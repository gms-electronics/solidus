class AddStoreAttributesToSpreeStores < ActiveRecord::Migration[7.2]
	def change
		add_column :spree_stores, :legal_name, :string
		add_column :spree_stores, :tax_id, :string
		add_column :spree_stores, :address, :text
		add_column :spree_stores, :contact_phone, :string
		add_column :spree_stores, :contact_email, :string
		add_column :spree_stores, :vat_id, :string
		add_column :spree_stores, :description, :text
	end
end
