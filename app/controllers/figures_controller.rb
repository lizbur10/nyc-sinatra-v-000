class FiguresController < ApplicationController

    get '/figures/new' do
        @titles = Title.all
        @landmarks = Landmark.all
        erb :'/figures/new'
    end

    post '/figures' do
        @figure = Figure.create(params[:figure])
        add_titles
        add_landmarks
        @figure.save
        redirect to '/figures'
    end

    get '/figures' do
        @figures = Figure.all
            
        erb :'/figures/index'
    end

    get '/figures/:id' do
        @figure = find_figure
        erb :'/figures/show'
    end

    get '/figures/:id/edit' do
        @figure = find_figure
        @titles = Title.all
        @landmarks = Landmark.all
        erb :'/figures/edit'
    end

    patch '/figures/:id' do
        @figure = find_figure
        @figure.update(params[:figure])
        add_titles
        add_landmarks
        @figure.save
        redirect to "/figures/#{@figure.id}"
        
    end

    helpers do
        def find_figure
            Figure.find(params[:id])
        end

        def add_titles
            if !params[:title].empty?
                @figure.titles << Title.create(params[:title])
            end
                
        end

        def add_landmarks
            if !params[:landmark].empty?
                @figure.landmarks << Landmark.create(params[:landmark])
            end
    
        end
    end
end
