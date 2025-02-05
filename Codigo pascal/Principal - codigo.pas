program principal;
uses CRT;
type
  fecha = record
    anio: INTEGER;
    mes: SHORTINT;
    dia: SHORTINT;
end;
type
  temperaturas = record
    valortemp: SHORTINT;
    fechatoma: fecha;
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
  conttempinf, conttemptot, acutemptot, i: INTEGER;
FUNCTION asterisco(n: INTEGER): INTEGER;
  begin
    if n<0 then
      n:= -1*n;
    asterisco:= (n - (n MOD 3)) DIV 3
  end;
begin
  assign(temp, 'temperaturas.txt');
  {$I-}
  reset(temp);
  {$I-}
  if IOResult <> 0 then
    halt(2);
  read(temp, t);
  assign(tempsal, 'temperaturas_agosto.txt');
  rewrite(tempsal);
  WriteLn(' ______________________________________________________ ');
  WriteLn('|   -30       0        30        60        90       120|');
  conttempinf:=0; conttemptot:=0; acutemptot:=0;
  While Not EOF(temp) do
  begin
    Write('|');
    if (t.valortemp>-1) and (t.valortemp<10) then
      Write('  ')
    else
      if (t.valortemp>-10) and (t.valortemp<100) then
        Write(' ');
    Write(t.valortemp);
    if (t.valortemp<0) then
      begin
        conttempinf:= conttempinf + 1;
        for i:=9 downto asterisco(t.valortemp) do
          Write(' ');
        for i:=1 to asterisco(t.valortemp) do
          Write('*');
      end
      else
        for i:=1 to 10 do
          Write(' ');
    Write('|'); //va siempre
    if (t.valortemp>=0) then
      begin
        for i:=1 to asterisco(t.valortemp) do
          Write('*');
        for i:=39 downto asterisco(t.valortemp) do
          Write(' ');
      end
      else
        for i:=0 to 39 do
          Write(' ');
    Write('|');
    WriteLn;

    if (t.fechatoma.anio=2021) and (t.fechatoma.mes=8) then
      begin
        ta.dia:= t.fechatoma.dia;
        ta.valortemp:= t.valortemp;
        write(tempsal, ta);
      end;
    conttemptot:= conttemptot + 1;
    acutemptot:= acutemptot + t.valortemp;
    read(temp, t);
  end;
  write(tempsal, ta); //no graba el último, [mirar]
  conttempinf:= trunc(conttempinf / conttemptot * 100);
  WriteLn('El porcentaje de temperaturas inferiores a 0 grados es de ', conttempinf, char(37));
  acutemptot:= trunc(acutemptot / conttemptot);
  if acutemptot>50 then
  begin
    textcolor(4);
    Write('ALERTA ROJA: ');
    NormVideo;
  end;
  Writeln('el promedio de temperaturas es de ',acutemptot);
  close(temp); close(tempsal);
  repeat
  until keypressed;
end.
