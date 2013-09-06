with Def_Caselles; use Def_Caselles;
--especificacions del paquet DEF_CASELLES.
--Té una part genérica que conté les dimensions del taulell
GENERIC

      Dimxy: Integer;
      Dimk: Integer;

package Def_Taulell is
   --procediments i funcions del paquet:
   type Taulell is array (1..10, 1..10) of Casella;
   function Inicialitzacio_Taulell (A,b: in integer) return Taulell;
   procedure Dibuixar_Taulell (A, B: in Integer);
   FUNCTION Celules_Devora (T: Taulell; A, B: Integer) RETURN Integer;
   function Queden_Celules (T: Taulell) return Boolean;
   function Seguent_Generacio (T: Taulell) return Taulell;
   procedure Guarda_Fitxer (A: String; T: in Taulell);
   function Obri_Fitxer (A: String) return taulell;

end Def_Taulell;