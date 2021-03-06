# == Schema Information
#
# Table name: marks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chef_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_marks_on_chef_id              (chef_id)
#  index_marks_on_user_id              (user_id)
#  index_marks_on_user_id_and_chef_id  (user_id,chef_id) UNIQUE
#

# RSpec.describe Mark, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
