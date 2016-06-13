class Stage < ActiveRecord::Base
  
  #attr_accessor :title, :string
  #attr_accessor :country, :string
  #attr_accessor :city, :string
  #attr_accessor :holes_count, :integer

  has_many :holes, :dependent => :destroy
  accepts_nested_attributes_for :holes, :allow_destroy => true

  has_many :game
  accepts_nested_attributes_for :game, :allow_destroy => true

  after_create :initialize_holes

  def initialize_holes
  	(0..holes_count-1).each do |i|
  		num = i + 1
  		self.holes.create(number: num)
  	end
  end

  def as_json(options={})
    {:title      => self.title,
     :country        => self.country,
     :city       => self.city,
     :holes_count => self.holes_count,
     :holes => self.holes.as_json
    }
  end

end
