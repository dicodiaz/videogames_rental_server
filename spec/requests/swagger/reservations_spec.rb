require 'swagger_helper'

RSpec.describe 'reservations', type: :request do
  path '/reservations' do
    get('list user reservations') do
      tags :Reservations
      security [Bearer: []]
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
                       user_id: { type: :number },
                       days: { type: :number },
                       total_price: { type: :string },
                       created_at: { type: :string },
                       videogame: {
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

      response(401, 'Unauthorized - Only users can see their own reservations') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        run_test!
      end
    end

    post('create reservation') do
      tags :Reservations
      security [Bearer: []]
      consumes 'application/json'
      produces 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          reservation: {
            type: :object,
            properties: {
              videogame_id: { type: :number },
              days: { type: :number },
              total_price: { type: :number }
            },
            required: %w[videogame_id days total_price]
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
                     user_id: { type: :number },
                     days: { type: :number },
                     total_price: { type: :string },
                     created_at: { type: :string },
                     videogame: {
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
               }

        let(:reservation) { { reservation: { videogame_id: 1, days: 1, total_price: 1.0 } } }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(401, 'Unauthorized - Only users can create their own reservations') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:reservation) { { reservation: { videogame_id: 1, days: 1, total_price: 1.0 } } }
        run_test!
      end

      response(422, 'Unprocessable Entity') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:reservation) { { reservation: { videogame_id: 1, days: 1 } } }
        run_test!
      end
    end
  end

  path '/reservations/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show reservation') do
      tags :Reservations

      response(200, 'Successful') do
        schema type: :object,
               properties: {
                 id: { type: :string },
                 type: { type: :string },
                 attributes: {
                   type: :object,
                   properties: {
                     id: { type: :number },
                     user_id: { type: :number },
                     days: { type: :number },
                     total_price: { type: :string },
                     created_at: { type: :string },
                     videogame: {
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

      response(401, 'Unauthorized - Only users can see their own reservations') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:id) { '1' }
        run_test!
      end

      response(404, 'Not found') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:id) { '1' }
        run_test!
      end
    end

    patch('update reservation') do
      tags :Reservations
      security [Bearer: []]
      consumes 'application/json'
      produces 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          reservation: {
            type: :object,
            properties: {
              videogame_id: { type: :number },
              days: { type: :number },
              total_price: { type: :number }
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
                     user_id: { type: :number },
                     days: { type: :number },
                     total_price: { type: :string },
                     created_at: { type: :string },
                     videogame: {
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

      response(401, 'Unauthorized - Only users can see their own reservations') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:id) { '1' }
        run_test!
      end

      response(404, 'Not found') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:id) { '1' }
        run_test!
      end

      response(422, 'Unprocessable Entity') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:id) { '1' }
        run_test!
      end
    end

    put('update reservation') do
      tags :Reservations
      security [Bearer: []]
      consumes 'application/json'
      produces 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          reservation: {
            type: :object,
            properties: {
              videogame_id: { type: :number },
              days: { type: :number },
              total_price: { type: :number }
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
                     user_id: { type: :number },
                     days: { type: :number },
                     total_price: { type: :string },
                     created_at: { type: :string },
                     videogame: {
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

      response(401, 'Unauthorized - Only users can see their own reservations') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:id) { '1' }
        run_test!
      end

      response(404, 'Not found') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:id) { '1' }
        run_test!
      end

      response(422, 'Unprocessable Entity') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:id) { '1' }
        run_test!
      end
    end

    delete('delete reservation') do
      tags :Reservations
      security [Bearer: []]
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

      response(401, 'Unauthorized - Only users can see their own reservations') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:id) { '1' }
        run_test!
      end

      response(404, 'Not found') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               }

        let(:id) { '1' }
        run_test!
      end
    end
  end
end
