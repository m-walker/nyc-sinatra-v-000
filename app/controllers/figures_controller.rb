class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if params[:title] != {"name"=>""}
      @title = Title.create(params[:title])
      @figure.titles << @title
    end
    if params[:landmark] != {"name"=>""}
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if params[:title] != {"name"=>""}
      @title = Title.new(params[:title])
      @figure.titles << @title
      @figure.save
    end
    if params[:landmark] != {"name"=>""}
      @title = landmark.new(params[:landmark])
      @figure.landmarks << @title
      @figure.save
    end

    redirect to "/figures/#{@figure.id}"
  end
  
end