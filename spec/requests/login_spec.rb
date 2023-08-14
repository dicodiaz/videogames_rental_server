require 'swagger_helper'

RSpec.describe 'login', type: :request do
  path '/login' do
    post('log in user') do
      tags :Login
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        }
      }

      response '200', 'Successful' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 address: { type: :string },
                 email: { type: :string },
                 admin: { type: :boolean }
               }

        let(:user) do
          user = User.create(name: 'user name', address: 'user address', email: 'user_email@mail.com',
                             password: 'user_password')
          { email: user.email, password: user.password }
        end
        run_test!
      end

      response '401', 'Unauthorized' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:user) { { email: 'user_email@mail.com', password: 'user_password' } }
        run_test!
      end
    end
  end
end
