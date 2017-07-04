class Site < ApplicationRecord
	has_many :contacts

	accepts_nested_attributes_for :contacts
end