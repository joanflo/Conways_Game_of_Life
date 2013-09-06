   with Ada.Numerics.Discrete_Random;
separate (Joc_De_La_Vida)
   PROCEDURE Pinta_Celules_Aleatories (T: IN OUT Taulell; Torna: OUT Boolean; A: IN Dimensions) IS
      --cream un subtipus dels enters anomenat aleatorio que va del 1 al 10
      SUBTYPE Aleatorio IS Integer RANGE 1..10;
      --despr�s instanciam el Numerics.Discrete_random amb aquest subtipus
      package Random_10 is new Ada.Numerics.Discrete_Random (Aleatorio); use Random_10;
      I, J: Integer;
      cel: integer:= 10;--contador de c�l�lules
      G: Random_10.Generator;--variable per a generar valors aleatoris dins el rang definit al subtipus
   begin
      Draw_Box (0,0,A.Xy,30,Black,True);
      Creaboto (Boto_Torna, 340, 15, 410, 30);
      Pintaboto (Boto_Torna, "Torna");
      --dibuixam 10 c�l�lules aleatoriament:
      while Cel/=0 loop
         Random_10.Reset (G);
         I:= Random (G);
         J:= Random (G);
         if not es_celula_viva (T(I,J)) then--tenim en compte que si a la casella ja hi havia
            Cel:=Cel-1;--una c�l�lula viva no pintarem la c�l�lula generada aletoriament a la iteraci�
            Pinta_Celula_Viva (T(I, J));
         end if;
      end loop;
      comensa_o_torna(torna, boto_torna);
   end Pinta_Celules_Aleatories;

