{*******************************************************}
{                                                       }
{       FMX UI ��׼���ButtonView��TextView����չ       }
{                                                       }
{         ��Ȩ���� (C) 2023 dqi1999                     }
{                                                       }
{*******************************************************}

unit UI.ButtonViewstyle;

interface

uses
  FMX.Graphics, System.Math, System.Classes, System.SysUtils, System.UIConsts,
  System.UITypes, System.JSON, UI.Base, UI.Standard, UI.Json;

const
  BOOTSTRAP_FAMILY = 'Bootstrap';
  BOOTSTRAP_NORMAL = 'Normal';
  BOOTSTRAP_OUTLINE = 'Outline';
  BOOTSTRAP_BORDER_WIDTH = 2;
  btn_primary = 'Primary';
  btn_secondary = 'Secondary';
  btn_success = 'Success';
  btn_danger = 'Danger';
  btn_warning = 'Warning';
  btn_info = 'Info';
  btn_light = 'Light';
  btn_dark = 'Dark';

  // Button Family as Angular Themes
  ANGULAR_STROKED_WIDTH = 2;
  ANGULAR_RAISED_WIDTH = 3;
  ANGULAR_LIGHT_FAMILY = 'Angular-Light';
  ANGULAR_DARK_FAMILY = 'Angular-Dark';

  // Button Class as Angular Styling
  btn_Basic = 'Basic';
  btn_Warn = 'Warn';
  btn_Link = 'Link';

  // DeepPurple & Amber Light Theme
  btn_PrimaryDeepPurple = 'DeepPurple';
  btn_AccentAmber = 'Amber';
  // Indigo & Pink Light Theme
  btn_PrimaryIndigo = 'Indigo';
  btn_AccentPink = 'Pink';

  // Pink & BlueGray Dark Theme
  btn_PrimaryPink = 'Pink';
  btn_AccentBlueGray = 'Blue-gray';
  // Purple & Green Dark Theme
  btn_PrimaryPurple = 'Purple';
  btn_AccentGreen = 'Green';

  // Button Appearance as Angular Attributes
  FlatAttr = 'Flat';
  RaisedAttr = 'Raised';
  BasicAttr = 'Basic';
  StrokedAttr = 'Stroked';


type
  // TSTYLEFAMILY=('Bootstrap','Angular-Light','Angular-Dark');

  TTextviewstyle = record
    const
      BootstrapbtnKinds: array[0..7] of string = ('Primary', 'Secondary', 'Success', 'Danger', 'Warning', 'Info', 'Light', 'Dark');
      AngularbtnKinds: array[0..6] of string = ('Basic', 'DeepPurple', 'Amber', 'Indigo', 'Pink', 'Warn', 'Link');
      AngularDarkbtnKinds: array[0..6] of string = ('Basic', 'Pink', 'Blue-gray', 'Purple', 'Green', 'Warn', 'Link');
    class function GetFAMILYAllClass(AFamily: string): Tarray<string>; static;
    class function GetFAMILYAAppearance(AFamily: string): Tarray<string>; static;
    class function GetAAppearance(AFamily: string; idx: Integer): string; static;
    class function GetAllClassFromFAMILYidx(AFamilyidx: Integer): Tarray<string>; static;
    class function GetClass(AFamily: string; idx: Integer): string; static;
    class function GetFAMILYClassCount(AFamily: string): Integer; static;
    class function GetFAMILYs: Tarray<string>; static;
    class function GetFAMILYI(idx: Integer): string; static;
    class function GetFAMILYCount: Integer; static;
    class procedure BootstrapClassToColors(const AClass: string; const AAppearance: string; var AFontColor, AButtonColor: TAlphaColor; out AOutLine: Boolean); static;
    class procedure AngularClassToLightColors(const AClass: string; const AAppearance: string; var AFontColor, AButtonColor: TAlphaColor); static;
    class procedure AngularClassToDarkColors(const AClass: string; const AAppearance: string; var AFontColor, AButtonColor: TAlphaColor); static;
    class procedure setBootstrap(button: TTextView; AClass, AAppearance: string); static;
    class procedure setAngularlight(button: TTextView; AClass, AAppearance: string); static;
    class procedure setAngularDark(button: TTextView; AClass, AAppearance: string); static;
    class procedure SetBtnKindColor(button: TTextView; ViewState: TViewState; btncolor: TAlphaColor; FontColor: TAlphaColor; BorderColor: TAlphaColor = TAlphaColorRec.Null); static;
    class procedure SetButtonStyle(button: TTextView; const AFamily: string; const AClass: string; const AAppearance: string); overload; static;
    class procedure SetButtonStyle(button: TTextView; const AFamily: Integer; const AClass: Integer; const AAppearance: Integer); overload; static;
    class procedure SetTextViewStyle(TextView: TTextView; const AFamily: string; const AClass: string); overload; static;

  private

  end;

  TTextViewHelper = class helper for TTextView
  public
    /// AFamily,buttonview ������ "Bootstrap"....
    /// AClass����ť��ɫ����
    /// AAppearance����ť��ۣ�"Normal"Ĭ��Ϊ������ͣ�"Outline"Ϊ������
    procedure SetButtonStyle(const AFamily: string; const AClass: string; const AAppearance: string);
    procedure SetTextViewStyle(const AFamily: string; const AClass: string);
  end;

