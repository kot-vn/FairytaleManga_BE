class Story < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :category, join_table: 'category_story'
  has_one_attached :image
  # has_and_belongs_to_many :category, join_table: "category_story"
  has_many :reader_story
  has_many :reader, through: :reader_story
  validates :name, presence: true
  validates :author_id, presence: true
  # validates :categories_id, presence: true
  has_many :chapter
  has_many :comment, as: :commentable
  has_many :like, as: :liketable
  attribute :image_url
  after_find :set_image_url


  def self.hot_story(time_range)
    @id = ReaderStory.select("COUNT(reader_stories.story_id) as read_count")
                      .group("reader_stories.story_id")
                      .pluck("reader_stories.story_id")
                      .where("reader_stories.created_at" => time_range)
                      .limit(5)
    @stories = Story.where(id: @id)
  end
end
