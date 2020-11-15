class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :status_id
  belongs_to :delivery_fee_id
  belongs_to :area_id
  belongs_to :date_id

  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 }, presence: true
  validates :status_id, numericality: { other_than: 1 }, presence: true
  validates :delivery_fee_id, numericality: { other_than: 1 }, presence: true
  validates :area_id, numericality: { other_than: 1 }, presence: true
  validates :date_id, numericality: { other_than: 1 }, presence: true
  validates :price, presence: true
end
