module Api
  module V1
    module Readers
      class CommentsController < ReaderappController
        before_action :set_commentable, only: %i[create index]

        def create
          if !is_ban?
            current_reader.update(time_ban: nil)
            @comment = @commentable.comment.new(comment_params)
            @comment.reader = @current_reader
            if @comment.save
              response_success(message: 'Save Successfuly')
            else
              response_error(message: 'Save Failed')
            end
          else
            render json: "You can't comment because you 're banned"
          end
        end

        def index
          @comments = @commentable.comment
          response_success(@comment)
        end

        def update
          comment = Comment.find(params[:id])
          if owner_comment(comment)
            comment.update(comment_params)
            response_success(message: 'update successful')
          else
            render json: {
              message: "You can't update this comment"
            }
          end
        end

        def destroy
          comment = Comment.find(params[:id])
          if owner_comment(comment)
            comment.destroy
            response_success('delete comment successfuly')
          else
            render json: {
              message: "You can't delete this comment"
            }
          end
        end

        private

        def comment_params
          params.permit(:content)
        end

        def owner_comment(comment)
          return true if comment.reader_id == current_reader.id
        end

        def is_ban?
          return false if current_reader.time_ban.nil? || current_reader.time_ban - Time.now >= 7.day
        end
      end
    end
  end
end
