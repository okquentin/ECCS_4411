with Ada.Text_IO;

procedure Program2_Func is
   function Calculate_Area (Length : Float; Width : Float) return Float is
   begin
      return Length * Width;
   end Calculate_Area;

   L, W, A : Float;
begin
   L := 5.0;
   W := 3.0;
   A := Calculate_Area(L, W);
   Ada.Text_IO.Put_Line("Area: " & Float'Image(A));
end Program2_Func;