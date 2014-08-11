class CreatePhonePolls < ActiveRecord::Migration
  def change
    create_table :phone_polls do |t|
      t.timestamps
    end
  end
end
