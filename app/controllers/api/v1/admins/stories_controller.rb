module Api
  module V1
    module Admins
      class StoriesController < AdminappController
        def get_authors
          @authors = Author.all
          # render json: @authors
          response_success(@authors)
        end

        def get_categories
          @categories = Category.all
          # render json: @categories
          response_success(@categories)
        end

        def create
          @story = Story.new(story_params)
          @story.image.attach(params[:image])
          if !params[:categories_id].blank?
            if @story.save
              @ca = JSON.parse params[:categories_id]
              @ca.each do |c|
                @category = Category.find(c)
                @story.category << @category
              end
              response_success(message: 'Success')
            else
              response_error(validation: @story.errors.full_messages)
            end
          else
            response_error(validation: "Categories can't be empty")
          end
        end

        def index
          stories = Story.order(id: :desc).ransack(params[:q]).result
          @pagy, @stories = pagy(stories, items: 10)
          response_list(@stories, { adapter: :json,
                                    each_serializer: ::Stories::ShowStoriesSerializer })
        end

        def show
          @story = Story.find(params[:id])
          # render json: @story, each_serializer: StorySerializer
          response_success(@story, { each_serializer: StorySerializer })
        end

        def update
          @story = Story.find(params[:id])
          if @story.update(story_params)
            # if !params[:categories_id].blank?
            @story.category.destroy_all
            @ca = JSON.parse params[:categories_id]
            @ca.each do |c|
              @category = Category.find(c)
              @story.category << @category
            end
            # render json: "Update Successfully"
            response_success('Update Successfully')
          else
            response_error(validation: @story.errors.full_messages)
          end
        end

        def destroy
          @story = Story.find(params[:id])
          if @story.chapter.destroy_all && @story.category.destroy_all
            @story.destroy
            response_success(message: 'destroy successfuly')
          else
            response_error(message: 'destroy failed')
          end
        end

        def show_list_chapters
          chapters = Chapter.where(story_id: params[:id]).order(id: :desc).ransack(params[:q]).result
          @pagy, @chapters = pagy(chapters, items: 10)
          response_list(@chapters, { adapter: :json, each_serializer: ChapterSerializer })
        end

        private

        def story_params
          params.permit(:name, :author_id, :description, :end, :image, categories_id: [])
        end

        # def test_params
        #   params.permit(:categories_id)
        # end
      end
    end
  end
end
