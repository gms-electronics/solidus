# frozen_string_literal: true

class AddReverseChargeStatusToStore < ActiveRecord::Migration[7.2]
  def change
    add_column :spree_stores, :reverse_charge_status, :integer
  end
end
