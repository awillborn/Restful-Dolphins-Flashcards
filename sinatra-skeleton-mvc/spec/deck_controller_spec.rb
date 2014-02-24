require 'spec_helper'

describe "Deck controller" do

  before(:all) do
    FactoryGirl.create(:card)
    first_user.decks << first_deck
  end
  let(:first_deck){FactoryGirl.create(:deck)}
  let(:first_user){FactoryGirl.create(:user)}

  describe "answering a question" do
    before(:each) do
      cards = Deck.find(1).cards
      post '/decks/1/cards/1', {answer: "Au"}, 'rack.session' => {cards: cards}
    end

    it "should be ok" do
      expect(last_response.status).to eq(200)
    end

    it "should return correct if answer is correct" do
      expect(last_response.body).to include("Correct")
    end
  end
end