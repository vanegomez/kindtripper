require 'rails_helper'

describe "user logins", type: :feature do
  before(:each) do
    stub_omniauth
  end

  it "can login with twitter" do
    visit "/"
    expect(page.status_code).to eq(200)
    click_link "Login"
    expect(page).to have_content("logout")
  end

  it "can logout" do
    visit '/'
    click_link "Login"
    expect(page).to have_content("logout")
    click_link "logout"
    expect(page).to have_content("Login")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
        provider: 'twitter',
        uid: "1234",
        info: {
            name: "Horace",
            nickname: "worace",
          },
        credentials: {
          token: "pizza",
          secret: "secretpizza"
        }
      })
  end
end

