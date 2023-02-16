require 'json_web_token'

module Api
  module V1
    module Admins
      class SessionsController < AdminappController
        skip_before_action :authenticate_request_admin, only: [:create]

        def create
          @admin = Admin.find_by(email: params[:email])
          if @admin && @admin.valid_password?(params[:password])
            sign_in(:admin, @admin)
            render json: {
              message: 'success',
              token: ::JsonWebToken.encode({
                                            admin_id: @admin.id
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
