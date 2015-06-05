class MainController < ApplicationController
  def index
    @sent = params[:sent]
    puts "sent: #{@sent}"
  end
  def send_email
    UserMailer.send_email(params).deliver!
  	redirect_to :controller=> 'main',:action=>'index', :sent => true
  end

  def self.sf_districts
    districts= ["Castro District",
    "Chinatown", 
    "Cole Valley",
    "Financial District",
    "Fisherman's Wharf",
    "Haight-Ashbury",
    "Hayes Valley",
    "Japantown",
    "Lower Haight",
    "Marina",
    "Mission District",
    "Nob Hill",
    "Noe Valley",
    "North Beach",
    "Pacific Heights",
    "Panhandle",
    "Potrero Hill",
    "Presidio",
    "Richmond",
    "Russian Hill",
    "Sea Cliff",
    "Sixth Street",
    "SOMA",
    "Sunset",
    "Tenderloin",
    "Union Square",
    "Upper Market"]
    districts.map{|d| [d,d]}
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
