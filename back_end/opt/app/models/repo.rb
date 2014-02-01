 class Repo < ActiveRecord::Base

	before_save :create_folder

	belongs_to :user
	belongs_to :team
	belongs_to :course
	serialize :order

	def create_name
		getRandomName.gsub(" ","_")
	end

	def create_folder	
		self.name = create_name
	    `mkdir ../../repositories/#{self.name}`
	    if File.directory? "../../repositories/#{self.name}"
	    	return true
	    end
	    false
	    self.errors.add(:repository, "Unable to create")
	end

end