const
  CNColorJsonTxt = '[{"name":"ε��","bkcolor":"#70f3ff","fcolor":"#000000"},{"name":"��","bkcolor":"#44cef6","fcolor":"#' + '000000"},{"name":"����","bkcolor":"#3eede7","fcolor":"#000000"},{"name":"ʯ��","bkcolor":"#1685a9","' + 'fcolor":"#ffffff"},{"name":"����","bkcolor":"#177cb0","fcolor":"#ffffff"},{"name":"����","bkcolor":"#' + '065279","fcolor":"#ffffff"},{"name":"����","bkcolor":"#003472","fcolor":"#ffffff"},{"name":"����","' +
    'bkcolor":"#4b5cc4","fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#a1afc9","fcolor":"#ffffff"},{"' + 'name":"����","bkcolor":"#2e4e7e","fcolor":"#ffffff"},{"name":"����","bkcolor":"#3b2e7e","fcolor":"#' + 'ffffff"},{"name":"��","bkcolor":"#4a4266","fcolor":"#ffffff"},{"name":"����","bkcolor":"#426666","' + 'fcolor":"#ffffff"},{"name":"����","bkcolor":"#425066","fcolor":"#ffffff"},{"name":"����","bkcolor":"#' + '574266","fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#8d4bbb","fcolor":"#ffffff"},{"name":"�Ͻ�","' +
    'bkcolor":"#815463","fcolor":"#ffffff"},{"name":"����","bkcolor":"#815476","fcolor":"#ffffff"},{"name":' + '"��̴","bkcolor":"#4c221b","fcolor":"#ffffff"},{"name":"���","bkcolor":"#003371","fcolor":"#ffffff"},{"' + 'name":"����","bkcolor":"#56004f","fcolor":"#ffffff"},{"name":"����","bkcolor":"#801dae","fcolor":"#' + 'ffffff"},{"name":"Ⱥ��","bkcolor":"#4c8dae","fcolor":"#ffffff"},{"name":"ѩ��","bkcolor":"#b0a4e3","' +
    'fcolor":"#000000"},{"name":"����ɫ","bkcolor":"#cca4e3","fcolor":"#000000"},{"name":"źɫ","bkcolor":"#' + 'edd1d8","fcolor":"#000000"},{"name":"ź��ɫ","bkcolor":"#e4c6d0","fcolor":"#000000"},{"name":"��ɰ","' + 'bkcolor":"#ff461f","fcolor":"#ffffff"},{"name":"���","bkcolor":"#ff2d51","fcolor":"#ffffff"},{"name":' + '"���","bkcolor":"#f36838","fcolor":"#ffffff"},{"name":"���","bkcolor":"#ff4777","fcolor":"#ffffff"},{"' +
    'name":"Ʒ��","bkcolor":"#f00056","fcolor":"#ffffff"},{"name":"�ۺ�","bkcolor":"#ffb3a7","fcolor":"#' + 'ffffff"},{"name":"�Һ�","bkcolor":"#f47983","fcolor":"#ffffff"},{"name":"���ĺ�","bkcolor":"#db5a6b","' + 'fcolor":"#ffffff"},{"name":"ӣ��ɫ","bkcolor":"#c93756","fcolor":"#ffffff"},{"name":"����","bkcolor":"#' + 'f9906f","fcolor":"#ffffff"},{"name":"����","bkcolor":"#f05654","fcolor":"#ffffff"},{"name":"���","' + 'bkcolor":"#ff2121","fcolor":"#ffffff"},{"name":"ʯ���","bkcolor":"#f20c00","fcolor":"#ffffff"},{"' +
    'name":"���","bkcolor":"#8c4356","fcolor":"#ffffff"},{"name":"糺�","bkcolor":"#c83c23","fcolor":"#' + 'ffffff"},{"name":"��֬","bkcolor":"#9d2933","fcolor":"#ffffff"},{"name":"���","bkcolor":"#ff4c00","' + 'fcolor":"#ffffff"},{"name":"��","bkcolor":"#ff4e20","fcolor":"#ffffff"},{"name":"ͮ","bkcolor":"#' + 'f35336","fcolor":"#ffffff"},{"name":"����","bkcolor":"#dc3023","fcolor":"#ffffff"},{"name":"��","' + 'bkcolor":"#ff3300","fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#cb3a56","fcolor":"#ffffff"},{"name":' +
    '"�","bkcolor":"#a98175","fcolor":"#ffffff"},{"name":"̴","bkcolor":"#b36d61","fcolor":"#ffffff"},{"' + 'name":"�̺�","bkcolor":"#ef7a82","fcolor":"#ffffff"},{"name":"���","bkcolor":"#ff0097","fcolor":"#' + 'ffffff"},{"name":"���","bkcolor":"#c32136","fcolor":"#ffffff"},{"name":"���","bkcolor":"#be002f","' + 'fcolor":"#ffffff"},{"name":"�ճ�","bkcolor":"#c91f37","fcolor":"#ffffff"},{"name":"����","bkcolor":"#' + 'bf242a","fcolor":"#ffffff"},{"name":"��","bkcolor":"#c3272b","fcolor":"#ffffff"},{"name":"��֬","' +
    'bkcolor":"#9d2933","fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#60281e","fcolor":"#ffffff"},{"name":' + '"��ɫ","bkcolor":"#622a1d","fcolor":"#ffffff"},{"name":"�ɻ�ɫ","bkcolor":"#bce672","fcolor":"#000000"},{' + '"name":"����","bkcolor":"#c9dd22","fcolor":"#000000"},{"name":"����","bkcolor":"#bddd22","fcolor":"#' + '000000"},{"name":"����","bkcolor":"#afdd22","fcolor":"#000000"},{"name":"�л�","bkcolor":"#a3d900","' +
    'fcolor":"#000000"},{"name":"����","bkcolor":"#9ed900","fcolor":"#000000"},{"name":"����","bkcolor":"#' + '9ed048","fcolor":"#000000"},{"name":"����","bkcolor":"#96ce54","fcolor":"#000000"},{"name":"����","' + 'bkcolor":"#00bc12","fcolor":"#000000"},{"name":"��ٻ","bkcolor":"#0eb83a","fcolor":"#000000"},{"name":' + '"����","bkcolor":"#0eb83a","fcolor":"#000000"},{"name":"���","bkcolor":"#0aa344","fcolor":"#000000"},{"' +
    'name":"ʯ��","bkcolor":"#16a951","fcolor":"#ffffff"},{"name":"�ɰ���","bkcolor":"#21a675","fcolor":"#' + 'ffffff"},{"name":"�ɻ���","bkcolor":"#057748","fcolor":"#ffffff"},{"name":"����","bkcolor":"#0c8918","' + 'fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#00e500","fcolor":"#000000"},{"name":"����","bkcolor":"#' + '40de5a","fcolor":"#000000"},{"name":"���","bkcolor":"#00e079","fcolor":"#000000"},{"name":"��ɫ","' + 'bkcolor":"#00e09e","fcolor":"#000000"},{"name":"���ɫ","bkcolor":"#3de1ad","fcolor":"#000000"},{"' +
    'name":"����","bkcolor":"#2add9c","fcolor":"#000000"},{"name":"��ɫ","bkcolor":"#2edfa3","fcolor":"#' + '000000"},{"name":"��","bkcolor":"#7fecad","fcolor":"#000000"},{"name":"����","bkcolor":"#a4e2c6","' + 'fcolor":"#000000"},{"name":"ʯ��","bkcolor":"#7bcfa6","fcolor":"#000000"},{"name":"��ɫ","bkcolor":"#' + '1bd1a5","fcolor":"#000000"},{"name":"���","bkcolor":"#48c0a3","fcolor":"#000000"},{"name":"ͭ��","' + 'bkcolor":"#549688","fcolor":"#000000"},{"name":"����","bkcolor":"#789262","fcolor":"#000000"},{"name":' +
    '"ī��","bkcolor":"#758a99","fcolor":"#ffffff"},{"name":"īɫ","bkcolor":"#50616d","fcolor":"#ffffff"},{"' + 'name":"ѻ��","bkcolor":"#424c50","fcolor":"#ffffff"},{"name":"��","bkcolor":"#41555d","fcolor":"#' + 'ffffff"},{"name":"ӣ��ɫ","bkcolor":"#eaff56","fcolor":"#000000"},{"name":"���","bkcolor":"#fff143","' + 'fcolor":"#000000"},{"name":"Ѽ��","bkcolor":"#faff72","fcolor":"#000000"},{"name":"�ӻ�","bkcolor":"#' +
    'ffa631","fcolor":"#000000"},{"name":"�Ȼ�","bkcolor":"#ffa400","fcolor":"#ffffff"},{"name":"��ɫ","' + 'bkcolor":"#fa8c35","fcolor":"#ffffff"},{"name":"�Ӻ�","bkcolor":"#ff8c31","fcolor":"#000000"},{"name":' + '"�ٻ�","bkcolor":"#ff8936","fcolor":"#000000"},{"name":"�ٺ�","bkcolor":"#ff7500","fcolor":"#000000"},{"' + 'name":"�ٻ�","bkcolor":"#ffb61e","fcolor":"#000000"},{"name":"����","bkcolor":"#ffc773","fcolor":"#' +
    '000000"},{"name":"�ƻ�","bkcolor":"#ffc64b","fcolor":"#000000"},{"name":"���","bkcolor":"#f2be45","' + 'fcolor":"#000000"},{"name":"�ɫ","bkcolor":"#f0c239","fcolor":"#000000"},{"name":"�ۻ�","bkcolor":"#' + 'e9bb1d","fcolor":"#000000"},{"name":"����ɫ","bkcolor":"#d9b611","fcolor":"#000000"},{"name":"��ɫ","' + 'bkcolor":"#eacd76","fcolor":"#000000"},{"name":"��ɫ","bkcolor":"#eedeb0","fcolor":"#000000"},{"name":' +
    '"�ݻ�","bkcolor":"#d3b17d","fcolor":"#000000"},{"name":"����","bkcolor":"#e29c45","fcolor":"#ffffff"},{"' + 'name":"�ڽ�","bkcolor":"#a78e44","fcolor":"#000000"},{"name":"���","bkcolor":"#c89b40","fcolor":"#' + 'ffffff"},{"name":"�ػ�","bkcolor":"#ae7000","fcolor":"#ffffff"},{"name":"����","bkcolor":"#ca6924","' + 'fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#b25d25","fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#' + 'b35c44","fcolor":"#ffffff"},{"name":"�غ�","bkcolor":"#9b4400","fcolor":"#ffffff"},{"name":"��","' +
    'bkcolor":"#9c5333","fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#a88462","fcolor":"#ffffff"},{"name":' + '"��ɫ","bkcolor":"#896c39","fcolor":"#ffffff"},{"name":"����","bkcolor":"#827100","fcolor":"#ffffff"},{"' + 'name":"��ɫ","bkcolor":"#6e511e","fcolor":"#ffffff"},{"name":"�غ�","bkcolor":"#7c4b00","fcolor":"#' + 'ffffff"},{"name":"��ɫ","bkcolor":"#955539","fcolor":"#ffffff"},{"name":"��ʯ","bkcolor":"#845a33","' +
    'fcolor":"#ffffff"},{"name":"����","bkcolor":"#ffffff","fcolor":"#000000"},{"name":"Ǧ��","bkcolor":"#' + 'f0f0f4","fcolor":"#000000"},{"name":"˪ɫ","bkcolor":"#e9f1f6","fcolor":"#000000"},{"name":"ѩ��","' + 'bkcolor":"#f0fcff","fcolor":"#000000"},{"name":"Ө��","bkcolor":"#e3f9fd","fcolor":"#000000"},{"name":' + '"�°�","bkcolor":"#d6ecf0","fcolor":"#000000"},{"name":"������","bkcolor":"#fffbf0","fcolor":"#000000"},{' +
    '"name":"��","bkcolor":"#f2ecde","fcolor":"#000000"},{"name":"��ǰ�","bkcolor":"#fcefe8","fcolor":"#' + '000000"},{"name":"�׷�","bkcolor":"#fff2df","fcolor":"#000000"},{"name":"ݱ��","bkcolor":"#f3f9f1","' + 'fcolor":"#000000"},{"name":"Ѽ����","bkcolor":"#e0eee8","fcolor":"#000000"},{"name":"��","bkcolor":"#' + 'e0f0e9","fcolor":"#000000"},{"name":"���","bkcolor":"#c0ebd7","fcolor":"#000000"},{"name":"з����","' +
    'bkcolor":"#bbcdc5","fcolor":"#000000"},{"name":"����","bkcolor":"#c2ccd0","fcolor":"#000000"},{"name":' + '"����","bkcolor":"#bacac6","fcolor":"#000000"},{"name":"��ɫ","bkcolor":"#808080","fcolor":"#ffffff"},{"' + 'name":"��ɫ","bkcolor":"#75878a","fcolor":"#ffffff"},{"name":"ˮɫ","bkcolor":"#88ada6","fcolor":"#' + 'ffffff"},{"name":"��","bkcolor":"#6b6882","fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#725e82","' +
    'fcolor":"#ffffff"},{"name":"����","bkcolor":"#3d3b4f","fcolor":"#ffffff"},{"name":"�ں�","bkcolor":"#' + '392f41","fcolor":"#ffffff"},{"name":"��","bkcolor":"#75664d","fcolor":"#ffffff"},{"name":"��","' + 'bkcolor":"#5d513c","fcolor":"#ffffff"},{"name":"���","bkcolor":"#665757","fcolor":"#ffffff"},{"name":' + '"�ɫ","bkcolor":"#493131","fcolor":"#ffffff"},{"name":"ú��","bkcolor":"#312520","fcolor":"#ffffff"},{"' + 'name":"���","bkcolor":"#161823","fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#000000","fcolor":"#' + 'ffffff"}]';

  JPColorjsonTxt = '[{"name":"�Ŵ���","bkcolor":"#895b8a ","fcolor":"#ffffff"},{"name":"���ӽC","bkcolor":"#824880 ","fcolor":' + '"#ffffff"},{"name":"���{","bkcolor":"#915c8b ","fcolor":"#ffffff"},{"name":"����","bkcolor":"#9d5b8b ","' + 'fcolor":"#ffffff"},{"name":"����","bkcolor":"#7a4171 ","fcolor":"#ffffff"},{"name":"����","bkcolor":"#' + 'bc64a4 ","fcolor":"#ffffff"},{"name":"�t��","bkcolor":"#b44c97 ","fcolor":"#ffffff"},{"name":"÷��","' +
    'bkcolor":"#aa4c8f ","fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#cc7eb1 ","fcolor":"#ffffff"},{"' + 'name":"�t��ɫ","bkcolor":"#cca6bf ","fcolor":"#ffffff"},{"name":"ǳ��","bkcolor":"#c4a3bf ","fcolor":"#' + 'ffffff"},{"name":"��ˮ��","bkcolor":"#e7e7eb ","fcolor":"#000000"},{"name":"��÷��","bkcolor":"#dcd6d9","' + 'fcolor":"#000000"},{"name":"����","bkcolor":"#d3cfd9","fcolor":"#000000"},{"name":"ĵ����","bkcolor":"#' +
    'd3ccd6","fcolor":"#000000"},{"name":"ϼɫ","bkcolor":"#c8c2c6","fcolor":"#ffffff"},{"name":"����","' + 'bkcolor":"#a6a5c4 ","fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#a69abd ","fcolor":"#ffffff"},{"' + 'name":"��ɫ","bkcolor":"#a89dac ","fcolor":"#ffffff"},{"name":"����","bkcolor":"#9790a4 ","fcolor":"#' + 'ffffff"},{"name":"�F����","bkcolor":"#9e8b8e","fcolor":"#ffffff"},{"name":"�F��ɫ","bkcolor":"#95859c ","' +
    'fcolor":"#ffffff"},{"name":"�۹���","bkcolor":"#95949a ","fcolor":"#ffffff"},{"name":"����","bkcolor":"#' + '71686c ","fcolor":"#ffffff"},{"name":"������","bkcolor":"#705b67 ","fcolor":"#ffffff"},{"name":"��ɫ","' + 'bkcolor":"#634950 ","fcolor":"#ffffff"},{"name":"���S","bkcolor":"#5f414b ","fcolor":"#ffffff"},{"' + 'name":"����","bkcolor":"#4f455c ","fcolor":"#ffffff"},{"name":"��ú��","bkcolor":"#5a5359 ","fcolor":"#' +
    'ffffff"},{"name":"����","bkcolor":"#594255 ","fcolor":"#ffffff"},{"name":"�t����","bkcolor":"#524748 ","' + 'fcolor":"#ffffff"},{"name":"�Ƥ���","bkcolor":"#513743 ","fcolor":"#ffffff"},{"name":"�һƾv","bkcolor":"#' + 'e6eae3","fcolor":"#000000"},{"name":"�w����ɫ","bkcolor":"#d4dcd6","fcolor":"#000000"},{"name":"�����","' + 'bkcolor":"#d4dcda","fcolor":"#000000"},{"name":"��Ұɫ","bkcolor":"#d3cbc6","fcolor":"#000000"},{"' +
    'name":"��ɫ","bkcolor":"#c8c2be ","fcolor":"#ffffff"},{"name":"���ݰײ�","bkcolor":"#b3ada0 ","fcolor":"#' + 'ffffff"},{"name":"����","bkcolor":"#a99e93 ","fcolor":"#ffffff"},{"name":"����Ⱦ","bkcolor":"#a58f86 ","' + 'fcolor":"#ffffff"},{"name":"������","bkcolor":"#928178 ","fcolor":"#ffffff"},{"name":"úɫ","bkcolor":"#' + '887f7a ","fcolor":"#ffffff"},{"name":"���Ӳ�","bkcolor":"#b4866b ","fcolor":"#ffffff"},{"name":"��Ⱦ","' +
    'bkcolor":"#b28c6e ","fcolor":"#ffffff"},{"name":"�ځ��Ʋ�","bkcolor":"#a16d5d ","fcolor":"#ffffff"},{"' + 'name":"�²�","bkcolor":"#9f6f55 ","fcolor":"#ffffff"},{"name":"���ɫ","bkcolor":"#8c6450 ","fcolor":"#' + 'ffffff"},{"name":"�yú��","bkcolor":"#856859 ","fcolor":"#ffffff"},{"name":"�ƿݲ�","bkcolor":"#765c47 ","' + 'fcolor":"#ffffff"},{"name":"ú��ɫ","bkcolor":"#6f514c ","fcolor":"#ffffff"},{"name":"����","bkcolor":"#' +
    '6f4b3e ","fcolor":"#ffffff"},{"name":"�\��","bkcolor":"#544a47 ","fcolor":"#ffffff"},{"name":"����ɫ","' + 'bkcolor":"#543f32 ","fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#554738 ","fcolor":"#ffffff"},{"' + 'name":"������Ⱦ","bkcolor":"#433d3c ","fcolor":"#ffffff"},{"name":"�\�S","bkcolor":"#432f2f ","fcolor":"#' + 'ffffff"},{"name":"��ī","bkcolor":"#3f312b ","fcolor":"#ffffff"},{"name":"�\�t","bkcolor":"#302833 ","' +
    'fcolor":"#ffffff"},{"name":"��","bkcolor":"#ffffff ","fcolor":"#000000"},{"name":"����ɫ","bkcolor":"#' + 'fffffc ","fcolor":"#000000"},{"name":"î�λ�ɫ","bkcolor":"#f7fcfe ","fcolor":"#000000"},{"name":"�״�","' + 'bkcolor":"#f8fbf8 ","fcolor":"#000000"},{"name":"���ɤ�ɫ","bkcolor":"#fbfaf5 ","fcolor":"#000000"},{"' + 'name":"���ɫ","bkcolor":"#f3f3f3 ","fcolor":"#000000"},{"name":"�׾�","bkcolor":"#f3f3f2 ","fcolor":"#' +
    '000000"},{"name":"��ɫ","bkcolor":"#eae5e3 ","fcolor":"#000000"},{"name":"��÷��","bkcolor":"#e5e4e6 ","' + 'fcolor":"#000000"},{"name":"����","bkcolor":"#dcdddd ","fcolor":"#000000"},{"name":"����","bkcolor":"#' + 'dddcd6 ","fcolor":"#000000"},{"name":"����","bkcolor":"#c0c6c9 ","fcolor":"#ffffff"},{"name":"�y��","' + 'bkcolor":"#afafb0 ","fcolor":"#ffffff"},{"name":"���g","bkcolor":"#adadad ","fcolor":"#ffffff"},{"' +
    'name":"��īɫ","bkcolor":"#a3a3a2 ","fcolor":"#ffffff"},{"name":"�aɫ","bkcolor":"#9ea1a3 ","fcolor":"#' + 'ffffff"},{"name":"����","bkcolor":"#9fa0a0 ","fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#949495 ","' + 'fcolor":"#ffffff"},{"name":"Դ����","bkcolor":"#888084 ","fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#' + '7d7d7d ","fcolor":"#ffffff"},{"name":"�Uɫ","bkcolor":"#7b7c7d ","fcolor":"#ffffff"},{"name":"�gɫ","' +
    'bkcolor":"#727171 ","fcolor":"#ffffff"},{"name":"ī","bkcolor":"#595857 ","fcolor":"#ffffff"},{"' + 'name":"�S��","bkcolor":"#595455 ","fcolor":"#ffffff"},{"name":"��̿ɫ","bkcolor":"#524e4d ","fcolor":"#' + 'ffffff"},{"name":"�{ī��","bkcolor":"#474a4d ","fcolor":"#ffffff"},{"name":"���ɫ","bkcolor":"#383c3c ","' + 'fcolor":"#ffffff"},{"name":"�`ɫ","bkcolor":"#2b2b2b ","fcolor":"#ffffff"},{"name":"�\","bkcolor":"#' +
    '2b2b2b ","fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#180614 ","fcolor":"#ffffff"},{"name":"��\","' + 'bkcolor":"#281a14 ","fcolor":"#ffffff"},{"name":"���ɫ","bkcolor":"#000b00 ","fcolor":"#ffffff"},{"' + 'name":"�\��","bkcolor":"#250d00 ","fcolor":"#ffffff"},{"name":"�����\��","bkcolor":"#241a08 ","fcolor":"#' + 'ffffff"},{"name":"���\ɫ","bkcolor":"#16160e ","fcolor":"#ffffff"},{"name":"�ȴ�ɫ","bkcolor":"#006e54 ","' +
    'fcolor":"#ffffff"},{"name":"���v��","bkcolor":"#00a381 ","fcolor":"#ffffff"},{"name":"���ɫ","bkcolor":"#' + '38b48b ","fcolor":"#ffffff"},{"name":"��v","bkcolor":"#00a497 ","fcolor":"#ffffff"},{"name":"ˮǳ��","' + 'bkcolor":"#80aba9 ","fcolor":"#ffffff"},{"name":"�ǳ��","bkcolor":"#5c9291 ","fcolor":"#ffffff"},{"' + 'name":"���","bkcolor":"#478384 ","fcolor":"#ffffff"},{"name":"���ٲ�","bkcolor":"#43676b ","fcolor":"#' +
    'ffffff"},{"name":"����","bkcolor":"#80989b ","fcolor":"#ffffff"},{"name":"�����{��","bkcolor":"#2c4f54 ","' + 'fcolor":"#ffffff"},{"name":"�����","bkcolor":"#1f3134 ","fcolor":"#ffffff"},{"name":"���","bkcolor":"#' + '47585c ","fcolor":"#ffffff"},{"name":"�����{��","bkcolor":"#485859","fcolor":"#ffffff"},{"name":"�{��","' + 'bkcolor":"#6c848d","fcolor":"#ffffff"},{"name":"����{��","bkcolor":"#53727d ","fcolor":"#ffffff"},{"' +
    'name":"ⶻ�ɫ","bkcolor":"#5b7e91 ","fcolor":"#ffffff"},{"name":"�ٶ�Ŀ��ɫ","bkcolor":"#426579 ","fcolor":"' + '#ffffff"},{"name":"�������{��","bkcolor":"#4c6473 ","fcolor":"#ffffff"},{"name":"����{��","bkcolor":"#' + '455765 ","fcolor":"#ffffff"},{"name":"�C��","bkcolor":"#44617b","fcolor":"#ffffff"},{"name":"�{�","' + 'bkcolor":"#393f4c ","fcolor":"#ffffff"},{"name":"���","bkcolor":"#393e4f ","fcolor":"#ffffff"},{"' +
    'name":"�ַ�","bkcolor":"#203744 ","fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#4d4c61 ","fcolor":"#' + 'ffffff"},{"name":"�°�","bkcolor":"#eaf4fc ","fcolor":"#000000"},{"name":"��Ǟɫ","bkcolor":"#eaedf7 ","' + 'fcolor":"#000000"},{"name":"�׻�ɫ","bkcolor":"#e8ecef ","fcolor":"#000000"},{"name":"�{��","bkcolor":"#' + 'ebf6f7 ","fcolor":"#000000"},{"name":"���{","bkcolor":"#c1e4e9 ","fcolor":"#000000"},{"name":"ˮɫ","' +
    'bkcolor":"#bce2e8 ","fcolor":"#000000"},{"name":"ƿҖ","bkcolor":"#a2d7dd ","fcolor":"#000000"},{"' + 'name":"��ɫɫ","bkcolor":"#abced8 ","fcolor":"#000000"},{"name":"��ɫ","bkcolor":"#a0d8ef ","fcolor":"#' + '000000"},{"name":"������ɫ","bkcolor":"#89c3eb ","fcolor":"#000000"},{"name":"����ɫ","bkcolor":"#84a2d4 ",' + '"fcolor":"#000000"},{"name":"��Ⱥ","bkcolor":"#83ccd2 ","fcolor":"#000000"},{"name":"ǳ�~","bkcolor":"#' +
    '84b9cb ","fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#698aab ","fcolor":"#ffffff"},{"name":"�{��ɫ","' + 'bkcolor":"#008899 ","fcolor":"#ffffff"},{"name":"ǳ��ɫ","bkcolor":"#00a3af ","fcolor":"#ffffff"},{"' + 'name":"��ǳ��","bkcolor":"#2a83a2 ","fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#59b9c6 ","fcolor":"#' + 'ffffff"},{"name":"��ɫ","bkcolor":"#2ca9e1 ","fcolor":"#000000"},{"name":"¶��ɫ","bkcolor":"#38a1db ","' +
    'fcolor":"#000000"},{"name":"��","bkcolor":"#0095d9 ","fcolor":"#000000"},{"name":"���{","bkcolor":"#' + '0094c8 ","fcolor":"#ffffff"},{"name":"�~ɫ","bkcolor":"#2792c3 ","fcolor":"#ffffff"},{"name":"�C��","' + 'bkcolor":"#007bbb ","fcolor":"#ffffff"},{"name":"��Ⱥ��","bkcolor":"#5383c3 ","fcolor":"#ffffff"},{"' + 'name":"�����@","bkcolor":"#5a79ba ","fcolor":"#ffffff"},{"name":"Ⱥ��ɫ","bkcolor":"#4c6cb3 ","fcolor":"#' +
    'ffffff"},{"name":"����ɫ","bkcolor":"#3e62ad ","fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#1e50a2 ","' + 'fcolor":"#ffffff"},{"name":"���~","bkcolor":"#507ea4 ","fcolor":"#ffffff"},{"name":"�����C","bkcolor":"#' + '19448e ","fcolor":"#ffffff"},{"name":"�C����","bkcolor":"#164a84","fcolor":"#ffffff"},{"name":"�{ɫ","' + 'bkcolor":"#165e83","fcolor":"#ffffff"},{"name":"���{","bkcolor":"#274a78 ","fcolor":"#ffffff"},{"' +
    'name":"��~","bkcolor":"#2a4073 ","fcolor":"#ffffff"},{"name":"�Cɫ","bkcolor":"#223a70 ","fcolor":"#' + 'ffffff"},{"name":"�C��","bkcolor":"#192f60 ","fcolor":"#ffffff"},{"name":"���C","bkcolor":"#1c305c ","' + 'fcolor":"#ffffff"},{"name":"���{","bkcolor":"#0f2350 ","fcolor":"#ffffff"},{"name":"⟽C","bkcolor":"#' + '17184b ","fcolor":"#ffffff"},{"name":"���\","bkcolor":"#0d0015 ","fcolor":"#ffffff"},{"name":"����ɫ","' +
    'bkcolor":"#bbc8e6 ","fcolor":"#000000"},{"name":"��ɫ","bkcolor":"#bbbcde ","fcolor":"#000000"},{"' + 'name":"�t���ɫ","bkcolor":"#8491c3 ","fcolor":"#ffffff"},{"name":"�t��","bkcolor":"#8491c3 ","fcolor":"#' + 'ffffff"},{"name":"�C�۹�","bkcolor":"#4d5aaf ","fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#4d5aaf ","' + 'fcolor":"#ffffff"},{"name":"�C�{","bkcolor":"#4a488e ","fcolor":"#ffffff"},{"name":"�t�۹�","bkcolor":"#' +
    '4d4398 ","fcolor":"#ffffff"},{"name":"�۹�ɫ","bkcolor":"#5654a2 ","fcolor":"#ffffff"},{"name":"�ټ{��","' + 'bkcolor":"#706caa ","fcolor":"#ffffff"},{"name":"�t�컨ɫ","bkcolor":"#68699b ","fcolor":"#ffffff"},{"' + 'name":"��Էɫ","bkcolor":"#867ba9 ","fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#dbd0e6 ","fcolor":"#' + '000000"},{"name":"����","bkcolor":"#a59aca ","fcolor":"#ffffff"},{"name":"Ǟɫ","bkcolor":"#7058a3 ","' +
    'fcolor":"#ffffff"},{"name":"����","bkcolor":"#674598 ","fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#' + '674196 ","fcolor":"#ffffff"},{"name":"�o��ɫ","bkcolor":"#9079ad ","fcolor":"#ffffff"},{"name":"������","' + 'bkcolor":"#745399 ","fcolor":"#ffffff"},{"name":"����","bkcolor":"#65318e ","fcolor":"#ffffff"},{"' + 'name":"����ɫ","bkcolor":"#522f60 ","fcolor":"#ffffff"},{"name":"����","bkcolor":"#493759 ","fcolor":"#' +
    'ffffff"},{"name":"���\","bkcolor":"#2e2930 ","fcolor":"#ffffff"},{"name":"��","bkcolor":"#884898 ","' + 'fcolor":"#ffffff"},{"name":"������","bkcolor":"#c0a2c7 ","fcolor":"#ffffff"},{"name":"�ϽC","bkcolor":"#' + '460e44 ","fcolor":"#ffffff"},{"name":"���tɫ","bkcolor":"#74325c ","fcolor":"#ffffff"},{"name":"ɣ�Όgɫ","' + 'bkcolor":"#55295b ","fcolor":"#ffffff"},{"name":"�ƽ�","bkcolor":"#e6b422","fcolor":"#000000"},{"' +
    'name":"��Ⱦ","bkcolor":"#d9a62e","fcolor":"#000000"},{"name":"�����~ɫ","bkcolor":"#d3a243","fcolor":"#' + '000000"},{"name":"ɽ����","bkcolor":"#c89932 ","fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#d0af4c ","' + 'fcolor":"#000000"},{"name":"�������","bkcolor":"#8b968d ","fcolor":"#ffffff"},{"name":"�L�m","bkcolor":"#' + '6e7955 ","fcolor":"#ffffff"},{"name":"ɽ�Fɫ","bkcolor":"#767c6b ","fcolor":"#ffffff"},{"name":"������","' +
    'bkcolor":"#888e7e ","fcolor":"#ffffff"},{"name":"���ɲ�","bkcolor":"#5a544b ","fcolor":"#ffffff"},{"' + 'name":"�{���ɲ�","bkcolor":"#56564b ","fcolor":"#ffffff"},{"name":"�{�Ĳ�","bkcolor":"#56564b ","fcolor":"#' + 'ffffff"},{"name":"ǧ�r��","bkcolor":"#494a41 ","fcolor":"#ffffff"},{"name":"�Ҿ���","bkcolor":"#6b6f59 ","' + 'fcolor":"#ffffff"},{"name":"�ɔȲ�","bkcolor":"#474b42 ","fcolor":"#ffffff"},{"name":"�\�v","bkcolor":"#' +
    '333631 ","fcolor":"#ffffff"},{"name":"��ú��","bkcolor":"#5b6356 ","fcolor":"#ffffff"},{"name":"���ɫ","' + 'bkcolor":"#726250 ","fcolor":"#ffffff"},{"name":"���屶��ɫ","bkcolor":"#9d896c ","fcolor":"#ffffff"},{"' + 'name":"����ɫ","bkcolor":"#94846a ","fcolor":"#ffffff"},{"name":"����ú��","bkcolor":"#897858 ","fcolor":"#' + 'ffffff"},{"name":"�Ĳ�","bkcolor":"#716246 ","fcolor":"#ffffff"},{"name":"����","bkcolor":"#cbb994 ","' +
    'fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#d6c6af ","fcolor":"#000000"},{"name":"�ɫ","bkcolor":"#' + 'bfa46f ","fcolor":"#ffffff"},{"name":"��֭ɫ","bkcolor":"#9e9478 ","fcolor":"#ffffff"},{"name":"���ݲ�","' + 'bkcolor":"#a59564 ","fcolor":"#ffffff"},{"name":"�L��","bkcolor":"#715c1f ","fcolor":"#ffffff"},{"' + 'name":"ľ�mɫ","bkcolor":"#c7b370 ","fcolor":"#ffffff"},{"name":"ɰɫ","bkcolor":"#dcd3b2 ","fcolor":"#' +
    'ffffff"},{"name":"��ɫ","bkcolor":"#a19361 ","fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#8f8667 ","' + 'fcolor":"#ffffff"},{"name":"÷�Ҳ�","bkcolor":"#887938 ","fcolor":"#ffffff"},{"name":"������","bkcolor":"#' + '6a5d21 ","fcolor":"#ffffff"},{"name":"�ƺ��ɲ�","bkcolor":"#918754 ","fcolor":"#ffffff"},{"name":"�˷N��ɫ",' + '"bkcolor":"#a69425 ","fcolor":"#ffffff"},{"name":"�����~","bkcolor":"#ada250 ","fcolor":"#ffffff"},{"' +
    'name":"����ɫ","bkcolor":"#938b4b ","fcolor":"#ffffff"},{"name":"�U��","bkcolor":"#8c8861 ","fcolor":"#' + 'ffffff"},{"name":"����","bkcolor":"#a1a46d ","fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#726d40 ","' + 'fcolor":"#ffffff"},{"name":"�Lɫ","bkcolor":"#928c36 ","fcolor":"#ffffff"},{"name":"�v��ɫ","bkcolor":"#' + 'dccb18 ","fcolor":"#000000"},{"name":"�Uɫ","bkcolor":"#d7cf3a ","fcolor":"#000000"},{"name":"Ĩ��ɫ","' +
    'bkcolor":"#c5c56a ","fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#c3d825 ","fcolor":"#000000"},{"' + 'name":"�ƾv","bkcolor":"#b8d200 ","fcolor":"#000000"},{"name":"��ѿɫ","bkcolor":"#e0ebaf","fcolor":"#' + '000000"},{"name":"����ɫ","bkcolor":"#d8e698","fcolor":"#000000"},{"name":"����ɫ","bkcolor":"#c7dc68","' + 'fcolor":"#000000"},{"name":"�൤","bkcolor":"#99ab4e ","fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#' +
    '7b8d42 ","fcolor":"#ffffff"},{"name":"̦ɫ","bkcolor":"#69821b ","fcolor":"#ffffff"},{"name":"�Ȼ�","' + 'bkcolor":"#aacf53","fcolor":"#000000"},{"name":"��ɫ","bkcolor":"#b0ca71","fcolor":"#ffffff"},{"name":' + '"���~ɫ","bkcolor":"#b9d08b","fcolor":"#000000"},{"name":"���~ɫ","bkcolor":"#839b5c ","fcolor":"#ffffff"}' + ',{"name":"�ĳ�ɫ","bkcolor":"#cee4ae ","fcolor":"#000000"},{"name":"�U�Ȼ�","bkcolor":"#82ae46 ","fcolor":' +
    '"#ffffff"},{"name":"��ɫ","bkcolor":"#a8c97f ","fcolor":"#ffffff"},{"name":"�����","bkcolor":"#9ba88d ",' + '"fcolor":"#ffffff"},{"name":"����","bkcolor":"#c8d5bb ","fcolor":"#000000"},{"name":"�Y�~��","bkcolor":"#' + 'c1d8ac ","fcolor":"#000000"},{"name":"ɽ��ɫ","bkcolor":"#a8bf93 ","fcolor":"#ffffff"},{"name":"����ɫ","' + 'bkcolor":"#769164","fcolor":"#ffffff"},{"name":"�׾v","bkcolor":"#d6e9ca","fcolor":"#000000"},{"name":' +
    '"���Ȼ�","bkcolor":"#93ca76","fcolor":"#ffffff"},{"name":"��Ⱦ","bkcolor":"#93b881 ","fcolor":"#ffffff"},' + '{"name":"���ȴ�","bkcolor":"#badcad ","fcolor":"#000000"},{"name":"���","bkcolor":"#97a791 ","fcolor":"' + '#ffffff"},{"name":"���v","bkcolor":"#98d98e ","fcolor":"#000000"},{"name":"ǳ�v","bkcolor":"#88cb7f ","' + 'fcolor":"#ffffff"},{"name":"���v","bkcolor":"#69b076","fcolor":"#ffffff"},{"name":"���g","bkcolor":"#' +
    '6b7b6e","fcolor":"#ffffff"},{"name":"�����","bkcolor":"#bed2c3","fcolor":"#000000"},{"name":"����","' + 'bkcolor":"#93b69c","fcolor":"#ffffff"},{"name":"����","bkcolor":"#a6c8b2 ","fcolor":"#ffffff"},{"' + 'name":"�v��ɫ","bkcolor":"#47885e ","fcolor":"#ffffff"},{"name":"ǧ�r�v","bkcolor":"#316745 ","fcolor":"#' + 'ffffff"},{"name":"����ɫ","bkcolor":"#68be8d ","fcolor":"#ffffff"},{"name":"�v","bkcolor":"#3eb370 ","' +
    'fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#007b43 ","fcolor":"#ffffff"},{"name":"ǧ����","bkcolor":"#' + 'bed3ca","fcolor":"#000000"},{"name":"ǧ��ɫ","bkcolor":"#92b5a9 ","fcolor":"#ffffff"},{"name":"���ɫ","' + 'bkcolor":"#7ebea5 ","fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#7ebeab ","fcolor":"#ffffff"},{"' + 'name":"���;v","bkcolor":"#028760 ","fcolor":"#ffffff"},{"name":"ľ�\ɫ","bkcolor":"#3b7960 ","fcolor":"#' +
    'ffffff"},{"name":"���[�q","bkcolor":"#2f5d50","fcolor":"#ffffff"},{"name":"���\","bkcolor":"#3a5b52 ","' + 'fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#475950 ","fcolor":"#ffffff"},{"name":"��v","bkcolor":"#' + '00552e ","fcolor":"#ffffff"},{"name":"�ɫ","bkcolor":"#005243 ","fcolor":"#ffffff"},{"name":"С��ɫ","' + 'bkcolor":"#96514d","fcolor":"#ffffff"},{"name":"�ݲ�","bkcolor":"#8d6449","fcolor":"#ffffff"},{"' +
    'name":"��ɫ","bkcolor":"#deb068","fcolor":"#000000"},{"name":"����ɫ","bkcolor":"#bf794e","fcolor":"#' + 'ffffff"},{"name":"��ɫ","bkcolor":"#bc763c","fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#b98c46","' + 'fcolor":"#ffffff"},{"name":"ɣȾ","bkcolor":"#b79b5b","fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#' + 'b77b57","fcolor":"#ffffff"},{"name":"����","bkcolor":"#b68d4c","fcolor":"#ffffff"},{"name":"����Ⱦ","' +
    'bkcolor":"#ad7d4c","fcolor":"#ffffff"},{"name":"��Ⱦ","bkcolor":"#ad7d4c","fcolor":"#ffffff"},{"name":' + '"���˲�","bkcolor":"#ae7c4f","fcolor":"#ffffff"},{"name":"֥�D��","bkcolor":"#ad7e4e","fcolor":"#ffffff"},' + '{"name":"����","bkcolor":"#ae7c58","fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#a86f4c","fcolor":"#' + 'ffffff"},{"name":"�iֽɫ","bkcolor":"#946243","fcolor":"#ffffff"},{"name":"���~ɫ","bkcolor":"#917347","' +
    'fcolor":"#ffffff"},{"name":"ɣ��","bkcolor":"#956f29","fcolor":"#ffffff"},{"name":"·����","bkcolor":"#' + '8c7042","fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#7b6c3e","fcolor":"#ffffff"},{"name":"٤�_ɫ","' + 'bkcolor":"#d8a373","fcolor":"#000000"},{"name":"������","bkcolor":"#cd8c5c","fcolor":"#ffffff"},{"' + 'name":"��ɫ","bkcolor":"#cd5e3c","fcolor":"#ffffff"},{"name":"�t�d��","bkcolor":"#cb8347","fcolor":"#' +
    'ffffff"},{"name":"����ɫ","bkcolor":"#c37854","fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#c38743","' + 'fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#c39143","fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#' + 'bf783a","fcolor":"#ffffff"},{"name":"���","bkcolor":"#bb5535","fcolor":"#ffffff"},{"name":"����","' + 'bkcolor":"#bb5520","fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#b55233","fcolor":"#ffffff"},{"' +
    'name":"ȸ��","bkcolor":"#aa4f37","fcolor":"#ffffff"},{"name":"��ʮ�ɲ�","bkcolor":"#9f563a","fcolor":"#' + 'ffffff"},{"name":"���iɫ","bkcolor":"#9f563a","fcolor":"#ffffff"},{"name":"�t�S","bkcolor":"#9a493f","' + 'fcolor":"#ffffff"},{"name":"�Ҳ�","bkcolor":"#98623c","fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#' + '965042","fcolor":"#ffffff"},{"name":"�uƤɫ","bkcolor":"#965036","fcolor":"#ffffff"},{"name":"�Sɫ","' +
    'bkcolor":"#95483f","fcolor":"#ffffff"},{"name":"����","bkcolor":"#954e2a","fcolor":"#ffffff"},{"name":' + '"�ͱ�ɫ","bkcolor":"#8f2e14","fcolor":"#ffffff"},{"name":"���ɫ","bkcolor":"#8a3319","fcolor":"#ffffff"},' + '{"name":"��ɫ","bkcolor":"#8a3b00","fcolor":"#ffffff"},{"name":"��÷","bkcolor":"#852e19","fcolor":"#' + 'ffffff"},{"name":"�t�uƤ","bkcolor":"#7b4741","fcolor":"#ffffff"},{"name":"���ϲ�","bkcolor":"#773c30","' +
    'fcolor":"#ffffff"},{"name":"�Ʋ�","bkcolor":"#783c1d","fcolor":"#ffffff"},{"name":"��ɫ","bkcolor":"#' + '762f07","fcolor":"#ffffff"},{"name":"���~ɫ","bkcolor":"#752100","fcolor":"#ffffff"},{"name":"�ɫ","' + 'bkcolor":"#6c3524","fcolor":"#ffffff"},{"name":"���ɫ","bkcolor":"#683f36","fcolor":"#ffffff"},{"' + 'name":"���ɫ","bkcolor":"#664032","fcolor":"#ffffff"},{"name":"��Ƥ��","bkcolor":"#6d3c32","fcolor":"#' +
    'ffffff"},{"name":"�\��","bkcolor":"#583822","fcolor":"#ffffff"},{"name":"���Ѳ�","bkcolor":"#6c2c2f","' + 'fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#640125","fcolor":"#ffffff"},{"name":"���ɫ","bkcolor":"#' + 'f8b862","fcolor":"#000000"},{"name":"����ɫ","bkcolor":"#f6ad49","fcolor":"#000000"},{"name":"���","' + 'bkcolor":"#f39800","fcolor":"#000000"},{"name":"�۸�ɫ","bkcolor":"#f08300","fcolor":"#000000"},{"' +
    'name":"�U��ɫ","bkcolor":"#ec6d51","fcolor":"#000000"},{"name":"�Ƶ�","bkcolor":"#ee7948","fcolor":"#' + '000000"},{"name":"��ɫ","bkcolor":"#ed6d3d","fcolor":"#000000"},{"name":"�Ƴ�","bkcolor":"#ec6800","' + 'fcolor":"#000000"},{"name":"�˲�ɫ","bkcolor":"#ec6800","fcolor":"#000000"},{"name":"��ɫ","bkcolor":"#' + 'ee7800","fcolor":"#000000"},{"name":"����","bkcolor":"#eb6238","fcolor":"#000000"},{"name":"���","' +
    'bkcolor":"#ea5506","fcolor":"#000000"},{"name":"���","bkcolor":"#ea5506","fcolor":"#000000"},{"name":' + '"��ɫ","bkcolor":"#eb6101","fcolor":"#000000"},{"name":"С��ɫ","bkcolor":"#e49e61","fcolor":"#000000"},{' + '"name":"��ɫ","bkcolor":"#e45e32","fcolor":"#000000"},{"name":"�Ʋ�","bkcolor":"#e17b34","fcolor":"#' + '000000"},{"name":"���ɫ","bkcolor":"#dd7a56","fcolor":"#000000"},{"name":"�����~ɫ","bkcolor":"#db8449","' +
    'fcolor":"#000000"},{"name":"�ƙ�Ⱦ","bkcolor":"#d66a35","fcolor":"#000000"},{"name":"�ѹ�Ӣɫ","bkcolor":"#' + 'ffd900","fcolor":"#000000"},{"name":"��ɫ","bkcolor":"#ffd900","fcolor":"#000000"},{"name":"�л�","' + 'bkcolor":"#ffea00","fcolor":"#000000"},{"name":"�ˤλ�ɫ","bkcolor":"#ffec47","fcolor":"#000000"},{"' + 'name":"����ɫ","bkcolor":"#fef263","fcolor":"#000000"},{"name":"��ɫ","bkcolor":"#fcd575","fcolor":"#' +
    '000000"},{"name":"���~ɫ","bkcolor":"#fbd26b","fcolor":"#000000"},{"name":"�װ�ɫ","bkcolor":"#f5e56b","' + 'fcolor":"#000000"},{"name":"������ɫ","bkcolor":"#eec362","fcolor":"#000000"},{"name":"����ȸɫ","bkcolor":"' + '#ebd842","fcolor":"#000000"},{"name":"��֧��ɫ","bkcolor":"#ffdb4f","fcolor":"#000000"},{"name":"֧��ɫ","' + 'bkcolor":"#fbca4d","fcolor":"#000000"},{"name":"���տ�ɫ","bkcolor":"#fcc800","fcolor":"#000000"},{"' +
    'name":"ɽ��ɫ","bkcolor":"#f8b500","fcolor":"#000000"},{"name":"�d��ɫ","bkcolor":"#fabf14","fcolor":"#' + '000000"},{"name":"�ٻ�","bkcolor":"#f7c114","fcolor":"#000000"},{"name":"��ɫ","bkcolor":"#e6b422","' + 'fcolor":"#000000"},{"name":"�@ɫ","bkcolor":"#bf242a","fcolor":"#000000"},{"name":"���@","bkcolor":"#' + 'fdeff2","fcolor":"#000000"},{"name":"�@��","bkcolor":"#e9dfe5","fcolor":"#000000"},{"name":"���","' +
    'bkcolor":"#e4d2d8","fcolor":"#000000"},{"name":"��ɫ","bkcolor":"#f6bfbc","fcolor":"#000000"},{"name":' + '"ɺ��ɫ","bkcolor":"#f5b1aa","fcolor":"#000000"},{"name":"�`ɫ","bkcolor":"#efab93","fcolor":"#000000"},{' + '"name":"��÷ɫ","bkcolor":"#f2a0a1","fcolor":"#000000"},{"name":"����","bkcolor":"#f0908d","fcolor":"#' + '000000"},{"name":"������","bkcolor":"#ee827c","fcolor":"#000000"},{"name":"��ɫ","bkcolor":"#f09199","' +
    'fcolor":"#000000"},{"name":"�ɫ","bkcolor":"#f4b3c2","fcolor":"#000000"},{"name":"����ɫ","bkcolor":"#' + 'eebbcb","fcolor":"#000000"},{"name":"��÷","bkcolor":"#e8d3c7","fcolor":"#000000"},{"name":"�җ@","' + 'bkcolor":"#e8d3d1","fcolor":"#000000"},{"name":"������","bkcolor":"#e6cde3","fcolor":"#000000"},{"' + 'name":"ʯ��ɫ","bkcolor":"#e5abbe","fcolor":"#000000"},{"name":"����÷","bkcolor":"#e597b2","fcolor":"#' +
    '000000"},{"name":"�һ�ɫ","bkcolor":"#e198b4","fcolor":"#000000"},{"name":"ˮ��","bkcolor":"#e4ab9b","' + 'fcolor":"#000000"},{"name":"�Ȥ������","bkcolor":"#e09e87","fcolor":"#000000"},{"name":"�˺�","bkcolor":"#' + 'd69090","fcolor":"#000000"},{"name":"����","bkcolor":"#d4acad","fcolor":"#000000"},{"name":"����ɫ","' + 'bkcolor":"#c97586","fcolor":"#ffffff"},{"name":"÷��","bkcolor":"#c099a0","fcolor":"#ffffff"},{"name":' +
    '"�ǳ��","bkcolor":"#b88884","fcolor":"#ffffff"},{"name":"÷Ⱦ","bkcolor":"#b48a76","fcolor":"#ffffff"},{' + '"name":"�շ���","bkcolor":"#a86965","fcolor":"#ffffff"},{"name":"ǳ�շ�","bkcolor":"#a25768","fcolor":"#' + 'ffffff"},{"name":"����","bkcolor":"#ec6d71","fcolor":"#000000"},{"name":"����","bkcolor":"#eb6ea5","' + 'fcolor":"#000000"},{"name":"�U��ɫ","bkcolor":"#e95295","fcolor":"#000000"},{"name":"ĵ��ɫ","bkcolor":"#' +
    'e7609e","fcolor":"#000000"},{"name":"����ɫ","bkcolor":"#d0576b","fcolor":"#000000"},{"name":"�к�","' + 'bkcolor":"#c85179","fcolor":"#ffffff"},{"name":"Ǿޱɫ","bkcolor":"#e9546b","fcolor":"#000000"},{"' + 'name":"����","bkcolor":"#e95464","fcolor":"#000000"},{"name":"����","bkcolor":"#c85554","fcolor":"#' + 'ffffff"},{"name":"���","bkcolor":"#c53d43","fcolor":"#ffffff"},{"name":"��p","bkcolor":"#e83929","' + 'fcolor":"#000000"},{"name":"��","bkcolor":"#e60033","fcolor":"#000000"},{"name":"�ɾp","bkcolor":"#' +
    'e2041b","fcolor":"#000000"},{"name":"��","bkcolor":"#d7003a","fcolor":"#000000"},{"name":"��p","' + 'bkcolor":"#c9171e","fcolor":"#000000"},{"name":"�ɫ","bkcolor":"#d3381c","fcolor":"#000000"},{"name":' + '"�൤","bkcolor":"#ce5242","fcolor":"#000000"},{"name":"���","bkcolor":"#d9333f","fcolor":"#000000"},{"' + 'name":"��֬","bkcolor":"#b94047","fcolor":"#ffffff"},{"name":"��p","bkcolor":"#ba2636","fcolor":"#' +
    'ffffff"},{"name":"��ɫ","bkcolor":"#b7282e","fcolor":"#ffffff"},{"name":"��ϲ�","bkcolor":"#a73836","' + 'fcolor":"#ffffff"},{"name":"�շ�","bkcolor":"#9e3d3f","fcolor":"#ffffff"},{"name":"���","bkcolor":"#' + 'a22041","fcolor":"#ffffff"},{"name":"Ũ��","bkcolor":"#a22041","fcolor":"#ffffff"},{"name":"����ɫ","' + 'bkcolor":"#f8f4e6","fcolor":"#000000"},{"name":"��ɫ","bkcolor":"#ede4cd","fcolor":"#000000"},{"name":' +
    '"�Ұ�ɫ","bkcolor":"#e9e4d4","fcolor":"#000000"},{"name":"����ɫ","bkcolor":"#ede1a9","fcolor":"#000000"},' + '{"name":"Ů�ɻ�","bkcolor":"#f2f2b0","fcolor":"#000000"},{"name":"�ݲ�ɫ","bkcolor":"#e4dc8a","fcolor":"#' + '000000"},{"name":"����","bkcolor":"#f8e58c","fcolor":"#000000"},{"name":"�ײ�","bkcolor":"#ddbb99","' + 'fcolor":"#000000"},{"name":"�����","bkcolor":"#d7a98c","fcolor":"#000000"},{"name":"ϴ��","bkcolor":"#' +
    'f2c9ac","fcolor":"#000000"},{"name":"�����ɫ","bkcolor":"#fff1cf","fcolor":"#000000"},{"name":"����ɫ","' + 'bkcolor":"#fddea5","fcolor":"#000000"},{"name":"��ɫ","bkcolor":"#fce2c4","fcolor":"#000000"},{"name":' + '"����ɫ","bkcolor":"#fde8d0","fcolor":"#000000"},{"name":"�ۻ�","bkcolor":"#f9c89b","fcolor":"#000000"},{' + '"name":"������","bkcolor":"#f7bd8f","fcolor":"#000000"},{"name":"����","bkcolor":"#f6b894","fcolor":"#' +
    '000000"},{"name":"�Ʒ�ɫ","bkcolor":"#f4dda5","fcolor":"#000000"},{"name":"��ɫ","bkcolor":"#f1bf99","' + 'fcolor":"#000000"},{"name":"��ɫ","bkcolor":"#f1bf99","fcolor":"#000000"},{"name":"����ɫ","bkcolor":"#' + 'efcd9a","fcolor":"#000000"},{"name":"��ɫ","bkcolor":"#efcd9a","fcolor":"#000000"},{"name":"����","' + 'bkcolor":"#f0cfa0","fcolor":"#000000"},{"name":"ǳ��","bkcolor":"#edd3a1","fcolor":"#000000"},{"name":' +
    '"��ɫ","bkcolor":"#e0c38c","fcolor":"#000000"},{"name":"����","bkcolor":"#f3bf88","fcolor":"#000000"},{"' + 'name":"��ɫ","bkcolor":"#f7b977","fcolor":"#000000"},{"name":"����ɫ","bkcolor":"#f19072","fcolor":"#' + '000000"},{"name":"��ɫ","bkcolor":"#f19072","fcolor":"#000000"},{"name":"ɺ����ɫ","bkcolor":"#ee836f","' + 'fcolor":"#000000"},{"name":"��֧��","bkcolor":"#eb9b6f","fcolor":"#000000"},{"name":"�c","bkcolor":"#' +
    'e0815e","fcolor":"#000000"},{"name":"ǳ�","bkcolor":"#df7163","fcolor":"#000000"},{"name":"����","' + 'bkcolor":"#d57c6b","fcolor":"#000000"},{"name":"ϴ��","bkcolor":"#d0826c","fcolor":"#000000"},{"name":' + '"�h�ݲ�","bkcolor":"#ca8269","fcolor":"#ffffff"},{"name":"����ɫ","bkcolor":"#bb5548","fcolor":"#ffffff"},' + '{"name":"��","bkcolor":"#ab6953","fcolor":"#ffffff"}]';


