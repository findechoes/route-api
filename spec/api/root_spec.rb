require 'spec_helper'

describe Root::API do
  context "GET /api/v1/routes" do
    it "return empty array" do
      get '/api/v1/routes'
      expect(response.status).to eq 200
    end
  end
  context "GET /api/v1/routes/1" do
    it "return routes of id" do
      get '/api/v1/routes/1'do
        expect(response.status).to eq 200
      end
    end
  end
  context "POST /api/v1/routes" do
    it "create 1 new route" do
      statuses = [{name: "test"}, {name: "test2"}]
      post '/api/v1/routes', statuses.to_json, 'CONTENT_TYPE' => 'application/json' do
        expect(response.status).to eq 201
      end
    end
    it "create many new routes" do
      statuses = {name: "test"}
      post '/api/v1/routes', statuses.to_json, 'CONTENT_TYPE' => 'application/json' do
        expect(response.body).to eq 201
      end
    end
  end
  context "GET /api/v1/spots" do
    it "return all spot" do
      get '/api/v1/spots' do
        expect(response.status).to eq 200
      end
    end
  end
  context "GET /api/v1/spots/1" do
    it "return spot of id" do
      get '/api/v1/spots/1' do
        expect(response.status).to eq 200
      end
    end
  end
end
