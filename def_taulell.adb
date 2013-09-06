with Adagraph; use Adagraph;
with Def_Caselles; use Def_Caselles;
WITH Ada.Sequential_Io;
--cos del paquet:
package body def_taulell is

   --aquesta funcio inicialitza el taulell amb cèl·lules mortes
   function Inicialitzacio_Taulell (A,B: in integer) return Taulell is
      T:Taulell;
      L: integer:=B/10;
   begin
      for I in 1..10 loop
         for J in 1..10 loop
            inicialitzar (t(i,j), L, i,j);
            Celula_Morta (T(I,J));
            Pinta_Celula_Morta (T(I,J));
         end loop;
      end loop;
      Draw_Box (0,0,B,A,Black,True);--pintam la capçalera d'abaix
      return T;
   end Inicialitzacio_Taulell;

   --dibuixa la graella que separa les distintes caselles i obri la finestra d'ADAGRAPH
   PROCEDURE Dibuixar_Taulell (A, B: IN Integer) IS
   BEGIN
      Open_Graph_Window (A,A+B);
      FOR I IN 0..10 LOOP
         Draw_Line(0, (A+B)-I*A/10, A, (A+B)-I*A/10, Black);
         Draw_Line(0+I*A/10, B, 0+I*A/10, A+B, Black);
      END LOOP;
   END Dibuixar_Taulell;

   --Ens diu quantes cèl·lules vives tenim al devora de la que analitzam
   function Celules_Devora (T: Taulell; A, B: Integer) return Integer is
      type Taulell2 is array (0..11, 0..11) of casella;
      T2: Taulell2; --taulell 12x12 per a poder tractar totes les cèl·lues per igual
      N: Integer:=0; --comptador de les cèl·lules veinades
      begin
         --Inicialitzam el taulell a cel·lula morta
         for I in T2'range(1) loop
            for J in T2'range(2) loop
               celula_morta (T2(I,J));
            end loop;
         end loop;
         --Hi passam els valors del taulell del joc
         for I in T'range(1) loop
            for J in T'range(2) loop
               T2(I,J):=T(I,J);
            end loop;
         end loop;
         if es_celula_viva(T2(A-1, B-1)) then
            N:= N+1;
         end if;
         if es_celula_viva(T2(A-1, B)) then
            N:=N+1;
         end if;
         if es_celula_viva(T2(A-1,B+1)) then
            N:=N +1;
         end if;
         if es_celula_viva(T2(A,B-1)) then
            N:=N+1;
         end if;
         if es_celula_viva(T2(A,B+1)) then
            N:=N+1;
         end if;
         if es_celula_viva(T2(A+1,B-1)) then
            N:=N+1;
         end if;
         if es_celula_viva(T2(A+1,B)) then
            N:=N+1;
         end if;
         if es_celula_viva(T2(A+1,B+1)) then
            N:=N+1;
         end if;
         return N;
      end Celules_Devora;

      --Ens torna un valor TRUE si hi ha almenys una cèl·lula viva al taulell
      function Queden_Celules (T:Taulell) return Boolean is
         Celula: Boolean:= False;
      BEGIN
         --recorr tot el taulell cercant una cèl·lula viva:
         for I in T'range(1) loop
            for J in T'range(2) loop
               if es_celula_viva(T(I,J)) then Celula:= True; end if;
            end loop;
            exit when Celula;
         end loop;
         return Celula;
      end Queden_Celules;

      --Pinta la següent generació:
      function Seguent_Generacio (T: Taulell) return Taulell is
         T1: Taulell;
      begin
         T1:=T;
         for I in T'range(1) loop
            for J in T'range(2) loop
               if es_celula_viva (T(I,J)) then--miram si la cèl·lula està viva
                  case Celules_Devora (T,I,J) is--Feim el que pertoqui segons el nombre de veïns
                     when 2 => pinta_celula_viva (t1(i,j));
                     when 3 => pinta_celula_viva (t1(i,j));
                     when others => pinta_celula_morta (t1(i,j));
                  end case;
               else if Celules_Devora (T,I,J)=3 then
                     Pinta_Celula_Viva (T1(I,J));
                  else Pinta_Celula_Morta (T1(I,J));
                  end if;
               end if;
            end loop;
         end loop;
         return T1;
      end Seguent_Generacio;

      --procediment que guarda a un fitxer la configuració de cèl·ules que li pasem
      procedure Guarda_Fitxer (A: String; T: in Taulell) is
         package Fitxer_Taulell is new Ada.Sequential_Io (Taulell); use Fitxer_Taulell;
         F: Fitxer_Taulell.File_Type;
      begin
         Create(F,Out_File,A);
         Write(F,T);
         Close (F);
      end Guarda_Fitxer;

      --procediment que obri un fitxer segons el nom que rebi
      function Obri_Fitxer (A:String) return taulell is
         package Fitxer_Taulell is new Ada.Sequential_Io (Taulell); use Fitxer_Taulell;
         F:Fitxer_Taulell.File_Type;
         t,t1: taulell;
      BEGIN
         --inicialitzam una varialbe tipus taulell per a en cas de que boti l'excepció NAME_ERROR la
         --funció pugui tornar un valor:
         for I in T1'range(1) loop
            for J in T1'range(2) loop
               Celula_Morta (T1(I,J));
            end loop;
            end loop;
         Open (F,In_File, A);--obrim fitxer en mode lectura
         Read (F,T);--llegim el taulell que hi ha guardat
         Close (F);--i tancam el fitxer
         --Després pintam la configuració que haguem recuperat:
         for I in T'range (1) loop
            for J in T'range(2) loop
               if Es_Celula_Viva (T(I,J)) then Pinta_Celula_Viva (T(I,J)); end if;
            end loop;
         end loop;
         return t;
      EXCEPTION
         --si hi ha algun problema amb el nom del fitxer botará l'excepció
         WHEN name_error=>
         draw_box (100,55,200,70, white, true);
         DISPLAY_TEXT(210,58,"Nom del fitxer introduit incorrecte", White);
         --visualitzam un missatge d'error i tornam un valor
         RETURN T1;

      end Obri_Fitxer;

   end Def_Taulell;