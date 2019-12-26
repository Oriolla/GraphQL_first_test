class Company < ApplicationRecord
  has_many :jobs

  validates_associated :jobs

  validates :name, :location, presence: true, on: [:create, :update]
  # presence - наличие
  #validates_associated :jobs # использовать, когда у вашей модели есть связи с другими моделями, и их также нужно проверить на валидность.

end
