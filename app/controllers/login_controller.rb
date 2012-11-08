class LoginController < ApplicationController
  http_basic_authenticate_with :name => "test", :password => "test"
  def index
    session[:admin] = true
    redirect_to '/'
  end
end
