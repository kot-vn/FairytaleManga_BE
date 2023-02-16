class Report < ApplicationRecord
  belongs_to :reader
  belongs_to :comment
end
