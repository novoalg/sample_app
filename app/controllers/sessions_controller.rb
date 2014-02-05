class SessionsController < ApplicationController

	def new
	end

	def create
	 user = User.find_by_email(params[:session][:email].downcase)
	 if user && user.authenticate(params[:session][:password])
	  #sign the user in and redirect to the user's show page.
	  sign_in user
	  redirect_to user
      flash[:success] = "Welcome User!"
	 else
  	  #create an error message and re-render the signin form
	  flash.now[:error] = 'Invalid email/password combination'
	  render 'new'
	 end
	end

	def destroy
        sign_out
        redirect_to root_url
	end
end