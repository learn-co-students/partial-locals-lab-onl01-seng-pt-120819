# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  validates :name, presence: true
  validates :hometown, presence: true
  validates :birthday, presence: true 
  
  def self.search(search_text)
    if search_text.present?
      where("name LIKE ?", "%#{search_text}%") 
    else
      self.all
    end
  end
end
