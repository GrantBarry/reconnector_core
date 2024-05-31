class Core::Property < ApplicationRecord
  belongs_to :agent, class_name: 'Core::Agent', foreign_key: :core_agent_id
end
