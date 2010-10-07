class CreateAccounts < ActiveRecord::Migration


  def self.up

    # defined here http://charlotte.jira.com/wiki/display/infofabric/Account+and+Parcel+numbering

    create_table :accounts do |t|
      t.string   "name",               :null => false
      t.string   "address",            :null => false
      t.string   "postcode",           :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
