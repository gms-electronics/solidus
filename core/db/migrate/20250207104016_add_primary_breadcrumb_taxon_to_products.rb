class AddPrimaryBreadcrumbTaxonToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :spree_products, :primary_breadcrumb_taxon_id, :integer, null: true
    add_foreign_key :spree_products, :spree_taxons, column: :primary_breadcrumb_taxon_id
    add_index :spree_products, :primary_breadcrumb_taxon_id
  end
end
