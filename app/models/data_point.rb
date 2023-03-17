# == Schema Information
#
# Table name: data_points
#
#  id         :integer          not null, primary key
#  timestamp  :datetime
#  value      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DataPoint < ApplicationRecord
end
