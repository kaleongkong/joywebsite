class District < ActiveRecord::Base
  def self.location
    [
      [37.773972, -122.431297],
      [37.785673, -122.47005],
      [37.784045, -122.454214],
      [37.777601, -122.495542],
      [37.778347, -122.483568],
      [37.77984, -122.464685],
      [37.776889, -122.453914]
    ]
  end

  def self.districts(city)
    ds=[]
    District.regions2districts.keys.each do |k|
      ds += District.regions2districts[k].map{|elm| [elm, "#{elm}, #{city}"]} if k.include?(city)
    end
    ds
  end

  def self.cities
    [
      'San Francisco', 
      'San Mateo'
    ]
  end
  def self.regions
    {
      'San Francisco'=> [
        'District 1/ Northwest',
        'Disrict 2/ Central West',
        'District 3/ Southwest',
        'District 4/ Twin Peaks West',
        'District 5',
        'District 6',
        'District 7',
        'District 8',
        'District 9',
        'District 10',
      ],
      'San Mateo'=>[
        'North',
        'South',
        'Northwest'
      ]
    }
  end
  def self.regions2districts
      {
      'San Francisco District 1/ Northwest'=> [
        'Sea Cliff',
        'Lake Street',
        'Jordan Park/ Laurel Heights',
        'Outer Richmond',
        'Central Richmond',
        'Inner Richmond',
        'Lone Mountain',
      ],
      'San Francisco Disrict 2/ Central West'=> [
        'Outer Sunset',
        'Sunset District',
        'Inner Sunset',
        'Outer Parkside',
        'Parkside',
        'Golden Gate Heights',
        'Inner Parkside',
      ],
      'San Francisco District 3/ Southwest'=> [
        'Pine Lake Park',
        'Merced Manor',
        'Lake Shore',
        'Lakeside',
        'Merced Heights',
        'Ingleside',
        'Oceanview',
        'Stonestown',
        'Ingleside Heights',
      ],
      'San Francisco District 4/ Twin Peaks West'=> [
        'Forest Hill',
        'Forest Knolls',
        'Forest Hill Extension',
        'West portal',
        'St. Francis Wood',
        'Balboa Terrace',
        'Mount Davidson Manor',
        'Ingleside Terrace',
        'Monterey Heights',
        'Westwood Park',
        'Sunnyside',
        'Westwood Highlands',
        'Miraloma Park',
        'Sherwood Forest',
        'Diamond Heights',
        'Midtown Terrace',
      ],
      'San Francisco District 5'=> [
        'Glen Park',
        'Haight Ashbury',
        'Noe Valley',
        'Twin Peaks',
        'Cole Valley/Parnassus Heights',
        'Buena Vistaq/Ashbury Heights',
        'Corona Heights',
        'Clarendon Heights',
        'Duboce Triangle',
        'Eureka Valley/Dolores Heights',
        'Mission Dolores',
      ],
      'San Francisco District 6'=> [
        'Anza Vista',
        'Hayes Valley',
        'Lower Pacific Heights',
        'Western Addition',
        'Alamo Square',
        'North Panhandle',
      ],
      'San Francisco District 7'=> [
        'Marina',
        'Pacific Heights',
        'Presidio Heights',
        'Cow Hollow',
      ],
      'San Francisco District 8'=> [
        'Downtown',
        'Financial District/Barbary Coast',
        'Nob Hill',
        'North Beach',
        'Russian Hill',
        'Van Ness/Civic Center',
        'Telegraph Hill',
        'North Waterfront',
        'Tenderloin',
      ],
      'San Francisco District 9'=> [
        'Bernal Heights',
        'Inner Mission',
        'Muission Bay',
        'Potrero Hill',
        'South of Market',
        'Yerba Buena',
        'South Beach',
        'Central Waterfront/Dogpatch',
      ],
      'San Francisco District 10'=> [
        'Bayview',
        'Crocker Amazon',
        'Excelsior',
        'Outer Mission',
        'Visitacion Valley',
        'Portola',
        'Silver Terrace',
        'Mission Terrace',
        'Hunters Point',
        'Bayview Heights',
        'Candlestick Point',
        'Little Hollywood',
      ],
      'San Mateo Northwest'=> [
        'Original Daly City',
        'Serramonte',
        'Southern Hills',
        'Westlake #1/Olympic',
        'Westlake Heights',
        'Westlake Highlands',
        'Westlake Knolls',
        'Broadmoor',
        'Westlake Terrace',
        'St. Francis Heights',
        'Westlake Palisades',
        'Blossom Valley',
        'Crown Colony',
        'Colma',
        'Brisbane',
        'Bayridge/Linda Vista'
      ],
      'San Mateo North'=> [
        'Pacifica',
        'San Bruno',
        'South San Francisco'
      ],
      'San Mateo South'=>[
        'Belmont',
        'Burlingame',
        'Foster City',
        'Half Moon Bay',
        'Hillsborough',
        'Menlo Park',
        'Millbrae',
        'Redwood City',
        'San Carlos',
        'San Mateo'
      ]
    }
  end
end