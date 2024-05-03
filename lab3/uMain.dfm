object frmMain: TfrmMain
  Left = 0
  Top = 0
  Margins.Left = 0
  Margins.Top = 0
  Margins.Right = 0
  Margins.Bottom = 0
  AlphaBlend = True
  AlphaBlendValue = 245
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1072#1103' '#8470'2'
  ClientHeight = 937
  ClientWidth = 820
  Color = 3548700
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  OnMouseDown = Dragging
  OnShow = FormShow
  TextHeight = 15
  object pNav: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 937
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'pNav'
    Color = 4928301
    Padding.Top = 5
    Padding.Bottom = 5
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    OnMouseDown = Dragging
    object spdbtnRSA: TSpeedButton
      Tag = 1
      AlignWithMargins = True
      Left = 3
      Top = 8
      Width = 179
      Height = 50
      Action = actChooseOption
      Align = alTop
      Caption = 'Encrypt'
      ImageIndex = 4
      ImageName = 'query_80px'
      Images = vilButtons_48
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16481792
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Margin = 10
      ParentFont = False
      Spacing = 20
    end
    object spdbtnExit: TSpeedButton
      AlignWithMargins = True
      Left = 3
      Top = 879
      Width = 179
      Height = 50
      Action = actClose
      Align = alBottom
      Caption = #1042#1099#1093#1086#1076
      ImageIndex = 2
      ImageName = 'exit_48'
      Images = vilButtons_48
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16481792
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Margin = 10
      ParentFont = False
      Spacing = 20
      ExplicitLeft = 4
      ExplicitTop = 542
    end
    object spdbtnHelp: TSpeedButton
      Tag = 3
      AlignWithMargins = True
      Left = 3
      Top = 823
      Width = 179
      Height = 50
      Action = actChooseOption
      Align = alBottom
      Caption = #1057#1087#1088#1072#1074#1082#1072
      ImageIndex = 3
      ImageName = 'help_48'
      Images = vilButtons_48
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16481792
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Margin = 10
      ParentFont = False
      Spacing = 20
      ExplicitLeft = 4
      ExplicitTop = 762
    end
    object spdbtnRSADecode: TSpeedButton
      Tag = 2
      AlignWithMargins = True
      Left = 3
      Top = 64
      Width = 179
      Height = 50
      Action = actChooseOption
      Align = alTop
      Caption = 'Decrypt'
      ImageIndex = 4
      ImageName = 'query_80px'
      Images = vilButtons_48
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16481792
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Margin = 10
      ParentFont = False
      Spacing = 20
      ExplicitLeft = 7
      ExplicitTop = 88
    end
  end
  object pgcSections: TPageControl
    Left = 185
    Top = 0
    Width = 635
    Height = 937
    ActivePage = tsRSADecryption
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Style = tsFlatButtons
    TabOrder = 1
    OnMouseDown = Dragging
    object tsWelcome: TTabSheet
      Caption = #1053#1072#1095#1072#1083#1086
      ImageIndex = 3
      TabVisible = False
      OnMouseDown = Dragging
      object esvimgBackground: TEsVirtualImage
        Left = 0
        Top = 0
        Width = 627
        Height = 927
        Align = alClient
        ImageCollection = dtmdImages.imgclcPictures
        ImageIndex = 0
        ImageName = 'welcome'
        OnMouseDown = Dragging
        ExplicitLeft = -1
        ExplicitTop = 2
        ExplicitHeight = 865
      end
      object lbWelcome: TLabel
        Left = 223
        Top = 468
        Width = 182
        Height = 62
        Caption = 'Anticlown'#13#10'    Ciphering'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'JetBrains Mono SemiBold'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseDown = Dragging
      end
    end
    object tsRSAEncryption: TTabSheet
      Caption = #1064#1080#1092#1088#1086#1074#1072#1085#1080#1077' RSA'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -22
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabVisible = False
      OnMouseDown = Dragging
      object lb_Encr_Title: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 621
        Height = 37
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #1064#1080#1092#1088#1086#1074#1072#1085#1080#1077' '#1089' '#1087#1086#1084#1086#1097#1100#1102' RSA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseDown = Dragging
        ExplicitWidth = 486
      end
      object shp_Encr_Q: TShape
        AlignWithMargins = True
        Left = 10
        Top = 173
        Width = 614
        Height = 45
        Margins.Left = 10
        Align = alTop
        Brush.Color = 6574152
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitTop = 92
      end
      object shp_Encr_P: TShape
        AlignWithMargins = True
        Left = 10
        Top = 84
        Width = 614
        Height = 45
        Margins.Left = 10
        Align = alTop
        Brush.Color = 6574152
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitTop = 92
      end
      object shp_Encr_Key: TShape
        AlignWithMargins = True
        Left = 10
        Top = 262
        Width = 614
        Height = 45
        Margins.Left = 10
        Align = alTop
        Brush.Color = 6574152
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitTop = 92
      end
      object lb_Encr_KeyRequirement: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 224
        Width = 66
        Height = 32
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = #1050#1083#1102#1095':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnMouseDown = Dragging
      end
      object lb_Encr_QRequirement: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 135
        Width = 196
        Height = 32
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = #1055#1088#1086#1089#1090#1086#1077' '#1095#1080#1089#1083#1086' Q:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnMouseDown = Dragging
      end
      object lb_Encr_PRequirement: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 46
        Width = 191
        Height = 32
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = #1055#1088#1086#1089#1090#1086#1077' '#1095#1080#1089#1083#1086' P:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnMouseDown = Dragging
      end
      object lb_Encr_Result: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 351
        Width = 106
        Height = 32
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnMouseDown = Dragging
      end
      object lb_Encr_FileName: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 313
        Width = 61
        Height = 32
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = #1060#1072#1081#1083':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnMouseDown = Dragging
      end
      object lb_Encr_PublicKeyAndModule: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 789
        Width = 7
        Height = 32
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnMouseDown = Dragging
      end
      object p_Encr_Options: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 834
        Width = 621
        Height = 90
        Align = alBottom
        BevelOuter = bvNone
        Padding.Left = 40
        Padding.Right = 10
        ShowCaption = False
        TabOrder = 0
        ExplicitTop = 817
        object spdbtn_Encr_LoadFile: TSpeedButton
          Tag = 1
          Left = 180
          Top = 0
          Width = 140
          Height = 90
          Action = act_Encr_LoadFile
          Align = alLeft
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 186
        end
        object spdbtn_Encr_SaveFile: TSpeedButton
          Tag = 1
          Left = 320
          Top = 0
          Width = 140
          Height = 90
          Action = act_Encr_SaveFile
          Align = alLeft
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 326
        end
        object spdbtn_Encr_Encrypt: TSpeedButton
          Tag = 2
          Left = 40
          Top = 0
          Width = 140
          Height = 90
          Action = act_Encr_Encrypt
          Align = alLeft
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 34
        end
      end
      object p_Encr_Result: TPanel
        AlignWithMargins = True
        Left = 10
        Top = 389
        Width = 607
        Height = 394
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pVigenereInput'
        Color = 6574152
        Padding.Left = 10
        Padding.Right = 10
        ParentBackground = False
        ShowCaption = False
        TabOrder = 1
        object mm_Encr_Result: TMemo
          AlignWithMargins = True
          Left = 13
          Top = 10
          Width = 581
          Height = 374
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 6574152
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object e_Encr_P: TEdit
        AlignWithMargins = True
        Left = 16
        Top = 91
        Width = 601
        Height = 31
        Margins.Left = 10
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = 6574152
        Constraints.MaxWidth = 601
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -22
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 4
        NumbersOnly = True
        ParentFont = False
        TabOrder = 2
      end
      object e_Encr_Q: TEdit
        AlignWithMargins = True
        Left = 16
        Top = 180
        Width = 601
        Height = 31
        Margins.Left = 10
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = 6574152
        Constraints.MaxWidth = 601
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -22
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 4
        NumbersOnly = True
        ParentFont = False
        TabOrder = 3
      end
      object e_Encr_Key: TEdit
        AlignWithMargins = True
        Left = 16
        Top = 269
        Width = 601
        Height = 31
        Margins.Left = 10
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = 6574152
        Constraints.MaxWidth = 601
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -22
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 5
        NumbersOnly = True
        ParentFont = False
        TabOrder = 4
      end
    end
    object tsRSADecryption: TTabSheet
      Caption = #1044#1077#1096#1080#1092#1088#1080#1088#1086#1074#1072#1085#1080#1077' RSA'
      ImageIndex = 3
      TabVisible = False
      OnMouseDown = Dragging
      object lb_Decr_Title: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 621
        Height = 37
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #1044#1077#1096#1080#1092#1088#1080#1088#1086#1074#1072#1085#1080#1077' '#1089' '#1087#1086#1084#1086#1097#1100#1102' RSA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseDown = Dragging
        ExplicitLeft = 6
        ExplicitTop = 11
      end
      object lb_Decr_KeyRequirement: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 46
        Width = 607
        Height = 32
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = #1050#1083#1102#1095':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnMouseDown = Dragging
        ExplicitWidth = 66
      end
      object shp_Decr_Key: TShape
        AlignWithMargins = True
        Left = 10
        Top = 84
        Width = 614
        Height = 45
        Margins.Left = 10
        Align = alTop
        Brush.Color = 6574152
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitLeft = 13
        ExplicitTop = 92
      end
      object lb_Decr_FileName: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 224
        Width = 607
        Height = 32
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = #1060#1072#1081#1083': '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnMouseDown = Dragging
        ExplicitWidth = 68
      end
      object lb_Decr_ModuleRequirement: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 135
        Width = 607
        Height = 32
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = #1052#1086#1076#1091#1083#1100':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnMouseDown = Dragging
        ExplicitWidth = 91
      end
      object shp_Decr_Module: TShape
        AlignWithMargins = True
        Left = 10
        Top = 173
        Width = 614
        Height = 45
        Margins.Left = 10
        Align = alTop
        Brush.Color = 6574152
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitLeft = 9
        ExplicitTop = 211
      end
      object lb_Decr_Result: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 262
        Width = 607
        Height = 32
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnMouseDown = Dragging
        ExplicitWidth = 106
      end
      object e_Decr_Key: TEdit
        AlignWithMargins = True
        Left = 16
        Top = 91
        Width = 601
        Height = 31
        Margins.Left = 10
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = 6574152
        Constraints.MaxWidth = 601
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -22
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 4
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
      end
      object p_Decr_Options: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 834
        Width = 621
        Height = 90
        Align = alBottom
        BevelOuter = bvNone
        Padding.Left = 40
        Padding.Right = 10
        ShowCaption = False
        TabOrder = 1
        object spdbtn_Decr_LoadFile: TSpeedButton
          Tag = 1
          Left = 180
          Top = 0
          Width = 140
          Height = 90
          Action = act_Decr_LoadFile
          Align = alLeft
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 186
        end
        object spdbtn_Decr_SaveFile: TSpeedButton
          Tag = 1
          Left = 320
          Top = 0
          Width = 140
          Height = 90
          Action = act_Decr_SaveFile
          Align = alLeft
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 326
        end
        object spdbtn_Decr_Decrypt: TSpeedButton
          Tag = 2
          Left = 40
          Top = 0
          Width = 140
          Height = 90
          Action = act_Decr_Decrypt
          Align = alLeft
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 34
        end
      end
      object e_Decr_Module: TEdit
        AlignWithMargins = True
        Left = 16
        Top = 180
        Width = 601
        Height = 31
        Margins.Left = 10
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = 6574152
        Constraints.MaxWidth = 601
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -22
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 4
        NumbersOnly = True
        ParentFont = False
        TabOrder = 2
      end
      object p_Decr_Result: TPanel
        AlignWithMargins = True
        Left = 10
        Top = 300
        Width = 607
        Height = 394
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        BevelOuter = bvNone
        Color = 6574152
        Padding.Left = 10
        Padding.Right = 10
        ParentBackground = False
        ShowCaption = False
        TabOrder = 3
        object mm_Decr_Result: TMemo
          AlignWithMargins = True
          Left = 13
          Top = 10
          Width = 581
          Height = 374
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 6574152
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
    object tsHelp: TTabSheet
      Caption = #1057#1087#1088#1072#1074#1082#1072
      ImageIndex = 2
      TabVisible = False
      OnMouseDown = Dragging
      object lbHelp: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 621
        Height = 892
        Align = alClient
        AutoSize = False
        Caption = 
          #9#9#9#1044#1086#1073#1088#1086' '#1087#1086#1078#1072#1083#1086#1074#1072#1090#1100'!'#13#10#13#10#1044#1072#1085#1085#1072#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1072' '#1087#1086#1079#1074#1086#1083#1103#1077#1090' '#1079#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100' /' +
          ' '#1076#1077#1096#1080#1092#1088#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1089#1090' '#1089#1080#1089#1090#1077#1084#1086#1081' '#1087#1086#1090#1086#1082#1086#1074#1086#1075#1086' '#1096#1080#1092#1088#1086#1074#1072#1085#1080#1103', '#1080#1089#1086#1087#1083#1100#1079#1091#1103' '#1075 +
          #1077#1085#1077#1088#1072#1090#1086#1088' '#1082#1083#1102#1095#1077#1074#1086#1081' '#1087#1086#1089#1083#1077#1076#1086#1074#1072#1090#1077#1083#1100#1085#1086#1089#1090#1080' '#1085#1072' '#1086#1089#1085#1086#1074#1077' '#1083#1080#1085#1077#1081#1085#1086#1075#1086' '#1089#1076#1074#1080#1075#1086#1074 +
          #1086#1075#1086' '#1088#1077#1075#1080#1089#1090#1088#1072' '#1089' '#1086#1073#1088#1072#1090#1085#1086#1081' '#1089#1074#1103#1079#1100#1102' LFSR. '#13#10#13#10#1044#1072#1083#1077#1077' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1099' '#1086#1089#1086#1073 +
          #1077#1085#1085#1086#1089#1090#1080' '#1088#1072#1073#1086#1090#1099' '#1087#1088#1086#1075#1088#1072#1084#1084#1099':'#13#10#8226' '#1053#1072#1095#1072#1083#1100#1085#1086#1077' '#1089#1086#1089#1090#1086#1103#1085#1080#1077' '#1088#1077#1075#1080#1089#1090#1088#1072' '#1074#1074#1086#1076#1080#1090 +
          #1089#1103' '#1089' '#1082#1083#1072#1074#1080#1072#1090#1091#1088#1099';'#13#10#8226' '#1057#1090#1077#1087#1077#1085#1100' '#1084#1085#1086#1075#1086#1095#1083#1077#1085#1072' LFSR = 34;'#13#10#13#10#1042#1040#1046#1053#1054': '#1055#1088#1080' ' +
          #1074#1074#1086#1076#1077' '#1085#1072#1095#1072#1083#1100#1085#1086#1075#1086' '#1089#1086#1089#1090#1086#1103#1085#1080#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1072' '#1080#1075#1085#1086#1088#1080#1088#1086#1091#1077#1090' '#1074#1089#1077' '#1089#1080#1084#1074#1086#1083#1099' '#1082#1088#1086 +
          #1084#1077' 0 '#1080' 1. '
        WordWrap = True
        OnMouseDown = Dragging
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 503
        ExplicitHeight = 69
      end
      object lbCompany: TLabel
        AlignWithMargins = True
        Left = 527
        Top = 901
        Width = 97
        Height = 23
        Align = alBottom
        Alignment = taRightJustify
        Caption = 'Anticlown'#8482
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 8388863
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object vilButtons_48: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'play_48px'
        Name = 'play_48px'
      end
      item
        CollectionIndex = 1
        CollectionName = 'load_file'
        Name = 'load_file'
      end
      item
        CollectionIndex = 2
        CollectionName = 'exit_48'
        Name = 'exit_48'
      end
      item
        CollectionIndex = 3
        CollectionName = 'help_48'
        Name = 'help_48'
      end
      item
        CollectionIndex = 4
        CollectionName = 'query_80px'
        Name = 'query_80px'
      end>
    ImageCollection = dtmdImages.imgclcButtons
    Width = 48
    Height = 48
    Left = 57
    Top = 21
  end
  object dlgLoadFile: TOpenDialog
    Left = 48
    Top = 88
  end
  object dlgSaveFile: TSaveDialog
    Left = 96
    Top = 88
  end
  object actmngActions: TActionManager
    Left = 104
    Top = 24
    StyleName = 'Platform Default'
    object act_Encr_Encrypt: TAction
      Category = 'Encryption'
      OnExecute = act_Encr_EncryptExecute
    end
    object act_Encr_LoadFile: TAction
      Category = 'Encryption'
      OnExecute = Act_Encr_LoadFileExecute
    end
    object act_Encr_SaveFile: TAction
      Category = 'Encryption'
      OnExecute = Act_Encr_SaveFileExecute
    end
    object actClose: TAction
      Category = 'Form'
      OnExecute = actCloseExecute
    end
    object actChooseOption: TAction
      Category = 'Form'
      OnExecute = actChooseOptionExecute
    end
    object act_Decr_Decrypt: TAction
      Category = 'Decryption'
      OnExecute = act_Decr_DecryptExecute
    end
    object act_Decr_LoadFile: TAction
      Category = 'Decryption'
      OnExecute = act_Decr_LoadFileExecute
    end
    object act_Decr_SaveFile: TAction
      Category = 'Decryption'
      OnExecute = act_Decr_SaveFileExecute
    end
  end
end
