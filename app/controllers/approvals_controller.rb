class ApprovalsController < ApplicationController
  def index
    matching_approvals = Approval.all

    @list_of_approvals = matching_approvals.order({ :created_at => :desc })

    render({ :template => "approvals/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_approvals = Approval.where({ :id => the_id })

    @the_approval = matching_approvals.at(0)

    render({ :template => "approvals/show.html.erb" })
  end

  def create
    the_approval = Approval.new
    the_approval.approver_id = params.fetch("query_approver_id")
    the_approval.requester_id = params.fetch("query_requester_id")
    the_approval.space_id = params.fetch("query_space_id")
    the_approval.status = params.fetch("query_status")
    #the_approval.note = params.fetch("query_note")

    if the_approval.valid?
      the_approval.save
      redirect_to("/approvals", { :notice => "Approval created successfully." })
    else
      redirect_to("/approvals", { :notice => "Approval failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_approval = Approval.where({ :id => the_id }).at(0)

    the_approval.approver_id = params.fetch("query_approver_id")
    the_approval.requester_id = params.fetch("query_requester_id")
    the_approval.space_id = params.fetch("query_space_id")
    the_approval.status = params.fetch("query_status")
    the_approval.note = params.fetch("query_note")

    if the_approval.valid?
      the_approval.save
      redirect_to("/approvals/#{the_approval.id}", { :notice => "Approval updated successfully."} )
    else
      redirect_to("/approvals/#{the_approval.id}", { :alert => "Approval failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_approval = Approval.where({ :id => the_id }).at(0)

    the_approval.destroy

    redirect_to("/approvals", { :notice => "Approval deleted successfully."} )
  end
end
