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
     else
       @notice = "Sorry! looks like invalid email or already registered"
     end
  end

  def credits

  end

  private
    def join_params
      params.require(:join).permit(:email, :association_type, :message)
    end
end
