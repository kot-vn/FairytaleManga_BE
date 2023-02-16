class Reader::ChapterSerializer < ActiveModel::Serializer
  attributes :id, :name, :images_url, :next_chap
end
