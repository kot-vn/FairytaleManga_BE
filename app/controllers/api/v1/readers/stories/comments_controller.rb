module Api
  module V1
    module Readers
      class Stories::CommentsController < CommentsController 
          private 
          def set_commentable
            @commentable = Story.find(params[:story_id])
          end
      end
    end
  end
end