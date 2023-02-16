module Api
  module V1
    module Readers
      class MissionsController < ReaderappController
        def mission_login
          @mission = MissionReader.find_by(reader_id: @current_reader.id, mission_id: params[:id])
          if @mission && @mission.time_login < Time.now - 1.day
            @mission.update(time_login: Time.now)
            @current_reader.update(score: current_reader.score+ @mission.score)
            render json: {
              message: "Chuc mung ban da hoan thanh nhiem vu"
            }
          elsif !mission
            @mr = MissionReader.new(reader_id: @current_reader.id, mission_id: params[:id], time_login: Time.now)
            if @mr.save
              render json: {
                message: "ok",
              }
            else
              render json: {
                message: "failed"
              }
            end
          else
            render json: {
              message: "Continue"
            }
          end
        end

        def mission_read
          @mission = MissionReader.find_by(reader_id: @current_reader.id, mission_id: params[:id])
          if @mission && @mission.time_readstory < Time.now - 1.day
            @mission.update(time_readstory: Time.now)
            @current_reader.update(score: current_reader.score+ @mission.score)
            render json: {
              message: "Chuc mung ban da hoan thanh nhiem vu"
            }
          elsif !mission
            @mr = MissionReader.new(reader_id: @current_reader.id, mission_id: params[:id], time_readstory: Time.now)
            if @mr.save
              render json: {
                message: "ok",
              }
            else
              render json: {
                message: "failed"
              }
            end
          else
            render json: {
              message: "Continue"
            }
          end
        end
      end
    end    
  end  
end