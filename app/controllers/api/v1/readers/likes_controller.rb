module Api
  module V1
    module Readers
      class LikesController < ReaderappController
        before_action :set_liketable, only: [:create, :index]

        def create
          @like = @liketable.like.new do |c|
            c.reader = current_reader
          end
          if @like.save
            response_success(message: "You 're liked that")
          else
            response_error(message: "u can't like that")
          end
        end

        def index
          @likes = @liketable.like.length
          response_success(@likes)
        end

        def destroy
          @like = Like.find(params[:id])
          if @like.reader_id == current_reader.id
            @like.destroy
          else
            # render json: {
            #   message: "You can't dislike ",
            # }
            response_error("You can't dislike")
          end
        end
      end
    end
  end
end
