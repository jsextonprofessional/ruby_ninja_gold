class RpgsController < ApplicationController
    
    def index
        @count = session[:count] ||= 0
        @farm = session[:farm]
        @cave = session[:cave]
        @house = session[:house]
        @casino = session[:casino]
    end  

    def handler
        flash[:success] = "u did it"
        session[:farm] = session[:count] + rand(10..20)
        session[:cave] = session[:count] + rand(5..10)
        session[:house] = session[:count] + rand(2..5)
        session[:casino] = session[:count] + rand(-50..50)
        redirect_to '/'
    end

    def reloader
        render index
    end

end
