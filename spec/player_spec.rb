require './lib/player'

RSpec.describe Player do
    let(:player) { Player.new({name: "Luka Modric", position: "midfielder"}) }

    it "exists" do
        expect(player).to be_a(Player)
    end

    it "has attributes" do
        expect(player.name).to eq("Luka Modric")
        expect(player.position).to eq("midfielder")
    end
end