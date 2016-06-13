class ScoreByHolesController < ApplicationController
  before_action :set_score_by_hole, only: [:show, :edit, :update, :destroy]

  # GET /score_by_holes
  # GET /score_by_holes.json
  def index
    @score_by_holes = ScoreByHole.all
  end

  # GET /score_by_holes/1
  # GET /score_by_holes/1.json
  def show
  end

  # GET /score_by_holes/new
  def new
    @score_by_hole = ScoreByHole.new
  end

  # GET /score_by_holes/1/edit
  def edit
  end

  # POST /score_by_holes
  # POST /score_by_holes.json
  def create
    @score_by_hole = ScoreByHole.new(score_by_hole_params)

    respond_to do |format|
      if @score_by_hole.save
        format.html { redirect_to @score_by_hole, notice: 'Score by hole was successfully created.' }
        format.json { render :show, status: :created, location: @score_by_hole }
      else
        format.html { render :new }
        format.json { render json: @score_by_hole.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /score_by_holes/1
  # PATCH/PUT /score_by_holes/1.json
  def update
    respond_to do |format|
      if @score_by_hole.update(score_by_hole_params)
        format.html { redirect_to @score_by_hole, notice: 'Score by hole was successfully updated.' }
        format.json { render :show, status: :ok, location: @score_by_hole }
      else
        format.html { render :edit }
        format.json { render json: @score_by_hole.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /score_by_holes/1
  # DELETE /score_by_holes/1.json
  def destroy
    @score_by_hole.destroy
    respond_to do |format|
      format.html { redirect_to score_by_holes_url, notice: 'Score by hole was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score_by_hole
      @score_by_hole = ScoreByHole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_by_hole_params
      params.fetch(:score_by_hole, {})
    end
end
