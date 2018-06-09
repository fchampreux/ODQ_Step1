# == Schema Information
#
# Table name: parameters_lists
#
#  id            :integer          not null, primary key
#  playground_id :integer          not null
#  code          :string(60)       not null
#  name          :string(100)      not null
#  description   :text
#  owner_id      :integer          not null
#  created_by    :string(100)      not null
#  updated_by    :string(100)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ParametersList < ActiveRecord::Base
extend CsvHelper

### scope
# Parameters are global to the project

### before filter
  before_create :set_code

### validation
  validates :name, presence: true, uniqueness: {scope: :playground_id, case_sensitive: false}, length: { minimum: 2, maximum: 100 }
#	validates :code, presence: true, uniqueness: {scope: :playground_id, case_sensitive: false}, length: { maximum: 60 }
  validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true	
	validates :updated_by, presence: true
	validates :owner_id, presence: true
	validates :playground, presence: true
	belongs_to :playground
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
  has_many :parameters, :inverse_of => :parameters_list, :dependent => :destroy 
  accepts_nested_attributes_for :parameters, :reject_if => :all_blank, :allow_destroy => true

### private functions definitions
  private

  ### before filters
    def set_code 
      self.code = name.gsub(/[^0-9A-Za-z]/, '_').upcase
    end 

end
