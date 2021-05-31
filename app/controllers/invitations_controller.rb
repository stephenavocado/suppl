class InvitationsController < ApplicationController
  def index
    matching_invitations = Invitation.all

    @list_of_invitations = matching_invitations.order({ :created_at => :desc })

    render({ :template => "invitations/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_invitations = Invitation.where({ :id => the_id })

    @the_invitation = matching_invitations.at(0)

    render({ :template => "invitations/show.html.erb" })
  end

  def create
    the_invitation = Invitation.new
    the_invitation.recipient_id = params.fetch("query_recipient_id")
    the_invitation.project_id = params.fetch("query_project_id")
    the_invitation.sender_id = params.fetch("query_sender_id")
    the_invitation.status = params.fetch("query_status")

    if the_invitation.valid?
      the_invitation.save
      redirect_to("/projects/#{params.fetch("query_project_id")}", { :notice => "Invitation sent successfully!" })
    else
      redirect_to("/projects/#{params.fetch("query_project_id")}", { :notice => "Invitation failed to send." })
    end
  end

  def accept_invite
    the_id = params.fetch("path_id")
    the_invitation = Invitation.where({ :id => the_id }).at(0)
    the_invitation.status = "Accepted"

    if the_invitation.valid?
      the_invitation.save

      redirect_to("/user/#{session.fetch(:user_id)}", { :notice => "Invitation accepted."} )
    else
      redirect_to("/user/#{session.fetch(:user_id)", { :alert => "Invitation failed to update successfully." })
    end
  end

  def decline_invite
    the_id = params.fetch("path_id")
    the_invitation = Invitation.where({ :id => the_id }).at(0)
    the_invitation.status = "Declined"

    if the_invitation.valid?
      the_invitation.save

      redirect_to("/user/#{session.fetch(:user_id)}", { :notice => "Invitation declined."} )
    else
      redirect_to("/user/#{session.fetch(:user_id)", { :alert => "Invitation failed to update successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_invitation = Invitation.where({ :id => the_id }).at(0)

    #the_invitation.recipient_id = params.fetch("query_recipient_id")
    #the_invitation.project_id = params.fetch("query_project_id")
    #the_invitation.sender_id = params.fetch("query_sender_id")
    the_invitation.status = params.fetch("query_status")

    if the_invitation.valid?
      the_invitation.save

      redirect_to("/user/#{session.fetch(:user_id)}", { :notice => "Invitation accepted."} )

    else
      redirect_to("/user/#{session.fetch(:user_id)", { :alert => "Invitation failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_invitation = Invitation.where({ :id => the_id }).at(0)

    the_invitation.destroy

    redirect_to("/invitations", { :notice => "Invitation deleted successfully."} )
  end
end