var
  CNColorJson: TJSONArray;
  JPColorJson: TJSONArray;


procedure GetJson(var Json: TJSONArray; ColorJsonTxt: string);

// html��ɫ�ַ���תTAlphaColor
function HtmlToColor(WebColor: string): TAlphaColor;

// procedure BootstrapClassToColors(const AClass: string; const AAppearance: string; var AFontColor, AButtonColor: TAlphaColor; out AOutLine: Boolean);

implementation

const
  OffsetValue: array[Boolean] of Integer = (0, 1);


procedure GetJson(var Json: TJSONArray; ColorJsonTxt: string);
begin
  if not Assigned(Json) then
    Json := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(ColorJsonTxt), 0) as TJSONArray;
end;

function MulDiv(nNumber, nNumerator, nDenominator: Integer): Integer;
begin
  Result := Round(nNumber * nNumerator / nDenominator);
end;

// ��ɫ�Ƿ���һ����ɫ
function IsLightColor(Color: TAlphaColor): Boolean;
var
  r, g, b: Byte;
  luminance: Double;
begin
  // ��ȡ��ɫ��RGB����
  r := TAlphaColorRec(Color).r;
  g := TAlphaColorRec(Color).g;
  b := TAlphaColorRec(Color).b;
  // ������ɫ������
  luminance := (0.299 * r + 0.587 * g + 0.114 * b) / 255;
  // �ж������Ƿ���ڵ���0.5�����ڵ���0.5��ʾΪ��ɫ������Ϊ��ɫ
  Result := luminance >= 0.5;
