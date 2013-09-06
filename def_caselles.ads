--especificacions del paquet DEF_CASELLES:
package Def_Caselles is
   type Estat is private;
   type Casella is private;--seran estructures privades
   procedure Pinta_Celula_Viva (a: in out casella);
   procedure Pinta_Celula_Morta (A: in out Casella);
   function Es_Celula_Viva (A: in Casella) return Boolean;
   procedure Celula_Viva (A: out Casella);
   procedure Celula_Morta (A: out Casella);
   procedure Inicialitzar (A: out Casella; B, C, D: in Integer);
   private
   type Estat is (Viva,Morta);
   type Casella is record--definim l'estructura de dades d'una casella
      Celula: Estat;
      X1, Y1, X2, Y2: Integer;
   end record;
end Def_Caselles;
