# == Schema Information
#
# Table name: business_objects
#
#  id                 :integer          not null
#  playground_id      :integer          not null
#  business_area_id   :integer          not null
#  main_scope_id      :integer
#  code               :string(60)       not null
#  name               :string(200)      not null
#  description        :text
#  organisation_level :integer
#  territory_level    :integer
#  hierarchy          :string(25)       not null
#  status_id          :integer          not null
#  owner_id           :integer          not null
#  all_records        :integer          default(0)
#  bad_records        :integer          default(0)
#  score              :integer          default(0)
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

					

require 'rails_helper'

RSpec.describe BusinessObject, type: :model do
  
  describe 'Validations'
  subject {FactoryBot.build(:business_object)}
#    it { should validate_presence_of(:hierarchy) }
#    it { should validate_uniqueness_of(:hierarchy).case_insensitive }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:playground_id) }
		it { should validate_length_of(:name).is_at_least(2).is_at_most(100)}
    it { should validate_presence_of(:code) }
#    it { should validate_uniqueness_of(:code).scoped_to(:business_area_id) }
    it { should validate_length_of(:code).is_at_most(10)}
#    it { should validate_presence_of(:playground_id) }
#    it { should validate_presence_of(:business_area) }
    it { should validate_presence_of(:owner_id) }
    it { should validate_presence_of(:status_id) }
    it { should validate_presence_of(:created_by) }
    it { should validate_presence_of(:updated_by) }

  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:business_object)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:business_object, name: nil)).to_not be_valid
  end


end
