# frozen_string_literal: true

require "rails_helper"
require "solidus_promotions/promotion_migrator"
require "solidus_promotions/promotion_map"
require "solidus_promotions/migrate_adjustments"

RSpec.describe SolidusPromotions::MigrateAdjustments do
  let(:promotion) { create(:promotion, :with_adjustable_action) }
  let(:order) { create(:order_with_line_items) }
  let(:line_item) { order.line_items.first }
  let(:tax_rate) { create(:tax_rate) }

  before do
    line_item.adjustments.create!(
      source: tax_rate,
      amount: -3,
      label: "Business tax",
      included: true,
      order: order
    )
    line_item.adjustments.create!(
      source: promotion.actions.first,
      amount: -2,
      label: "Promotion (Because we like you)",
      order: order
    )
    SolidusPromotions::PromotionMigrator.new(
      SolidusPromotions::PROMOTION_MAP
    ).call
  end

  describe ".up" do
    subject { described_class.up }

    it "migrates our adjustment" do
      spree_promotion_action = Spree::PromotionAction.first
      solidus_promotion_benefit = SolidusPromotions::Benefit.first
      expect { subject }.to change {
        Spree::Adjustment.promotion.first.source
      }.from(spree_promotion_action).to(solidus_promotion_benefit)
    end

    it "will not touch tax adjustments" do
      expect { subject }.not_to change {
        Spree::Adjustment.tax.first.attributes
      }
    end
  end

  describe ".down" do
    subject { described_class.down }

    before do
      described_class.up
    end

    it "migrates our adjustment" do
      spree_promotion_action = Spree::PromotionAction.first
      solidus_promotion_benefit = SolidusPromotions::Benefit.first
      expect { subject }.to change {
        Spree::Adjustment.promotion.first.source
      }.from(solidus_promotion_benefit).to(spree_promotion_action)
    end

    it "will not touch tax adjustments" do
      expect { subject }.not_to change {
        Spree::Adjustment.tax.first.attributes
      }
    end
  end
end
