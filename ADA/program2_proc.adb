with Ada.Text_IO;

procedure Program2_Proc is
   procedure Calculate_Area (Length : Float; Width : Float; Area : out Float) is
   begin
      Area := Length * Width;
      Ada.Text_IO.Put_Line("Area: " & Float'Image(Area));
   end Calculate_Area;

   L, W, A : Float;
begin
   L := 5.0;
   W := 3.0;
   Calculate_Area(L, W, A);
end Program2_Proc;