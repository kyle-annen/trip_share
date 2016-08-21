class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :locations
  has_many :restaurants, :through => :location


  #paperclip entries
  attr_accessor :image
  has_attached_file :image, 
    styles: {large: "600x400>", medium: "300x200>", thumb: "100x75>" }, 
    default_url: "public/images/:style/missing.png"
  crop_attached_file :image, :aspect => "3:2"
  ###
  # validates_attachment :image, 
  #   content_type: {content_type: ["image/jpeg", "image/png"]}
  # validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/]
  do_not_validate_attachment_file_type :image

  #validations
  validates :name, presence: true
  validates :user_id, presence: true
  validates :image, presence: true
  validates :blurb, presence: true
   
end
