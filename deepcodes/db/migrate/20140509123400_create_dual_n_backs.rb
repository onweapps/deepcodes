class CreateDualNBacks < ActiveRecord::Migration
  def change
    create_table :dual_n_backs do |t|
      t.integer :n_back
      t.integer :av_matches
      t.integer :correct
      t.integer :incorrect
      t.belongs_to :user
      t.timestamps
    end
  end
end
