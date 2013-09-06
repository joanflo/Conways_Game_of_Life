with Def_Caselles; use Def_Caselles;
with Def_Taulell;
with adagraph; use adagraph;
with def_boto; use def_boto;
PROCEDURE Joc_De_La_Vida IS
   type Dimensions is record--definim l'estrutura de dades que utilitzarem
      Xy: Integer:= 600;--per instanciar el paquet generic TAUL_JOC
      K: Integer:= 100;
   end record;
   dim: dimensions;--variable que usam posteriorment per pintar cèl·lules manualment
   package Taul_Joc is new Def_Taulell (Dim.Xy, Dim.K); use Taul_Joc;--instanciació
   T: Taulell;
   B1, B2, B3,Boto_Torna, Boto_Sortir: Boto; --definim diversos botons que usarem al
   --llarg del programa
   --B1: BOTO_MANUAL
   --B2: ALEATORI
   --B3: OBRRIR
   X, Y: Integer;
   Gen: Integer:= 1;--contador de generacions
   nom: string (1..10):="          ";
   Boto_Pitjat, Fi: Boolean:= False;
   Torna: Boolean:= True;--variable booleana per forçar sortides de bucle
   procedure Botons_Inicials (B1, B2, B3: out Boto)  is separate;
   function Fitxer return String is separate;--torna el nom que has introduit per teclat
   PROCEDURE Comensa_O_Torna (Torna: OUT Boolean; Boto_Torna: IN OUT Boto) IS SEPARATE;--mira si has pitjat
   --el boto començar o torna
   procedure Pinta_Celules_Manual (T: in out Taulell; A: Dimensions; Torna: out boolean; boto_torna: out boto) is separate;
   procedure Pinta_Celules_Aleatories (T: in out Taulell; Torna: out Boolean; A: in Dimensions) is separate;
   procedure visualitza_generacio (gen: in integer) is separate;
   begin
      Dibuixar_Taulell (Dim.Xy, Dim.K);
      while not Fi loop
         boto_pitjat:=false;
         while Torna loop
            T:=Inicialitzacio_Taulell (Dim.K,Dim.Xy);
            Botons_Inicials (B1, B2, B3);
            while not Boto_Pitjat loop
               Get_Mouse_Button (Left_Button, X, Y);--agafe les cordenades d'on feim clic
               if Dinsboto (B1, X, Y) then
                  Pitjaboto (B1, "Manual");
                  Pinta_Celules_Manual (T, Dim, Torna, boto_torna);
                  Boto_pitjat:= true;--quan hem pitjat un boto posam a TRUE boto_pitjat per a sortir del bucle
               end if;
               if Dinsboto (B2, X, Y) then
                  Pitjaboto (B2, "Aleatori");
                  Pinta_Celules_Aleatories (T, Torna, Dim);
                  Boto_Pitjat:= True;
               end if;
               if X>100 and X<200 and Y<70 and Y>55 then--mira si feim click dins el requadre per escriure el nom del fitxer
                  Nom:=Fitxer;
                  get_mouse_button (left_button,x,y);
                  if Dinsboto (B3, X, Y) then
                     Pitjaboto (B3, "Obrir");
                     while not Queden_Celules (T) loop
                        T:=Obri_Fitxer (Nom);--guarda a T el taulell que hi ha dins l'arxiu amb el nom que
                        --li passam per paràmetre
                        if not Queden_Celules (T) then
                           Wait_For_Mouse_Button (Left_Button);
                           Draw_Box (210,55,Dim.Xy,70, Black, True);--borra el posible missatge d'error
                           --abans de tornar a escriure el següent nom de fitxer
                           Nom:=Fitxer;
                        else draw_box (210,55,dim.xy,70, black, true);--ídem però sense tornar a escriure el nom
                        end if;
                     end loop;
                     Boto_Pitjat:= True;
                     comensa_o_torna (torna, boto_torna);
                     torna:=false;
                  end if;
               end if;
            end loop;
         end loop;
         torna:=true; boto_pitjat:= false;--així tornarem a usar les variables a continuació
         while Queden_Celules (T) and Gen<51 and not boto_pitjat loop
            delay 0.8;
            if Mouse_Button_Pressed (Left_Button) then Get_Mouse_Button (Left_Button,X,Y);
               IF Dinsboto (Boto_Torna,X,Y) THEN--podem tornar en qualsevol moment després d'haver iniciat el joc
                  pitjaboto (Boto_torna, "Torna");
                  boto_pitjat:=true;
               end if;
            end if;
            T:=Seguent_Generacio (T);--formam la seguent generació que guardam a la variable taulell T
            visualitza_generacio (gen);--i també mostram la generació en que estam
            Gen:=Gen+1;
         end loop;
         Creaboto (Boto_Sortir, 450,15,520,30);
         Pintaboto (Boto_Sortir, "Sortir");
         IF Gen=51 OR NOT Boto_Pitjat THEN Fi:=True; END IF;
         --un cop acabat el joc podem sortir del programa o tornar al menú d'inici
         gen:=1;
         while not Boto_Pitjat loop
            if Fi then
               Get_Mouse_Button (Left_Button, X , Y);
               if Dinsboto (Boto_Torna,X,Y) then
                  pitjaboto (Boto_torna, "Torna");
                  Fi:=False; Boto_Pitjat:=True;
               elsif Dinsboto (Boto_Sortir,X,Y) then
                  Pitjaboto (Boto_Sortir, "Sortir");
                  Boto_Pitjat:=True;
               end if;
            end if;
         end loop;
      end loop;
END Joc_De_La_Vida;