end;

// html��ɫ�ַ���תTAlphaColor
function HtmlToColor(WebColor: string): TAlphaColor;
var
  I: Integer;
  Offset: Integer;
begin
  WebColor := WebColor.Trim;
  if (Length(WebColor) < 6) or (Length(WebColor) > 7) then
    raise Exception.Create('Invalid Color string');
  for I := 1 to Length(WebColor) do
    if not CharInSet(WebColor[I], ['#', 'a'..'f', 'A'..'F', '0'..'9']) then { do not localize }
      raise Exception.Create('Invalid Color string');
  Offset := OffsetValue[Pos('#', WebColor) = 1];
  // Result := RGB(StrToInt('$' + Copy(WebColor, 1 + Offset, 2)),                             { do not localize }
  // StrToInt('$' + Copy(WebColor, 3 + Offset, 2)), StrToInt('$' + Copy(WebColor, 5 + Offset, 2)));  { do not localize }
  Result := MakeColor(StrToInt('$' + Copy(WebColor, 1 + Offset, 2)), StrToInt('$' + Copy(WebColor, 3 + Offset, 2)), StrToInt('$' + Copy(WebColor, 5 + Offset, 2)), 255);
end;

// ��ɫ����
function LightenColor(Color: TAlphaColor; Percent: Integer): TAlphaColor;
var
  r, g, b: Byte;
