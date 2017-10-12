class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with user: ENV["USERNAME"], password: ENV["PASSWORD"]

  def show
  end
end
