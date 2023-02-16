class Comment < ApplicationRecord
  belongs_to :reader
  belongs_to :commentable, polymorphic: true
  has_many :comment, as: :commentable
  has_many :like, as: :liketable
  has_many :report 

  def self.comment_be_report
    @comment = Comment.where("num_report >= ? and status = 0", 3)
                     .order(id: :desc)
                     .ransack(params[:q])
                     .result
  end
end