begin
  // Color:=TAlphaColorRec(Color).r;
  r := TAlphaColorRec(Color).r;
  g := TAlphaColorRec(Color).g;
  b := TAlphaColorRec(Color).b;
  r := r + MulDiv(255 - r, Percent, 100); // Percent% closer to white
  g := g + MulDiv(255 - g, Percent, 100);
  b := b + MulDiv(255 - b, Percent, 100);
  Result := MakeColor(r, g, b, TAlphaColorRec(Color).A);
end;

// ��ɫ�䰵
function DarkenColor(Color: TAlphaColor; Percent: Integer): TAlphaColor;
var
  r, g, b: Byte;
begin
  r := TAlphaColorRec(Color).r;
  g := TAlphaColorRec(Color).g;
  b := TAlphaColorRec(Color).b;
  r := r - MulDiv(r, Percent, 100); // Percent% closer to black
  g := g - MulDiv(g, Percent, 100);
  b := b - MulDiv(b, Percent, 100);
  Result := MakeColor(r, g, b, TAlphaColorRec(Color).A);
end;

// Button and Font Colors for Light Themes (DeepPurpleAndAmber)

{ TbuttonViewHelper }

procedure TTextViewHelper.SetButtonStyle(const AFamily: string; const AClass: string; const AAppearance: string);
begin
  TTextviewstyle.SetButtonStyle(self, AFamily, AClass, AAppearance);
