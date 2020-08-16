program AsalSayiBul (input,output);
{ Girdiğiniz Sayıya en yakın Asal Sayıyı bulur }

TYPE
  tNatSayiArti = 1..maxint;

VAR
  SayiGir, d : tNatSayiArti;
  bulundu : boolean;

FUNCTION AsalSayi (p : tNatSayiArti) : boolean;
{ eger p asal sayi ise true, yoksa false }

VAR
  q : tNatSayiArti;

BEGIN
  if p < 2 then
    AsalSayi := FALSE
  ELSE
    BEGIN
      AsalSayi := TRUE;
      for q := 2 to p-1 do
        if p mod q = 0 then
          AsalSayi := false
    END
END; { AsalSayi }

BEGIN
  WriteLn('Sayı Giriniz: ');
  ReadLn(SayiGir);
  Write('Girdiğiniz ', SayiGir,' Sayısına en yakın Asal Sayı: ');
  if AsalSayi (SayiGir) then
    WriteLn(SayiGir)
  else
    if SayiGir = 1 then
      WriteLn('2':5)
    ELSE
    BEGIN
      bulundu := FALSE;
      if odd (SayiGir) then
        d := 2
      else
        d := 1;

      REPEAT
        if AsalSayi (SayiGir + d) then
        BEGIN
          bulundu := TRUE;
          Write (SayiGir + d : 2)
        END;
        if AsalSayi (SayiGir - d) then
        BEGIN
          bulundu := TRUE;
          Write (SayiGir - d : 2);
        END;
        d := d + 2
      UNTIL (bulundu);
      WriteLn;

    END { SayiGir <> 1 }
END. { AsalSayiBul }
