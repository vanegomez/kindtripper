class Opening < ActiveRecord::Base
  require 'httparty'
  has_many :user_openings
  has_many :users, through: :user_openings

  # validates :title

  def self.parse_response
    page = "http://www.peacecorps.gov/api/v1/openings"
    data = []
    while page != nil
      response = HTTParty.get(page)
      data << JSON.parse(response.body)['results']
      page = JSON.parse(response.body)['next']
    end
    data.flatten
  end

  def self.find_or_create_job
    parse_response.each do |response|
      if job = Opening.find_by(req_id: response['req_id'])
        job
      else
        create({title:               response['title'],
                req_id:              response['req_id'],
                country:             response['country'],
                sector:              response['sector'],
                apply_date:          response['apply_date'],
                start_date:          response['staging_start_date'],
                project_description: response['project_description']
          })
      end
    end
  end

  def self.by_country
    Opening.all.pluck(:country).uniq.sort.map do |country|
      country.capitalize
    end
  end

  def self.by_sector
    Opening.all.pluck(:sector).uniq.sort
  end

  def image
    "#{sector.parameterize}.jpg"
    # "#{sector.parameterize}-#{id % 3}.jpg"
  end
  # "community-economic-development-0.jpg"
  # "community-economic-development-1.jpg"
  # "community-economic-development-2.jpg"
end

# <dt> <%= image_tag opening.image %></dt>
