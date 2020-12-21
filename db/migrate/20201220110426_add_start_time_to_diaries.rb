class AddStartTimeToDiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :start_time, :idatetime
  end
end
