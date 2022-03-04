import java.util.ArrayList;

class Player {
    ArrayList<Card> hand = new ArrayList<Card>();

    void drawCard() {
        hand.add(drawDeck[0]);
    }

    void placeCard() {

    }
}