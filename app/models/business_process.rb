# == Schema Information
#
# Table name: business_processes
#
#  id               :integer          not null, primary key
#  playground_id    :integer
#  business_flow_id :integer
#  code             :string(255)
#  name             :string(255)
#  description      :text
#  hierarchy        :string(255)
#  PCF_index        :string(255)
#  PCF_reference    :string(255)
#  status_id        :integer
#  owner_id         :integer
#  created_by       :string(255)
#  updated_by       :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#



class BusinessProcess < ActiveRecord::Base
	validates :code, presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true
	validates :hierarchy, presence: true, uniqueness: true
	validates :owner_id, presence: true
	validates :status_id, presence: true
	validates :playground_id, presence: true
	validates :business_flow_id, presence: true	
	
	has_many :business_objects
	has_many :business_rules
	belongs_to :business_flow
end