require 'swagger_helper'

RSpec.describe 'videogames', type: :request do
  path '/videogames' do
    get('list videogames') do
      tags :Videogames
      produces 'application/json'

      response(200, 'Successful') do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :string },
                   type: { type: :string },
                   attributes: {
                     type: :object,
                     properties: {
                       id: { type: :number },
                       name: { type: :string },
                       photo: { type: :string },
                       description: { type: :string },
                       price_per_day: { type: :string }
                     }
                   }
                 }
               }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create videogame') do
      tags :Videogames
      consumes 'application/json'
      produces 'application/json'
      parameter name: :videogame, in: :body, schema: {
        type: :object,
        properties: {
          videogame: {
            type: :object,
            properties: {
              name: { type: :string },
              photo: { type: :string },
              description: { type: :string },
              price_per_day: { type: :number }
            },
            required: %w[name photo description price_per_day]
          }
        }
      }

      response(201, 'Created') do
        schema type: :object,
               properties: {
                 id: { type: :string },
                 type: { type: :string },
                 attributes: {
                   type: :object,
                   properties: {
                     id: { type: :number },
                     name: { type: :string },
                     photo: { type: :string },
                     description: { type: :string },
                     price_per_day: { type: :string }
                   }
                 }
               }

        let(:videogame) do
          { videogame: { name: 'test', photo: 'photo', description: 'description', price_per_day: 1.0 } }
        end
        run_test!
      end

      response(401, 'Unauthorized - Only admins can create videogames') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:videogame) do
          { videogame: { name: 'test', photo: 'photo', description: 'description', price_per_day: 1.0 } }
        end
        run_test!
      end

      response(422, 'Unprocessable Entity') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:videogame) do
          { videogame: { name: 'test', photo: 'photo', description: 'description', price_per_day: 1.0 } }
        end
        run_test!
      end
    end
  end

  path '/videogames/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show videogame') do
      tags :Videogames
      produces 'application/json'

      response(200, 'Successful') do
        schema type: :object,
               properties: {
                 id: { type: :string },
                 type: { type: :string },
                 attributes: {
                   type: :object,
                   properties: {
                     id: { type: :number },
                     name: { type: :string },
                     photo: { type: :string },
                     description: { type: :string },
                     price_per_day: { type: :string }
                   }
                 }
               }

        let(:id) { '1' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'Not found') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:id) { '1' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update videogame') do
      tags :Videogames
      consumes 'application/json'
      produces 'application/json'
      parameter name: :videogame, in: :body, schema: {
        type: :object,
        properties: {
          videogame: {
            type: :object,
            properties: {
              name: { type: :string },
              photo: { type: :string },
              description: { type: :string },
              price_per_day: { type: :number }
            }
          }
        }
      }

      response(200, 'Successful') do
        schema type: :object,
               properties: {
                 id: { type: :string },
                 type: { type: :string },
                 attributes: {
                   type: :object,
                   properties: {
                     id: { type: :number },
                     name: { type: :string },
                     photo: { type: :string },
                     description: { type: :string },
                     price_per_day: { type: :string }
                   }
                 }
               }

        let(:id) { '1' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(401, 'Unauthorized - Only admins can update videogames') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:videogame) do
          { videogame: { name: 'test', photo: 'photo', description: 'description', price_per_day: 1.0 } }
        end
        run_test!
      end

      response(404, 'Not found') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:id) { '1' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, 'Unprocessable Entity') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:videogame) do
          { videogame: { name: 'test', photo: 'photo', description: 'description', price_per_day: 1.0 } }
        end
        run_test!
      end
    end

    put('update videogame') do
      tags :Videogames
      consumes 'application/json'
      produces 'application/json'
      parameter name: :videogame, in: :body, schema: {
        type: :object,
        properties: {
          videogame: {
            type: :object,
            properties: {
              name: { type: :string },
              photo: { type: :string },
              description: { type: :string },
              price_per_day: { type: :number }
            }
          }
        }
      }

      response(200, 'Successful') do
        schema type: :object,
               properties: {
                 id: { type: :string },
                 type: { type: :string },
                 attributes: {
                   type: :object,
                   properties: {
                     id: { type: :number },
                     name: { type: :string },
                     photo: { type: :string },
                     description: { type: :string },
                     price_per_day: { type: :string }
                   }
                 }
               }

        let(:id) { '1' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(401, 'Unauthorized - Only admins can update videogames') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:videogame) do
          { videogame: { name: 'test', photo: 'photo', description: 'description', price_per_day: 1.0 } }
        end
        run_test!
      end

      response(404, 'Not found') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:id) { '1' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, 'Unprocessable Entity') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:videogame) do
          { videogame: { name: 'test', photo: 'photo', description: 'description', price_per_day: 1.0 } }
        end
        run_test!
      end
    end

    delete('delete videogame') do
      tags :Videogames
      produces 'application/json'

      response(200, 'Successful') do
        schema type: :object,
               properties: {
                 message: { type: :string }
               }

        let(:id) { '1' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(401, 'Unauthorized - Only admins can delete videogames') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:id) { '1' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'Not found') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:id) { '1' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
