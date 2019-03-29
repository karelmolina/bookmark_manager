require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :session, :method_override
  register Sinatra::Flash

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
    begin
      Bookmark.generate(title: params[:title],url: params[:url])
    rescue
      flash[:notice] = "You must submit a valid URL."
    end
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/edit/:id' do
    @id = params[:id]
    erb :edit
  end

  patch 'bookmarks/:id' do
    Bookmark.update(id: params[:id],title: params[:title], url: params[:url])
  end

  run if app_file == $0
end
