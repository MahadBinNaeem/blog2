class Article < ApplicationRecord
  include Visible
  paginates_per 15
  has_many :comments, dependent: :destroy

  validates :title, presence: true,uniqueness: true, on: :create#, confirmation: { message: "Enter Same" }, comparison: { equal_to: :title_confirmation}, fo7rmat: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
  #validates :title_confirmation, presence: true
  validates :body, presence: true, length: {minimum:2}, exclusion: { in: %w(www us ca jp),
    message: "%{value} is reserved." }, exclusion: { in: [true, false] }#, inclusion: { in: %w(small medium large),
    #message: "%{value} is not a valid size" }
  validates :checkBox, acceptance: { message: 'must be abided' }
  #validates_associated :comments
  validates_each :title, :body do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end
  before_validation :normalize_name, on: :create

  after_create_commit :log_article_saved_to_db
  after_update_commit :log_article_saved_to_db
  after_initialize do |article|
    puts "You have initialized"
  end

  after_find do |article|
    puts "you find"
  end

  after_touch do |article|
    puts "You have touched"
  end

  before_create do
    if title.blank?
      self.title=title.capitalize 
    end
  end
  
  private

  def normalize_name
    self.title = title.downcase.titleize
  end

  def log_article_saved_to_db
    puts 'article was saved to database'
  end 
end
