class Image < ActiveRecord::Base
  belongs_to :dir_path
  validates_uniqueness_of :path

  after_create :optimize_image

  def optimize_image
    OptimizeImageJob.perform_later(self.id)
  end
end
