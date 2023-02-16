class MissionReader < ApplicationRecord
  belongs_to :reader
  belongs_to :mission
end
