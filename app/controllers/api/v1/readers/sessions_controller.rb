module Api
  module V1
    module Readers
      class SessionsController < ReaderappController
        skip_before_action :authenticate_request_reader, only: [:create]

        def create
          reader = Reader.find_by(email: params[:email])
          if reader && reader.valid_password?(params[:password])
            render json: {
              message: "success",
              token: ::JsonWebToken.encode({
                reader_id: reader.id,
              })
            }
          else
              response_error(validation: "Email or password is not correct, please try again !")
          end
        end
      end
    end
  end
end
