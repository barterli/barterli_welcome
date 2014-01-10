class WelcomeController < ApplicationController
  
  def index
    @join = Join.new
  end

  def create_join
    join_params.each_pair do |k, v|
      params['k'] = v.downcase!
    end
    @join = Join.new(join_params)
     if @join.save
       Notifier.welcome_mail(@join).deliver
       @notice = "You will receive a notification when the product is live"
       @redirect = true
     else
       @redirect = false
       @errors = "<ul>"
      @join.errors.each do |name, error|
          if name.to_s.downcase == "email"
            @errors += "<li>"+name.to_s.capitalize + " " + error+"</li>"
         else
            @errors += "<li>"+error+"</li>"
         end
       end
        @errors += "</ul>"
        @notice = @errors.html_safe
     end
  end

  def credits

  end

  private
    def join_params
      params.require(:join).permit(:email, :association_type, :message)
    end
end
