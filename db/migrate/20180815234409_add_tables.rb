class AddTables < ActiveRecord::Migration[5.2]
  def change

  #create reciepe table
    create_table :recipes do |t|
      t.string :name
    end

  #users table
    create_table :users do |t|
      t.string :name
    end

  #recipe cards table
    create_table :recipe_cards do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.integer :rating
      t.timestamps
    end

#recipe_ingredients
  create_table :recipe_ingredients do |t|
    t.string :user_id
    t.integer :recipe_id
    t.integer :rating
  end


 #allergens table

      create_table :allergens do |t|
        t.string :user_id
        t.integer :ingredient_id
    end

#Ingredients
    create_table :ingredients do |t|
      t.string :name
    end


  end
end
