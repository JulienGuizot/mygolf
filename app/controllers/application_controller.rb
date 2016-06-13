class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_game
  	@games = Game.all
  	@current_game = @games.select{|g| g.current }.first
  	@current_game = Game.create(current: true)
  	@stage = Stage.create(title: "test", country: "test", city: "test", holes_count: 9)
  	@current_game.stage = @stage
  	@current_game.save
  	respond_to do |format|
      if !@current_game.blank?
        format.json { render json: @current_game, status: :ok  }
      else
        format.json { render json: "{ 'error' : 'Bad parameters, any current game founded' }", status: :unprocessable_entity }
      end
    end
  end
end
