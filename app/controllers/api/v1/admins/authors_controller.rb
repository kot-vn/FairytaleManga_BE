module Api
  module V1
    module Admins
      class AuthorsController < AdminappController
        def create
          @author = Author.new(author_params)
          @author.image.attach(params[:author][:image])
          if @author.save
            # render json: {
            #   message: "Success",
            # }
            response_success(message: "Success")
          else
            # render json: {
            #   message: "Failded",
            #   validation: @author.errors.messages,
            # }, status: 400
            response_error(validation: @author.errors.full_messages)
          end
        end

        def index
          authors = Author.order(id: :desc).ransack(params[:q]).result
          @pagy, @authors = pagy(authors, items: 10)
          response_list(@authors, { adapter: :json,
                                    each_serializer: AuthorSerializer})
        end

        def show
          @author = Author.find(params[:id])
          # render json: @author
          if @author
            response_success(@author)
          else
            response_not_found(message: "Author don't already")
          end
        end

        def update
          @author = Author.find(params[:id])
          if @author.update(author_params)
            # render json: "Update Successfully"
            response_success("Update Successfully")
          else
            # render json: {
            #          message: "Failed",
            #          validation: @author.errors.messages,
            #        }, status: 400
            response_error(validation: @author.errors.full_messages)
          end
        end

        def destroy
          author = Author.find(params[:id])
          # render json: @author.story
          if !Author.has_story(author) #@author.story.blank? #!Author.has_story(@author)
            author.destroy
            # render json: {
            #   message: "destroy successfuly",
            # }
            response_success(message: "destroy successfully")
          else
            # render json: {
            #   message: "destroy failed because author has many story",
            # }, status: 400
            response_error(message: "destroy failed because author has many story")
          end
        end

        private

        def author_params
          params.permit(:name, :description, :image)
        end
      end
    end
  end
end
