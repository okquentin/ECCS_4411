with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Program3 is
   Number : Integer;
begin
   Put("Enter an integer: ");
   Get(Number);

   if Number > 0 then
      Put_Line("The integer is greater than 0.");
   elsif Number < 0 then
      Put_Line("The integer is less than 0.");
   else
      Put_Line("The integer is equal to 0.");
   end if;
end Program3;