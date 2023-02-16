module Api
  module V1
    module Readers
      class Authors::CommentsController < CommentsController
        private

        def set_commentable
          @commentable = Author.find(params[:author_id])
        end
      end
    end
  end
end
