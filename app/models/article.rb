class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if record.title == "Evil"
      record.errors.add :base, "This person is evil"
    end
  end
end
class Article < ApplicationRecord
  include Visible
  validates_with GoodnessValidator
  has_many :comments, dependent: :destroy
  validates :title, presence: true,uniqueness: true, on: :create#, confirmation: { message: "Enter Same" }, comparison: { equal_to: :title_confirmation}, fo7rmat: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
  #validates :title_confirmation, presence: true
  validates :body, presence: true, length: {minimum:2}, exclusion: { in: %w(www us ca jp),
    message: "%{value} is reserved." }, exclusion: { in: [true, false] }#, inclusion: { in: %w(small medium large),
    #message: "%{value} is not a valid size" }
  validates :checkBox, acceptance: { message: 'must be abided' }
  validates_associated :comments
  validates_each :title, :body do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end
end
