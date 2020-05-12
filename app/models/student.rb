class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students
  validates :name, presence: true
  validates :hometown, presence: true
  validates :birthday, presence: true

  def self.search(query)
    if query.present?
      where('NAME like ?', "%#{query}%") #-> looks for the exact match or a fragment
    else
      self.all
    end
  end

end

