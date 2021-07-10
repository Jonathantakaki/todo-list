
FactoryBot.define do
    factory :grupo do
      nome { Faker::Lorem.word }
    end
  end

  # spec/requests/todos_spec.rb
require 'rails_helper'

RSpec.describe 'Grupos API', type: :request do
 
  let!(:Grupos) { create_list(:grupo, 10) }
  let(:grupo_id) { grupos.first.id }

 
  describe 'GET /grupos' do
  
    before { get '/grupos' }

    it 'returns grupos' do
    
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


  describe 'GET /grupos/:id' do
    before { get "/grupos/#{todo_id}" }

    context 'when the record exists' do
      it 'returns the todo' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(todo_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:todo_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Todo/)
      end
    end
  end

  
  describe 'POST /grupos' do
 
    let(:valid_attributes) { { nome: 'Apredendo Ruby' } }

    context 'when the request is valid' do
      before { post '/grupos', params: valid_attributes }

      it 'creates a todo' do
        expect(json['nome']).to eq('Aprendendo Ruby')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/grupos', params: { nome: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end


  describe 'PUT /grupos/:id' do
    let(:valid_attributes) { { nome: 'Exercicio Fisico' } }

    context 'when the record exists' do
      before { put "/grupos/#{grupo_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

 
  describe 'DELETE /grupos/:id' do
    before { delete "/grupos/#{grupo_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end