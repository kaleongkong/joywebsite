class UserMailer < ActionMailer::Base
  default from: "joyrealestate.sup@gmail.com"
  def send_email
  	mail(to: "joyrealestate.ad@gmail.com", subject: 'Sample Email')
  end
end
