class Admin::DashboardController < ApplicationController
  # before_filter :authorize
  http_basic_authenticate_with :name => "jungle", :password => "book"
  def show
  end
end
