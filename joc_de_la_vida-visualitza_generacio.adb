separate (Joc_De_La_Vida)
   procedure Visualitza_Generacio (Gen: in Integer) is
      Generacio: String (1..2);
   begin
      Generacio(1) := character'val(character'pos('0') + gen/10);--pasam d'un integer a un string per a
      Generacio(2) := Character'Val(Character'Pos('0') + Gen - (Gen/10)*10);--poder visualitzar-lo a la
      Display_Text (300,58, "GENERACIO ", white);--finestra de l'adagraph.
      draw_box (400,58,430,70, black, true);--borram el nombre anterior per a poder visualitzar el nou
      Display_Text (400,58,Generacio, white);--visualitzam el nombre de generacio actual
   end Visualitza_Generacio;
     