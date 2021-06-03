namespace :slurp do
  desc "TODO"

  task materials: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "wood_flooring_sample_data.csv"))
    csv = CSV.parse(csv_text.scrub, :headers => true, :encoding => "ISO-8859-1")
      csv.each do |row|
        m = Material.new
        m.photo_ref = row["photo_ref"]
        m.manufacturer_id = row["manufacturer_id"]
        m.name = row["name"]
        m.residential_use = row["residential_use"]
        m.commercial_use = row["commericial_use"]
        m.materials = row["materials "]
        m.price_range = row["price_range"]
        m.description = row["description"]
        m.indoor_outdoor = row["indoor_outdoor"]
        m.application = row["application"]
        m.manufacturer_note = row["manufacturer_note"]
        m.flammability = row["flammability"]
        m.hardness = row["hardness"]
        m.environmental_note = row["environmental_note"]
        m.availability = row["availability"]
        m.lead_time = row["lead_time"]
        m.min_units = row["min_units"]
        m.country_of_origin = row["country_of_origin"]
        m.content = row["content"]
        m.finish = row["finish"]
        m.construction = row["contruction"]
        m.wood_grade = row["wood_grade"]
        m.wood_figuring = row["wood_figuring"]
        m.save
        puts "#{m.name} saved!"
      end

      puts "There are now #{Material.count} rows in the materials table"

  end

end
