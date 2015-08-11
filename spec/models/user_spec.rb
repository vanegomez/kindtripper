require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: "Vane Gomez", nickname: "Vane", uid: "12345", token: "12345", token_secret: "12345") }

  it 'is valid' do
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without a uid' do
    user.nickname = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without a token' do
    user.token = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without a secret token' do
    user.token_secret = nil
    expect(user).to_not be_valid
  end

  it 'responds to presence of user openings' do
    respond_to :user_openings
  end

  it 'responds to presence of openings' do
    respond_to :openings
  end
end
