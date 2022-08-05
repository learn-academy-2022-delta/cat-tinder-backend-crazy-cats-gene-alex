require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do 
      Cat.create(
        name: 'Felix',
        age: 2,
        enjoys: 'Walks in the park',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )

      get '/cats'

      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1

    end
  end

  describe "POST /create" do
    it "creates a cat" do 
      cat_params = {
        cat: {
        name: 'Buster',
        age: 4,
        enjoys: 'Meow Mix, and plenty of sunshine.',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }

      post '/cats', params: cat_params

      expect(response).to have_http_status(200)

      cat = Cat.first 

      expect(cat.name).to eq 'Buster'
    end
  end

  describe "PATCH /update" do
    it "updates a cat" do 
      cat_params = {
        cat: {
        name: 'Buster',
        age: 4,
        enjoys: 'Meow Mix, and plenty of sunshine.',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }

      post '/cats', params: cat_params

      cat = Cat.first
      updated_cat_params = {
        cat: {
        name: 'Buster',
        age: 5,
        enjoys: 'Meow Mix, and plenty of sunshine.',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }

      patch "/cats/#{cat.id}", params: updated_cat_params
      updated_cat = Cat.find(cat.id)
      expect(response).to have_http_status(200)
      expect(updated_cat.age).to eq 5

    end
  end

  describe 'DELETE /destroy' do
    it "deletes a cat" do 
      cat_params = {
        cat: {
        name: 'Buster',
        age: 4,
        enjoys: 'Meow Mix, and plenty of sunshine.',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
    post "/cats", params: cat_params
    cat = Cat.first
    delete "/cats/#{cat.id}"
    expect(response).to have_http_status(200)
    cats = Cat.all
    expect(cats).to be_empty
    end
  end

  describe "cannot create a cat without valid attributes" do
    it "doesn't create a cat without a name" do
      cat_params = {
        cat: {
          age: 6,
          enjoys: 'getting error codes',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      
      post '/cats', params: cat_params
      expect(response.status).to eq 422
      cat = JSON.parse(response.body)
      expect(cat['name']).to include "can't be blank"
    end

    it "doesn't create a cat without a age" do
      cat_params = {
        cat: {
          name: 'Fluffy',
          enjoys: 'getting error codes',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      
      post '/cats', params: cat_params
      expect(response.status).to eq 422
      cat = JSON.parse(response.body)
      expect(cat['age']).to include "can't be blank"
    end

    it "doesn't create a cat without a enjoys" do
      cat_params = {
        cat: {
          name: 'Fluffy',
          age: 6,
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      
      post '/cats', params: cat_params
      expect(response.status).to eq 422
      cat = JSON.parse(response.body)
      expect(cat['enjoys']).to include "can't be blank"
    end

    it "doesn't create a cat without an image" do
      cat_params = {
        cat: {
          name: 'Fluffy',
          age: 6,
          enjoys: 'getting error codes',
        }
      }
      
      post '/cats', params: cat_params
      expect(response.status).to eq 422
      cat = JSON.parse(response.body)
      expect(cat['image']).to include "can't be blank"
    end
  end

  describe "cannot update cat without valid attributes" do
    it "updates a cat" do 
      cat_params = {
        cat: {
        name: 'Buster',
        age: 4,
        enjoys: 'Meow Mix, and plenty of sunshine.',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }

      post '/cats', params: cat_params

      cat = Cat.first
      updated_cat_params = {
        cat: {
        name: 'Buster',
        age: 4,
        enjoys: 'Meow',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }

      patch "/cats/#{cat.id}", params: updated_cat_params
      expect(response.status).to eq 422
     
    end
  end
end
