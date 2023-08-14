require 'swagger_helper'

RSpec.describe 'sessions', type: :request do
  path '/login' do
    post('log in user') do
      tags :Session
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string, default: 'admin@mail.com' },
              password: { type: :string, default: 'test123' }
            },
            required: %w[email password]
          }
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

        let(:user) { { user: { email: 'user_email@mail.com', password: 'user_password' } } }
        run_test!
      end

      response '401', 'Unauthorized' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:user) { { user: { email: 'user_email@mail.com', password: 'user_password' } } }
        run_test!
      end
    end
  end

  path '/logout' do
    delete('log out user') do
      tags :Session
      security [Bearer: []]
      consumes 'application/json'
      produces 'application/json'

      response '200', 'Successful' do
        schema type: :object,
               properties: {
                 message: { type: :string }
               }

        run_test!
      end

      response '401', 'Unauthorized' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        run_test!
      end
    end
  end
end
