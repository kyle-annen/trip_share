class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :locations
  has_many :restaurants, :through => :location


  #paperclip entries
  attr_accessor :image
  has_attached_file :image, 
    styles: {large: "600x400>", medium: "300x200>", thumb: "100x75>" }, 
    default_url: "public/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  crop_attached_file :image, :aspect => "3:2"

  #validations
  validates :name, presence: true
  validates :user_id, presence: true
  validates :image, presence: true
  validates :blurb, presence: true
   
end
