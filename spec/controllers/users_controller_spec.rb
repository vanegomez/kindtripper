require 'rails_helper'

describe UsersController do
  context '#show' do
    it 'returns an user' do
      user = User.create(name: "Vane Gomez", nickname: "Vane", uid: "12345", token: "12345", token_secret: "12345")

      get :show, id: user.id

      expect(response).to have_http_status(:ok)

      # poptart_response = JSON.parse(response.body)
      puts response.body
      expect(response.body["name"]).to eq('Vane Gomez')

      # expect(response.body['sprinkles']).to eq('none')
    end
  end
end
