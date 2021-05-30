class ApprovalRequestsController < ApplicationController
  def index
    matching_approval_requests = ApprovalRequest.all

    @list_of_approval_requests = matching_approval_requests.order({ :created_at => :desc })

    render({ :template => "approval_requests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_approval_requests = ApprovalRequest.where({ :id => the_id })

    @the_approval_request = matching_approval_requests.at(0)

    render({ :template => "approval_requests/show.html.erb" })
  end

  def create
    the_approval_request = ApprovalRequest.new
    the_approval_request.sender_id = params.fetch("query_sender_id")
    the_approval_request.recipient_id = params.fetch("query_recipient_id")
    the_approval_request.project_save_id = params.fetch("query_project_save_id")
    the_approval_request.status = params.fetch("query_status")
    the_approval_request.element_id = params.fetch("query_element_id")

    if the_approval_request.valid?
      the_approval_request.save
      redirect_to("/approval_requests", { :notice => "Approval request created successfully." })
    else
      redirect_to("/approval_requests", { :notice => "Approval request failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_approval_request = ApprovalRequest.where({ :id => the_id }).at(0)

    the_approval_request.sender_id = params.fetch("query_sender_id")
    the_approval_request.recipient_id = params.fetch("query_recipient_id")
    the_approval_request.project_save_id = params.fetch("query_project_save_id")
    the_approval_request.status = params.fetch("query_status")
    the_approval_request.element_id = params.fetch("query_element_id")

    if the_approval_request.valid?
      the_approval_request.save
      redirect_to("/approval_requests/#{the_approval_request.id}", { :notice => "Approval request updated successfully."} )
    else
      redirect_to("/approval_requests/#{the_approval_request.id}", { :alert => "Approval request failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_approval_request = ApprovalRequest.where({ :id => the_id }).at(0)

    the_approval_request.destroy

    redirect_to("/approval_requests", { :notice => "Approval request deleted successfully."} )
  end
end
