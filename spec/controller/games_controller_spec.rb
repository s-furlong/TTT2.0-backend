require 'rails_helper'

RSpec.describe "/games", type: :request do

  describe "POST /index" do
    it "renders a JSON response with the new game" do
        post "/api/v1/games",
             params: {:board => [" ", " ", " ", " ", " ", " ", " ", " ", " "]}, as: :json

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
        response_body = JSON.parse(response.body, symbolize_names: true)
        expect(response_body).to eq({:win => false, :token => "X", :draw => false, :winner => nil })
    end

    it "renders Token O in response if there is more Xs than Os" do
        post "/api/v1/games",
             params: {:board => ["X", "O", "X", "O", "X", " ", " ", " ", " "]}, as: :json

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
        response_body = JSON.parse(response.body, symbolize_names: true)
        expect(response_body).to eq({:win => false, :token => "O", :draw => false, :winner => nil })
    end

    it "renders true in response for tie is the board is full when there is no winner" do
        post "/api/v1/games",
             params: {:board => ["X", "O", "X", "O", "X", "X", "O", "X", "O"]}, as: :json

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
        response_body = JSON.parse(response.body, symbolize_names: true)
        expect(response_body).to eq({:win => false, :token => "O", :draw => true, :winner => nil })
    end

    it "renders true in response for win from X and winner is the X token" do
        post "/api/v1/games",
             params: {:board => [" ", "O", "X", "O", "X", "X", "X", "O", " "]}, as: :json
             
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
        response_body = JSON.parse(response.body, symbolize_names: true)
        expect(response_body).to eq({:win => true, :token => "O", :draw => false, :winner => "X" })
    end
  end
end
