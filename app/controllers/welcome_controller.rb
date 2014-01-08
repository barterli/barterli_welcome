class WelcomeController < ApplicationController
  
  def index
    @join = Join.new
  end

  def create_join
    @join = Join.new(join_params)
   
     if @join.save
       flash[:notice] = "You will receive a notification when the product is live"
       redirect_to root_path
     else
       flash[:alert] = "Sorry! looks like invalid email"
       redirect_to root_path
     end
  end


  private
    def join_params
      params.require(:join).permit(:email, :association_type, :message)
    end
end