end;

procedure TTextViewHelper.SetTextViewStyle(const AFamily, AClass: string);
begin
  TTextviewstyle.SetTextViewStyle(self, AFamily, AClass);
end;

{ Tbuttonviewstyle }

class procedure TTextviewstyle.AngularClassToDarkColors(const AClass, AAppearance: string; var AFontColor, AButtonColor: TAlphaColor);
begin
  if SameText(AClass, btn_Basic) then
  begin
    AButtonColor := HtmlToColor('#424242');
    AFontColor := HtmlToColor('#FFFFFF');
  end
  else if SameText(AClass, btn_PrimaryPink) then
  begin
    AButtonColor := HtmlToColor('#E91E63');
    AFontColor := HtmlToColor('#FFFFFF');
  end
  else if SameText(AClass, btn_AccentBlueGray) then
  begin
    AButtonColor := HtmlToColor('#607D8B');
    AFontColor := HtmlToColor('#FFFFFF');
  end
  else if SameText(AClass, btn_PrimaryPurple) then
  begin
    AButtonColor := HtmlToColor('#9C27B0');
    AFontColor := HtmlToColor('#FFFFFF');
  end
  else if SameText(AClass, btn_AccentGreen) then
  begin
    AButtonColor := HtmlToColor('#69F0AE');
    AFontColor := HtmlToColor('#0E1F17');
  end
  else if SameText(AClass, btn_Warn) then
  begin
    AButtonColor := HtmlToColor('#F44336');
    AFontColor := HtmlToColor('#FFFFFF');
  end
  else if SameText(AClass, btn_Link) then
  begin
    AButtonColor := HtmlToColor('#424242');
    AFontColor := HtmlToColor('#FFFFFF');
  end;
end;

