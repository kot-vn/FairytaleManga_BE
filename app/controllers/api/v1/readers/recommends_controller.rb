module Api
  module V1
    module Readers
      class RecommendsController < ApplicationController
        def recommend_story
          @stories = Story.joins(:chapter).uniq.order("created_at DESC").limit(10)
          # render json: @stories, each_serializer: nil
          response_success(@stories, serializer: ::Reader::StorySerializer)
        end

        def get_story_by_category
          @stories = Story.joins(:category)
                          .where("category_story.category_id= ?", params[:id])
                          .joins(:chapter).uniq
          response_success(@stories, serializer: ::Reader::StorySerializer)
        end
      end
    end
  end
end
