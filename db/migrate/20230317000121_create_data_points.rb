class CreateDataPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :data_points do |t|
      t.datetime :timestamp
      t.decimal :value

      t.timestamps
    end
  end
end
