class Article < ApplicationRecord
  belongs_to :author
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  has_many :likes, as: :likeable, dependent: :destroy

  enum :status, [ :published, :unpublished ], default: :unpublished

  validates :title, presence: true, length: { in: 2..20 }
  validates :body, presence: true, length: { in: 3..500 }
  validates :author_id, numericality: { only_integer: true }

  scope :filter_by_status, ->(filter) { where(status: filter) }
  scope :filter_by_tag, ->(tag) { joins(:tags).where(tags: { name: tag }) }
end
