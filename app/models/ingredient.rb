class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :doses
  before_destroy :checkParentDoses

  def to_s
    self.name
  end
 
  private

  def checkParentDoses
    raise ActiveRecord::InvalidForeignKey unless self.doses.empty?
  end

end
