class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attachment :image

  has_many :posts
  has_many :post_images


  validates :name, length: { minimum: 2, maximum: 20 }
  validates :name, presence: true
  validates :introduction, length: { maximum: 50 }



  def email_required?
    false
  end

  def email_changed?
    false
  end

end
