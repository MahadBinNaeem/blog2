class Assembly < ApplicationRecord
	has_many :menifests
	has_many :parts, through: :manifests
end
