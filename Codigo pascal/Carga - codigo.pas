program Carga;
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
var
  temp: file of temperaturas;
  t: temperaturas;
  inganio: INTEGER;
  ingmes, ingdia, ingvalor: SHORTINT;
  decision: SHORTINT;
  flag: BOOLEAN;
begin
  assign(temp, 'temperaturas.txt');
  rewrite(temp);
  repeat
    Repeat
      WriteLn('Ingrese el a',char(241),'o de la toma, en formato AAAA');
      ReadLn(inganio);
    Until (inganio>1999) and (inganio<2023);
    t.fechatoma.anio:= inganio;
    Repeat
      WriteLn('Ingrese el mes de la toma, en formato MM');
      ReadLn(ingmes);
    Until (ingmes>0) and (ingmes<13);
    t.fechatoma.mes:= ingmes;
    Repeat
      flag:= true;
      WriteLn('Ingrese el d',char(237),'a de la toma, en formato DD');
      ReadLn(ingdia);
      case ingmes of
        2: if ingdia>28 then
            flag:= false;
        4,6,9,11: if ingdia>30 then
            flag:= false;
        else
            if ingdia>31 then
              flag:=false;
      end;
      if ingdia<1 then
        flag:= false
    Until flag=true;
    t.fechatoma.dia:= ingdia;
    Repeat
      WriteLn('Ingrese el valor de la toma');
      ReadLn(ingvalor);
    Until (ingvalor>-31) and (ingvalor<121);
    t.valortemp:= ingvalor;
    Write(temp, t);
    WriteLn(char(191),'Desea ingresar otro valor?');
    WriteLn('1= Si, 0= NO');
    ReadLn(decision)
  until (decision=0);
  Write(temp, t);
  close(temp)
end.
