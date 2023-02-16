class Like < ApplicationRecord
  belongs_to :reader
  belongs_to :liketable, polymorphic: true
end
