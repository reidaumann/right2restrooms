namespace :slurp do
  desc "TODO"
  task bathrooms: :environment do
  end

  require "csv"
  csv_text = File.read(Rails.root.join("lib", "csvs", "Bathrooms1.csv"))
  csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
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
