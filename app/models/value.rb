# == Schema Information
#
# Table name: values
#
#  id             :integer          not null, primary key
#  playground_id  :integer          not null
#  values_list_id :integer          not null
#  code           :string(60)       not null
#  name           :string(100)      not null
#  description    :text
#  property       :string(100)
#  created_by     :string(100)      not null
#  updated_by     :string(100)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Value < ActiveRecord::Base
extend CsvHelper

### scope
#  Value is linked to a list which belongs to the correct scope

### before filter
before_create :set_playground
before_update :set_updated_by

### validation
	validates :code, presence: true, uniqueness: {scope: :values_list_id, case_sensitive: false}, length: { maximum: 20 }
	validates :name, presence: true, uniqueness: {scope: :values_list_id, case_sensitive: false}, length: { minimum: 2, maximum: 100 }
	validates :description, presence: true, length: { maximum: 1000 }
	validates :updated_by, presence: true
	validates :created_by, presence: true
	validates :playground_id, presence: true
	validates :values_list, presence: true
  belongs_to :values_list

### private functions definitions
  private
  
	### before filters
	def set_playground 
		self.playground_id = self.values_list.playground_id
	end 

    def set_updated_by
		self.updated_by = self.values_list.updated_by
	end

end


