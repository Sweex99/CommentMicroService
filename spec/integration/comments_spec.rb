require 'swagger_helper'

describe 'D A' do
  path '/api/v1/comments' do

    post 'Creates a comment' do

      tags 'Comments'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string },
          user_id: { type: :integer },
          product_id: { type: :integer },
          comment_id: { type: :integer }
        },
        required: %w[text user_id product_id]
        }
    
        response '201', 'comment created' do
          let(:pet) { { name: 'Dodo', status: 'available' } }
          run_test!
        end
    
        response '422', 'invalid request' do
          let(:pet) { { name: 'foo' } }
          run_test!
        end
      end
    end

    path '/api/v1/comments/{id}' do

      get 'Retrieves a comment' do
        tags 'Comments'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :string
    
        response '200', 'comment found' do
          schema type: :object,
          properties: {
            id: { type: :integer },
            text: { type: :string },
            product_id: { type: :integer },
            user_id: { type: :integer }
          },
          required: [ 'id', 'text', 'product_id' 'user_id' ]

          let(:id) { Comment.create(text: 'foo', product_id: 1, user_id: 1, comment_id: 1) }
          run_test!
        end
    
        response '404', 'pet not found' do
            let(:id) { 'invalid' }
            run_test!
          end
      end

      path '/api/v1/comments' do

        get 'Retrieves all comment' do
          tags 'Comments'
          consumes 'application/json'

          response '200', 'comment found' do
            run_test!
          end

          response '404', 'comment not found' do
              run_test!
            end
        end  
    end

    path '/api/v1/comments/{id}' do

        put 'Updates a comment' do
    
          tags 'Comments'
          consumes 'application/json'
          parameter name: :id, in: :path, type: :string
          parameter name: :comment, in: :body, schema: {
            type: :object,
            properties: {
              text: { type: :string },
              user_id: { type: :integer },
              product_id: { type: :integer },
              comment_id: { type: :integer }
            },
            required: %w[text user_id product_id]
            }
        
            response '201', 'comment created' do
              let(:pet) { { name: 'Dodo', status: 'available' } }
              run_test!
            end
        
            response '422', 'invalid request' do
              let(:pet) { { name: 'foo' } }
              run_test!
            end
          end
        end

        path '/api/v1/comments/{id}' do

          delete 'Updates a comment' do

            tags 'Comments'
            consumes 'application/json'
            parameter name: :id, in: :path, type: :string

              response '201', 'comment created' do
                let(:pet) { { name: 'Dodo', status: 'available' } }
                run_test!
              end

              response '422', 'invalid request' do
                let(:pet) { { name: 'foo' } }
                run_test!
              end
            end
          end

# ------------------------------------

path '/api/v1/comments/user_comments/{user_id}' do

  get 'Retrieves a comment' do
    tags 'Comments'
    consumes 'application/json'
    parameter name: :user_id, in: :path, type: :string

    response '200', 'comment found' do
      schema type: :object,
      properties: {
        id: { type: :integer },
        text: { type: :string },
        product_id: { type: :integer },
        user_id: { type: :integer },
        comment_id: { type: :integer}
      },
      required: [ 'id', 'text', 'product_id' 'user_id', 'comment_id' ]

      let(:id) { Comment.create(text: 'foo', product_id: 1, user_id: 1, comment_id: 1) }
      run_test!
    end

    response '404', 'pet not found' do
        let(:id) { 'invalid' }
        run_test!
      end
  end

  path '/api/v1/comments/nested_comments/{comment_id}' do

    get 'Retrieves a comment' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :comment_id, in: :path, type: :string
  
      response '200', 'comment found' do
        schema type: :object,
        properties: {
          id: { type: :integer },
          text: { type: :string },
          product_id: { type: :integer },
          user_id: { type: :integer },
          comment_id: { type: :integer}
        },
        required: [ 'id', 'text', 'product_id' 'user_id', 'comment_id' ]

        let(:id) { Comment.create(text: 'foo', product_id: 1, user_id: 1, comment_id: 1) }
        run_test!
      end
  
      response '404', 'pet not found' do
          let(:id) { 'invalid' }
          run_test!
        end
    end

    path '/api/v1/comments/product_comments/{product_id}' do

      get 'Retrieves a comment' do
        tags 'Comments'
        consumes 'application/json'
        parameter name: :product_id, in: :path, type: :string
    
        response '200', 'comment found' do
          schema type: :object,
          properties: {
            id: { type: :integer },
            text: { type: :string },
            product_id: { type: :integer },
            user_id: { type: :integer },
            comment_id: { type: :integer }
          },
          required: [ 'id', 'text', 'product_id' 'user_id', 'comment_id' ]

          let(:id) { Comment.create(text: 'foo', product_id: 1, user_id: 1, comment_id: 1) }
          run_test!
        end
    
        response '404', 'pet not found' do
            let(:id) { 'invalid' }
            run_test!
          end
      end
    end
  end
end


# -------------------------------------
    end
end