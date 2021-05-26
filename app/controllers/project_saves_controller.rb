class ProjectSavesController < ApplicationController
  def index
    matching_project_saves = ProjectSafe.all

    @list_of_project_saves = matching_project_saves.order({ :created_at => :desc })

    render({ :template => "project_saves/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_project_saves = ProjectSafe.where({ :id => the_id })

    @the_project_safe = matching_project_saves.at(0)

    render({ :template => "project_saves/show.html.erb" })
  end

  def create
    the_project_safe = ProjectSafe.new
    the_project_safe.element_id = params.fetch("query_element_id")
    the_project_safe.material_id = params.fetch("query_material_id")
    the_project_safe.approval_requests_count = params.fetch("query_approval_requests_count")

    if the_project_safe.valid?
      the_project_safe.save
      redirect_to("/project_saves", { :notice => "Project safe created successfully." })
    else
      redirect_to("/project_saves", { :notice => "Project safe failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_project_safe = ProjectSafe.where({ :id => the_id }).at(0)

    the_project_safe.element_id = params.fetch("query_element_id")
    the_project_safe.material_id = params.fetch("query_material_id")
    the_project_safe.approval_requests_count = params.fetch("query_approval_requests_count")

    if the_project_safe.valid?
      the_project_safe.save
      redirect_to("/project_saves/#{the_project_safe.id}", { :notice => "Project safe updated successfully."} )
    else
      redirect_to("/project_saves/#{the_project_safe.id}", { :alert => "Project safe failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_project_safe = ProjectSafe.where({ :id => the_id }).at(0)

    the_project_safe.destroy

    redirect_to("/project_saves", { :notice => "Project safe deleted successfully."} )
  end
end
