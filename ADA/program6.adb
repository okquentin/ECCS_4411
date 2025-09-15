with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Program6 is
   -- Generic bubble sort
   generic
      type Element_Type is private;
      type Array_Type is array (Positive range <>) of Element_Type;
      with procedure Swap (A, B : in out Element_Type);
      with function Less (Left, Right : Element_Type) return Boolean;
   procedure Bubble_Sort (Arr : in out Array_Type);

   procedure Bubble_Sort (Arr : in out Array_Type) is
   begin
      for Pass in 1 .. Arr'Length - 1 loop
         for I in Arr'First .. Arr'Last - Pass loop
            if not Less (Arr (I), Arr (I + 1)) then
               Swap (Arr (I), Arr (I + 1));
            end if;
         end loop;
      end loop;
   end Bubble_Sort;

   procedure Int_Swap (X, Y : in out Integer) is
      Temp : Integer;
   begin
      Temp := X;
      X    := Y;
      Y    := Temp;
   end Int_Swap;

   function Int_Less (Left, Right : Integer) return Boolean is
   begin
      return Left < Right;
   end Int_Less;

   -- Define array type for Integer
   type Int_Array is array (Positive range <>) of Integer;
   procedure Int_Bubble_Sort is new Bubble_Sort
      (Element_Type => Integer,
        Array_Type   => Int_Array,
        Swap         => Int_Swap,
        Less         => Int_Less);
   -- Example array
   A : Int_Array (1 .. 10) := (10, 7, 2, 8, 6, 1, 5, 9, 7, 3);

begin
   Put_Line ("Before sort:");
   for I in A'Range loop
      Put (A (I)'Image & " ");
   end loop;
   New_Line;

   Int_Bubble_Sort (A);

   Put_Line ("After sort:");
   for I in A'Range loop
      Put (A (I)'Image & " ");
   end loop;
   New_Line;
end Program6;