module Api
  module V1
    module Admins
      class MissionsController < ApplicationController
        def create
          @mission = Mission.new(mission_params)
          if @mission.save
            # render json: {
            #   message: "Create Successful",
            # }
            response_success(message: "Create Successful")
          else
            # render json: {
            #   valid: @mission.messages.errors,
            # }, status: 400
            response_error(valid: @mission.errors.full_messages)
          end
        end

        def index
          @missions = Mission.all
          # render json: @missions
          response_success(@mission)
        end

        def update
          @mission = Mission.find(params[:id])
          if @mission.update(mission_params)
            # render json: "Update Successfully"
            response_success("Update Successfully")
          else
            # render json: {
            #          message: "Failed",
            #          validation: @mission.errors.messages,
            #        }, status: 400
            response_error(validation: @mission.errors.full_messages)
          end
        end

        private

        def mission_params
          params.permit(:name, :score)
        end
      end
    end
  end
end
