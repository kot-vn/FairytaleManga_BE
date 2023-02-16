module Api
  module V1
    module Readers
      class ReadersController < ReaderappController
        skip_before_action :authenticate_request_reader, only: [:create]

        def create
          @reader = Reader.new(reader_params)
          if @reader.save
            @reader.image.attach(params[:reader][:image])
            # UserMailer.reader_activation(@reader).deliver_now
              response_success(message: "hello")
          else
              response_error(validation: @reader.errors.full_messages)
          end
        end

        def update
          @reader = Reader.find(params[:id])
            if @reader.update(reader_params)
              response_success("ok")
            else
              response_error(validate: @reader.errors.messages)
            end
        end

        private

        def reader_params
          params.permit(:name, :email, :password, :age, :gender, :phonenumber, :address, :image)
        end
      end
    end
  end
end
