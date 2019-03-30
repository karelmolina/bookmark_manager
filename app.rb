require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/bookmark'
require_relative './lib/comments'
require_relative './lib/help_enviroment'
require_relative './lib/tags'
require_relative './lib/bookmark_tag'
require_relative './lib/user'

''' class for app to run the routes'''
class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @user = User.find(id: session[:id_user])
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/bookmarks/add' do
    erb :add
  end

  post '/add' do
    flash[:notice] = 'You must submit a valid URL.' unless Bookmark.generate(title: params[:title], url: params[:url])
    # begin
    #   Bookmark.generate(title: params[:title],url: params[:url])
    # rescue
    #   flash[:notice] = 'You must submit a valid URL. '
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
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/comment/new' do
    @id = params[:id]
    erb :comments
  end

  post '/bookmarks/:id/comment' do
    Comments.generate(text: params[:comment], bookmark_id: params[:id])
    redirect('/bookmarks')
  end

  get '/bookmarks/:id/tag/new' do
    @id = params[:id]
    erb :tags
  end

  post '/bookmarks/:id/tag' do
    tag = Tag.generate(tag: params[:tag])
    Bookmark_Tag.generate(bookmark_id: params[:id],tag_id: tag.id)
    redirect('/bookmarks')
  end

  get '/user/new' do
    erb :user
  end

  post '/user' do
    user = User.generate(email: params[:email], pwd: params[:pwd])
    session[:id_user] = user.id
    redirect('/bookmarks')
  end

  run if app_file == $PROGRAM_NAME
end
