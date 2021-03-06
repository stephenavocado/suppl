class RoomsController < ApplicationController
  def index
    matching_rooms = Room.all

    @list_of_rooms = matching_rooms.order({ :created_at => :desc })

    redirect_to({ :template => "rooms/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_rooms = Room.where({ :id => the_id })

    @the_room = matching_rooms.at(0)

    render({ :template => "rooms/show.html.erb" })
  end

  def create
    the_room = Room.new
    the_room.name = params.fetch("query_name")
    the_room.project_id = params.fetch("query_project_id")
    the_room.description = params.fetch("query_description")
    # the_room.elements_count = params.fetch("query_elements_count")

    if the_room.valid?
      the_room.save
      redirect_to("/projects/#{the_room.project_id}", { :notice => "Space created successfully." })
    else
      redirect_to("/projects/#{the_room.project_id}", { :notice => "Space failed to create successfully." })
    end
  end

  def create_space_and_elements
      
    the_room = Room.new
    the_room.name = params.fetch("query_name")
    the_room.project_id = params.fetch("query_project_id")
    the_room.description = params.fetch("query_description")
    the_room.save

    element_names = params.fetch("query_elements")

    element_names.each do |element_name|
      e = Element.new
      e.name = element_name
      e.room_id = the_room.id
      e.save

    end
  end

  def update
    the_id = params.fetch("path_id")
    the_room = Room.where({ :id => the_id }).at(0)

    the_room.name = params.fetch("query_name")
    the_room.project_id = params.fetch("query_project_id")
    the_room.description = params.fetch("query_description")
    the_room.elements_count = params.fetch("query_elements_count")

    if the_room.valid?
      the_room.save
      redirect_to("/rooms/#{the_room.id}", { :notice => "Room updated successfully."} )
    else
      redirect_to("/rooms/#{the_room.id}", { :alert => "Room failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_room = Room.where({ :id => the_id }).at(0)
    the_project_id = the_room.project_id

    the_room.destroy

    redirect_to("/projects/#{the_project_id}", { :notice => "Space deleted successfully."} )
  end
end
