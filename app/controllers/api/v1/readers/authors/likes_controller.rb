module Api
  module V1
    module Readers
      class Authors::LikesController < LikesController
        private

        def set_liketable
          @liketable = Author.find(params[:author_id])
        end
      end
    end
  end
end
