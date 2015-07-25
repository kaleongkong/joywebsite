class UserMailer < ActionMailer::Base
  default from: "joyrealestate.sup@gmail.com"
  def send_email(args={})
    @name = args[:name]
    @email = args[:email]
  	@desired_zip = args[:desired_zip]
  	@price_range = args[:price_range]
  	@size = args[:size]
    @locations = args[:locations]
  	@desired_property_type = [{single_family: args[:single_family]}, {condo: args[:condo]}, {multiunits: args[:multiunits]}]
  	@desired_property_type.map!{|h| h.first[0].to_s if h.first[1]}.compact!
    @additional_info = args[:additional_info]
  	mail(to: "joyrealestate.ad@gmail.com", subject: "#{@name}'s dream house research")
  end
end
