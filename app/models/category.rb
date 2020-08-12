class Category < ApplicationRecord
  belongs_to :parent_category, class_name: Category.name, optional: true

  has_many :child_categorys, class_name: Category.name, foreign_key: :parent_id
  has_many :products
end
