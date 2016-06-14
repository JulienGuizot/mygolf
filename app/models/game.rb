class Game < ActiveRecord::Base
  
  belongs_to :stage, foreign_key: "stage_id"
  #attr_accessor :current, :boolean

  has_many :scores, :dependent => :destroy
  accepts_nested_attributes_for :scores, :allow_destroy => true

  #before_create :verification

  #def verification
  #	stage.present? && !stage.blank? && scores.present? && scores.count >= 1
  #end

  def current_hole
  	scores.first.current_hole
  end

  def is_finish?
    if !self.scores.first.nil?
      !self.scores.first.score_by_holes.last.nb_shots.blank?
    else
      false
    end
  end

  def as_json(options={})
    {:id           => self.id,
     :current      => self.current,
     :stage        => self.stage.as_json,
     :scores       => self.scores.as_json,
 	}
  end

end
