# == Schema Information
#
# Table name: organisations
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  code               :string(255)
#  name               :string(255)
#  description        :text
#  organisation_level :integer
#  hierarchy          :string(255)
#  status_id          :integer
#  owner_id           :integer
#  parent_id          :integer
#  external_reference :string(255)
#  created_by         :string(255)
#  updated_by         :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Organisation < ActiveRecord::Base
extend SimpleSearch
extend CsvHelper

### id generation
  self.sequence_name = "objects_seq"

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter
  before_create :set_code
  before_create :set_hierarchy

	validates :code, presence: true, uniqueness: true, length: { maximum: 30 }
	validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
	validates :hierarchy, presence: true, uniqueness: true, length: { maximum: 255 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :owner_id, presence: true
	validates :status_id, presence: true
	validates :playground_id, presence: true
	belongs_to :playground								
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"			# helps retrieving the owner name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"		# helps retrieving the status name
        belongs_to :parent_org, :class_name => "Organisation", :foreign_key => "parent_id"	# helps retrieving the parent name
        has_many :child_orgs, :class_name => "Organisation" , :foreign_key => "parent_id"	# link to the child oreganisation


### private functions definitions
  private

  ### before filters
    def set_code
      if Organisation.count > 1			#Undefined organisation exists, but is a parent for none  
        self.code = self.parent_org.code + '-' + code
        self.organisation_level = self.parent_org.organisation_level + 1
      end
    end 

    def set_hierarchy
      if Organisation.where("playground_id = ?", self.playground_id).count == 0 
        self.hierarchy = self.playground.hierarchy + '.001' 
      else if Organisation.where("parent_id = ?", self.parent_id).count == 0 
        self.hierarchy = self.parent_org.hierarchy + '.001'
      else 
        last_one = Organisation.where("parent_id = ?", self.parent_id).maximum("hierarchy")
        self.hierarchy = last_one.next
      end
      end
    end

end
