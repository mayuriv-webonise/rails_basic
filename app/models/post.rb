class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    scope :published, -> { where(published: true) }
    scope :unpublished, -> { where(published: false) }

    def published?
      published
    end

    def unpublished?
      !published
    end

    def publish
      update(published: true)
    end

    def unpublish
      update(published: false)
    end
  end
