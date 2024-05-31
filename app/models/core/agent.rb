class Core::Agent < ApplicationRecord
  belongs_to :account, class_name: 'Core::Account', foreign_key: :core_account_id

  validates :first_name, :last_name, presence: true
  normalizes :first_name, :last_name, with: ->(value) { value.strip }

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  normalizes :email, with: ->(value) { value.downcase.strip }

  validates :mobile, :phone, :fax, uniqueness: { case_sensitive: false }
  normalizes :mobile, :phone, :fax, with: ->(value) { value.strip }

  has_many :properties, dependent: :nullify, class_name: 'Core::Property'
end
