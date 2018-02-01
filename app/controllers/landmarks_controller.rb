class LandmarksController < ApplicationController

    get '/landmarks' do
        @landmarks = Landmark.all
        erb :'/landmarks/index'
    end

    get '/landmarks/new' do
        @figures = Figure.all
        @titles = Title.all
        erb :'/landmarks/new'
    end

    post '/landmarks' do
        Landmark.create(params[:landmark])
        redirect to :'/landmarks'
    end

    get '/landmarks/:id' do
        @landmark = find_landmark
        erb :'/landmarks/show'
    end

    get '/landmarks/:id/edit' do
        @landmark = find_landmark
        erb :'/landmarks/edit'
    end

    patch '/landmarks/:id' do
        landmark = Landmark.update(params[:landmark])
        redirect to "/landmarks/#{landmark.id}"
    end

    helpers do
        def find_landmark
            Landmark.find(params[:id])
        end
    end

end
