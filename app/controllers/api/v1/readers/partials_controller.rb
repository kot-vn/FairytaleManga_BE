module Api
  module V1
    module Readers
      class PartialsController < ApplicationController
        def header
          show_categories
        end
      end
    end
  end
end
