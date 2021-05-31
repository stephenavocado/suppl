class UserAuthenticationController < ApplicationController
  # Uncomment this if you want to force users to sign in before any other actions
  # skip_before_action(:force_user_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def show

    matching_invitations = Invitation.all
    @list_of_invitations = matching_invitations.order({ :created_at => :desc })

    matching_projects = Project.all
    @list_of_projects = matching_projects.order({ :created_at => :desc })

    matching_palettes = Palette.all
    @list_of_palettes = matching_palettes.order({ :created_at => :desc })
    
    render({ :template => "user_authentication/show.html.erb" })
  end
  
  def sign_in_form
    render({ :template => "user_authentication/sign_in.html.erb" })
  end

  def create_cookie
    user = User.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if user != nil
      are_they_legit = user.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/user_sign_in", { :alert => "Incorrect password." })
      else
        session[:user_id] = user.id
      
        redirect_to("/materials", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/", { :alert => "No user with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "user_authentication/sign_up.html.erb" })
  end

  def create
    @user = User.new
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    # @user.user_type = params.fetch("query_user_type")
    @user.username = params.fetch("query_username")
    @user.first_name = params.fetch("query_first_name")
    @user.last_name = params.fetch("query_last_name")
    # @user.comments_count = params.fetch("query_comments_count")
    # @user.projects_count = params.fetch("query_projects_count")
    # @user.invitations_sent_count = params.fetch("query_invitations_sent_count")
    # @user.invitation_requests_count = params.fetch("query_invitation_requests_count")

    save_status = @user.save

    if save_status == true
      session[:user_id] = @user.id
   
      redirect_to("/materials", { :notice => "User account created successfully."})
    else
      redirect_to("/", { :alert => "User account failed to create successfully."})
    end
  end
    
  def edit_profile_form
    render({ :template => "user_authentication/edit_profile.html.erb" })
  end

  def update
    @user = @current_user
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.user_type = params.fetch("query_user_type")
    @user.username = params.fetch("query_username")
    @user.first_name = params.fetch("query_first_name")
    @user.last_name = params.fetch("query_last_name")
    
    if @user.valid?
      @user.save

      redirect_to("/materials", { :notice => "User account updated successfully."})
    else
      render({ :template => "user_authentication/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_user.destroy
    reset_session
    
    redirect_to("/", { :notice => "User account cancelled" })
  end
 
end
