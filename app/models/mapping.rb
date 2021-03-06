# == Schema Information
#
# Table name: mappings
#
#  id               :integer          not null, primary key
#  playground_id    :integer          not null
#  mappings_list_id :integer          not null
#  source_software  :string(100)
#  source_table     :string(100)
#  source_value_id  :string(100)
#  source_code      :string(100)
#  target_software  :string(100)
#  target_table     :string(100)
#  target_value_id  :string(100)
#  target_code      :string(100)
#  source_property  :string(100)
#  target_property  :string(100)
#  owner_id         :integer          not null
#  created_by       :string(100)      not null
#  updated_by       :string(100)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Mapping < ActiveRecord::Base
extend CsvHelper

### scope
#  Mapping is linked to a list which belongs to the correct scope

### before filter
before_update :retrieve_target_caption

### validation

	validates :source_software  , presence: true, length: { maximum: 100 }
	validates :source_table     , presence: true, length: { maximum: 100 }
	validates :source_code      , presence: true, length: { maximum: 100 }
	validates :source_property  , presence: true, length: { maximum: 100 }
	validates :target_software  , presence: true, length: { maximum: 100 }
	validates :target_table     , presence: true, length: { maximum: 100 }
	validates :target_code      , presence: true, length: { maximum: 100 }
	validates :target_property   , presence: true, length: { maximum: 100 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :owner_id, presence: true
	validates :playground_id, presence: true
	validates :mappings_list, presence: true
  belongs_to :mappings_list
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name

### private functions definitions
  private
  
  def retrieve_target_caption
    current_list = self.mappings_list.target_list
    if (self.target_code == "") 
      self.target_caption = ""
    else
      current_value = current_list.values.where("value_code = ?", self.target_code).take! 
      self.target_caption = current_value.value_caption
    end
  end

end


