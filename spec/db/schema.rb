ActiveRecord::Schema.define(version: 0) do
  create_table :posts, force: true do |t|
    t.column :title, :string, null: false, limit: 255
    t.column :body, :text, null: false
    t.column :impressions, :integer, limit: 4, null: false
    t.column :published, :boolean, default: false
    t.column :exceprt, :string, limit: 500
  end

  create_table :contacts, force: true do |t|
    t.column :name, :string, null: false, limit: 255
    t.column :email, :string, null: false, limit: 50
    t.column :alternate_email, :string, null: false, limit: 50
    t.column :phone, :string, null: false, limit: 15
    t.column :cellphone, :string, null: false, limit: 15
  end
end
