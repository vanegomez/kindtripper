require 'rails_helper'

RSpec.describe Opening, type: :model do
  let(:opening) { Opening.create(title: "Title", req_id: "123", country: "Country", sector: "Sector", apply_date: "12345", start_date: "12345", project_description: "Description") }

  it 'is valid' do
    expect(opening).to be_valid
  end

  it 'is invalid without a title' do
    opening.title = nil
    expect(opening).to_not be_valid
  end

  it 'is invalid without a req_id' do
    opening.req_id = nil
    expect(opening).to_not be_valid
  end

  it 'is invalid without a country' do
    opening.country = nil
    expect(opening).to_not be_valid
  end

  it 'is invalid without a sector' do
    opening.sector = nil
    expect(opening).to_not be_valid
  end

  it 'is invalid without a apply date' do
    opening.apply_date = nil
    expect(opening).to_not be_valid
  end

  it 'is invalid without a start date' do
    opening.start_date = nil
    expect(opening).to_not be_valid
  end

  it 'is invalid without a project description' do
    opening.project_description = nil
    expect(opening).to_not be_valid
  end

  it 'responds to presence of users' do
    respond_to :users
  end

  it 'responds to presence of openings' do
    respond_to :openings
  end

  it 'can find or create a job' do
    VCR.use_cassette("finding_jobs") do
      expect(Opening.count).to eq 0
      jobs = ImportOpenings.call
      expect(jobs.length).to be > 0

      expect(Opening.count).to eq(jobs.length)
      ImportOpenings.call
      expect(Opening.count).to eq(jobs.length)
    end
  end

  it 'can find all the countries' do
    opening
    expect(Opening.by_country.count).to eq(1)
    expect(opening.country).to eq("Country")
  end

  it 'can find all the sectors' do
    opening
    expect(Opening.by_sector.count).to eq(1)
  end

  it 'responds to image method' do
    expect(opening).to respond_to(:image)
    expect(opening.image).to eq("sector.jpg")
  end
end
