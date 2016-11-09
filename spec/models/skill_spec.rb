# == Schema Information
#
# Table name: skills
#
#  id                 :integer          not null, primary key
#  name               :string(100)      not null
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  business_object_id :integer
#  skill_size         :integer
#  skill_precision    :integer
#  skill_type_id      :integer
#  is_key             :boolean
#  is_published       :boolean
#

require 'rails_helper'

RSpec.describe Skill, type: :model do
  
  describe 'Validations'
  subject {FactoryGirl.build(:skill)}
  it {should validate_presence_of(:name)}
  it {should validate_length_of(:name).is_at_least(2)}
  it {should validate_presence_of(:column_type)} 
  it {should validate_presence_of(:size)}
#  it {should validate_presence_of(:is_key)}
  it {should validate_presence_of(:created_by)}  
  it {should validate_presence_of(:updated_by)}
  it {should validate_presence_of(:session_id)}
  it {should validate_presence_of(:playground_id)}
  it {should validate_presence_of(:business_object_id)}
  it {should belong_to(:business_object)}

  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:skill)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:skill, name: nil)).to_not be_valid
  end

end