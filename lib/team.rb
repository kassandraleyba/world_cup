class Team
    attr_reader :country, :players
    attr_writer :eliminated

    def initialize(country)
        @country = country
        @eliminated = false
        @players = []
    end

    def eliminated?
        @eliminated
    end

    def add_player(player)
        @players << player
    end

    def players_by_position(position)
        # require 'pry'; binding.pry
        player_position = []
        @players.each do |player|
           if player.position == position
            player_position << player
           end
        end
        player_position
    end
end