class Comment < ApplicationRecord
  include Visible
  belongs_to :article
  validates :commenter, presence: true
  validates :body, presence: true, length: {minimum:10}
  after_destroy :log_destroy_action

  private

  def log_destroy_action
    puts "Comment Destroyed"
  end
end
