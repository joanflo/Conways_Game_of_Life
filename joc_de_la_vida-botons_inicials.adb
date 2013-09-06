SEPARATE (Joc_De_La_Vida)
   --cream els botons que surten al principi del programa
   procedure Botons_Inicials (b1, b2, b3: out boto) is
   begin
      Creaboto (B1,145,15,215,30);
      Pintaboto (B1,"Manual");
      Creaboto (B2, 235, 15, 320,30);
      Pintaboto (B2, "Aleatori");
      Creaboto (B3, 340, 15, 410, 30);
      Pintaboto (B3, "Obrir");
      Display_Text(10,58,"Nom fitxer: ",White);
      Draw_Box (100,55,200,70, White,True);
   end Botons_Inicials;
   