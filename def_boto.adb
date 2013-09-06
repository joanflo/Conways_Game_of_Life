with Adagraph; use Adagraph;

package body def_Boto is

   procedure Creaboto (
         B  :    out Boto;   
         X1,                 
         Y1,                 
         X2,                 
         Y2 : in     Integer ) is 
   begin
      B.X1:=X1;
      B.Y1:=Y1;
      B.X2:=X2;
      B.Y2:=Y2;
   end Creaboto;

   procedure Pintaboto (
         B   : in     Boto;  
         Nom : in     String ) is 
   begin
      Draw_Box(B.X1,B.Y1,B.X2,B.Y2,Light_Gray,True);
      Draw_Box(B.X1,B.Y1,B.X2,B.Y2,Black,False);
      Draw_Line(B.X1+1,B.Y1+1,B.X1+1,B.Y2-1,White);
      Draw_Line(B.X1+1,B.Y2-1,B.X2-1,B.Y2-1,White);
      Draw_Line(B.X1+1,B.Y1+1,B.X2-1,B.Y1+1,Dark_Gray);
      Draw_Line(B.X2-1,B.Y1+1,B.X2-1,B.Y2-1,Dark_Gray);
      Display_Text(B.X1+12,B.Y1+2,Nom);
   end Pintaboto;

   function Dinsboto (
         B : in     Boto;   
         X,                 
         Y : in     Integer ) 
     return Boolean is 
   begin
      return (X>=B.X1 and X<=B.X2 and Y>=B.Y1 and Y<=B.Y2);
   end Dinsboto;

   procedure Pitjaboto (
         B   : in     Boto;  
         Nom : in     String ) is 
   begin
      Draw_Box(B.X1,B.Y1,B.X2,B.Y2,Dark_Gray,True);
      Draw_Box(B.X1,B.Y1,B.X2,B.Y2,Black,False);
      Draw_Line(B.X1+1,B.Y1+1,B.X1+1,B.Y2-1,Black);
      Draw_Line(B.X1+1,B.Y2-1,B.X2-1,B.Y2-1,Black);
      Draw_Line(B.X1+1,B.Y1+1,B.X2-1,B.Y1+1,White);
      Draw_Line(B.X2-1,B.Y1+1,B.X2-1,B.Y2-1,White);
      Display_Text(B.X1+12,B.Y1+2,Nom);
      delay 0.2;
      Pintaboto(B,Nom);
   end Pitjaboto;

end def_Boto;
