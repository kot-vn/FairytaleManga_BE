module Api
  module V1
    module Readers
      class Stories::LikesController < LikesController
          private 
          def set_liketable
            @liketable = Author.find(params[:story_id])
          end
      end
    end
  end
end