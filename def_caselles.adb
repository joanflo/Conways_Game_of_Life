--Cos del paquet DEF_CASELLES:
with Adagraph; use Adagraph;
PACKAGE BODY Def_Caselles IS

   --Programa que pinta una cèl·lula i actualitza el se estat a viva:
   procedure Pinta_Celula_Viva (A: in out Casella) is
   begin
      A.Celula:= Viva;
      Draw_Circle (A.X1+(A.X2-A.X1)/2, A.Y1+(A.Y2-A.Y1)/2, 20, Blue, True);--calculam les coordenades del centre
   end Pinta_Celula_Viva;

   --Programa que borra una cèl·lula i actualitza el se estat a morta:
   procedure Pinta_Celula_Morta (A: in out Casella) is
   begin
      A.Celula:= Morta;
      Draw_Circle (A.X1+(A.X2-A.X1)/2, A.Y1+(A.Y2-A.Y1)/2, 20, White, True);
   end Pinta_Celula_Morta;

   --Funció que te tornar un valor boolean TRUE si la cèl·lula que li pasam està viva
   function Es_Celula_Viva (a: in casella) return Boolean is
   begin
      if A.celula=Viva then
         return True;
      else return False;
      end if;
   end Es_Celula_Viva;

   --Aquest altre actualitza una cèl·lula a viva
   procedure Celula_Viva (A: out Casella) is
   begin
      A.Celula:=Viva;
   end Celula_Viva;

   --I aquest actualitza una cèl·lula a morta
   procedure Celula_Morta (A: out Casella) is
   begin
      A.Celula:=Morta;
   end Celula_Morta;

   --programa que asigna a A,B i C coordenades segons la referencia de la finestra gráfica:
   procedure Inicialitzar (A: out Casella; B, C, D: in Integer) is
   begin
      --B: Costat casella / C,D: coordenades de les caselles
      A.X1:= B*(c-1);
      A.X2:= A.X1 + B;
      A.Y1:=100+(D-1)*B;
      A.Y2:= A.Y1+B;
   end Inicialitzar;

end Def_Caselles;


      