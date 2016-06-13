class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all.select { |g| !g.is_finish? }
    @games = @games.sort_by{|g| g.id }

    respond_to do |format|
      if @games.count > 0
        format.json { render json: @games, status: :ok }
      else
        format.json { render json: "{ 'error' : 'Bad parameters, any game founded' }", status: :unprocessable_entity }
      end
    end    
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      if !@game.blank?
        format.json { render json: @game }
      else
        format.json { render json: "{ 'error' : 'Bad parameters, game not founded' }", status: :unprocessable_entity }
      end
    end    
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    @game.stage = Stage.find(params[:stage_id])
    @golfers = JSON.parse(params[:golfers])
    @game.current = true
    @remove_game = Game.all.select{ |g| g.current && !g.is_finish? }
    @remove_game.each do |game|
      game.destroy
    end

    @golfers.each do |golfer|
      new_score = @game.scores.create()
      new_score.golfer.create(name: golfer.name, sexe: golfer.sexe, handicapt: golfer.handicap)
      new_score.save
    end

    respond_to do |format|
      if @game.save
        format.json { render json: @game, status: :ok  }
      else
        format.json { render json: "{ 'error' : 'Bad parameters, game not created' }", status: :unprocessable_entity }
      end
    end
  end

  def endgame
    @game = Game.find(params[:id])
    @game.current = false

    respond_to do |format|
      if @game.save
        format.json { render json: "{ 'success' : 'Game is finish' }", status: :ok }
      else
        format.json { render json: "{ 'error' : 'Bad parameters, game not terminated' }", status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    @game = Game.find(params[:id])
    @score_by_holes = JSON.parse(params[:score_by_holes])

    i = 0
    @score_by_holes.each do |score_by_hole|
      sbh = @game.scores(i).score_by_holes(params[:number_hole] - 1)
      sbh.nb_shots = score_by_hole.nb_shots
      sbh.save
      i += 1
    end

    respond_to do |format|
      if @game.save
        format.json { render json: @game, status: :ok }
      else
        format.json { render json: "{ 'error' : 'Bad parameters, score by hole not added' }", status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.fetch(:game, {})
    end
end
