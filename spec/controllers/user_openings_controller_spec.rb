require "rails_helper"

RSpec.describe UserOpeningsController, type: :controller do
  let(:user) { User.create(name: "Vane Gomez", nickname: "Vane", uid: "12345", token: "12345", token_secret: "12345") }
  let(:opening) { Opening.create(title: "Title", req_id: "123", country: "Country", sector: "Sector", apply_date: "12345", start_date: "12345", project_description: "Description") }
  let(:user_opening) { UserOpening.create(user_id: user.id, opening_id: opening.id) }

  describe 'Create action' do
    it 'creates a user opening' do
      session[:user_id] = user.id

      expect {
        post :create, user_id: user.id, opening_id: opening.id
      }.to change { UserOpening.count }.from(0).to(1)

      expect(response).to have_http_status(:found)
    end

    it 'creates a new user opening and redirects to user show page' do
      session[:user_id] = user.id

      expect {
        post :create, user_id: user.id, opening_id: opening.id
      }.to change { UserOpening.count }.from(0).to(1)

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(user_path(user))
    end
  end

  describe 'Destroy action' do
    it 'destroys a user opening' do
      user_opening

      expect {
        delete :destroy, id: user_opening.id
      }.to change { UserOpening.count }.from(1).to(0)

      expect(response).to have_http_status(:found)
    end
  end
end
