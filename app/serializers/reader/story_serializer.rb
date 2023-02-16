class Reader::StorySerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :author_name, :description, :image_url, :views, :first_chap, :last_chap

  def author_name
    object.author.name
  end

  def author_id
    object.author.id
  end

  has_many :category, each_serializer: CategorySerializer
  has_many :chapter, each_serializer: ChapterSerializer
  
  def status
    if object.end == 0
      return "On going"
    else
      return "End"
    end
  end

  def views
    object.reader.length
  end

  def first_chap
    object.chapter.first
  end

  def last_chap
    object.chapter.last
  end
end

