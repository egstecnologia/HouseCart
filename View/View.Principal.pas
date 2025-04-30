unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.Buttons,
  View.Residencias, View.DadosPessoais, View.CadProduto,
  Model.Usuario, Model.Produtos;

type
  TfrmPrincipal = class(TForm)
    pnlContainer: TPanel;
    pnlGroupMenu: TPanel;
    pnlForm: TPanel;
    pnlBtnCasas: TPanel;
    shpBtnCasa: TShape;
    pnlInfoUser: TPanel;
    btnCasas: TSpeedButton;
    pnlBtnDadosPessoais: TPanel;
    shpBtnDadosPessoais: TShape;
    btnDadosPessoais: TSpeedButton;
    pnlBtnProdutos: TPanel;
    shpBtnProdutos: TShape;
    btnProdutos: TSpeedButton;
    procedure btnCasasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDadosPessoaisClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
  private
    FUsuario: TUsuario;
  public
    constructor Create(aUsuario: TUsuario); reintroduce;
    destructor Destroy; override;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCasasClick(Sender: TObject);
begin
    TfrmResidencias.Create(FUsuario, pnlForm);
end;

procedure TfrmPrincipal.btnDadosPessoaisClick(Sender: TObject);
begin
  TfrmAlterarDadosPessoais.Create(FUsuario, pnlForm);
end;

procedure TfrmPrincipal.btnProdutosClick(Sender: TObject);
begin
  TfrmCadastroProduto.Create(pnlForm, FUsuario);
end;

constructor TfrmPrincipal.Create(aUsuario: TUsuario);
begin
  inherited Create(nil);
  FUsuario := aUsuario;
  frmPrincipal := Self;
  frmPrincipal.ShowModal;
end;

destructor TfrmPrincipal.Destroy;
begin
  FUsuario.Free;
  inherited;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Action := caFree;
//  frmPrincipal := nil;
end;

end.
