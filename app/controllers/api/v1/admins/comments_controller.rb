module Api
  module V1
    module Admins
      class CommentsController < ApplicationController
        def index
          # comment = Comment.where("num_report >= ? and status = 0", 3).order(id: :desc).ransack(params[:q]).result
          @comment = Comment.comment_be_report
          @pagy, @comment = pagy(comment, items: 10)
          response_list(@comment, { adapter: :json,
                                       each_serializer: nil })
        end

        def ban_comment
          @comment = Comment.find(params[:id])
          # @comment.update(status: params[:status])
          if params[:status] == 1 #user enter key banned
            @reader = Reader.find(@comment.reader_id)
            @comment.update(status: params[:status])
            @title = "Warning your comment is toxic. We will ban you.!!"
            @notification = Notification.create(reader_id: @comment.reader_id, title: @title)
            if @reader.update(time_ban: Time.now)
              # render json: "dr"
              response_success("Ban success")
            else 
              # render json: "chua dc"
              response_error("Failed")
            end
          elsif params[:status] == 2
            # render json: "ok"
            response_success("Don't ban success")
          else
            # render json: {
            #   message: "Not have status"
            # }, status: 400
            response_error(message: "Please enter status")
          end
        end
      end
    end
  end
end