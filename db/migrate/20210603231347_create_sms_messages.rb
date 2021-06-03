class CreateSmsMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :sms_messages do |t|
      t.string :mobile_number
      t.string :message

      t.timestamps
    end
  end
end
