with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Program4 is
   A, B : Integer;
   Result : Integer;
begin
   Put_Line("This program divides the first integer by the second integer.");
   Put("Enter the first integer: ");
   Get(A);
   Put("Enter the second integer: ");
   Get(B);

   begin
      Result := A / B;
      Put_Line("Result: " & Integer'Image(Result));
   exception
      when Constraint_Error =>
         Put_Line("Error: Division by zero is not allowed.");
   end;
end Program4;