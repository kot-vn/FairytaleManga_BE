class ReaderGiftSerializer < ActiveModel::Serializer
  attributes :status

  def status
    if @instance_options[:current_reader] == object.reader_id
      return "changed"
    else
      return "unchanged"
    end
    # return @instance_options[:current_reader]
  end
end
