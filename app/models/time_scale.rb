# == Schema Information
#
# Table name: time_scales
#
#  playground_id    :integer
#  period_id        :integer          not null, primary key
#  day_of_week      :integer
#  day_of_month     :integer
#  day_of_year      :integer
#  week_of_year     :integer
#  month_of_year    :integer
#  year             :integer
#  period_month     :string(6)
#  period_day       :string(8)
#  period_date      :date
#  period_timestamp :datetime
#  created_by       :string(255)
#  updated_by       :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class TimeScale < ActiveRecord::Base
    self.primary_key = "period_id"
end
