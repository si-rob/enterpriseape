class Company < ActiveRecord::Base
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Company.create! row.to_hash
        end
    end

    def self.to_csv
        attributes = %w{name manager status terms}

        CSV.generate(headers: true) do |csv|
            csv << attributes
            all.each do |company|
                csv << attributes.map{ |attr| company.send(attr) }
            end
        end
    end

end