class procedure TTextviewstyle.AngularClassToLightColors(const AClass, AAppearance: string; var AFontColor, AButtonColor: TAlphaColor);
begin
  // Button and Font Colors for Light Themes (DeepPurpleAndAmber)
  if SameText(AClass, btn_Basic) then
  begin
    AButtonColor := HtmlToColor('#FFFFFF');
    AFontColor := HtmlToColor('#212121');
  end
  else if SameText(AClass, btn_PrimaryDeepPurple) then
  begin
    AButtonColor := HtmlToColor('#673AB7');
    AFontColor := HtmlToColor('#FFFFFF');
  end
  else if SameText(AClass, btn_AccentAmber) then
  begin
    AButtonColor := HtmlToColor('#FFD740');
    AFontColor := HtmlToColor('#211C08');
  end
  else if SameText(AClass, btn_PrimaryIndigo) then
  begin
    AButtonColor := HtmlToColor('#3F51B5');
    AFontColor := HtmlToColor('#FFFFFF');
  end
  else if SameText(AClass, btn_AccentPink) then
  begin
    AButtonColor := HtmlToColor('#FF4081');
    AFontColor := HtmlToColor('#FFFFFF');
  end
  else if SameText(AClass, btn_Warn) then
  begin
    AButtonColor := HtmlToColor('#F44336');
    AFontColor := HtmlToColor('#FFFFFF');
  end
  else if SameText(AClass, btn_Link) then
  begin
    AButtonColor := HtmlToColor('#FFFFFF');
    AFontColor := HtmlToColor('#212121');
  end;
end;

class procedure TTextviewstyle.BootstrapClassToColors(const AClass, AAppearance: string; var AFontColor, AButtonColor: TAlphaColor; out AOutLine: Boolean);
const
  // from bootstrap css
  bs_blue = '#0d6efd';
  bs_indigo = '#6610f2';
  bs_purple = '#6f42c1';
  bs_pink = '#d63384';
  bs_red = '#dc3545';
  bs_orange = '#fd7e14';
  bs_yellow = '#ffc107';
  bs_green = '#198754';
  bs_teal = '#20c997';
  bs_cyan = '#0dcaf0';
  bs_white = '#fff';
  bs_gray = '#6c757d';
  bs_gray_dark = '#343a40';
  bs_primary = '#0d6efd';
  bs_secondary = '#6c757d';
  bs_success = '#198754';
  bs_info = '#0dcaf0';
  bs_warning = '#ffc107';
  bs_danger = '#dc3545';
  bs_light = '#f8f9fa';
  bs_dark = '#212529';
begin
  AOutLine := SameText(AAppearance, BOOTSTRAP_OUTLINE);

  if SameText(AClass, btn_primary) then
  begin
    AButtonColor := HtmlToColor(bs_primary);
    // AButtonColor := TAlphaColors.Blue;
    AFontColor := TAlphaColors.White;
  end
  else if SameText(AClass, btn_secondary) then
  begin
    AButtonColor := HtmlToColor(bs_secondary);
    AFontColor := TAlphaColors.White;
  end
  else if SameText(AClass, btn_success) then
  begin
    AButtonColor := HtmlToColor(bs_success);
    AFontColor := TAlphaColors.White;
  end
  else if SameText(AClass, btn_danger) then
  begin
    AButtonColor := HtmlToColor(bs_danger);
    AFontColor := TAlphaColors.White;
  end
  else if SameText(AClass, btn_warning) then
  begin
    AButtonColor := HtmlToColor(bs_warning);
    AFontColor := HtmlToColor('#212529');
  end
  else if SameText(AClass, btn_info) then
  begin
    AButtonColor := HtmlToColor(bs_info);
    AFontColor := HtmlToColor('#212529');
  end
  else if SameText(AClass, btn_light) then
  begin
    AButtonColor := HtmlToColor(bs_light);
    AFontColor := HtmlToColor('#212529');
  end
  else if SameText(AClass, btn_dark) then
  begin
    AButtonColor := HtmlToColor(bs_dark);
    AFontColor := TAlphaColors.White;
  end
  else
  begin
    AOutLine := False;
    AButtonColor := $FFFAFAFA;
    AFontColor := TAlphaColors.White;
  end;
end;

class function TTextviewstyle.GetFAMILYAAppearance(AFamily: string): Tarray<string>;
begin
  if SameText(BOOTSTRAP_FAMILY, AFamily) then
  begin
    Result := ['Normal', 'Outline'];
  end
  else if SameText(ANGULAR_LIGHT_FAMILY, AFamily) or SameText(ANGULAR_DARK_FAMILY, AFamily) then
  begin
    Result := ['Flat', 'Raised', 'Basic', 'Stroked'];
  end;
end;

class function TTextviewstyle.GetFAMILYAllClass(AFamily: string): Tarray<string>;
var
  I: Integer;
begin
  if SameText(BOOTSTRAP_FAMILY, AFamily) then
  begin
    SetLength(Result, Length(BootstrapbtnKinds));
    for I := Low(BootstrapbtnKinds) to High(BootstrapbtnKinds) do
    begin
      Result[I] := BootstrapbtnKinds[I];
    end;
  end
  else if SameText(ANGULAR_LIGHT_FAMILY, AFamily) then
  begin
    SetLength(Result, Length(AngularbtnKinds));
    for I := Low(AngularbtnKinds) to High(AngularbtnKinds) do
    begin
      Result[I] := AngularbtnKinds[I];
    end;
  end
  else if SameText(ANGULAR_DARK_FAMILY, AFamily) then
  begin
    SetLength(Result, Length(AngularDarkbtnKinds));
    for I := Low(AngularDarkbtnKinds) to High(AngularDarkbtnKinds) do
    begin
      Result[I] := AngularDarkbtnKinds[I];
    end;
  end;
end;

class function TTextviewstyle.GetFAMILYClassCount(AFamily: string): Integer;
begin
  Result := Length(GetFAMILYAllClass(AFamily));
end;

class function TTextviewstyle.GetFAMILYCount: Integer;
begin
  Result := Length(GetFAMILYs);
end;

class function TTextviewstyle.GetFAMILYI(idx: Integer): string;
begin
  Result := BOOTSTRAP_FAMILY;
  case idx of
    0:
      begin
        Result := BOOTSTRAP_FAMILY;
      end;
    1:
      begin
        Result := ANGULAR_LIGHT_FAMILY;
      end;
    2:
      begin
        Result := ANGULAR_DARK_FAMILY;
      end;
  else
    begin
      Result := BOOTSTRAP_FAMILY;
    end;
  end;
end;

class function TTextviewstyle.GetAAppearance(AFamily: string; idx: Integer): string;
var
  arr: Tarray<string>;
begin
  arr := GetFAMILYAAppearance(AFamily);
  idx := EnsureRange(idx, 0, high(arr));
  Result := arr[idx];
end;

class function TTextviewstyle.GetAllClassFromFAMILYidx(AFamilyidx: Integer): Tarray<string>;
begin
  Result := GetFAMILYAllClass(GetFAMILYI(AFamilyidx));
end;

class function TTextviewstyle.GetClass(AFamily: string; idx: Integer): string;
var
  arr: Tarray<string>;
begin
  arr := GetFAMILYAllClass(AFamily);
  idx := EnsureRange(idx, 0, high(arr));
  Result := arr[idx];
end;

class function TTextviewstyle.GetFAMILYs: Tarray<string>;
begin
  Result := [BOOTSTRAP_FAMILY, ANGULAR_LIGHT_FAMILY, ANGULAR_DARK_FAMILY];
end;

class procedure TTextviewstyle.setAngularDark(button: TTextView; AClass, AAppearance: string);
var
  LFontColor, LButtonColor: TAlphaColor;
  LRaised, LStroked, LBasic: Boolean;
  LPrimaryAccentWarn: Boolean;
  Border: TViewBorder;
  btnbrush: TViewBrush;
  L_lastfontcolor: TAlphaColor;
  L_lastButtonColor: TAlphaColor;
  C1, C2, C3: TAlphaColor;
  color20, color40, color50: TAlphaColor;
begin
  // ͨ����ʽ���Ƶõ���ť��ɫ��������ɫ
  AngularClassToDarkColors(AClass, AAppearance, LFontColor, LButtonColor);
  Border := TDrawableBorder(button.Background).Border;

  // Ĭ����ʽ: Flat
  // ʹ��Flat StyleΪ����
  Border.Width := 0; // û�����
  button.TextSettings.Color.Default := LFontColor;
  button.TextSettings.Font.Style := [Tfontstyle.fsBold]; // ���ּӴ�

  LStroked := SameText(AAppearance, StrokedAttr);
  LRaised := SameText(AAppearance, RaisedAttr);
  LPrimaryAccentWarn := SameText(AClass, btn_PrimaryPink) or SameText(AClass, btn_PrimaryPurple) or SameText(AClass, btn_AccentBlueGray) or SameText(AClass, btn_AccentGreen) or SameText(AClass, btn_Warn);
  LBasic := SameText(AAppearance, BasicAttr);

  with button.Background do
  begin
    ItemDefault.Color := LButtonColor;
    ItemDefault.Kind := TViewBrushKind.Solid;
    C1 := LButtonColor;
    C2 := LFontColor;
    C3 := $FFCCCCCC;

    if LStroked then
    begin
      Border.Width := ANGULAR_STROKED_WIDTH;
      ItemDefault.Kind := TViewBrushKind.None;
      // Only for Primary, Accent and Warn, Stroked FontColor as Button Color
      C1 := TAlphaColors.Null;

      // Only for Primary, Accent and Warn, Stroked FontColor as Button Color
      if LPrimaryAccentWarn then
        C2 := LButtonColor
      else
        C2 := LFontColor;
    end
    else if LRaised then
    begin
      Border.Width := ANGULAR_RAISED_WIDTH;
      C1 := LButtonColor;
      C2 := LFontColor;
      C3 := DarkenColor(LButtonColor, 20);
    end
    else if LBasic then
    begin
      C1 := TAlphaColors.Null;
      C3 := TAlphaColors.Null;
      // Only for Primary, Accent and Warn, Stroked FontColor as Button Color
      if LPrimaryAccentWarn then
        C2 := LButtonColor
      else
        C2 := LFontColor;
    end;
    SetBtnKindColor(button, TViewState.None, C1, C2, C3);

    btnbrush := ItemDefault;

    if LStroked or LBasic then
    begin
      // Button Hot: Button Color 50% ligthen of Font Color
      SetBtnKindColor(button, TViewState.Hovered, DarkenColor(C2, 50), C2, C3);

      // Button Pressed: Button Color 40% ligthen of Font Color
      SetBtnKindColor(button, TViewState.Pressed, DarkenColor(C2, 40), DarkenColor(C2, 50), C2);

      // Button Selected: Button Color 60% ligthen of Font Color
      SetBtnKindColor(button, TViewState.Selected, DarkenColor(C2, 60), C2, C3);

      SetBtnKindColor(button, TViewState.Focused, DarkenColor(C2, 60), C2, DarkenColor(C3, 50));
    end
    else
    begin
      // Flat and Raised Appearance
      if IsLightColor(LButtonColor) then
        color20 := DarkenColor(C1, 20)
      else
        color20 := LightenColor(C1, 20);

      if IsLightColor(LButtonColor) then
        color50 := DarkenColor(C1, 50)
      else
        color50 := LightenColor(C1, 50);

      SetBtnKindColor(button, TViewState.Hovered, color20, C2, C3);
      SetBtnKindColor(button, TViewState.Pressed, color50, C2, C1);
      SetBtnKindColor(button, TViewState.Selected, LightenColor(C1, 50), C2, C3);
      SetBtnKindColor(button, TViewState.Focused, C1, C2, C3);
    end;
  end;
