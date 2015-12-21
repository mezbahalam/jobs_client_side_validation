class HomeController < ApplicationController

  def index
  	if current_user
  		redirect_to job_path
   end
  end
  def index
  	
 
  end
end
