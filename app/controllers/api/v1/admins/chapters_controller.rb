module Api
  module V1
    module Admins
      class ChaptersController < AdminappController
        def create
          @chapter = Chapter.new(chapter_params)
          # binding.pry
          # if params[:images].present?
          #   # @images = JSON.load params[:images]
            # params[:images].each do |image|
              # @chapter.images.attach(params[:images])
            # end
          # @chapter.images.attach(params[:images])
          # end
          if @chapter.save
            # render json: {
            #   message: "success",
            # }
            response_success(message: "success")
          else
            # render json: {
            #   message: "failed",
            #   validation: @chapter.errors.messages,
            # }, status: 400
            response_error(validation: @chapter.errors.full_messages)
          end
          # chapter.images.attach(params[:images])

          # binding.pry
          
        end

        def show
          @chapter = Chapter.find(params[:id])
          # render json: @chapter
          response_success(@chapter)
        end

        # def update
        #   @chapter = Chapter.find(params[:id])
        #   if @chapter.update(chapter_params)
        #     render json: "Update Successfully"
        #   else
        #     render json: {
        #              message: "Failed",
        #              validation: @chapter.errors.messages,
        #            }, status: 400
        #   end
        # end

        def destroy
          @chapter = Chapter.find(params[:id])
          if @chapter.destroy
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

        def chapter_params
          params.permit(:name, :story_id, images: [])
        end
      end
    end
  end
end
