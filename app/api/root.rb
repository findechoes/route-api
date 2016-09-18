module Root
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    rescue_from Neo4j::ActiveNode::Labels::RecordNotFound do |e|
        rack_response({ message: e.message, status: 404 }.to_json, 404)
      end

    # http://localhost:3000/api/v1/routes/list
    resource :routes do
      desc 'Return all route.'
      get do
        {:a => "test"}
      end
    end
    resource :spots do
      desc 'Return all spot.'
      get do
        Spot.all
      end
      desc 'Return all spot.'
      params do
        requires :id, type: Integer, desc: 'Spot id.'
      end
      get ':id' do
        Spot.find(params[:id])
      end
    end
  end
end
