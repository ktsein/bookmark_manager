ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative './models/link.rb'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  post "/links" do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect "/links"
  end

  get "/links/new" do
    erb :add_link
  end

  get "/tags" do
    tag = Tag.all(name: params[:search_tag])
    @tag = tag
    @links = tag.links
    erb :tags
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
