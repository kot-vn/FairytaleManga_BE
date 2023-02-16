module Api
  module V1
    module Readers
      class StoriesController < ApplicationController
        # before_action :authenticate_request_reader, only: [:read_story]
        def index
          # chapter_exists_story_ids = Chapter.pluck(:story_id).uniq
          # stories = Story.where(id: chapter_exists_story_ids)
          stories = Story.joins(:chapter).uniq
          response_success(stories, { each_serializer: ::Stories::ShowStoriesSerializer })
        end

        def search_stories
          @q = Story.ransack(params[:q])
          @stories = @q.result(distinct: true)
          response_success(@stories)
        end

        def read_story
          authenticate_request_reader
          current_reader = @current_reader
          if current_reader.blank?
            response_success(message: 'Doc truyen di')
          else
            @readerstory = ReaderStory.new(reader_id: current_reader.id, story_id: params[:id], chap: params[:chap])
            if @readerstory.save
              response_success(message: 'ok')
            else
              response_error(message: 'failed')
            end
          end
        end

        def show
          @story = Story.find(params[:id])
          response_success(@story, serializer: ::Reader::StorySerializer)
        end

        def show_chapter
          # @story = Story.find_by(name: params[:name_story])
          chapter = Chapter.find_by(id: params[:id])
          next_chap = Chapter.set_next_chap(chapter)
          prev_chap = Chapter.set_prev_chap(chapter)
          # render json: {chapter, serializer: ::Reader::ChapterSerializer, {meta: next_chap, prev_chap}}
          # response_success(chapter, serializer: ::Reader::ChapterSerializer)
          render json: chapter, meta: [next: next_chap,prev: prev_chap], adapter: :json
        end

        def show_list_chapters
          chapters = Chapter.where(story_id: params[:id]).order(id: :desc)
          response_success(chapters, { adapter: :json, serializer: ::Reader::ChapterSerializer })
        end

        private

        def story_params
          params.permit(:reader_id, :story_id, :chap)
        end

        def is_login?
          check_authen
          return false if @current_reader.blank?
        end
      end
    end
  end
end
