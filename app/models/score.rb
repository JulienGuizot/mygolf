class Score < ActiveRecord::Base
  
  has_one :golfer
  accepts_nested_attributes_for :golfer, :allow_destroy => true

  belongs_to :game, foreign_key: "game_id"


  def has_golfer?
  	self.golfer.present? && !self.golfer.blank?
  end

  def is_initialize?
  	has_golfer?
  end

  def has_score_by_holes?
  	self.score_by_holes.present? && (score_by_holes.count == 9 or score_by_holes.count == 18)
  end

  def current_score
  	total = self.golfer.handicap

  	score_by_holes.each do |s|
  		break if !s.hole_played?
  		total += s.points_by_hole
  	end
  	total ## en faire une variable ?
  end

  def current_hole
  	current = 1
  	score_by_holes.each do |s|
  		break if !s.hole_played?
  		current += 1
  	end
  	current ## en faire une variable 
  end

  def as_json(options={})
    {:id           => self.id,
     :golfer      => self.golfer.as_json,
    }
  end

end
