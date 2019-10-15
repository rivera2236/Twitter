class AddLinkToTwits < ActiveRecord::Migration[6.0]
  def change
    add_column :twits, :link, :string
  end
end
