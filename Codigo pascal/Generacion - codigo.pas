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
  cant: INTEGER;
  flag: BOOLEAN;
  i: INTEGER;
begin
  randomize;
  assign(temp, 'temperaturas.txt');
  rewrite(temp);
  WriteLn('Ingresar la cantidad de datos para generar de forma aleatoria');
  ReadLn(cant);
  for i:=0 to cant do
    BEGIN
      t.valortemp:= (random(151)) - 30;
      t.fechatoma.anio:= (random(23) + 2000);
      t.fechatoma.mes:= (random(12) + 1);
      Repeat
        flag:= FALSE;
        t.fechatoma.dia:= (random(31) + 1);
        case t.fechatoma.mes of
          2: if (t.fechatoma.dia>28) then
              flag:= TRUE;
          4, 6, 9, 11: if (t.fechatoma.dia>30) then
              flag:= TRUE;
        end;
      Until (flag=FALSE);
      Write(temp, t)
    END;
  WriteLn('Generaci',char(243),'n exitosa, presione una tecla para salir');
  Repeat
  Until keypressed();
  close(temp)
end.
