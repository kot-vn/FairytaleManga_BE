module Api
  module V1
    module Admins
      class CategoriesController < AdminappController
        def create
          @category = Category.new(category_params)
          if @category.save
            # render json: {
            #   message: "success",
            # }
            response_success(message: "success")
          else
            # render json: {
            #   message: "failed",
            #   validation: @category.errors.messages,
            # }, status: 400
            response_error(validation: @category.errors.full_messages)
          end
        end

        def index
          categories = Category.order(id: :desc).ransack(params[:q]).result
          @pagy, @categories = pagy(categories, items: 10)
          response_list(@categories, { adapter: :json,
                                       each_serializer: CategorySerializer })
        end

        def show
          @category = Category.find(params[:id])
          if @category
          # render json: @category, each_serializer: CategorySerializer
            response_success(@category, { each_serializer: CategorySerializer })
          else
            response_not_found(message: "This category not found")
          end
        end

        def update
          @category = Category.find(params[:id])
          if @category.update(category_params)
            # render json: "Update Successfully"
            response_success(message: "Update Successfully")
          else
            # render json: {
            #          message: "Failed",
            #          validation: @category.errors.messages,
            #        }, status: 400
            response_error(validation: @category.errors.full_messages)
          end
        end

        def destroy
          @category = Category.find(params[:id])
          if @category.story.destroy_all
            @category.destroy
            # render json: {
            #   message: "destroy successfuly",
            # }
            response_success(message: "destroy successfully")
          else
            # render json: {
            #   message: "destroy failed",
            # }, status: 400
            response_error(message: "destroy failed")
          end
        end

        private

        def category_params
          params.permit(:name, :description)
        end
      end
    end
  end
end
