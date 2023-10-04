class Comment < ApplicationRecord
  include Visible
  
  belongs_to :article, touch: true
  validates :commenter, presence: true
  validates :body, presence: true, length: {minimum:10}
  validates_associated :articles
  after_destroy :log_destroy_action
  private
  def log_destroy_action
    puts "Comment Destroyed"
  end
end
