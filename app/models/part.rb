class Part < ApplicationRecord
	has_many :manifests
	has_many :assemblies, through: :manifests
end
