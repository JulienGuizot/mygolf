class Golfer < ActiveRecord::Base
  
  #attr_accessor :name, :string
  #attr_accessor :sexe, :string
  #attr_accessor :handicap, :integer

  belongs_to :score, foreign_key: "score_id"

   def self.type_sexe_golfer
    {
        'M' => 'Man',
        'W'   => 'Woman',
    }
   end

   def as_json(options={})
    {:id           => self.id,
     :name      => self.name,
     :sexe        => self.sexe,
     :handicap       => self.handicap
    }
  end

end
