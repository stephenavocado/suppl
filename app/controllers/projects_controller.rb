class ProjectsController < ApplicationController
  def index
    matching_projects = Project.all

    @list_of_projects = matching_projects.order({ :created_at => :desc })

    render({ :template => "projects/index.html.erb" })
  end

  def show
    the_id = params.fetch("an_id")

    matching_projects = Project.where({ :id => the_id })
    @the_project = matching_projects.at(0)

    matching_element_types = ElementType.all
    @list_of_element_types = matching_element_types.order({ :created_at => :desc })

    matching_palettes = Palette.all
    @list_of_palettes = matching_palettes.order({ :created_at => :desc })

    matching_palette_saves = PaletteSafe.all
    @list_of_palette_saves = matching_palette_saves.order({ :created_at => :desc })

    matching_element_types = ElementType.all
    @list_of_element_types = matching_element_types.order({ :created_at => :desc })

    matching_rooms = Room.all
    @list_of_rooms = matching_rooms.order({ :created_at => :desc })

    render({ :template => "projects/show.html.erb" })
  end

  def create
    the_project = Project.new
    the_project.project_name = params.fetch("query_project_name")
    the_project.user_id = params.fetch("query_user_id")
    the_project.description = params.fetch("query_description")
    # the_project.photo = params.fetch("photo_upload")
    # the_project.spaces_count = params.fetch("query_spaces_count")
    # the_project.invitations_count = params.fetch("query_invitations_count")

    if the_project.valid?
      the_project.save
      redirect_to("/projects", { :notice => "Project created successfully." })
    else
      redirect_to("/projects", { :notice => "Project failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_project = Project.where({ :id => the_id }).at(0)

    the_project.project_name = params.fetch("query_project_name")
    the_project.user_id = params.fetch("query_user_id")
    the_project.description = params.fetch("query_description")
    the_project.photo = params.fetch("query_photo")
    # the_project.spaces_count = params.fetch("query_spaces_count")
    # the_project.invitations_count = params.fetch("query_invitations_count")

    if the_project.valid?
      the_project.save
      redirect_to("/projects/#{the_project.id}", { :notice => "Project updated successfully."} )
    else
      redirect_to("/projects/#{the_project.id}", { :alert => "Project failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_project = Project.where({ :id => the_id }).at(0)

    the_project.destroy

    redirect_to("/projects", { :notice => "Project deleted successfully."} )
  end
end
