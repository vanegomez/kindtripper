class Opening < ActiveRecord::Base
  require 'httparty'
  has_many :user_openings
  has_many :users, through: :user_openings

  validates :title, presence: true
  validates :req_id, presence: true
  validates :country, presence: true
  validates :sector, presence: true
  validates :apply_date, presence: true
  validates :start_date, presence: true
  validates :project_description, presence: true

  after_create :clear_cache
  after_save :clear_cache
  after_destroy :clear_cache

  def clear_cache
    Rails.cache.clear
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
  end
end
