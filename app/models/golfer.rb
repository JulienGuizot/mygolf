class Golfer < ActiveRecord::Base
  
  #attr_accessor :name, :string
  #attr_accessor :sexe, :string
  #attr_accessor :handicap, :integer

  has_many :score_by_holes, :dependent => :destroy
  accepts_nested_attributes_for :score_by_holes, :allow_destroy => true

  belongs_to :score, foreign_key: "score_id"

  after_create :initialize_score_by_holes

  def initialize_score_by_holes
    (0..self.score.game.stage.holes_count-1).each do |i|
      num = i + 1
      self.score_by_holes.create(number: num)
    end
  end


   def self.type_sexe_golfer
    {
        'M' => 'Man',
        'W'   => 'Woman',
    }
   end

   def total_score
    total = 0 
    self.score.score_by_holes.each do |s|
      break if s.points_by_hole.nil?
      total += s.points_by_hole
    end
    total
   end

   def as_json(options={})
    {:id           => self.id,
     :name      => self.name,
     :sexe        => self.sexe,
     :handicap       => self.handicap,
     :score_by_holes => self.score_by_holes.as_json,
     :total_score => total_score
    }
  end

end
