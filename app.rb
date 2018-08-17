require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do
	@username = params[:username]
	@phone    = params[:phone]
	@datetime = params[:datetime]
	@barber   = params[:barber]
	@color    = params[:color]

	@title = 'Thank you!'

	@message = "Dear #{@username}, we'll be waiting for you #{@datetime}"

	f  = File.open './public/users.txt' , 'a'
	f.write "User: #{@username}, Phone: #{@phone} , Date and time: #{@datetime}, Barber: #{@barber}, #{@color} ;     "
	f.close

	erb :message
end

post '/contacts' do
	@email = params[:email]
	@text     = params[:text]

	@title = 'Thank you!'

	t  = File.open './public/contacts.txt' , 'a'
	t.write "Email: #{@email}, Text: #{@text}"
	t.close

	erb :message

end