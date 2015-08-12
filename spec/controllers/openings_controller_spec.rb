require "rails_helper"

RSpec.describe OpeningsController, type: :controller do
  let(:opening) { Opening.create(title: "Title", req_id: "123", country: "Country", sector: "Sector", apply_date: "12345", start_date: "12345", project_description: "Description") }

  describe "GET index" do
    it "renders the index" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, id: opening.id
      expect(response).to have_http_status(:success)
    end
  end
end

