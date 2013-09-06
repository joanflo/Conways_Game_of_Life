SEPARATE (Joc_De_La_Vida)
   --aquest programa es cridat quan tenim les cèl·lules colocades al taulell i ens permet
   --començar el joc, anar al principi o bé guardar la disposició de les cèl·lules al taulell
   procedure Comensa_O_Torna (Torna: out Boolean;boto_torna: in out boto) is
      Boto_Guarda, Boto_comença:Boto;
      X, Y: Integer;
      comença: boolean:=false;
   begin
      Draw_Box (145,15,320,30,Black,True);--cream i pintam els botons
      Creaboto (Boto_Guarda, 245,15,320,30);
      pintaboto (boto_guarda, "Guarda");
      Creaboto (Boto_Comença,145,15,225,30);
      Pintaboto (Boto_Comença, "Comença");
      creaboto (boto_torna, 340, 15, 410, 30);
      pintaboto (boto_torna, "Torna");
      torna:=false;
      while not Comença and not Torna loop
         Get_Mouse_Button (Left_Button,X,Y);
         IF X>100 AND X<200 AND Y<70 AND Y>55 THEN --si feim clic al requadre blanc de text tenim l'opció
            -- de posar el nom d'un fitxer on podem guardar si volem la configuració de cèl·lules
            Nom:=Fitxer;
            get_mouse_button (left_button,x,y);
             if Dinsboto (Boto_Guarda,x,Y) then
                Pitjaboto (Boto_Guarda, "Guarda");
               Guarda_Fitxer (Nom, T);
            end if;
         end if;
         Draw_Box (210,46,600,80,Black,True);
         --després triam entre comensar o tornar
         if Dinsboto (Boto_Comença,X,Y) then
            Pitjaboto (Boto_Comença, "Comença");
            Comença:=True;
            draw_box (145,15,320,30, black, true);--Borra el botó Comença
         elsif Dinsboto (Boto_Torna, X, Y) then
            Pitjaboto (Boto_Torna, "Torna");
            Torna:= True;
         end if;
      end loop;

   end Comensa_O_Torna;
   