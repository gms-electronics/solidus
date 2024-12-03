# frozen_string_literal: true

store = Spree::Store.where(code: 'sample-store').first

taxonomies = [
  { name: "Categories", store: },
  { name: "Brands", store: }
]

taxonomies.each do |taxonomy_attrs|
  Spree::Taxonomy.create!(taxonomy_attrs)
end
