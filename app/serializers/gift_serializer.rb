class GiftSerializer < ActiveModel::Serializer
  # include JSONAPI::serializer
  attributes :id, :name, :score, :stock, :image_url #, :status

  # has_many :reader
  has_many :reader_gift, serializer: ReaderGiftSerializer
end
