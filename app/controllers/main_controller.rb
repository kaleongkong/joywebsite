class MainController < ApplicationController
  def index
    @sent = params[:sent]
    # puts "#{District.cities[0]}"
    # puts "sent: #{@sent}"
    # @home_active="active"
  end
  
  def send_email
    puts params
    email_params = {}
    desired_cities = []
    desired_districts = []
    email_params[:name] = params[:name]
    email_params[:email] = params[:email]
    email_params[:price_range] = params[:price_range]
    email_params[:size] = params[:size]
    email_params[:additional_info] = params[:additional_info]
    email_params[:single_family] = params[:single_family] 
    email_params[:condo] = params[:condo]
    email_params[:multiunits] = params[:multiunits]
    email_params[:locations] = []
    params.each do |k, v|
      if k.include?('desired_city')
        desired_cities << v
      elsif k.include?('desired_district')
        desired_districts << v
      end
    end
    desired_districts.length.times do |i|
      email_params[:locations] << {district: desired_districts[i], city: desired_cities[i]}
    end
    UserMailer.send_email(email_params).deliver!
  	redirect_to :controller=> 'main',:action=>'index', :sent => true
  end

  def blog
    @blogs_per_page = 3
    @num_of_pages = Blog.all.length/@blogs_per_page
    if @num_of_pages*@blogs_per_page < Blog.all.length
      @num_of_pages += 1
    end
    @error = session[:error]
    @current_page = params[:current_page].to_i
    unless params[:current_page]
      @current_page = 1
    end
    # @blog_active="active"
    @blogs = Blog.load_blogs(@current_page, @blogs_per_page)
  end

  def self.available_cities
    District.cities.map!{|d| [d,d]}
  end

  def sign_in
    user_name = params[:user_name]
    pw = params[:password]
    if user_name == 'joyadmin' && pw == 'joyadmin'
      session[:login] = true 
      session[:error] = nil
    else
      session[:error] = 'invalid_user_login'
      redirect_to :controller=> 'main',:action=>'blog'
      return
    end
    redirect_to :back
  end

  def sign_out
    session[:login] = false
    redirect_to :back
  end
  
  def self.us_states
    [
      ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY']
    ]
  end
end
