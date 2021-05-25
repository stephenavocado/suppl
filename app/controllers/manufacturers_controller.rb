class ManufacturersController < ApplicationController
  def index
    matching_manufacturers = Manufacturer.all

    @list_of_manufacturers = matching_manufacturers.order({ :created_at => :desc })

    render({ :template => "manufacturers/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_manufacturers = Manufacturer.where({ :id => the_id })

    @the_manufacturer = matching_manufacturers.at(0)

    render({ :template => "manufacturers/show.html.erb" })
  end

  def create
    the_manufacturer = Manufacturer.new
    the_manufacturer.name = params.fetch("query_name")
    the_manufacturer.description = params.fetch("query_description")
    the_manufacturer.materials_count = params.fetch("query_materials_count")

    if the_manufacturer.valid?
      the_manufacturer.save
      redirect_to("/manufacturers", { :notice => "Manufacturer created successfully." })
    else
      redirect_to("/manufacturers", { :notice => "Manufacturer failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_manufacturer = Manufacturer.where({ :id => the_id }).at(0)

    the_manufacturer.name = params.fetch("query_name")
    the_manufacturer.description = params.fetch("query_description")
    the_manufacturer.materials_count = params.fetch("query_materials_count")

    if the_manufacturer.valid?
      the_manufacturer.save
      redirect_to("/manufacturers/#{the_manufacturer.id}", { :notice => "Manufacturer updated successfully."} )
    else
      redirect_to("/manufacturers/#{the_manufacturer.id}", { :alert => "Manufacturer failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_manufacturer = Manufacturer.where({ :id => the_id }).at(0)

    the_manufacturer.destroy

    redirect_to("/manufacturers", { :notice => "Manufacturer deleted successfully."} )
  end
end
