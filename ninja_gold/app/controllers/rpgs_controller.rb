class RpgsController < ApplicationController
    
    def index
        @count = session[:count]
        session[:count] ||= 0
        @output = session[:output]
        session[:output] ||= []
    end

    def handler
        timestamp = Time.now
        if params[:source] == 'farm'
            count = rand(10..20)
        elsif params[:source] == 'cave'
            count = rand(5..20)
        elsif params[:source] == 'house'
            count = rand(2..5)
        elsif params[:source] == 'casino'
            count = rand(-50..50)
        end
        if count > 0
            session[:output] << "Earned #{count} GOLDS from the #{params[:source]}! YEEEEET!!1 (#{timestamp.strftime('%Y/%m/%d %l:%M %P')})"
        else
            session[:output] << "Entered a casino and lost #{count} GOLDS. Bummer. (#{timestamp.strftime('%Y/%m/%d %l:%M %P')})"
        end
        session[:count] += count
        redirect_to '/'
    end
end
