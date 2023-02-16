require "json_web_token"

class ApplicationController < ActionController::API
  # include Pagy::Backend
  include Response
  # before_action :authenticate_request
  def show_categories
    @categories = Category.all
    response_success(@categories)
  end

  # def current_admin
  #   header = request.headers["Authorization"]
  #   header = header.split(" ").last
  #   decode = JsonWebToken.decode(header)
  #   @current_admin = Admin.find_by(id: decode[:admin_id])
  #   render json: {admin: @current_admin}
  # end

  private

  def authenticate_request_admin
    header = request.headers["Authorization"]
    if header
      header = header.split(" ").last
      if JsonWebToken.decode(header)
        decode = JsonWebToken.decode(header)
        @current_admin = Admin.find_by(id: decode[:admin_id])
        if !@current_admin
          # render json: {
          #         message: "Please login",
          #       }, status:400
          response_error(message: "please login, you aren't admin")
        end
      else
        response_error(message: "please login, because your session is expried or you don't login by admin account")
      end
    else
      response_error(message: "You need to login")
    end
  end

  def authenticate_request_reader
    header = request.headers["Authorization"]
    if header
      header = header.split(" ").last
      if JsonWebToken.decode(header)
        decode = JsonWebToken.decode(header)
        @current_reader = Reader.find_by(id: decode[:reader_id])
        if !@current_reader
          response_error(message: "please login, you aren't reader")
        end
      else
        response_error(message: "please login, because your session is signature")
      end
    else
      response_error(message: "you need to login")
    end
  end

  def check_authen
    header = request.headers["Authorization"]
    if JsonWebToken.decode(header)
      header = header.split(" ").last
      decode = JsonWebToken.decode(header)
      @current_reader = Reader.find_by(id: decode[:reader_id])
    else
      @current_reader = nil
    end
  end
end
