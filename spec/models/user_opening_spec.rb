require 'rails_helper'

RSpec.describe UserOpening, type: :model do
  let(:job) { UserOpening.new(user_id: 1, opening_id: 1) }

  it 'is valid' do
    expect(job).to be_valid
  end

  it 'is invalid without a user id' do
    job.user_id = nil
    expect(job).to_not be_valid
  end

  it 'is invalid without a opening id' do
    job.opening_id = nil
    expect(job).to_not be_valid
  end

  it 'responds to presence of user jobs' do
    respond_to :user_jobs
  end

  it 'responds to presence of users' do
    respond_to :users
  end
end
