# == Schema Information
#
# Table name: business_objects
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  code               :string(255)
#  name               :string(255)
#  description        :text
#  organisation_level :integer
#  territory_level    :integer
#  hierarchy          :string(255)
#  status_id          :integer
#  owner_id           :integer
#  db_technology      :string(255)
#  db_connection      :string(255)
#  db_owner_schema    :string(255)
#  structure_name     :string(255)
#  key_columns        :text
#  published_columns  :text
#  created_by         :string(255)
#  updated_by         :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  business_area_id   :integer
#

class BusinessObject < ActiveRecord::Base

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter
  before_create :set_code
  before_create :set_hierarchy

	validates :code, presence: true, uniqueness: true, length: { maximum: 30 }
	validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
	validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :owner_id, presence: true
	validates :status_id, presence: true
	validates :playground_id, presence: true
	validates :business_area_id, presence: true
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"	# helps retrieving the status name
	belongs_to :business_area
	has_many :business_rules


### private functions definitions
  private

  ### before filters
    def set_code 
      self.code = self.business_area.code + '-' + code
    end 

    def set_hierarchy
      if BusinessObject.where("business_area_id = ?", self.business_area_id).count == 0 
        self.hierarchy = self.business_area.hierarchy + '.001'
      else 
        last_one = BusinessObject.maximum("hierarchy")
        self.hierarchy = last_one.next
      end
    end

end
