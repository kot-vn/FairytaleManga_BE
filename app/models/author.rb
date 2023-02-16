class Author < ApplicationRecord
  validates :name, presence: true#, message: "Author name must exist"
  validates :description, presence: true#, message: "Author description must exist"
  has_one_attached :image
  has_many :story
  has_many :comment, as: :commentable
  has_many :like, as: :liketable

  def self.has_story(author)
    return true if author.story.present? 
  end
end
