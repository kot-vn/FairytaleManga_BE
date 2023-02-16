module Api
  module V1
    module Admins
      class ReadersController < AdminappController
        def index
          readers = Reader.order(id: :desc).ransack(params[:q]).result
          @pagy, @readers = pagy(readers, items: 10)
          response_list(@readers, { adapter: :json,
                                    each_serializer: ReaderSerializer })
        end
      end
    end
  end
end
