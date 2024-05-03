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
  Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1072#1103' '#8470'1'
  ClientHeight = 701
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseDown = Dragging
  OnShow = FormShow
  TextHeight = 15
  object pNav: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 701
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
    object spdbtnTurningGrille: TSpeedButton
      Tag = 1
      AlignWithMargins = True
      Left = 3
      Top = 8
      Width = 179
      Height = 50
      Action = actChooseOption
      Align = alTop
      ImageIndex = 5
      ImageName = 'gantt_chart_48px'
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
    object spdbtnVigenere: TSpeedButton
      Tag = 2
      AlignWithMargins = True
      Left = 3
      Top = 64
      Width = 179
      Height = 50
      Action = actChooseOption
      Align = alTop
      ImageIndex = 2
      ImageName = 'grid_48'
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
      ExplicitLeft = 0
      ExplicitTop = 8
      ExplicitWidth = 185
    end
    object spdbtnExit: TSpeedButton
      AlignWithMargins = True
      Left = 3
      Top = 643
      Width = 179
      Height = 50
      Action = actClose
      Align = alBottom
      Caption = #1042#1099#1093#1086#1076
      ImageIndex = 4
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
      Top = 587
      Width = 179
      Height = 50
      Action = actChooseOption
      Align = alBottom
      Caption = #1057#1087#1088#1072#1074#1082#1072
      ImageIndex = 6
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
      ExplicitLeft = 0
      ExplicitTop = 486
    end
  end
  object pgcSections: TPageControl
    Left = 185
    Top = 0
    Width = 635
    Height = 701
    ActivePage = tsVigenere
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
      Caption = 'tsWelcome'
      ImageIndex = 3
      TabVisible = False
      OnMouseDown = Dragging
      object esvimgBackground: TEsVirtualImage
        Left = 0
        Top = 0
        Width = 627
        Height = 691
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
        Top = 380
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
    object tsTurningGrille: TTabSheet
      Caption = #1052#1077#1090#1086#1076' '#1087#1086#1074#1086#1088#1072#1095#1080#1074#1072#1102#1097#1077#1081#1089#1103' '#1088#1077#1096#1077#1090#1082#1080
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -22
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabVisible = False
      OnMouseDown = Dragging
      object lbGrilleTitle: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 486
        Height = 37
        Align = alTop
        Alignment = taCenter
        Caption = #1052#1077#1090#1086#1076' '#1087#1086#1074#1086#1088#1072#1095#1080#1074#1072#1102#1097#1077#1081#1089#1103' '#1088#1077#1096#1077#1090#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseDown = Dragging
      end
      object lbGrilleInput: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 46
        Width = 255
        Height = 37
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = #1058#1077#1082#1089#1090' '#1076#1083#1103' '#1086#1073#1088#1072#1073#1086#1090#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnMouseDown = Dragging
      end
      object pGrilleOptions: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 598
        Width = 621
        Height = 90
        Align = alBottom
        BevelOuter = bvNone
        Padding.Left = 40
        Padding.Right = 10
        ShowCaption = False
        TabOrder = 2
        object spdbtnGrilleLoadFile: TSpeedButton
          Tag = 1
          Left = 320
          Top = 0
          Width = 140
          Height = 90
          Action = actLoadFile
          Align = alLeft
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 290
        end
        object spdbtnGrilleSaveFile: TSpeedButton
          Tag = 1
          Left = 460
          Top = 0
          Width = 140
          Height = 90
          Action = actSaveFile
          Align = alLeft
          Enabled = False
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 430
        end
        object spdbtnGrilleDecode: TSpeedButton
          Tag = 1
          Left = 180
          Top = 0
          Width = 140
          Height = 90
          Action = actDecode
          Align = alLeft
          Enabled = False
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 174
        end
        object spdbtnGrilleEncode: TSpeedButton
          Tag = 2
          Left = 40
          Top = 0
          Width = 140
          Height = 90
          Action = actEncode
          Align = alLeft
          Enabled = False
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 18
        end
      end
      object pGrilleResults: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 291
        Width = 621
        Height = 298
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pGrilleResults'
        Color = 6574152
        Padding.Left = 10
        Padding.Top = 10
        Padding.Right = 10
        Padding.Bottom = 10
        ParentBackground = False
        ShowCaption = False
        TabOrder = 1
        OnMouseDown = Dragging
        object shpGrilleBevel: TShape
          AlignWithMargins = True
          Left = 304
          Top = 38
          Width = 13
          Height = 247
          Margins.Left = 20
          Margins.Top = 5
          Margins.Right = 20
          Align = alClient
          Brush.Color = 3548700
          Pen.Style = psClear
          Shape = stRoundRect
          OnMouseDown = Dragging
          ExplicitLeft = 286
          ExplicitWidth = 27
          ExplicitHeight = 229
        end
        object lbGrilleResults: TLabel
          Left = 10
          Top = 10
          Width = 540
          Height = 23
          Align = alTop
          Caption = #9#1047#1072#1096#1080#1092#1088#1086#1074#1072#1085#1085#1099#1081#9#9#9#1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1085#1085#1099#1081
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnMouseDown = Dragging
        end
        object mmGrilleEncode: TMemo
          AlignWithMargins = True
          Left = 13
          Top = 43
          Width = 268
          Height = 235
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alLeft
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 6574152
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object mmGrilleDecode: TMemo
          AlignWithMargins = True
          Left = 340
          Top = 43
          Width = 268
          Height = 235
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alRight
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 6574152
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
      object pGrilleInput: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 89
        Width = 621
        Height = 196
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pVigenereInput'
        Color = 6574152
        Padding.Left = 10
        Padding.Right = 10
        ParentBackground = False
        ShowCaption = False
        TabOrder = 0
        object mmGrilleInput: TMemo
          AlignWithMargins = True
          Left = 13
          Top = 10
          Width = 595
          Height = 176
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 6574152
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
          OnChange = actCheckInputFieldExecute
        end
      end
    end
    object tsVigenere: TTabSheet
      Caption = #1040#1083#1075#1086#1088#1080#1090#1084' '#1042#1080#1078#1077#1085#1077#1088#1072
      ImageIndex = 1
      TabVisible = False
      OnMouseDown = Dragging
      object lbVigenereTitle: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 621
        Height = 37
        Align = alTop
        Alignment = taCenter
        Caption = #1040#1083#1075#1086#1088#1080#1090#1084' '#1042#1080#1078#1077#1085#1077#1088#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseDown = Dragging
        ExplicitWidth = 274
      end
      object lbVigenereKey: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 46
        Width = 607
        Height = 37
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = #1050#1083#1102#1095#1077#1074#1072#1103' '#1092#1088#1072#1079#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnMouseDown = Dragging
        ExplicitWidth = 205
      end
      object shpVigenereKey: TShape
        AlignWithMargins = True
        Left = 3
        Top = 89
        Width = 350
        Height = 45
        Align = alTop
        Brush.Color = 6574152
        Constraints.MaxWidth = 350
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitLeft = 6
        ExplicitTop = 97
      end
      object lbVigenereInput: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 140
        Width = 607
        Height = 37
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = #1058#1077#1082#1089#1090' '#1076#1083#1103' '#1086#1073#1088#1072#1073#1086#1090#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnMouseDown = Dragging
        ExplicitWidth = 255
      end
      object eVigenereKey: TEdit
        AlignWithMargins = True
        Left = 10
        Top = 95
        Width = 335
        Height = 31
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
        ParentFont = False
        TabOrder = 0
        OnChange = actCheckInputFieldExecute
      end
      object pVigenereOptions: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 598
        Width = 621
        Height = 90
        Align = alBottom
        BevelOuter = bvNone
        Padding.Left = 40
        Padding.Right = 10
        ShowCaption = False
        TabOrder = 3
        object spdbtnVigenereSaveFile: TSpeedButton
          Tag = 2
          Left = 460
          Top = 0
          Width = 140
          Height = 90
          Action = actSaveFile
          Align = alLeft
          Enabled = False
          Flat = True
          ExplicitLeft = 430
        end
        object spdbtnVigenereEncode: TSpeedButton
          Tag = 2
          Left = 40
          Top = 0
          Width = 140
          Height = 90
          Action = actEncode
          Align = alLeft
          Enabled = False
          Flat = True
          ExplicitLeft = 10
        end
        object spdbtnVigenereLoadFile: TSpeedButton
          Tag = 2
          Left = 320
          Top = 0
          Width = 140
          Height = 90
          Action = actLoadFile
          Align = alLeft
          Flat = True
          ExplicitLeft = 290
        end
        object spdbtnVigenereDecode: TSpeedButton
          Tag = 2
          Left = 180
          Top = 0
          Width = 140
          Height = 90
          Action = actDecode
          Align = alLeft
          Enabled = False
          Flat = True
          ExplicitLeft = 150
        end
      end
      object pVigenereResults: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 349
        Width = 621
        Height = 225
        Align = alTop
        BevelOuter = bvNone
        Color = 6574152
        Padding.Left = 10
        Padding.Top = 10
        Padding.Right = 10
        Padding.Bottom = 10
        ParentBackground = False
        ShowCaption = False
        TabOrder = 2
        OnMouseDown = Dragging
        object lbVigenereResults: TLabel
          Left = 10
          Top = 10
          Width = 601
          Height = 23
          Align = alTop
          Caption = #9#1047#1072#1096#1080#1092#1088#1086#1074#1072#1085#1085#1099#1081#9#9#9#1056#1072#1089#1096#1080#1092#1088#1086#1074#1072#1085#1085#1099#1081
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnMouseDown = Dragging
          ExplicitWidth = 540
        end
        object shpVigenereBevel: TShape
          AlignWithMargins = True
          Left = 304
          Top = 38
          Width = 13
          Height = 174
          Margins.Left = 20
          Margins.Top = 5
          Margins.Right = 20
          Align = alClient
          Brush.Color = 3548700
          Pen.Style = psClear
          Shape = stRoundRect
          OnMouseDown = Dragging
          ExplicitLeft = 286
          ExplicitWidth = 11
          ExplicitHeight = 229
        end
        object mmVigenereEncode: TMemo
          AlignWithMargins = True
          Left = 13
          Top = 43
          Width = 268
          Height = 162
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alLeft
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 6574152
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object mmVigenereDecode: TMemo
          AlignWithMargins = True
          Left = 340
          Top = 43
          Width = 268
          Height = 162
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alRight
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 6574152
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
      object pVigenereInput: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 183
        Width = 621
        Height = 160
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pVigenereInput'
        Color = 6574152
        Padding.Left = 10
        Padding.Right = 10
        ParentBackground = False
        ShowCaption = False
        TabOrder = 1
        object mmVigenereInput: TMemo
          AlignWithMargins = True
          Left = 13
          Top = 10
          Width = 595
          Height = 140
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 6574152
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
          OnChange = actCheckInputFieldExecute
        end
      end
    end
    object tsHelp: TTabSheet
      Caption = 'tsHelp'
      ImageIndex = 2
      TabVisible = False
      OnMouseDown = Dragging
      object lbHelp: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 621
        Height = 656
        Align = alClient
        AutoSize = False
        Caption = 
          #9#9#9#1044#1086#1073#1088#1086' '#1087#1086#1078#1072#1083#1086#1074#1072#1090#1100'!'#13#10#13#10#1044#1072#1085#1085#1072#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1072' '#1087#1086#1079#1074#1086#1083#1103#1077#1090' '#1079#1072#1096#1080#1092#1088#1086#1074#1072#1090#1100' /' +
          ' '#1076#1077#1096#1080#1092#1088#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1089#1090' '#1084#1077#1090#1086#1076#1086#1084' '#1087#1086#1074#1086#1088#1072#1095#1080#1074#1072#1102#1097#1077#1081#1089#1103' '#1088#1077#1096#1077#1090#1082#1080' '#1080' '#1072#1083#1075#1086#1088#1080#1090#1084 +
          #1086#1084' '#1042#1080#1078#1077#1085#1077#1088#1072'. '#13#10#13#10#1044#1072#1083#1077#1077' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1099' '#1087#1088#1086#1075#1088#1072#1084#1084#1085#1099#1077' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103':'#13#10#1052#1077 +
          #1090#1086#1076' '#1087#1086#1074#1086#1088#1072#1095#1080#1074#1072#1102#1097#1077#1081#1089#1103' '#1088#1077#1096#1077#1090#1082#1080':'#13#10#8226' '#1090#1077#1082#1089#1090' '#1085#1072' '#1072#1085#1075#1083#1080#1081#1089#1082#1086#1084' '#1103#1079#1099#1082#1077';'#13#10#8226' '#1087 +
          #1088#1080' '#1076#1083#1080#1085#1077' '#1090#1077#1082#1089#1090#1072' '#1084#1077#1085#1077#1077' 16 '#1089#1080#1084#1074#1086#1083#1086#1074' '#1086#1085' '#1076#1086#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1087#1086#1089#1083#1077#1076#1086#1074#1072#1090#1077#1083#1100#1085#1086 +
          ' '#1089#1080#1084#1074#1086#1083#1072#1084#1080' '#1072#1085#1075#1083#1080#1081#1089#1082#1086#1075#1086' '#1072#1083#1092#1072#1074#1080#1090#1072' '#1076#1086' 16 '#1089#1080#1084#1074#1086#1083#1086#1074';'#13#10#1040#1083#1075#1086#1088#1080#1090#1084' '#1042#1080#1078#1077#1085#1077 +
          #1088#1072':'#13#10#8226' '#1090#1077#1082#1089#1090' '#1085#1072' '#1088#1091#1089#1089#1082#1086#1084' '#1103#1079#1099#1082#1077';'#13#10#8226' '#1087#1088#1086#1075#1088#1077#1089#1089#1080#1074#1085#1099#1081' '#1082#1083#1102#1095';'#13#10#13#10#1050#1083#1102#1095#1077#1074#1072 +
          #1103' '#1092#1088#1072#1079#1072' '#1079#1072#1076#1072#1077#1090#1089#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1084' '#1089' '#1082#1083#1072#1074#1080#1072#1090#1091#1088#1091'. '#1058#1077#1082#1089#1090' '#1076#1083#1103' '#1096#1080#1092#1088#1086#1074#1072#1085#1080 +
          #1103'/'#1076#1077#1096#1080#1092#1088#1080#1088#1086#1074#1072#1085#1080#1103' '#1084#1086#1078#1085#1086' '#1074#1074#1077#1089#1090#1080' '#1082#1072#1082' '#1089' '#1092#1072#1081#1083#1072', '#1090#1072#1082' '#1080' '#1089' '#1082#1083#1072#1074#1080#1072#1090#1091#1088#1099'.'#13#10 +
          #13#10#1042#1040#1046#1053#1054': '#1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1080#1075#1085#1086#1088#1080#1088#1086#1091#1077#1090' '#1074#1089#1077' '#1089#1080#1084#1074#1086#1083#1099', '#1085#1077' '#1103#1074#1083#1103#1102#1097#1080#1077#1089#1103' '#1073#1091#1082#1074#1072#1084 +
          #1080' '#1079#1072#1076#1072#1085#1085#1086#1075#1086' '#1072#1083#1092#1072#1074#1080#1090#1072', '#1080' '#1096#1080#1092#1088#1091#1077#1090'/'#1076#1077#1096#1080#1092#1088#1080#1088#1091#1077#1090' '#1090#1086#1083#1100#1082#1086' '#1090#1077#1082#1089#1090' '#1085#1072' '#1079#1072#1076#1072 +
          #1085#1085#1086#1084' '#1103#1079#1099#1082#1077'. '
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
        Top = 665
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
  object actmngActions: TActionManager
    Left = 96
    Top = 16
    StyleName = 'Platform Default'
    object actClose: TAction
      Category = 'Form'
      OnExecute = actCloseExecute
    end
    object actChooseOption: TAction
      Category = 'Form'
      OnExecute = actChooseOptionExecute
    end
    object actEncode: TAction
      Category = 'Ciphering'
      OnExecute = actEncodeExecute
    end
    object actLoadFile: TAction
      Category = 'Ciphering'
      OnExecute = actLoadFileExecute
    end
    object actSaveFile: TAction
      Category = 'Ciphering'
      OnExecute = actSaveFileExecute
    end
    object actDecode: TAction
      Category = 'Ciphering'
      OnExecute = actDecodeExecute
    end
    object actCheckInputField: TAction
      Category = 'Ciphering'
      OnExecute = actCheckInputFieldExecute
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
        CollectionName = 'spotted_patterns_48px'
        Name = 'spotted_patterns_48px'
      end
      item
        CollectionIndex = 2
        CollectionName = 'grid_48'
        Name = 'grid_48'
      end
      item
        CollectionIndex = 3
        CollectionName = 'load_file'
        Name = 'load_file'
      end
      item
        CollectionIndex = 4
        CollectionName = 'exit_48'
        Name = 'exit_48'
      end
      item
        CollectionIndex = 5
        CollectionName = 'gantt_chart_48px'
        Name = 'gantt_chart_48px'
      end
      item
        CollectionIndex = 6
        CollectionName = 'help_48'
        Name = 'help_48'
      end>
    ImageCollection = dtmdImages.imgclcButtons
    Width = 48
    Height = 48
    Left = 57
    Top = 13
  end
  object opntxtLoadFile: TOpenTextFileDialog
    Filter = 'Text Files|*.txt'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1072#1081#1083' '#1076#1083#1103' '#1074#1074#1086#1076#1072
    Left = 128
    Top = 80
  end
  object svtxtSaveFile: TSaveTextFileDialog
    DefaultExt = 'txt'
    FileName = 'out'
    Title = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1072#1081#1083' '#1076#1083#1103' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
    Left = 88
    Top = 80
  end
end
