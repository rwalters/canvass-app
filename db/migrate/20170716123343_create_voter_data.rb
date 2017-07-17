ROM::SQL.migration do
  change do
    create_table(:categories) do
      primary_key :id

      column :name, String, null: false # Committed, Unaware, Transactional
    end

    create_table(:voters) do
      primary_key :id

      column :name,    String, null: false
      column :address, String, null: false
      column :email,   String, null: false

      foreign_key :category_id, :categories, on_delete: :restrict

      column :party_registration, String, null: false
      column :only_call_for_vote_reminder, TrueClass, default: true, null: false
    end

    create_table(:interactions) do
      primary_key :id

      foreign_key :voter_id, :voters, on_delete: :restrict
      foreign_key :user_id, :users,   on_delete: :restrict

      column :discussed,          TrueClass, default: false
      column :registered_to_vote, TrueClass, default: false
      column :registered_to_change_affiliation, TrueClass, default: false
      column :refused,        TrueClass, default: false
      column :other_language, TrueClass, default: false
      column :not_home,       TrueClass, default: false
      column :moved,          TrueClass, default: false
      column :dead,           TrueClass, default: false
    end
  end
end
