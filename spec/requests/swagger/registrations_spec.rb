require 'swagger_helper'

RSpec.describe 'registrations', type: :request do
  path '/signup' do
    post('sign up user') do
      tags :Registration
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              name: { type: :string },
              address: { type: :string },
              email: { type: :string },
              password: { type: :string },
              admin: { type: :boolean, default: false }
            },
            required: %w[name address email password]
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

        let(:user) do
          { user: { name: 'user name', address: 'user address', email: 'user_email@mail.com',
                    password: 'user_password' } }
        end
        run_test!
      end

      response '401', 'Unauthorized' do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:user) do
          { user: { name: 'user name', address: 'user address', email: 'user_email@mail.com',
                    password: 'user_password' } }
        end
        run_test!
      end
    end
  end
end
