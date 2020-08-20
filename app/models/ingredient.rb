class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :doses
  before_destroy :checkParentDoses

 
  private

  def checkParentDoses
    raise ActiveRecord::InvalidForeignKey unless self.doses.empty?
  end

end
