class DirPath < ActiveRecord::Base
  after_create :collect_images
  has_many :images
  validate :path_structure
  validates_uniqueness_of :path

  def collect_images
    CollectImagesJob.perform_later(self.id)
  end

  def path_structure
    errors.add(:path, 'needs to end with / character') unless self.path.end_with?('/')
  end
end
