class SessionsController < ApplicationController

    def new
    
    end

    def create
        user = User.find_by(email: session_params[:email].downcase)
            if user && user.authenticate(session_params[:password])
                session[:user_id] = user.id
                flash[:notice] = "Welcome #{user.username} You are successfully Logged In"
                redirect_to user
          else
            flash.now[:alert] = "Invalid Credentials"
            render :new
          end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end

    def session_params
        params.require(:session).permit(:email, :password)
      end
end
