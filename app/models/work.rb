class Work < ApplicationRecord
  # Validations
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :story, presence: true

  # Callbacks
  before_validation :generate_slug, if: -> { slug.blank? && title.present? }

  # Scopes
  scope :featured, -> { where(featured: true) }
  scope :published, -> { where.not(status: "Draft") }
  scope :by_category, ->(category) { where(category: category) }
  scope :recent, -> { order(created_at: :desc) }

  # Instance methods
  def to_param
    slug
  end

  private

  def generate_slug
    self.slug = title.parameterize
  end
end
