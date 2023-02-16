module Api
  module V1
    module Readers
      class HotstoriesController < ApplicationController
        def hot_day
          
          # binding.pry
          
          time_range = (Time.now - 1.day+ 7.hour)..Time.now+7.hour
          @stories = Story.hot_story(time_range)
          # render json: @stories, each_serializer: nil
          response_success(@stories, {each_serializer: ::Stories::ShowStoriesSerializer})
        end

        def hot_month
          time_range = (Time.now.midnight - 1.month)..Time.now.midnight
          @stories = Story.hot_story(time_range)
          # render json: @stories, each_serializer: nil
          response_success(@stories, {each_serializer: ::Stories::ShowStoriesSerializer})
        end

        def hot_week
          time_range = (Time.now.midnight - 1.week)..Time.now.midnight
          @stories = Story.hot_story(time_range)
          # render json: @stories, each_serializer: nil
          response_success(@stories, {each_serializer: ::Stories::ShowStoriesSerializer})
        end
      end
    end
  end
end
