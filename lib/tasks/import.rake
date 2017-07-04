require 'spreadsheet'

namespace :import do
	desc "it imports xls file and save to database table"

	task customers: :environment do
		file_name = File.join Rails.root, "customer.xls"
		excel = Spreadsheet.open file_name
		sheet = excel.worksheet 0

		row_count = 0
		sheet.each do |item|
			value = { name: item[0], age: item[1] }
			if row_count > 0
				Customer.create(value)
			end
			row_count += 1
		end
	end
end