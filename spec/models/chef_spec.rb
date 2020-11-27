# == Schema Information
#
# Table name: chefs
#
#  id         :bigint           not null, primary key
#  address    :string(255)      default("")
#  comment    :text(65535)      not null
#  image      :string(255)
#  latitude   :float(24)
#  longitude  :float(24)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_chefs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

# RSpec.describe Chef, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
