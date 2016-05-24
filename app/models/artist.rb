class Artist < OpenStruct

  # attr_accessor :id, :name, :created_at, :updated_at

  def self.service
    ChaimzService.new
  end

  #by using OpenStruct this allows us to get rid of the attr_accessor and initialize methods

  # def initialize(new_artist_hash)
  #   @id         = new_artist_hash[:id]
  #   @name       = new_artist_hash[:name]
  #   @created_at = new_artist_hash[:created_at]
  #   @updated_at = new_artist_hash[:updated_at]
  # end

  def self.find(id) #creating a class method that why we use self.
    temp_artist_hash = service.artist_hash(id)
    Artist.new(temp_artist_hash)
  end

  def self.all
    temp_artists_hash = service.artists_hash
    temp_artists_hash.map { |temp_artist_hash| Artist.new(temp_artist_hash) }
  end

end
