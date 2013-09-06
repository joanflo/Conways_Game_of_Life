separate (joc_de_la_vida)
function Fitxer return string is
   num:INTEGER:=0;
   CAR:CHARACTER;
   Text:String(1 .. 10):= "          ";
   Cr:constant Character:=Character'Val (16#0D#);--valor en hexadecimal de la tecla ENTER
BEGIN
   Car:=Get_Key;--asignam a CAR la tecla que pulsem
   WHILE CAR/=CR LOOP--mentres aquesta tecla sigui diferent a ENTER mantenim per pantalla
      num:=num+1;--el que haguem introduïr per teclat
      TEXT(num):=CAR;
      DISPLAY_TEXT(105,58,TEXT,BLACK);
      Car:=Get_Key;
   end loop;
      return text;
EXCEPTION
   --aquesta excepció bota quan superam el máxim de caracters permetuts per al nom del fitxer
   WHEN CONSTRAINT_ERROR=>
      Draw_Box (100,55,200,70, White, True);
      --visualitzam missatge d'error
      Display_Text(210,58,"El nom del fitxer supera el nombre maxim de", White);
      display_text(210,46, "caracters permesos (max. 10 caracters)", white);
      return "          ";--per a no violar el flux del programa tornam un valor blanc per exemple

end Fitxer;


