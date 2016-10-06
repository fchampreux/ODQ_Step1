# == Schema Information
#
# Table name: business_objects
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  name               :string(255)
#  description        :text
#  organisation_level :integer
#  territory_level    :integer
#  hierarchy          :string(255)
#  status_id          :integer
#  owner_id           :integer
#  created_by         :string(255)
#  updated_by         :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  business_area_id   :integer
#  all_records        :integer
#  bad_records        :integer
#  score              :integer
#  odq_unique_id      :integer
#  odq_object_id      :integer
#  main_scope_id      :integer
#  code               :string(255)
#

#FactoryGirl.factories.clear
FactoryGirl.define do
  factory :business_object do
    id                  0
    business_area_id    1
    playground_id       1
    name                "Test Business Object"
    code                "TEST_BO"
    description         "This is a test Business object used for unit testing"
    created_by          "Fred"
    updated_by          "Fred"
    hierarchy           "1.0"
#    session_id          "TestRun-01"
    owner_id            1
    status_id           0
    end

end