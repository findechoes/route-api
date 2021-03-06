require 'spec_helper'

describe V1::Spots do
  before(:each) do
    Spot.delete_all
  end
  context "GET /api/v1/spots" do
    it "return all spot" do
      get '/api/v1/spots'
      expect(response.status).to eq 200
    end
  end
  context "GET /api/v1/spots/1" do
    it "return spot of id" do
      @spot = Spot.create(name: "test1")
      @spot.save
      get "/api/v1/spots/#{@spot.id}"
      expect(response.status).to eq 200
    end
  end
  context "POST /api/v1/spots" do
    it "create 1 new spot" do
      statuses = {name: "test"}
      post '/api/v1/spots', statuses.to_json, 'CONTENT_TYPE' => 'application/json'
      expect(response.status).to eq 201
      expect(Spot.all.size).to eq 1
    end
  end
  context "DELETE /api/v1/spots/1" do
    it "delete 1 spot" do
      expect(Spot.all.size).to eq 0
      @spot = Spot.create(name: "test1")
      @spot.save
      expect(Spot.all.size).to eq 1
      delete "/api/v1/spots/#{@spot.id}"
      expect(response.status).to eq 200
      expect(Spot.all.size).to eq 0
    end
  end
  context "PUT /api/v1/spots/1" do
    it "update 1 spot" do
      status = {
        name: "test",
        desc: "Loren Ipsum",
        long: 180.0,
        lat: 90.0
      }
      expect(Spot.all.size).to eq 0
      @spot = Spot.create(name: "test1")
      @spot.save
      expect(Spot.all.size).to eq 1
      put "/api/v1/spots/#{@spot.id}", status.to_json, 'CONTENT_TYPE' => 'application/json'
      expect(response.status).to eq 200
      expect(Spot.all.size).to eq 1
    end
  end
end
