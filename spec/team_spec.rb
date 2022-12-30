require './lib/team'
require './lib/player'

RSpec.describe Team do
    let(:team) { Team.new("France") }
    let(:mbappe) { Player.new({name: "Kylian Mbappe", position: "forward"}) }
    let(:pogba) { Player.new({name: "Paul Pogba", position: "midfielder"}) }

    it "exists" do
        expect(team).to be_a(Team)
    end

    it "has attributes" do
        expect(team.country).to eq("France")
    end

    it "default is not eliminated" do 
        expect(team.eliminated?).to eq(false)
    end

    it "can be eliminated" do
        team.eliminated = true

        expect(team.eliminated?).to eq(true)
    end

    it "starts with no players" do
        expect(team.players).to eq([])
    end

    it "can add players" do
        team.add_player(mbappe)
        team.add_player(pogba)

        expect(team.players).to eq([mbappe, pogba])
    end

    it "has players by position" do
        team.add_player(mbappe)
        team.add_player(pogba)
        
        expect(team.players_by_position("midfielder")).to eq([pogba])
        expect(team.players_by_position("defender")).to eq([])
    end
end