require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  #read
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  #create
  post '/articles' do
    # binding.pry
    @article = Article.create(params)
    redirect to "/articles/#{ @article.id }"
    erb :show
  end

  #create
  get '/articles/new' do
    erb :new
  end

  #read
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  #update
  get '/articles/:id/edit' do 
    # binding.pry
    @article = Article.find(params[:id])
    erb :edit
  end
  
  patch '/articles/:id' do
    # binding.pryc
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  post '/articles/:id/delete' do 
    binding.pry
    @article = Article.find(params[:id])
    @article.destroy
  end
  
  
  
end
