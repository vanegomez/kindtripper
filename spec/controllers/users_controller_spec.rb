require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:user) { User.create(name: "Vane Gomez", nickname: "Vane", uid: "12345", token: "12345", token_secret: "12345") }

  describe "GET show" do
    it "returns http success" do
      get :show, id: user.id
      expect(response).to have_http_status(:success)
    end
  end
end

