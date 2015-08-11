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

  it 'responds to presence of user openings' do
    respond_to :user_openings
  end

  it 'responds to presence of users' do
    respond_to :users
  end
end
