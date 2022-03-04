/*  Every turn, takes a card, and tries to place all cards in deck if possible
 *
 *
 *
 */

class AI {
    Hand hand;
    int health = 20;
    int mana = 2;

    public AI() {
        hand = new Hand();
    }

    void startTurn(Card[] field, int mana) {
        this.mana = mana;
        for (int i = 0; i < hand.inHand.length; i++) {
            Card c = hand.inHand[i];
            if (c.manaCost <= mana) { //if the cost of inHand[i] is less than or equal to the mana we have
                placeCard(i, field);
                mana--;
            }
        }
    }
    
    void placeCard(int i, Card[] field) {
        float pos = random(9.);
        field[int(pos)] = hand.inHand[i];
        hand.remove(i);
    }
    
    void drawCard(Card c) {
        hand.drawCard(c);
    }
}
