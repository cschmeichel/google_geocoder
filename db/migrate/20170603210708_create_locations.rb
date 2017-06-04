class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :lat, :decimal, {:precision=>3, :scale=>7}
      t.string :lng, :decimal, {:precision=>3, :scale=>7}

      t.timestamps
    end
  end
end
