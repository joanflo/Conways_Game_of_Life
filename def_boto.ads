-- Creaboto inicialitza un boto amb els valors dels dos punts donats
-- Pintarboto pinta el boto a la pantalla
-- Dins boto val vertader si s'ha fet click al boto
-- Pitja boto pinta el boto com si estás pitjat dues dècimes de segon
-- i torna al seu estat normal
package def_Boto is
   type Boto is private; 
   procedure Creaboto (B: out Boto; X1, Y1, X2, Y2: in Integer); 
   procedure Pintaboto (B: in Boto; Nom: in String); 
   function Dinsboto (B: in Boto; X, Y: in Integer) return Boolean; 
   procedure Pitjaboto (B : in Boto; Nom: in String); 
private
   type Boto is record 
         X1, Y1, X2, Y2: Integer;  
   end record; 
end def_Boto;