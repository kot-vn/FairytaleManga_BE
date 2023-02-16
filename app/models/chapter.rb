class Chapter < ApplicationRecord
  validates :name, presence: true#, message: "Chapter name must exist"
  belongs_to :story
  has_many_attached :images
  has_many :comment, as: :commentable
  attribute :images_url
  after_find :set_images_url
 
  def self.set_next_chap(chapter)
    Chapter.select('id, name, updated_at')
          .where("chapters.id > ? && chapters.story_id = ?", chapter.id, chapter.story_id)
          .limit(1)
  end

  def self.set_prev_chap(chapter)
    Chapter.select('id, name, updated_at')
          .where("chapters.id < ? && chapters.story_id = ?", chapter.id, chapter.story_id)
          .limit(1)
  end
end
