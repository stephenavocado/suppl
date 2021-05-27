class ElementTypesController < ApplicationController
  def index
    matching_element_types = ElementType.all

    @list_of_element_types = matching_element_types.order({ :created_at => :desc })

    render({ :template => "element_types/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_element_types = ElementType.where({ :id => the_id })

    @the_element_type = matching_element_types.at(0)

    render({ :template => "element_types/show.html.erb" })
  end

  def create
    the_element_type = ElementType.new
    the_element_type.name = params.fetch("query_name")

    if the_element_type.valid?
      the_element_type.save
      redirect_to("/element_types", { :notice => "Element type created successfully." })
    else
      redirect_to("/element_types", { :notice => "Element type failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_element_type = ElementType.where({ :id => the_id }).at(0)

    the_element_type.name = params.fetch("query_name")

    if the_element_type.valid?
      the_element_type.save
      redirect_to("/element_types/#{the_element_type.id}", { :notice => "Element type updated successfully."} )
    else
      redirect_to("/element_types/#{the_element_type.id}", { :alert => "Element type failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_element_type = ElementType.where({ :id => the_id }).at(0)

    the_element_type.destroy

    redirect_to("/element_types", { :notice => "Element type deleted successfully."} )
  end
end
