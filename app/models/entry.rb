class Entry < ApplicationRecord
	delegated_type :entryable, types: %w[ Message Emoji ], dependent: :destroy
end
