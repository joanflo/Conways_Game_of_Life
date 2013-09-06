SEPARATE (Joc_De_La_Vida)
   --aquest programa ens permet introduïr cèl·lules de forma manual
   procedure Pinta_Celules_Manual (T: in out Taulell; A: Dimensions; Torna: out Boolean; boto_torna: out boto) is
      X1, Y1, C: Integer;
      --la variable C és el nombre de cèl·lules que queden per pintar
      --X1, Y1 són les variables que ens permeten saber a quina casella hem clicat
   BEGIN
      torna:=false;
      C:=10;
      Draw_Box (0,0,A.Xy,30,Black,True);
      Creaboto (Boto_Torna, 340, 15, 410, 30);--pintam el boto per tornar
      Pintaboto (Boto_Torna, "Torna");
      while C>0 and not torna loop

         Get_Mouse_Button (Left_Button, X1, Y1);
         if Y1>A.K then
            X1:=1+x1/(a.xy/10);--trobam les coordenades de
            Y1:=1+(y1-a.k)/(a.xy/10);--la casella que hem clicat
            if Es_Celula_Viva (T(x1,y1)) then--si feim clic a una casella viva l'hem de matar:
               Pinta_Celula_Morta(T(X1,Y1));--posam el seu estat a FALSE, la borram gráficament
               c:=c+1;--y pujam el contador que ens indica les cèl·lules que falten
            else Pinta_Celula_Viva (T(X1,Y1));--si esta viva el mateix a l'inreves
            c:=c-1;
            end if;
         end if;
         if Dinsboto (Boto_Torna, X1, Y1) then
            Pitjaboto (Boto_Torna, "Torna");
            Torna:= True;
         end if;
      end loop;
      comensa_o_torna(torna, boto_torna);

   end Pinta_celules_manual;
      