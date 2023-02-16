module Stories
  class ShowStoriesSerializer < ActiveModel::Serializer
    attributes :id, :name, :status, :author_name, :chapter, :views, :image_url

    def author_name
      object.author.name
    end
  
    def author_id
      object.author.id
    end

    has_many :chapter, serializer: GetChapSerializer
  
    def cat_id
      object.category.ids
    end
  
    def status
      if object.end == true
        return "End"
      else
        return "On going"
      end
    end

    def views
      object.reader.length
    end

    def chapter
      object.chapter.last
    end
  end
end

