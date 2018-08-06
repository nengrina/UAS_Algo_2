program Transkrip_Nilai;
uses crt;
const
  jml_data = 10;
type
  tTN = record
           nm     : string;
           absensi : real;
           tugas : real;
		        UTS : real;
		        UAS : real;
           AB  : real;
           tg : real;
		        UTSp : real;
		        UASp : real;
           mk  : ShortString;
		        total : real;
           hf : char;
         end;
  tarr_TN = array [1..jml_data] of tTN;

  function menu:char;
  begin
    clrscr;
    writeln('****************************');
    writeln('* 1. Input Data Mahasiswa  *');
    writeln('* 2. Output Data Mahasiswa *');
    writeln('****************************');
    writeln('* 0. Keluar                *');
    writeln('****************************');
    write('Pilih menu : '); readln(menu);

  end;

  procedure input_data(idx:integer;var data:tarr_TN);
  begin
     WRITELN(' |-----------------------------------------------------|');
     WRITELN(' |     KODE MK     | |           MATA KULIAH           |');
     WRITELN(' |-----------------------------------------------------|');
     WRITELN(' |     FTI203      | |          JAVA LANJUTAN          |');
     WRITELN(' |     TIF302      | |    ALGORITMA & PEMOGRAMAN II    |');
     WRITELN(' |     FTI211      | |           KALKULUS II           |');
     WRITELN(' |     FTI205      | | Prak. ALGORITMA & PEMOGRAMAN II |');
     WRITELN(' |     UBB101      | |               AGAMA             |');
     WRITELN(' |     FTI209      | |        KONSEP TEKNOLOGI         |');
     WRITELN(' |-----------------------------------------------------|');
     writeln;
     writeln('Data Mahasiswa ke-',idx);
     write('Nama Mahasiswa   : ');readln(data[idx].nm);
     write('Kode Mata Kuliah : ');readln(data[idx].mk);
     write('Nilai Absensi    : ');readln(data[idx].absensi);
     write('Nilai Tugas      : ');readln(data[idx].tugas);
	    write('Nilai UTS        : ');readln(data[idx].uts);
	    write('Nilai UAS        : ');readln(data[idx].uas);





  end;

  procedure proses_data(var data:tTN);
  begin
	   if (data.mk = 'FTI203' )then
      data.mk:= 'Java Lanjutan'
      else
       if (data.mk = 'TIF302' )then
       data.mk:= 'Algoritma dan Pemograman II'
       else
       if (data.mk = 'FTI211' )then
       data.mk:= 'Kalkulus II'
       else
       if data.mk ='FTI205' then
        data.mk:= 'Praktikum Algoritma dan Pemograman'
        else
         if data.mk ='UBB101' then
        data.mk:= 'Agama'
        else
         if data.mk ='FTI209' then
        data.mk:= 'Konsep Teknologi';

           if (data.mk ='Java Lanjutan') or (data.mk ='Agama') or (data.mk ='Konsep Teknologi') then
                begin
                data.ab:=data.absensi * 0.10;
                data.tg:=data.tugas * 0.20;
                data.utsp:=data.uts * 0.30;
                data.uasp:=data.uas * 0.40;
                end
                else
            if (data.mk ='Algoritma dan Pemograman II') then
                begin
                data.ab:=data.absensi * 0.10;
                data.tg:=data.tugas * 0.15;
                data.utsp:=data.uts * 0.35;
                data.uasp:=data.uas * 0.40;
                end
                else
                if (data.mk ='Kalkulus II') then
                begin
                data.ab:=data.absensi * 0.10;
                data.tg:=data.tugas * 0.20;
                data.utsp:=data.uts * 0.35;
                data.uasp:=data.uas * 0.35;
                end
                else
            if (data.mk ='Praktikum Algoritma dan Pemograman') then
                begin
                data.ab:=data.absensi * 0.10;
                data.tg:=data.tugas * 0.30;
                data.utsp:=data.uts * 0.30;
                data.uasp:=data.uas * 0.30;
                end ;
	data.total:= (data.ab)+(data.tg)+(data.utsp)+(data.uasp);
	if (data.total >= 90) then
	   data.hf := 'A'
	else
	if (data.total >= 70) then
	   data.hf := 'B'
	else
	if (data.total >= 50) then
	   data.hf := 'C'
	else
	if (data.total >= 30) then
	   data.hf := 'D'
	else
	data.hf := 'E';

  end;


  procedure output_data(jml:integer;data:tarr_TN);
  var
    i:integer;
  begin
    if jml=0 then
    begin
       writeln('Tidak Ada Data !');
       readkey;
    end
    else
         for i:=1 to jml do
         begin
           writeln('Data Mahasiswa ke-',i);
           writeln;
           writeln('Nama Mahasiswa    : ',data[i].nm);
           writeln('Mata Kuliah       : ',data[i].mk);
           writeln('Nilai Absensi     : ',data[i].ab:3:1);
           writeln('Nilai Tugas       : ',data[i].tg:3:1);
           writeln('Nilai UTS         : ',data[i].utsp:3:1);
           writeln('Nilai UAS         : ',data[i].uasp:3:1);
           writeln('Total Nilai       : ',data[i].total:3:1);
		   writeln('Huruf Mutu        : ',data[i].hf);
           writeln;
         end;

  end;

var
  no_menu,terus:char;
  jml_MHS:integer;
  data_MHS : tarr_TN;
begin
  jml_MHS:=0;
  repeat
    no_menu:=menu;
    case no_menu of
     '1' : begin
            clrscr;
            repeat
              input_data(jml_MHS+1,data_MHS);
              proses_data(data_MHS[jml_MHS+1]);
              jml_MHS:=jml_MHS+1;
              writeln;
              write('Input Data Lagi (y/n) : ');readln(terus);
              writeln;
              writeln;
            until(terus='n');
           end;

     '2' :  begin
              clrscr;
              output_data(jml_MHS,data_MHS);
              readln;
            end;

    end;
  until(no_menu='0');
end.

// ****TRANSKIP NILAI*****//
//       Neng Rina        //
//    Taufan Wisnu Mukti  //
//************************//


