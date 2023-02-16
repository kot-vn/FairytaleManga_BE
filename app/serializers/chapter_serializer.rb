class ChapterSerializer < ActiveModel::Serializer
  attributes :id, :name, :images_url, :time
  # belongs_to :story
  def time
    object.updated_at.strftime("%B %d, %Y")
  end
end
