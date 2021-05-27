class PaletteSavesController < ApplicationController
  def index
    matching_palette_saves = PaletteSafe.all

    @list_of_palette_saves = matching_palette_saves.order({ :created_at => :desc })

    render({ :template => "palette_saves/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_palette_saves = PaletteSafe.where({ :id => the_id })

    @the_palette_safe = matching_palette_saves.at(0)

    render({ :template => "palette_saves/show.html.erb" })
  end

  def create
    the_palette_safe = PaletteSafe.new
    the_palette_safe.material_id = params.fetch("query_material_id")
    the_palette_safe.palette_id = params.fetch("query_palette_id")

    if the_palette_safe.valid?
      the_palette_safe.save
      redirect_to("/materials", { :notice => "#{the_palette_safe.material.name} saved." })
    else
      redirect_to("/materials", { :notice => "Palette safe failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_palette_safe = PaletteSafe.where({ :id => the_id }).at(0)

    the_palette_safe.material_id = params.fetch("query_material_id")
    the_palette_safe.palette_id = params.fetch("query_palette_id")

    if the_palette_safe.valid?
      the_palette_safe.save
      redirect_to("/palette_saves/#{the_palette_safe.id}", { :notice => "Palette safe updated successfully."} )
    else
      redirect_to("/palette_saves/#{the_palette_safe.id}", { :alert => "Palette safe failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_palette_safe = PaletteSafe.where({ :id => the_id }).at(0)
    the_palette = the_palette_safe.palette_id
    the_palette_safe.destroy

    redirect_to("/palettes/#{the_palette}", { :notice => "Palette safe deleted successfully."} )
  end
end
