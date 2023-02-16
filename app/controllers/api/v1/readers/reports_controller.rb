module Api
  module V1
    module Readers
      class ReportsController < ReaderappController
        def createreports
          @report = Report.find_by(reader_id: current_reader.id, comment_id: params[:id])
          @comment = Comment.find(params[:id])        
          if(@comment.reader_id == current_reader.id)
            render json: "You can't report your comment"
          elsif @report
            render json: "You can report 1 time 1 comment"
          else
            @comment.update(num_report: @comment.num_report+1 )
            Report.create(reader_id: current_reader.id, comment_id: params[:id])
              response_success(message: "We will check your report")
          end
        end
      end
    end
  end
end