module Api
  module V1
    module Readers
      class NotificationsController < ReaderappController
        def list_story
          time_range = (Time.now.midnight - 1.month)..Time.now.midnight
          @stories = current_reader.story.where("created_at" => time_range)
            .where("end" => 0)
          # render json: {
          #   story_name: @stories,
          # }
          response_success(@stories)
        end

        def index
          @notifications = Notification.where(reader_id: current_reader.id, read: false)
                                      .order("created_at DESC")
          # render json: @notifications
          response_success(@notifications)
        end

        def update
          @notification = Notification.find(params[:id])
          if @notification.update(read: true)
            render json: "You read this notification"
          else
            render json: "Function Read is wrong!!!"
          end
        end
      end
    end
  end
end
