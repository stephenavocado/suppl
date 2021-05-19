class PalettesController < ApplicationController
  def index
    matching_palettes = Palette.all

    @list_of_palettes = matching_palettes.order({ :created_at => :desc })

    render({ :template => "palettes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_palettes = Palette.where({ :id => the_id })

    @the_palette = matching_palettes.at(0)

    render({ :template => "palettes/show.html.erb" })
  end

  def create
    the_palette = Palette.new
    # the_palette.material_id = params.fetch("query_material_id")
    the_palette.user_id = params.fetch("query_user_id")
    the_palette.name = params.fetch("query_name")
    the_palette.description = params.fetch("query_description")
    # the_palette.saves_count = params.fetch("query_saves_count")

    if the_palette.valid?
      the_palette.save
      redirect_to("/palettes", { :notice => "Palette created successfully." })
    else
      redirect_to("/palettes", { :notice => "Palette failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_palette = Palette.where({ :id => the_id }).at(0)

    the_palette.material_id = params.fetch("query_material_id")
    the_palette.user_id = params.fetch("query_user_id")
    the_palette.name = params.fetch("query_name")
    the_palette.description = params.fetch("query_description")
    the_palette.saves_count = params.fetch("query_saves_count")

    if the_palette.valid?
      the_palette.save
      redirect_to("/palettes/#{the_palette.id}", { :notice => "Palette updated successfully."} )
    else
      redirect_to("/palettes/#{the_palette.id}", { :alert => "Palette failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_palette = Palette.where({ :id => the_id }).at(0)

    the_palette.destroy

    redirect_to("/palettes", { :notice => "Palette deleted successfully."} )
  end
end
