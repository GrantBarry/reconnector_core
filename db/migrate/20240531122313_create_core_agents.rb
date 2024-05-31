class CreateCoreAgents < ActiveRecord::Migration[7.1]
  def change
    create_table :core_agents, id: :uuid do |t|
      t.belongs_to :core_account, null: false, foreign_key: true, type: :uuid, index: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile
      t.string :phone
      t.string :fax

      t.timestamps
    end
  end
end
