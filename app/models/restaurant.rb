class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: {in: ["chinese", "italian", "japanese", "french", "belgian"], message: "Not a valid category!"}


  def average_rating
    reviews.sum(:rating) / reviews.count.to_f
  end

end
