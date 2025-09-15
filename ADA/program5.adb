with Ada.Text_IO; use Ada.Text_IO;

procedure Program5 is

   type Suit_Type is (Hearts, Diamonds, Clubs, Spades);
   type Rank_Type is (Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace);

   type Card is record
      Suit : Suit_Type;
      Rank : Rank_Type;
   end record;

   My_Card : Card := (Suit => Hearts, Rank => Queen);
begin
   Put_Line("Card: " & Rank_Type'Image(My_Card.Rank) & " of " & Suit_Type'Image(My_Card.Suit));
end Program5;