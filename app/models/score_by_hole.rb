class ScoreByHole < ActiveRecord::Base
  
  #attr_accessor :nb_shots, :integer
  #attr_accessor :number, :integer

  belongs_to :golfer, foreign_key: "golfer_id"

  def hole_played?
  	hole.present? && !hole.blank? && !nb_shots.blank?
  end

  def points_by_hole
  	if hole_played?
  		self.nb_shots - self.score.game.stage.holes[self.number].par
  	else
  		nil
  	end
  end

  def get_hole
  	self.score.game.stage.holes[self.number]
  end

end
