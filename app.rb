require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/bookmark'
require_relative './lib/help_enviroment'
require_relative './lib/comments'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
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
    flash[:notice] = "You must submit a valid URL." unless Bookmark.generate(title: params[:title],url: params[:url])
    # begin
    #   Bookmark.generate(title: params[:title],url: params[:url])
    # rescue
    #   flash[:notice] = "You must submit a valid URL. "
    # end
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

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id],title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/comment/new' do
    @id = params["id"]
    erb :comments
  end

  post '/bookmarks/:id/comment' do
    Comments.generate(text: params["text"], bookmark_id: params["id"])
    redirect('/bookmarks')
  end

  run if app_file == $0
end
