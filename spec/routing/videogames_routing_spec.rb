require 'rails_helper'

RSpec.describe VideogamesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/videogames').to route_to('videogames#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/videogames/1').to route_to('videogames#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/videogames').to route_to('videogames#create', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: '/videogames/1').to route_to('videogames#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/videogames/1').to route_to('videogames#update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/videogames/1').to route_to('videogames#destroy', id: '1', format: :json)
    end
  end
end
