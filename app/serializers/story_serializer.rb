class StorySerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :author_name, :author_id, :description, :cat_id, :image_url, :chapter, :views

  def author_name
    object.author.name
  end

  def author_id
    object.author.id
  end

  has_many :category, each_serializer: CategorySerializer

  def chapter
    object.chapter
  end

  def cat_id
    object.category.ids
  end

  def status
    object.end
  end

  def views
    object.reader.length
  end
end
