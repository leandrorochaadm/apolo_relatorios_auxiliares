unit uFrmUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ShellAPI;

type
  TForm2 = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    mmo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure compactar;
    function ObterDiretorioDoExecutavel: string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.compactar;
var
  sNomeArquivoCompactado, sDiretorioCompactar: string;
begin
  // deleta o backup anterior, ou melhor, da versão anterior,
  // evitando erro de arquivo já existente
  // if FileExists(ObterDiretorioDoExecutavel + 'Auxiliar_bkp.exe') then
  // DeleteFile(ObterDiretorioDoExecutavel + 'Auxiliar_bkp.exe');

  // Renomeia o executável atual (desatualizado) para "Sistema_Backup.exe"
  // RenameFile(ObterDiretorioDoExecutavel + 'Auxiliar.exe',
  // ObterDiretorioDoExecutavel + 'Auxiliar_bkp.exe');

  // armazena o nome do arquivo de atualização em uma variável
  sNomeArquivoCompactado := ObterDiretorioDoExecutavel + 'setup/lib.7z';
  sDiretorioCompactar := ObterDiretorioDoExecutavel + 'bin';

  mmo1.Lines.Add(TimeToStr(Now) +
      ' - Inicio da compactação do arquivo de atualização');
  // executa a linha de comando do 7-Zip para compactar o diretorio pro update

   mmo1.Lines.Add(TimeToStr(Now)+' - diretorio '+sDiretorioCompactar);

  try
    ShellExecute(0, nil, '7z.exe',
      PWideChar(' a -r ' + sNomeArquivoCompactado + ' ' + sDiretorioCompactar),' ', SW_SHOW);
//      pause
  finally
    mmo1.Lines.Add(TimeToStr(Now) +
        ' - Fim da compactação do arquivo de atualização');

     mmo1.Lines.Add(TimeToStr(Now)+' - arquivo:' + sNomeArquivoCompactado);
  end;

end;

procedure TForm2.FormShow(Sender: TObject);
begin
  mmo1.Lines.Add(TimeToStr(Now) + ' - Olá!');
  mmo1.Lines.Add('');
  mmo1.Lines.Add('');

  compactar;
end;

function TForm2.ObterDiretorioDoExecutavel: string;
begin
  Result := ExtractFilePath(Application.ExeName);
end;

end.
