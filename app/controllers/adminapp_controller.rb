class AdminappController < ApplicationController
  before_action :authenticate_request_admin
end
