class MaterialsController < ApplicationController
  def index
    matching_materials = Material.all

    @list_of_materials = matching_materials.order({ :created_at => :desc })

    render({ :template => "materials/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_materials = Material.where({ :id => the_id })

    @the_material = matching_materials.at(0)

    render({ :template => "materials/show.html.erb" })
  end

  def create
    the_material = Material.new
    the_material.photo_ref = params.fetch("query_photo_ref")
    the_material.manufacturer_id = params.fetch("query_manufacturer_id")
    the_material.name = params.fetch("query_name")
    the_material.residential_use = params.fetch("query_residential_use")
    the_material.commercial_use = params.fetch("query_commercial_use")
    the_material.materials = params.fetch("query_materials")
    the_material.price_range = params.fetch("query_price_range")
    the_material.description = params.fetch("query_description")
    the_material.indoor_outdoor = params.fetch("query_indoor_outdoor")
    the_material.application = params.fetch("query_application")
    the_material.manufacturer_note = params.fetch("query_manufacturer_note")
    the_material.flammability = params.fetch("query_flammability")
    the_material.hardness = params.fetch("query_hardness")
    the_material.availability = params.fetch("query_availability")
    the_material.lead_time = params.fetch("query_lead_time")
    the_material.min_units = params.fetch("query_min_units")
    the_material.country_of_origin = params.fetch("query_country_of_origin")
    the_material.content = params.fetch("query_content")
    the_material.finish = params.fetch("query_finish")
    the_material.construction = params.fetch("query_construction")
    the_material.wood_grade = params.fetch("query_wood_grade")
    the_material.wood_figuring = params.fetch("query_wood_figuring")
    the_material.saves_count = params.fetch("query_saves_count")

    if the_material.valid?
      the_material.save
      redirect_to("/materials", { :notice => "Material created successfully." })
    else
      redirect_to("/materials", { :notice => "Material failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_material = Material.where({ :id => the_id }).at(0)

    the_material.photo_ref = params.fetch("query_photo_ref")
    the_material.manufacturer_id = params.fetch("query_manufacturer_id")
    the_material.name = params.fetch("query_name")
    the_material.residential_use = params.fetch("query_residential_use")
    the_material.commercial_use = params.fetch("query_commercial_use")
    the_material.materials = params.fetch("query_materials")
    the_material.price_range = params.fetch("query_price_range")
    the_material.description = params.fetch("query_description")
    the_material.indoor_outdoor = params.fetch("query_indoor_outdoor")
    the_material.application = params.fetch("query_application")
    the_material.manufacturer_note = params.fetch("query_manufacturer_note")
    the_material.flammability = params.fetch("query_flammability")
    the_material.hardness = params.fetch("query_hardness")
    the_material.availability = params.fetch("query_availability")
    the_material.lead_time = params.fetch("query_lead_time")
    the_material.min_units = params.fetch("query_min_units")
    the_material.country_of_origin = params.fetch("query_country_of_origin")
    the_material.content = params.fetch("query_content")
    the_material.finish = params.fetch("query_finish")
    the_material.construction = params.fetch("query_construction")
    the_material.wood_grade = params.fetch("query_wood_grade")
    the_material.wood_figuring = params.fetch("query_wood_figuring")
    the_material.saves_count = params.fetch("query_saves_count")

    if the_material.valid?
      the_material.save
      redirect_to("/materials/#{the_material.id}", { :notice => "Material updated successfully."} )
    else
      redirect_to("/materials/#{the_material.id}", { :alert => "Material failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_material = Material.where({ :id => the_id }).at(0)

    the_material.destroy

    redirect_to("/materials", { :notice => "Material deleted successfully."} )
  end
end
