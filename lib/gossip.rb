

class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open("./db/gossip.csv", "a") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossip = []
    CSV.foreach("./db/gossip.csv") do |row|
      temp_gossip = Gossip.new(row[0], row[1])
      all_gossip << temp_gossip
    end
    return all_gossip
  end

  def self.delete_gossip_by_message(message)
    remaining_gossips = Gossip.all
    remaining_gossips.delete_if { |gossip| gossip.content == message }
    File.truncate("./db/gossip.csv", 0)
    remaining_gossips.each { |gossip|
      CSV.open("./db/gossip.csv", "w") do |csv|
        csv << [gossip.author, gossip.content]
      end
    }
  end

  def self.delete_gossip_by_name(writer)
    remaining_gossips = Gossip.all
    remaining_gossips.delete_if { |gossip| gossip.author == writer }
    File.truncate("./db/gossip.csv", 0)
    remaining_gossips.each { |gossip|
      CSV.open("./db/gossip.csv", "w") do |csv|
        csv << [gossip.author, gossip.content]
      end
    }
  end
end
