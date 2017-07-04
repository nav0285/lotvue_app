class User < ApplicationRecord

	has_and_belongs_to_many :roles, :join_table => :user_roles
  has_attached_file :pic, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :pic, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	validates :email, uniqueness: true

	scope :active, -> { joins(:roles).where(roles: {hidden: false}) }

end
