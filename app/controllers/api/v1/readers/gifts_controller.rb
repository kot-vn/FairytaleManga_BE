module Api
  module V1
    module Readers
      class GiftsController < ReaderappController
        def index
          @gifts = Gift.all
          # render ({ json: @gifts, adapter: :json, each_serializer: GiftSerializer, current_reader: current_reader.id })
          response_success(@gift, {each_serializer: GiftSerializer}, current_reader.id)
        end

        def show
          @gift = Gift.find(params[:id])
          # render json: @gift, :each_serializer => GiftSerializer
          response_success(@gift, {each_serializer: GiftSerializer})
        end

        # def exchange

        # end

      end
    end
  end
end
