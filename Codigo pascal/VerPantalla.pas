program VerPantalla;
uses CRT;
type
  fecha = record
    anio: INTEGER;
    mes: SHORTINT;
    dia: SHORTINT
end;
type
  temperaturas = record
    valortemp: SHORTINT;
    fechatoma: fecha
end;
type
  temperaturas_agosto = record
    valortemp: SHORTINT;
    dia: SHORTINT;
end;
var
  temp: file of temperaturas;
  t: temperaturas;
  tempsal: file of temperaturas_agosto;
  ta: temperaturas_agosto;
  i: INTEGER;
  ing: SHORTINT;
begin
  assign(temp, 'temperaturas.txt');
  {$I-}
  reset(temp);
  {$I-}
  if IOResult <> 0 then
    halt(2);
  assign(tempsal, 'temperaturas_agosto.txt');
  {$I-}
  reset(tempsal);
  {$I-}
  if IOResult <> 0 then
    halt(2);
  read(temp, t);
  read(tempsal, ta);
  i:= 1;
  WriteLn(char(191),'Qu',char(233),' temperatura quiere visualizar?');
  WriteLn('0= Temperaturas totales');
  WriteLn('1= Temperaturas de agosto de 2021');
  Repeat
    Read(ing);
  Until (ing=0) or (ing=1);
  if (ing=0) then
  begin
    WriteLn('N',char(176),'  VTp AAAA MM DD');
    While not EOF(temp) do
    BEGIN
      Write(i);
      if i<10 then
        Write('  ')
      else
        if i<100 then
          Write(' ');
      i:= i + 1;

      if ((t.valortemp>-1) and (t.valortemp<10)) then
        Write('   ')
      else
        if ((t.valortemp>-10) and (t.valortemp<100)) then
          Write('  ')
        else
          Write(' ');
      Write(t.valortemp);
      Write(' ');
      Write(t.fechatoma.anio);
      if t.fechatoma.mes>9 then
        Write(' ')
      else
        Write('  ');
      Write(t.fechatoma.mes);
      if t.fechatoma.dia>9 then
        Write(' ')
      else
        write('  ');
      write(t.fechatoma.dia);
      Read(temp, t);
      WriteLn;
      delay(200);
    END;
  end;
  if (ing=1) then
  begin
    WriteLn('N',char(176),'  Vtp  DD');
    While not EOF(tempsal) do
    BEGIN
      Write(i);
      if i<10 then
        Write('  ')
      else
        if i<100 then
          Write(' ');
      i:= i + 1;
      if ((ta.valortemp>-1) and (ta.valortemp<10)) then
        Write('   ')
      else
        if ((ta.valortemp>-10) and (ta.valortemp<100)) then
          Write('  ')
        else
          Write(' ');
      Write(ta.valortemp);
      Write(' ');
      if ta.dia>9 then
        Write(' ')
      else
        write('  ');
      write(ta.dia);
      Read(tempsal, ta);
      WriteLn;
      delay(200);
    END;
  end;
  REPEAT
  UNTIL keypressed();
  close(temp); close(tempsal);
end.
