class Controller
  def initialize
    @view = View.new
  end

  def create_gossip
    params = @view.create_gossip
    gossip = Gossip.new(params["author"], params["content"])
    gossip.save
  end

  def index_gossips
    @view.index_gossips(Gossip.all)
  end

  def delete_gossip_by_name
    params = @view.delete_gossip_by_name
    Gossip.delete_gossip_by_name(params)
  end

  def delete_gossip_by_message
    params = @view.delete_gossip_by_message
    Gossip.delete_gossip_by_message(params)
  end
end
