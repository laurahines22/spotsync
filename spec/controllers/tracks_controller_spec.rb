require 'rails_helper'

RSpec.describe TracksController, type: :controller do

  describe "GET #search" do
    it "returns http success" do
      get :search
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #add_to_playlist" do
    it "returns http success" do
      get :add_to_playlist
      expect(response).to have_http_status(:success)
    end
  end

end
