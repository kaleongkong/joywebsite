class UserMailer < ActionMailer::Base
  default from: "joyrealestate.sup@gmail.com"
  def send_email(args={})
  	@desired_st_addr = args[:desired_st_addr]
  	@desired_city = args[:desired_city]
  	@desired_state = args[:desired_state]
  	@desired_zip = args[:desired_zip]
  	@price_range = args[:price_range]
  	@size = args[:size]
  	@desired_property_type = {single_family: args[:single_family], condo: args[:condo], multiunits: args[:multiunits]}
  	@desired_property_type.each{|k,v| @desired_property_type if v}.compact!
  	mail(to: "joyrealestate.ad@gmail.com", subject: 'Sample Email')
  end
end
