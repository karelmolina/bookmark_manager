require 'sinatra/base'
require_relative 'lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :session

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/bookmarks/add' do
    erb :add
  end

  post '/add' do
    session[:url] = params[:url]
    Bookmark.new(session[:url])
    redirect '/bookmarks'
  end

  run if app_file == $0
end
