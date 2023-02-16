module Api
  module V1
    module Admins
      class AdminsController < AdminappController
        skip_before_action :authenticate_request_admin, only: [:create]

        def create
          @admin = Admin.new(admin_params)
          if @admin.save
            # render json: {
            #          message: "success",
            #        }
            response_success(message: "Ok")
          else
            # render json: {
            #          message: "failed",
            #          validation: @category.errors.messages,
            #        }, status: 400
            response_error(validation: @category.errors.full_messages)
          end
        end

        def index
          admins = Admin.order(id: :desc).ransack(params[:q]).result
          @pagy, @admins = pagy(admins, items: 5)
          response_list(@admins, { adapter: :json,
                                   each_serializer: nil })
        end

        def show_current_admin
          # render json: current_admin
          response_success(current_admin)
        end

        def update_admin
          if current_admin.valid_password?(params[:oldPassword])
            if params[:password]== params[:reEnterPwd]
              if current_admin.update(username: params[:username], email: params[:email], password: params[:password])
                render json: {
                        message: "Update Successfully",
                      }
              else
                # render json: {
                #         message: "Failed",
                #         validation: @admin.errors.messages,
                #       }, status: 400
                response_error(@admin.errors.full_messages)
              end
            else
              # render json: {
              #   message: "Confirm pass word must be like your password"
              # }, status: 400
              response_error(message: "Confirm pass word must be like your password")
            end    
          else
            # render json: {
            #   validation: "Nhap sai mk"
            # }, status: 400
            response_error(message: "Nhap sai mk kia man")
          end
        end

        private

        def admin_params
          params.permit(:email, :username, :oldPassword, :password, :reEnterPwd)
        end
      end
    end
  end
end
