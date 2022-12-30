require './lib/world_cup'
require './lib/team'
require './lib/player'

RSpec.describe WorldCup do
    let(:france) { Team.new("France") }
    let(:mbappe) { Player.new({name: "Kylian Mbappe", position: "forward"}) }
    let(:pogba) { Player.new({name: "Paul Pogba", position: "midfielder"}) }
    let(:croatia) { Team.new("Croatia") }
    let(:modric) { Player.new({name: "Luka Modric", position: "midfielder"}) }
    let(:vida) { Player.new({name: "Domagoj Vida", position: "defender"}) }
    let(:world_cup) { WorldCup.new(2018, [france, croatia]) }

    it "exists" do
        france.add_player(mbappe)
        france.add_player(pogba)

        croatia.add_player(modric) 
        croatia.add_player(vida)

        expect(world_cup).to be_a(WorldCup)
    end

    it "has attributes" do
        expect(world_cup.year).to eq(2018)
        expect(world_cup.teams).to eq([france, croatia])
    end

    it "has active players by position" do
        france.add_player(mbappe)
        france.add_player(pogba)

        croatia.add_player(modric) 
        croatia.add_player(vida)

        expect(world_cup.active_players_by_position("midfielder")).to eq([pogba, modric])

        croatia.eliminated = true 

        expect(world_cup.active_players_by_position("midfielder")).to eq([pogba])
    end

    it "can list all players by position" do 
        france.add_player(mbappe)
        france.add_player(pogba)

        croatia.add_player(modric) 
        croatia.add_player(vida)

        all_positions =    {
                "forward" => [mbappe],
                "midfielder" => [pogba, modric],
                "defender" => [vida]
              }

        expect(world_cup.active_players_by_position).to eq(all_positions)
    end
end