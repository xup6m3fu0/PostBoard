class AddCategoriesAndCategoriesArticlesTable < ActiveRecord::Migration
  def change
  	create_table :categories do |t|
  		t.string :name
  	end 
   	
   	create_table :categories_articles do |f|
   		f.integer :category_id
   		f.integer :article_id
   	end
   end 
end
