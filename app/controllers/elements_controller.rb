class ElementsController < ApplicationController
  def index
    matching_elements = Element.all

    @list_of_elements = matching_elements.order({ :created_at => :desc })

    render({ :template => "elements/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_elements = Element.where({ :id => the_id })

    @the_element = matching_elements.at(0)

    render({ :template => "elements/show.html.erb" })
  end

  def create
    the_element = Element.new
    the_element.room_id = params.fetch("query_room_id")
    the_element.name = params.fetch("query_name")
    # the_element.saves_count = params.fetch("query_saves_count")

    if the_element.valid?
      the_element.save
      redirect_to("/rooms/#{the_element.room_id}", { :notice => "Element created successfully." })
    else
      redirect_to("/rooms/#{the_element.room_id}", { :notice => "Element failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_element = Element.where({ :id => the_id }).at(0)

    the_element.room_id = params.fetch("query_room_id")
    the_element.name = params.fetch("query_name")
    the_element.saves_count = params.fetch("query_saves_count")

    if the_element.valid?
      the_element.save
      redirect_to("/elements/#{the_element.id}", { :notice => "Element updated successfully."} )
    else
      redirect_to("/elements/#{the_element.id}", { :alert => "Element failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_element = Element.where({ :id => the_id }).at(0)

    the_element.destroy

    redirect_to("/elements", { :notice => "Element deleted successfully."} )
  end
end
