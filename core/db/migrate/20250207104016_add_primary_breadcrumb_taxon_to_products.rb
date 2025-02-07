class AddPrimaryBreadcrumbTaxonToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :spree_products, :primary_breadcrumb_taxon, null: true, foreign_key: { to_table: :spree_taxons }
  end
end
