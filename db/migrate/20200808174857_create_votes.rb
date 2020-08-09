class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :voteable, polymorphic: true, null: false
      t.string :vote_type

      t.timestamps
    end
  end
end
