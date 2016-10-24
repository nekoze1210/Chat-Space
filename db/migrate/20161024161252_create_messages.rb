class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text        :text
      t.text        :thumbnail
      t.references  :group, index: true
      t.references  :user, index: true
      t.timestamps
    end
  end
end
