require 'sinatra/base'
require 'slim'
require 'rack-google-analytics'

class Connify < Sinatra::Base
  use Rack::GoogleAnalytics, :tracker => 'UA-75589081-1'

  get '/' do
    slim :index
  end

  post '/' do
    set_input
    @result = connify(@input)
    puts "index post - input is #{@input}, result is #{@result}"
    slim :index
  end

  get '/:num' do
    set_input
    @result = connify(@input)
    slim :index
  end

  def set_input
    @input = params[:num].to_i
  end

  def connify(input)
    (input.is_a? Integer) ? input * 4 : "error: please enter a number."
  end
end

