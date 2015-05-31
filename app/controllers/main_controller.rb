class MainController < ApplicationController
  def index
  end
  def send_email
    UserMailer.send_email.deliver!
  	redirect_to :back
  end
end
