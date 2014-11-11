class Seed
  class << self
    def run!(file)
      puts "#{Time.now.strftime("%Y/%m/%d %H:%M:%S")} SEEDING #{file}"
      require File.join(Rails.root, 'db', 'seed', "#{file}.rb")
    end
  end
end

files = %w(
  users
  photos
)

ActiveRecord::Base.transaction do
  files.each do |file|
    Seed.run!(file)
  end
end