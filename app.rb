require 'sinatra'
require 'sinatra/reloader'

set :public_folder, 'public'

enable :sessions


get '/' do
  if @name
    erb :form
  end
  erb :index
end


get '/form' do
  @name = session[:login]
  @message = session[:message]
  session[:message] = nil

  erb :form
end


# ログインフォーム

get '/login' do
  @name = session[:login]
  @message = session[:message]
  session[:message] = nil

  erb :login_form
end



post '/login' do
    if params[:name] == 'tamashiro' && params[:password] == 'tamashiro'
      session[:login] = 'タマシロ'
      session[:message] = 'ログインしました'
      redirect '/form'
    else
      session[:message] = 'ログイン失敗しました'
    end
  redirect '/login'
end



# ログアウト

get '/logout' do
  session[:login] = nil
  redirect '/'
end
