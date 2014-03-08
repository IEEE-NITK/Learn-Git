class Repo < ActiveRecord::Base

  before_save :create_folder
  after_destroy :delete_repo

  validates_uniqueness_of :user_id, scope: [:course_id]


  belongs_to :user
  belongs_to :team
  belongs_to :course
  serialize :order

# def create_name
# 	getRandomName.gsub(" ","_")
# end

def create_folder
  self.name =getRandomName.gsub(" ","_")
  `mkdir ../../repositories/#{self.name}`
  if File.directory? "../../repositories/#{self.name}"
    return true
  end
  false
  self.errors.add(:repository, "Unable to create")
end

def delete_repo
  `rm -rf ../../repository/#{self.name}`
end

private
def getRandomName
  names = ["Sad Python",
    "Fierce Rare Sledgehammer",
    "Helpless Backpack",
    "Stony Grim Roadrunner",
    "Cheerful Proton",
    "Morbid Foot",
    "Frozen Accidentally Wrench",
    "Longitude Insane",
    "Ninth Laser",
    "Appropriate Winter",
    "Outstanding Monkey",
    "Northernmost Crayon",
    "Nocturnal Electrical",
    "Liquid Morbid Ray",
    "Nervous Pineapple ",
    "Streaming Obscure",
    "Random Name"
  ]
  a = (0..16).to_a.sample
  @aname = names[a].to_s+"_" + ((1000..9999).to_a.sample).to_s
  puts @aname
  return @aname
end


end
