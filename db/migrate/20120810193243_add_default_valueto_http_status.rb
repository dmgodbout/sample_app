class AddDefaultValuetoHttpStatus < ActiveRecord::Migration
  def change
  	change_column_default(:links, :http_status, 301)
  end
end
