class Hole < ActiveRecord::Base
  
  #attr_accessor :number, :integer
  #attr_accessor :distance_m, :float
  #attr_accessor :distance_w, :float
  #attr_accessor :par, :integer

  belongs_to :stage, foreign_key: "stage_id"

  def as_json(options={})
    {:number      => self.number,
     :distance_m        => self.distance_m,
     :distance_w       => self.distance_w,
     :par => self.par
    }
  end

end