end;

class procedure TTextviewstyle.setAngularlight(button: TTextView; AClass, AAppearance: string);
var
  LFontColor, LButtonColor: TAlphaColor;
  LRaised, LStroked, LBasic: Boolean;
  LPrimaryAccentWarn: Boolean;
  Border: TViewBorder;
  btnbrush: TViewBrush;
  L_lastfontcolor: TAlphaColor;
  L_lastButtonColor: TAlphaColor;
  C1, C2, C3: TAlphaColor;
  color20, color40, color50: TAlphaColor;
begin
  // ͨ����ʽ���Ƶõ���ť��ɫ��������ɫ
  AngularClassToLightColors(AClass, AAppearance, LFontColor, LButtonColor);
  Border := TDrawableBorder(button.Background).Border;

  // Ĭ����ʽ: Flat
  // ʹ��Flat StyleΪ����
  Border.Width := 0; // û�����
  button.TextSettings.Color.Default := LFontColor;
  button.TextSettings.Font.Style := [Tfontstyle.fsBold]; // ���ּӴ�

  LStroked := SameText(AAppearance, StrokedAttr);
  LRaised := SameText(AAppearance, RaisedAttr);
  LPrimaryAccentWarn := SameText(AClass, btn_PrimaryDeepPurple) or SameText(AClass, btn_PrimaryIndigo) or SameText(AClass, btn_AccentAmber) or SameText(AClass, btn_AccentPink) or SameText(AClass, btn_Warn);
  LBasic := SameText(AAppearance, BasicAttr);

  with button.Background do
  begin
    ItemDefault.Color := LButtonColor;
    ItemDefault.Kind := TViewBrushKind.Solid;
    C1 := LButtonColor;
    C2 := LFontColor;
    C3 := $FFCCCCCC;

    if LStroked then
    begin
      Border.Width := ANGULAR_STROKED_WIDTH;
      C1 := TAlphaColors.Null;

      // Only for Primary, Accent and Warn, Stroked FontColor as Button Color
      if LPrimaryAccentWarn then
        C2 := LButtonColor
      else
        C2 := LFontColor;
    end
    else if LRaised then
    begin
      Border.Width := ANGULAR_RAISED_WIDTH;
      C1 := LButtonColor;
      C2 := LFontColor;
      C3 := DarkenColor(LButtonColor, 20);
    end
    else if LBasic then
    begin
      C1 := TAlphaColors.Null;
      C3 := TAlphaColors.Null;
      // Only for Primary, Accent and Warn, Stroked FontColor as Button Color
      if LPrimaryAccentWarn then
        C2 := LButtonColor
      else
        C2 := LFontColor;
    end;
    SetBtnKindColor(button, TViewState.None, C1, C2, C3);

    btnbrush := ItemDefault;

    if LStroked or LBasic then
    begin
      // Button Hot: Button Color 50% ligthen of Font Color
      SetBtnKindColor(button, TViewState.Hovered, LightenColor(C2, 50), C2, C3);

      // Button Pressed: Button Color 40% ligthen of Font Color
      SetBtnKindColor(button, TViewState.Pressed, LightenColor(C2, 40), LightenColor(C2, 50), C2);

      // Button Selected: Button Color 60% ligthen of Font Color
      SetBtnKindColor(button, TViewState.Selected, LightenColor(C2, 50), C2, C3);

      SetBtnKindColor(button, TViewState.Focused, LightenColor(C2, 50), C2, LightenColor(C3, 50));
    end
    else
    begin
      if IsLightColor(LButtonColor) then
        color20 := DarkenColor(C1, 20)
      else
        color20 := LightenColor(C1, 20);

      if IsLightColor(LButtonColor) then
        color50 := DarkenColor(C1, 50)
      else
        color50 := LightenColor(C1, 50);

      SetBtnKindColor(button, TViewState.Hovered, color20, C2, C3);
      SetBtnKindColor(button, TViewState.Pressed, color50, C2, C1);
      SetBtnKindColor(button, TViewState.Selected, color50, C2, C3);
      SetBtnKindColor(button, TViewState.Focused, C1, C2, C3);
    end;
  end;
end;

class procedure TTextviewstyle.setBootstrap(button: TTextView; AClass, AAppearance: string);
var
  LFontColor, LButtonColor: TAlphaColor;
  LOutLine: Boolean;
  Border: TViewBorder;
  C1, C2, C3: TAlphaColor;
  color20, color40, color50: TAlphaColor;
begin
  // ͨ����ʽ���Ƶõ���ť��ɫ��������ɫ
  BootstrapClassToColors(AClass, AAppearance, LFontColor, LButtonColor, LOutLine);
  Border := TDrawableBorder(button.Background).Border; // �õ��߿�
  button.TextSettings.Font.Style := [Tfontstyle.fsBold]; // Ĭ�����ּӴ�

  Border.Width := 3; // Ĭ�������Ϊ2��Ĭ����ɫΪ͸��
  Border.Color.Default := TAlphaColors.Null;
  Border.Kind := TBrushKind.Solid;

  // Ĭ��״̬����ʽ
  with button.Background do
  begin
    if LOutLine then
    begin // �����,�ڲ���ťΪ͸��ɫ
      C1 := TAlphaColors.Null;
      C2 := LButtonColor;
      C3 := LButtonColor;
    end
    else
    begin
      C1 := LButtonColor;
      C2 := LFontColor;
      C3 := TAlphaColors.Null;

    end;
    SetBtnKindColor(button, TViewState.None, C1, C2, C3);

    // ����Ĭ�ϱ���ɫ���õ�������ť
    SetBtnKindColor(button, TViewState.Pressed, C1, C2, C3);
    SetBtnKindColor(button, TViewState.Focused, C1, C2, C3);
    SetBtnKindColor(button, TViewState.Hovered, C1, C2, C3);
    SetBtnKindColor(button, TViewState.Selected, C1, C2, C3);

    if IsLightColor(LButtonColor) then
      color20 := DarkenColor(LButtonColor, 20)
    else
      color20 := LightenColor(LButtonColor, 20);

    if IsLightColor(LButtonColor) then
      color40 := DarkenColor(LButtonColor, 40)
    else
      color40 := LightenColor(LButtonColor, 40);

    if IsLightColor(LButtonColor) then
      color50 := DarkenColor(LButtonColor, 50)
    else
      color50 := LightenColor(LButtonColor, 50);

    if LOutLine then
    begin
      SetBtnKindColor(button, TViewState.Pressed, LButtonColor, LFontColor, color50);
      SetBtnKindColor(button, TViewState.Hovered, LButtonColor, LFontColor, TAlphaColors.Null);
      SetBtnKindColor(button, TViewState.Focused, LButtonColor, LFontColor, color20);
    end
    else
    begin
      SetBtnKindColor(button, TViewState.Pressed, color20, LFontColor, color50);
      // �����ͣ��ť��Ч���Ͱ���һ��
      SetBtnKindColor(button, TViewState.Hovered, color20, LFontColor, color40);
      SetBtnKindColor(button, TViewState.Focused, color20, LFontColor, color20);
    end;
  end;
end;

class procedure TTextviewstyle.SetBtnKindColor(button: TTextView; ViewState: TViewState; btncolor, FontColor, BorderColor: TAlphaColor);
var
  Border: TViewBorder;
begin
  Border := TDrawableBorder(button.Background).Border; // �õ��߿�
  Border.Color.SetColor(ViewState, BorderColor);
  button.TextSettings.Color.SetColor(ViewState, FontColor);
  button.Background.SetColor(ViewState, btncolor);
end;

class procedure TTextviewstyle.SetButtonStyle(button: TTextView; const AFamily, AClass, AAppearance: Integer);
var
  AFamilystr, AClassstr, AAppearancestr: string;
begin
  AFamilystr := GetFAMILYI(AFamily);
  AClassstr := GetFAMILYAllClass(AFamilystr)[AClass];
  AAppearancestr := GetFAMILYAAppearance(AFamilystr)[AAppearance];
  SetButtonStyle(button, AFamilystr, AClassstr, AAppearancestr);
end;

class procedure TTextviewstyle.SetTextViewStyle(TextView: TTextView; const AFamily, AClass: string);
var
  I: Integer;
  Json: TJSONObject;
  fcolorstr: string;
  bkcolorstr: string;
  Border: TViewBorder;
begin
  TextView.Background.ItemDefault.Kind := TViewBrushKind.Solid;
  TextView.TextSettings.Font.Style := [Tfontstyle.fsBold]; // Ĭ�����ּӴ�
  TextView.TextSettings.Gravity := TLayoutGravity.Center;

  Border := TDrawableBorder(TextView.Background).Border; // �õ��߿�
  Border.Style := TViewBorderStyle.RectBorder;

  with TextView.Background do
  begin
    if SameText('CN', AFamily) then
    begin
      GetJson(CNColorJson, CNColorJsonTxt);
      for I := 0 to CNColorJson.Count - 1 do
      begin
        Json := CNColorJson.Items[I] as TJSONObject;
        if SameText(Json.GetValue<string>('name'), AClass) then
        begin
          bkcolorstr := Json.s['bkcolor'];
          fcolorstr := Json.s['fcolor'];
          ItemDefault.Color := HtmlToColor(bkcolorstr);
          TextView.TextSettings.Color.Default := HtmlToColor(fcolorstr);
          Break;
        end;
      end;
    end
    else if SameText('JP', AFamily) then
    begin
      GetJson(JPColorJson, JPColorjsonTxt);
      for I := 0 to JPColorJson.Count - 1 do
      begin
        Json := JPColorJson.Items[I] as TJSONObject;
        if SameText(Json.GetValue<string>('name'), AClass) then
        begin
          bkcolorstr := Json.s['bkcolor'];
          fcolorstr := Json.s['fcolor'];
          ItemDefault.Color := HtmlToColor(bkcolorstr);
          TextView.TextSettings.Color.Default := HtmlToColor(fcolorstr);
          Break;
        end;
      end;
    end
  end;
end;

class procedure TTextviewstyle.SetButtonStyle(button: TTextView; const AFamily, AClass, AAppearance: string);
var
  Border: TViewBorder;
begin
  // ͨ����ʽ�޸�
  // Բ��
  // if button is TButtonView then
  begin
    button.Background.XRadius := 5;
    button.Background.yRadius := 5;
  end;
  button.TextSettings.Gravity := TLayoutGravity.Center;

  Border := TDrawableBorder(button.Background).Border; // �õ��߿�
  Border.Style := TViewBorderStyle.RectBorder;

  if SameText(BOOTSTRAP_FAMILY, AFamily) then
  begin
    setBootstrap(button, AClass, AAppearance);
  end
  else if SameText(ANGULAR_LIGHT_FAMILY, AFamily) then
  begin
    setAngularlight(button, AClass, AAppearance);
  end
  else if SameText(ANGULAR_DARK_FAMILY, AFamily) then
  begin
    setAngularDark(button, AClass, AAppearance);
  end;
end;

end.

