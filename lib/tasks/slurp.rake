namespace :slurp do
  desc "Import library bathrooms from CSV"
  task bathrooms: :environment do
    require "csv"
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "Bathrooms1.csv"))
    csv = CSV.parse(csv_text, headers: true, encoding: "ISO-8859-1")
    
    csv.each do |row|
      b = Bathroom.new
      b.hours = row["Hours"]
      b.address = row["Address"]
      b.accessible = true
      b.gender_neutral = false
      b.family_accessible = false
      b.purchase_required = false
      b.save
      puts "#{b.hours}, #{b.address} saved"
    end

    puts "There are now #{Bathroom.count} rows in the bathrooms table"
  end
end

namespace :slurp do
  desc "Import the police station bathrooms from CSV"
  task morebathrooms: :environment do
    require "csv"
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "Bathrooms2.csv"))
    csv = CSV.parse(csv_text, headers: true, encoding: "ISO-8859-1")
    
    csv.each do |row|
      b = Bathroom.new
      b.hours = "24/7"
      b.address = row["Address"]
      b.accessible = false
      b.gender_neutral = false
      b.family_accessible = false
      b.purchase_required = false
      b.save
      puts "#{b.hours}, #{b.address} saved"
    end

    puts "There are now #{Bathroom.count} rows in the bathrooms table"
  end
