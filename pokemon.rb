class Pokemon
    attr_accessor :name, :url, :weight, :height, :base_xp

    @@all = []

    def initialize(poke_hash)
        self.name = poke_hash[:name]
        self.url = poke_hash[:url]
        @@all << self
    end

    def self.all
        @@all
    end

end