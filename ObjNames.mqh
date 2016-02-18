//|                                                      ProjectName |
//|                                      Copyright 2012, CompanyName |
//|                                       http://www.companyname.net |


#define BG_COLOR                          clrLightGray
#define BOLRDER_COLOR                     clrGray
#define CONTROLS_BUTTONBGCOLOR_ENABLED    clrLightGray 
#define CONTROLS_BUTTONBGCOLOR_DISABLED   clrSilver 
#define CONTROLS_FONTCOLOR                clrBlack
#define CONTROLS_FONTCOLOR_DISABLED       clrDarkGray
#define CONTROLS_LISTBGCOLOR              clrWhite
#define CONTROLS_LISTFONTCOLOR            clrBlack
#define CONTROLS_LISTBORDERCOLOR          clrDarkGray
#define CONTORLS_LISTHIGHLIGHTCOLOR       clrLightBlue
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Exe
  {
public:
                     Exe(void);
                    ~Exe(void);
   void              ChangeSymbol(string pair) { ChartSetSymbolPeriod(0,pair,Period());};
   void              ChangePeriod(int n);

   void              ChangeShowAskLine(void);
   void              ChangeShowBidLine(void);
   void              ChangeTradeLevels(void);
   void              ChangeOHLC(void);
   void              ChangeDateScale(void);
   void              ChangePriceScale(void);
   void              ChangeGrid(void);
   void              ChanePeriodSep(void);
   void              ChangeVolume(void);
   void              ChangeScaleFix(void);
   void              SelectAll(void);
   void              ChangeChartType(void);
   void              ChangeChartLine(void);
   void              ChangeShift(void);
   void              ChangeAutoscroll(void);
   void              ChangeZoomIn(void);
   void              ChangeZoomOut(void);
   void              ChangeMouseScroll(void);
   void              RemoveAll(void);

  };
Exe::Exe(void) {}
Exe::~Exe(void) {}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Exe::ChangeMouseScroll(void)
  {
   if(!ChartGetInteger(0,CHART_MOUSE_SCROLL)) ChartSetInteger(0,CHART_MOUSE_SCROLL,true);
   else ChartSetInteger(0,CHART_MOUSE_SCROLL,false);
   ChartRedraw(0);
   return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Exe::ChangeZoomOut(void)
  {
   long q;
   ChartGetInteger(0,CHART_SCALE,0,q);
   if( q == 0) return;
   ChartSetInteger(0,CHART_SCALE,q-1);
   ChartRedraw(0);
   return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Exe::ChangeZoomIn(void)
  {
   long q;
   ChartGetInteger(0,CHART_SCALE,0,q);
   if( q == 5) return;
   ChartSetInteger(0,CHART_SCALE,q+1);
   ChartRedraw(0);
   return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Exe::ChangeAutoscroll(void)
  {
   if(!ChartGetInteger(0,CHART_AUTOSCROLL)) ChartSetInteger(0,CHART_AUTOSCROLL,true);
   else ChartSetInteger(0,CHART_AUTOSCROLL,false);
   ChartRedraw(0);
   return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Exe::ChangeShift(void)
  {
   if(!ChartGetInteger(0,CHART_SHIFT)) ChartSetInteger(0,CHART_SHIFT,true);
   else ChartSetInteger(0,CHART_SHIFT,false);
   ChartRedraw(0);
   return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Exe::ChangeChartType(void)
  {
   switch((ENUM_CHART_MODE)ChartGetInteger(0,CHART_MODE))
     {
      case 0: ChartSetInteger(0,CHART_MODE,CHART_CANDLES); break;
      case 1: ChartSetInteger(0,CHART_MODE,CHART_LINE); break;
      case 2: ChartSetInteger(0,CHART_MODE,CHART_BARS); break;
      default: break;
     }
   ChartRedraw(0);
   return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Exe::SelectAll(void)
  {
   for(int i=0;i<ObjectsTotal();i++)
     {
      string name=ObjectName(i);
      if(name!="OpenPanel" && StringFind(name,"Panel")==-1) ObjectSetInteger(0,name,OBJPROP_SELECTED,true);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Exe::RemoveAll(void)
  {
   for(int i=ObjectsTotal();i>=0;i--)
     {
      string name=ObjectName(i);
      if(name!="OpenPanel") ObjectDelete(0,name);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Exe::ChangeScaleFix(void)
  {
   if(!ChartGetInteger(0,CHART_SCALEFIX)) ChartSetInteger(0,CHART_SCALEFIX,true);
   else ChartSetInteger(0,CHART_SCALEFIX,false);
   ChartRedraw(0); return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Exe::ChangeVolume(void)
  {
   if(!ChartGetInteger(0,CHART_SHOW_VOLUMES)) ChartSetInteger(0,CHART_SHOW_VOLUMES,true);
   else ChartSetInteger(0,CHART_SHOW_VOLUMES,false);
   ChartRedraw(0); return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Exe::ChanePeriodSep(void)
  {
   if(!ChartGetInteger(0,CHART_SHOW_PERIOD_SEP)) ChartSetInteger(0,CHART_SHOW_PERIOD_SEP,true);
   else ChartSetInteger(0,CHART_SHOW_PERIOD_SEP,false);
   ChartRedraw(0);  return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Exe::ChangeGrid(void)
  {
   if(!ChartGetInteger(0,CHART_SHOW_GRID)) ChartSetInteger(0,CHART_SHOW_GRID,true);
   else ChartSetInteger(0,CHART_SHOW_GRID,false);
   ChartRedraw(0);    return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Exe::ChangePriceScale(void)
  {
   if(!ChartGetInteger(0,CHART_SHOW_PRICE_SCALE)) ChartSetInteger(0,CHART_SHOW_PRICE_SCALE,true);
   else ChartSetInteger(0,CHART_SHOW_PRICE_SCALE,false);
   ChartRedraw(0);  return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Exe::ChangeDateScale(void)
  {
   if(!ChartGetInteger(0,CHART_SHOW_DATE_SCALE)) ChartSetInteger(0,CHART_SHOW_DATE_SCALE,true);
   else ChartSetInteger(0,CHART_SHOW_DATE_SCALE,false);
   ChartRedraw(0);   return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Exe::ChangeOHLC(void)
  {
   if(!ChartGetInteger(0,CHART_SHOW_OHLC)) ChartSetInteger(0,CHART_SHOW_OHLC,true);
   else ChartSetInteger(0,CHART_SHOW_OHLC,false);
   ChartRedraw(0);  return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Exe::ChangeTradeLevels(void)
  {
   if(!ChartGetInteger(0,CHART_SHOW_TRADE_LEVELS)) ChartSetInteger(0,CHART_SHOW_TRADE_LEVELS,true);
   else ChartSetInteger(0,CHART_SHOW_TRADE_LEVELS,false);
   ChartRedraw(0);  return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Exe::ChangePeriod(int n)
  {
   int  Periods[9]={PERIOD_M1,PERIOD_M5,PERIOD_M15,PERIOD_M30,PERIOD_H1,PERIOD_H4,PERIOD_D1,PERIOD_W1,PERIOD_MN1};
   ChartSetSymbolPeriod(0,Symbol(),Periods[n]);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Exe::ChangeShowBidLine(void)
  {
   if(!ChartGetInteger(0,CHART_SHOW_BID_LINE)) ChartSetInteger(0,CHART_SHOW_BID_LINE,true);
   else ChartSetInteger(0,CHART_SHOW_BID_LINE,false);
   ChartRedraw(0);   return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Exe::ChangeShowAskLine(void)
  {
   if(!ChartGetInteger(0,CHART_SHOW_ASK_LINE)) ChartSetInteger(0,CHART_SHOW_ASK_LINE,true);
   else ChartSetInteger(0,CHART_SHOW_ASK_LINE,false);
   ChartRedraw(0);   return;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class names
  {
private:
   string            ObjName;
   int               ListLineCount;
   bool              ListScrolStatus;

   void              CreateRect(string name,int x,int y,int xsize,int ysize,int style,int border,int width,color col);
   void              CreateRadioButton(string name,int x,int y,int state);
   void              CreateLabel(string name,string txt,int x,int y,int FontSize,string font,color c);
   void              CreateButton(string name,string txt,int x,int y,int xsize,int ysize,int fontsize);
   void              CreateBitmap(string name,int x,int y,int sizex,int sizey,string dest);
   void              CreateBitmapLabelCheckBox(string name,int x,int y,int state);
   void              CreateBitmapLabel(string name,int x,int y,int xsize,int ysize,int state,string txton,string txtoff);

public:
                     names(void);
                    ~names(void);
   void              SetName(string t) { ObjName=t; };
   void              Remove(void);
   string            Name_Cog(void) { return("OpenPanel"); };
   string            Name_Background(void) { return(ObjName+"background"); };
   string            Name_BackgroundBorder1(void) { return(ObjName+"backgroundB1"); };
   string            Name_BackgroundBorder2(void) { return(ObjName+"backgroundB2"); };
   string            Name_KeyDialog(void) { return(ObjName+"KeySetup"); };
   string            Name_KeyDialogOk(void) { return(ObjName+"KeySetupOk"); };

   string            Name_KeyDialogCancel(void) { return(ObjName+"KeySetupCancel"); };
   string            Name_KeyDialogLabel(int n) { return(ObjName+"KeySetupLabel"+(string)n); };
   string            Name_RadioButton(void) { return(ObjName+"Radio"); };
   string            Name_RadioButton(int i) { return(ObjName+"Radio"+(string)i); };
   string            Name_RadioButtonRect(int i) { return(ObjName+"Radio"+(string)i+"Rect"); };
   string            Name_RadioButtonLabel(int i) { return(ObjName+"Radio"+(string)i+"Label"); };
   string            Name_CheckButton() { return(ObjName+"CheckBox"); };
   string            Name_CheckButtonMain(int i) { return(ObjName+"CheckBox"+(string)i+"Main"); };
   string            Name_CheckButtonLabel(int i) { return(ObjName+"CheckBox"+(string)i+"Label"); };
   string            Name_CheckButtonRect(int i) { return(ObjName+"CheckBox"+(string)i+"Rect"); };

   string            Name_ListScrollBox() { return(ObjName+"Scrollbox"); };
   string            Name_ListScrollWheel(int i) { return(ObjName+"ScrollWheel"+(string)i); };
   string            Name_ListRect(void) { return(ObjName+"Rect"); };
   string            Name_ListRect(int i) { return(ObjName+"Rect"+(string)i); };
   string            Name_ListLabel(int i) { return(ObjName+"Label"+(string)i); };
   string            Name_PanelColor(void) { return(ObjName+"Color"); };
   string            Name_PanelWidth(void) { return(ObjName+"Width"); };
   string            Name_PanelStyle(void) { return(ObjName+"Style"); };
   string            Name_PanelObjDelete(void) { return(ObjName+"ObjDelete"); };
   string            Name_Note(void) { return("OnScreenNote"); };

   void              CreateNote(string txt);
   void              RemoveNote(void) { ObjectDelete(0,Name_Note()); };

   void              CreateCog();
   void              CogChangeState(int n) { ObjectSetInteger(0,Name_Cog(),OBJPROP_STATE,n); };
   void              CreateBackground(int x,int y,int xsize,int ysize);
   void              BackgroundChangeYsize(int value);
   void              CreateDotRect(int n,int x,int y,int xsize,int ysize);
   bool              Status() { if(ObjectFind(0,Name_Background())!=-1) return(true); else return(false); };
   void              ShowDemo(int x,int y);

   //----------- CHECK
   void              CheckCreate(int i,int x,int y,int xsize,string txt,string tooltip,int state);
   int               CheckChangeState(int n);
   int               CheckReturnState(int n) { return((int)ObjectGetInteger(0,Name_CheckButtonMain(n),OBJPROP_STATE)); };
   void              CheckRemove(int n);
   //----------- RADIO
   void              RadioCreate(int i,int x,int y,string txt,int state);
   int               RadioState(string sparam);

   //----------- BUTTONS
   void              ButtonCreate(string name,int x,int y,int xsize,int ysize,string txt);
   void              ButtonEnable(void);
   void              ButtonDisable(void);
   bool              ButtonState(void);
   void              ButtonResetState(void);
   void              ButtonMove(int value);

   //----------- List
   void              ListCreate(int x,int y,int xsize,int count);
   void              ListCreate2(int x,int y,int xsize,int count);
   void              ListCreateSroll(int X,int Y,int ysize);
   int               ListScrollGetPoz(int total);
   int               ListResturnLineCount(void) { return(ListLineCount); };
   int               ListHighlightLine(string sparam);
   int               ListHighlightLine2(string sparam);
   void              ListSetLineValue(int i,string text,string tip);
   void              ListScrollReset();
   void              ListScrollStatusSet(bool status) { ListScrolStatus=status; };
   bool              ListScrollStatusGet(void) { return(ListScrolStatus); };

   //------------ Panel - Colors
   bool              PanelStatus(void) { if(ObjectFind(0,Name_Background())!=-1) return(true); else return(false); };
   void              PanelColorsCreate(int x,int y);
   color             PanelColorCode(int nr);
   void              PanelExeColors(string sparam);
   void              PanelStyleCreate(int x,int y);
   void              PanelExeStyle(string sparam);
   void              PanelWidthCreate(int x,int y);
   void              PanelExeWidth(string sparam);
   void              PanelObjDeleteCreate(int x,int y);
   string            ReturnObjDeletePos(int nr);
   void              PanelExeObjeDelete(string sparam);

   //------------ Create ShortCut Dialog
   void              KeySetupCreate(string text);
   void              KeySetupRemove();
   void              KeyButtonOkEnable(void);
   void              KeyButtonOkDisable(void);
   bool              KeyButtonOkState(void);
   void              KeyButtonOkResetState(void);
   void              KeyShowInput(string txt) { ObjectSetString(0,Name_KeyDialogLabel(2),OBJPROP_TEXT,txt); }
   void              KeyShowInput2(string txt) { ObjectSetString(0,Name_KeyDialogLabel(3),OBJPROP_TEXT,txt); }
   bool              KeyMenuStatus(void) { if(ObjectFind(0,Name_KeyDialog()+"b0")!=-1) return(true); else return(false); };

  };


names::names(void) {}
names::~names(void) {}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::CreateNote(string txt)
  {
   CreateLabel(Name_Note(),txt,30,15,8,"Arial",clrGray);
   ObjectSetInteger(0,Name_Note(),OBJPROP_CORNER,1);
   ObjectSetInteger(0,Name_Note(),OBJPROP_ANCHOR,ANCHOR_RIGHT);
   ObjectSetInteger(0,Name_Note(),OBJPROP_BACK,true);
   EventSetTimer(1);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::CreateCog(void)
  {
   CreateBitmapLabel(Name_Cog(),25,5,16,18,0,"::Cog1.bmp","::Cog2.bmp");
   ObjectSetInteger(0,Name_Cog(),OBJPROP_CORNER,1);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::Remove(void)
  {
   for(int i=ObjectsTotal();i>=0;i--)
     {
      string name=ObjectName(i);
      if(StringFind(name,ObjName)!=-1) ObjectDelete(0,name);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::CreateBackground(int x,int y,int xsize,int ysize)
  {
   CreateRect(Name_BackgroundBorder1(),x-2,y-2,xsize+4,ysize+4,STYLE_SOLID,BORDER_FLAT,0,BOLRDER_COLOR);
   CreateRect(Name_BackgroundBorder2(),x-2,y-2,xsize+3,ysize+3,STYLE_SOLID,BORDER_FLAT,0,BG_COLOR);
   CreateRect(Name_Background(),x,y,xsize,ysize,STYLE_SOLID,BORDER_RAISED,1,BG_COLOR);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::CreateDotRect(int n,int x,int y,int xsize,int ysize)
  {
   CreateRect(Name_Background()+(string)n,x,y,xsize,ysize,STYLE_DOT,BORDER_FLAT,1,BG_COLOR);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::BackgroundChangeYsize(int value)
  {

   long sy=ObjectGetInteger(0,Name_Background(),OBJPROP_YSIZE);
   ObjectSetInteger(0,Name_Background(),OBJPROP_YSIZE,sy+value);
   sy=ObjectGetInteger(0,Name_BackgroundBorder1(),OBJPROP_YSIZE);
   ObjectSetInteger(0,Name_BackgroundBorder1(),OBJPROP_YSIZE,sy+value);
   sy=ObjectGetInteger(0,Name_BackgroundBorder2(),OBJPROP_YSIZE);
   ObjectSetInteger(0,Name_BackgroundBorder2(),OBJPROP_YSIZE,sy+value);

   sy=ObjectGetInteger(0,Name_Background()+"2",OBJPROP_YSIZE);
   ObjectSetInteger(0,Name_Background()+"2",OBJPROP_YSIZE,sy+value);

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::RadioCreate(int i,int x,int y,string txt,int state)
  {
   CreateRect(Name_RadioButtonRect(i),x-10,y-4,90,20,STYLE_SOLID,BORDER_FLAT,0,BG_COLOR);
   CreateLabel(Name_RadioButtonLabel(i),txt,x+20,y+6,10,"Arial",CONTROLS_FONTCOLOR);
   ObjectSetString(0,Name_RadioButtonLabel(i),OBJPROP_TOOLTIP,txt);
   ObjectSetInteger(0,Name_RadioButtonLabel(i),OBJPROP_ANCHOR,ANCHOR_LEFT);
   CreateBitmapLabel(Name_RadioButton(i),x,y,12,12,state,"::RadioButtonOn.bmp","::RadioButtonOff.bmp");
   ObjectSetString(0,Name_RadioButton(i),OBJPROP_TOOLTIP,txt);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int names::RadioState(string sparam)
  {
   int n;
   for(int i=1;i<4;i++)
     {
      string name=Name_RadioButton(i);
      if(StringFind(sparam,name)!=-1) { n=i; ObjectSetInteger(0,name,OBJPROP_STATE,0); }
      else ObjectSetInteger(0,name,OBJPROP_STATE,1);
     }

   return(n);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::CheckCreate(int i,int x,int y,int xsize,string txt,string tooltip,int state)
  {
   CreateRect(Name_CheckButtonRect(i),x,y,xsize,20,STYLE_SOLID,BORDER_FLAT,0,BG_COLOR);
   CreateLabel(Name_CheckButtonLabel(i),txt,x+25,y+3,9,"Arial",CONTROLS_FONTCOLOR);
   CreateBitmapLabel(Name_CheckButtonMain(i),x+5,y+4,13,13,state,"::CheckboxOn.bmp","::CheckboxOff.bmp");

   ObjectSetString(0,Name_CheckButtonLabel(i),OBJPROP_TOOLTIP,tooltip);
   ObjectSetString(0,Name_CheckButtonMain(i),OBJPROP_TOOLTIP,tooltip);

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int names::CheckChangeState(int i)
  {
   string name=Name_CheckButtonMain(i);
   long a= ObjectGetInteger(0,name,OBJPROP_STATE);
   int s = 0;
   if(a==0) s=1;
   ObjectSetInteger(0,name,OBJPROP_STATE,s);
   return(s);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::CheckRemove(int n)
  {
   ObjectDelete(0,Name_CheckButtonLabel(n));
   ObjectDelete(0,Name_CheckButtonRect(n));
   ObjectDelete(0,Name_CheckButtonMain(n));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::ButtonCreate(string name,int x,int y,int xsize,int ysize,string txt)
  {
   ObjName=name;
   CreateRect(Name_BackgroundBorder1(),x-1,y-1,xsize+2,ysize+2,STYLE_SOLID,BORDER_RAISED,1,BOLRDER_COLOR);
   CreateButton(Name_Background(),txt,x,y,xsize,ysize,8);
  }



void names::ButtonEnable() { ObjectSetInteger(0,Name_Background(),OBJPROP_BGCOLOR,CONTROLS_BUTTONBGCOLOR_ENABLED); ObjectSetInteger(0,Name_Background(),OBJPROP_COLOR,CONTROLS_FONTCOLOR); }
void names::ButtonDisable() { ObjectSetInteger(0,Name_Background(),OBJPROP_BGCOLOR,CONTROLS_BUTTONBGCOLOR_DISABLED); ObjectSetInteger(0,Name_Background(),OBJPROP_COLOR,CONTROLS_FONTCOLOR_DISABLED); }
bool names::ButtonState() { if(ObjectGetInteger(0,Name_Background(),OBJPROP_BGCOLOR)==CONTROLS_BUTTONBGCOLOR_ENABLED) return(true); else return(false); }
void names::ButtonResetState() { ObjectSetInteger(0,Name_Background(),OBJPROP_STATE,0); }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::ButtonMove(int value)
  {

   long sy=ObjectGetInteger(0,Name_Background(),OBJPROP_YDISTANCE);
   ObjectSetInteger(0,Name_Background(),OBJPROP_YDISTANCE,sy+value);
   sy=ObjectGetInteger(0,Name_BackgroundBorder1(),OBJPROP_YDISTANCE);
   ObjectSetInteger(0,Name_BackgroundBorder1(),OBJPROP_YDISTANCE,sy+value);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::ListCreate(int x,int y,int xsize,int count)
  {
   ListLineCount=count;
   int ysize=count*16+7;

   CreateRect(Name_BackgroundBorder1(),x-2,y-2,xsize+4,ysize+4,STYLE_SOLID,BORDER_FLAT,0,CONTROLS_LISTBORDERCOLOR);
   CreateRect(Name_Background(),x,y,xsize,ysize,STYLE_SOLID,BORDER_SUNKEN,1,CONTROLS_LISTBGCOLOR);

   ListCreateSroll(x+xsize-26,y+4,ysize);

   for(int i=0;i<count;i++)
     {
      CreateRect(Name_ListRect(i),x+4,y+2+i*16,xsize-32,18,STYLE_SOLID,BORDER_FLAT,0,CONTROLS_LISTBGCOLOR);
      CreateLabel(Name_ListLabel(i),"",x+10,y+4+i*16,9,"Arial",CONTROLS_LISTFONTCOLOR);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::ListCreate2(int x,int y,int xsize,int count)
  {
   ListLineCount=count;
   int ysize=count*16+7;
   CreateRect(Name_BackgroundBorder1(),x-2,y-2,xsize+4,ysize+4,STYLE_SOLID,BORDER_FLAT,0,CONTROLS_LISTBORDERCOLOR);
   CreateRect(Name_Background(),x,y,xsize,ysize,STYLE_SOLID,BORDER_SUNKEN,1,CONTROLS_LISTBGCOLOR);

   ListCreateSroll(x+xsize-26,y+4,ysize);

   for(int i=0;i<count;i++)
     {
      CreateRect(Name_ListRect(i)+"1",x+4,y+2+i*16,int(xsize*0.65),18,STYLE_SOLID,BORDER_FLAT,0,CONTROLS_LISTBGCOLOR);
      CreateRect(Name_ListRect(i)+"2",int(x+xsize*0.58),y+2+i*16,int(xsize*0.305),18,STYLE_SOLID,BORDER_FLAT,0,CONTROLS_LISTBGCOLOR);
      CreateLabel(Name_ListLabel(i)+"1","",x+10,y+4+i*16,9,"Arial",CONTROLS_LISTFONTCOLOR);
      ObjectSetString(0,Name_ListLabel(i)+"1",OBJPROP_TOOLTIP,"-");
      CreateLabel(Name_ListLabel(i)+"2","",int(x+xsize*0.72),y+4+i*16,9,"Arial",CONTROLS_LISTFONTCOLOR);
      ObjectSetInteger(0,Name_ListLabel(i)+"2",OBJPROP_ANCHOR,ANCHOR_UPPER);
      ObjectSetString(0,Name_ListLabel(i)+"2",OBJPROP_TOOLTIP,"-");
     }
   CreateRect(Name_BackgroundBorder2(),int(x+xsize*0.58),y+4,1,ysize-8,STYLE_SOLID,BORDER_FLAT,0,BG_COLOR);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::ListCreateSroll(int X,int Y,int ysize)
  {
   CreateRect(Name_ListScrollBox(),X,Y,1,ysize-8,STYLE_SOLID,BORDER_FLAT,0,BG_COLOR);
   CreateRect(Name_ListScrollWheel(0),X+4,Y+1,17,33,STYLE_SOLID,BORDER_FLAT,0,BOLRDER_COLOR);
   CreateRect(Name_ListScrollWheel(1),X+3,Y,17,33,STYLE_SOLID,BORDER_FLAT,0,BG_COLOR);
   CreateRect(Name_ListScrollWheel(2),X+5,Y+2,14,30,STYLE_SOLID,BORDER_RAISED,1,BG_COLOR);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int names::ListScrollGetPoz(int total)
  {
   if(total<=ListLineCount) return(0);
   long y=ObjectGetInteger(0,Name_ListScrollWheel(0),OBJPROP_YDISTANCE)-ObjectGetInteger(0,Name_ListScrollBox(),OBJPROP_YDISTANCE)-2;
   double size=(ObjectGetInteger(0,Name_ListScrollBox(),OBJPROP_YSIZE)-ObjectGetInteger(0,Name_ListScrollWheel(0),OBJPROP_YSIZE)-2)/((double)(total-ListLineCount));
   if(y == 0 || size ==0) return(0);
   int rez=int(y/size);
   return(rez);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::ListScrollReset()
  {
   string name=Name_ListScrollBox();
   long y=ObjectGetInteger(0,name,OBJPROP_YDISTANCE)+2;
   name=Name_ListScrollWheel(0);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y-1);
   name=Name_ListScrollWheel(1);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y-2);
   name=Name_ListScrollWheel(2);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int names::ListHighlightLine(string sparam)
  {
   if(StringFind(sparam,"#")!=-1)
     {
      for(int i=0;i<ListLineCount;i++) ObjectSetInteger(0,Name_ListRect(i),OBJPROP_BGCOLOR,CONTROLS_LISTBGCOLOR);
      return(-1);
     }

   int n=(int)StringSubstr(sparam,StringLen(sparam)-1,1);
   for(int i=0;i<ListLineCount;i++)
     {
      ObjectSetInteger(0,Name_ListRect(i),OBJPROP_BGCOLOR,CONTROLS_LISTBGCOLOR);
      if(n==i) ObjectSetInteger(0,Name_ListRect(i),OBJPROP_BGCOLOR,CONTORLS_LISTHIGHLIGHTCOLOR);
     }
   return(n);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int names::ListHighlightLine2(string sparam)
  {
   if(StringFind(sparam,"#")!=-1)
     {
      for(int i=0;i<ListLineCount;i++)
        {
         ObjectSetInteger(0,Name_ListRect(i)+"1",OBJPROP_BGCOLOR,CONTROLS_LISTBGCOLOR);
         ObjectSetInteger(0,Name_ListRect(i)+"2",OBJPROP_BGCOLOR,CONTROLS_LISTBGCOLOR);
        }
      return(-1);
     }

   int n=(int)StringSubstr(sparam,StringLen(sparam)-2,1);
   for(int i=0;i<ListLineCount;i++)
     {
      string name=Name_ListRect(i);
      ObjectSetInteger(0,Name_ListRect(i)+"1",OBJPROP_BGCOLOR,CONTROLS_LISTBGCOLOR);
      ObjectSetInteger(0,Name_ListRect(i)+"2",OBJPROP_BGCOLOR,CONTROLS_LISTBGCOLOR);
      if(n==i)
        {
         ObjectSetInteger(0,Name_ListRect(i)+"1",OBJPROP_BGCOLOR,CONTORLS_LISTHIGHLIGHTCOLOR);
         ObjectSetInteger(0,Name_ListRect(i)+"2",OBJPROP_BGCOLOR,CONTORLS_LISTHIGHLIGHTCOLOR);
        }
     }
   return(n);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::ListSetLineValue(int i,string text,string tip)
  {
   ObjectSetString(0,Name_ListLabel(i),OBJPROP_TEXT,text);
   ObjectSetString(0,Name_ListRect(i),OBJPROP_TOOLTIP,tip);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::PanelColorsCreate(int x,int y)
  {
   ObjName="ColorPanel";
   int xsize = 186;
   int ysize = 57;
   long cx = ChartGetInteger(0,CHART_WIDTH_IN_PIXELS);
   long cy = ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS);
   if(x>cx || y>cy || x<0 || y<0) { x=20; y=20; }
   if((x+xsize)>cx) x=(int)cx-xsize;
   if((y+ysize)>cy) y=(int)cy-ysize;

   CreateBackground(x,y,xsize,ysize);

   int j=0;
   int jx=0;
   for(int i=0;i<16;i++)
     {
      if(i>=8) { j=1;  jx=176; }
      int x_ = x+5 + i*22-jx;
      int y_ = y+5 + +j*25;
      CreateRect(Name_PanelColor()+"B1#"+(string)i,x_+1,y_+1,19,20,STYLE_SOLID,BORDER_FLAT,0,clrWhiteSmoke);
      CreateRect(Name_PanelColor()+"B2#"+(string)i,x_+3,y_+3,19,20,STYLE_SOLID,BORDER_FLAT,0,clrDarkGray);
      CreateRect(Name_PanelColor()+"B3#"+(string)i,x_+3,y_+3,17,18,STYLE_SOLID,BORDER_FLAT,0,clrLightGray);
      CreateRect(Name_PanelColor()+"#"+(string)i,x_+5,y_+5,13,14,STYLE_SOLID,BORDER_FLAT,0,PanelColorCode(i));
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
color names::PanelColorCode(int nr)
  {
   color c[16]={ clrBlack,clrGray,clrMaroon,clrOlive,clrGreen,clrTeal,clrNavy,clrPurple,clrWhite,clrSilver,clrRed,clrYellow,clrLime,clrAqua,clrBlue,clrFuchsia };
   return(c[nr]);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::PanelExeColors(string sparam)
  {
   int poz=StringFind(sparam,"#");
   int n=(int)StringSubstr(sparam,poz+1,StringLen(sparam)-poz);

   for(int i=0;i<ObjectsTotal();i++)
     {
      string name=ObjectName(i);
      if(ObjectGetInteger(0,name,OBJPROP_SELECTED))
        {
         ObjectSetInteger(0,name,OBJPROP_COLOR,PanelColorCode(n));
         ObjectSetInteger(0,name,OBJPROP_LEVELCOLOR,PanelColorCode(n));
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::PanelStyleCreate(int x,int y)
  {
   ObjName="StylePanel";
   int xsize = 79;
   int ysize = 100;
   int cx =(int) ChartGetInteger(0,CHART_WIDTH_IN_PIXELS);
   int cy = (int) ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS);
   if(x>cx || y>cy || x<0 || y<0) { x=20; y=20; }
   if((x+xsize)>cx) x=cx-xsize;
   if((y+ysize)>cy) y=cy-ysize;

   CreateBackground(x,y,xsize,ysize);
   y+=5;
   x+=5;
   for(int i=0;i<5;i++)
     {
      int y_=y+i*19-3;
      CreateRect(Name_PanelStyle()+"B1#"+(string)i,x-1,y_+1,69,17,STYLE_SOLID,BORDER_FLAT,0,clrWhiteSmoke);
      CreateRect(Name_PanelStyle()+"B2#"+(string)i,x+1,y_+3,69,17,STYLE_SOLID,BORDER_FLAT,0,clrDarkGray);
      CreateRect(Name_PanelStyle()+"B3#"+(string)i,x+1,y_+3,67,15,STYLE_SOLID,BORDER_FLAT,0,clrLightGray);
      CreateBitmap(Name_PanelStyle()+"#"+(string)i,x+5,y_+7,59,8,"::Style"+(string)i+".bmp");
      ObjectSetString(0,Name_PanelStyle()+"#"+(string)i,OBJPROP_TOOLTIP,"Style "+(string)i);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::PanelExeStyle(string sparam)
  {
   int poz=StringFind(sparam,"#");
   int n=(int)StringSubstr(sparam,poz+1,1);

   for(int i=0;i<ObjectsTotal();i++)
     {
      string name=ObjectName(i);
      if(ObjectGetInteger(0,name,OBJPROP_SELECTED))
        {
         ObjectSetInteger(0,name,OBJPROP_STYLE,n);
         ObjectSetInteger(0,name,OBJPROP_LEVELSTYLE,n);
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::PanelExeWidth(string sparam)
  {
   int poz=StringFind(sparam,"#");
   int n=(int)StringSubstr(sparam,poz+1,1);
   for(int i=0;i<ObjectsTotal();i++)
     {
      string name=ObjectName(i);
      if(ObjectGetInteger(0,name,OBJPROP_SELECTED))
        {
         ObjectSetInteger(0,name,OBJPROP_WIDTH,n+1);
         ObjectSetInteger(0,name,OBJPROP_LEVELWIDTH,n+1);
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::PanelWidthCreate(int x,int y)
  {
   ObjName="WidthPanel";
   int xsize = 79;
   int ysize = 100;
   int cx =(int) ChartGetInteger(0,CHART_WIDTH_IN_PIXELS);
   int cy = (int) ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS);
   if(x>cx || y>cy || x<0 || y<0) { x=20; y=20; }
   if((x+xsize)>cx) x=cx-xsize;
   if((y+ysize)>cy) y=cy-ysize;

   CreateBackground(x,y,xsize,ysize);
   y+=5;
   x+=5;
   for(int i=0;i<5;i++)
     {
      int y_=y+i*19-3;
      CreateRect(Name_PanelWidth()+"B1#"+(string)i,x-1,y_+1,69,17,STYLE_SOLID,BORDER_FLAT,0,clrWhiteSmoke);
      CreateRect(Name_PanelWidth()+"B2#"+(string)i,x+1,y_+3,69,17,STYLE_SOLID,BORDER_FLAT,0,clrDarkGray);
      CreateRect(Name_PanelWidth()+"B3#"+(string)i,x+1,y_+3,67,15,STYLE_SOLID,BORDER_FLAT,0,clrLightGray);
      CreateBitmap(Name_PanelWidth()+"#"+(string)i,x+5,y_+7,59,8,"::Width"+(string)i+".bmp");
      ObjectSetString(0,Name_PanelWidth()+"#"+(string)i,OBJPROP_TOOLTIP,"Width "+(string)i);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::PanelObjDeleteCreate(int x,int y)
  {
   ObjName="ObjDeletePanel";
   int xsize = 79;
   int ysize = 158;
   int cx = (int)ChartGetInteger(0,CHART_WIDTH_IN_PIXELS);
   int cy = (int)ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS);
   if(x>cx || y>cy || x<0 || y<0) { x=20; y=20; }
   if((x+xsize)>cx) x=cx-xsize;
   if((y+ysize)>cy) y=cy-ysize;

   CreateBackground(x,y,xsize,ysize);
   y+=5;
   x+=5;

   for(int i=0;i<8;i++)
     {
      int y_=y+i*19 -3;
      CreateRect(Name_PanelObjDelete()+"B1#"+(string)i,x-1,y_+1,69,17,STYLE_SOLID,BORDER_FLAT,0,clrWhiteSmoke);
      CreateRect(Name_PanelObjDelete()+"B2#"+(string)i,x+1,y_+3,69,17,STYLE_SOLID,BORDER_FLAT,0,clrDarkGray);
      CreateRect(Name_PanelObjDelete()+"B3#"+(string)i,x+1,y_+3,67,15,STYLE_SOLID,BORDER_FLAT,0,clrLightGray);

      CreateLabel(Name_PanelObjDelete()+"LB3#"+(string)i,ReturnObjDeletePos(i),x+35,y_+11,8,"Arial",clrBlack);
      ObjectSetInteger(0,Name_PanelObjDelete()+"LB3#"+(string)i,OBJPROP_ANCHOR,ANCHOR_CENTER);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string names::ReturnObjDeletePos(int nr)
  {
   string label[8]={"All","Vertical l.","Horizontal l.","Trend l.","Fibonnacci","Arrows","Shapes","Text"};
   return(label[nr]);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::KeySetupCreate(string text)
  {

   int x=(int)ObjectGetInteger(0,Name_Background(),OBJPROP_XDISTANCE)+5;
   int y=(int)ObjectGetInteger(0,Name_Background(),OBJPROP_YDISTANCE)+5;
   int ysize = (int)ObjectGetInteger(0,Name_Background(),OBJPROP_YSIZE)-10;
   int xsize = 265;

   CreateRect(Name_KeyDialog()+"b2",x-2,y-2,xsize+4,ysize+4,STYLE_SOLID,BORDER_FLAT,0,BOLRDER_COLOR);
   CreateRect(Name_KeyDialog()+"b1",x-2,y-2,xsize+3,ysize+3,STYLE_SOLID,BORDER_FLAT,0,BG_COLOR);
   CreateRect(Name_KeyDialog()+"b0",x,y,xsize,ysize,STYLE_SOLID,BORDER_RAISED,1,BG_COLOR);

   CreateLabel(Name_KeyDialogLabel(1),text,x+xsize/2,int(y+ysize*0.1),14,"Arial",clrBlack);
   ObjectSetInteger(0,Name_KeyDialogLabel(1),OBJPROP_ANCHOR,ANCHOR_UPPER);
   CreateLabel(Name_KeyDialogLabel(2),"Press a key",x+xsize/2,int(y+ysize*0.35),18,"Arial",clrBlack);
   ObjectSetInteger(0,Name_KeyDialogLabel(2),OBJPROP_ANCHOR,ANCHOR_UPPER);

   CreateLabel(Name_KeyDialogLabel(3),"",x+xsize/2,int(y+ysize*0.55),8,"Arial",clrRed);
   ObjectSetInteger(0,Name_KeyDialogLabel(3),OBJPROP_ANCHOR,ANCHOR_UPPER);

   CreateButton(Name_KeyDialogOk(),"Ok",int(x+xsize*0.5-85),int(y+ysize*0.6),80,30,8);
   CreateButton(Name_KeyDialogCancel(),"Cancel",int(x+xsize*0.5+5),int(y+ysize*0.6),80,30,8);
   KeyButtonOkDisable();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::KeySetupRemove()
  {
   for(int i=ObjectsTotal();i>=0;i--)
     {
      string name=ObjectName(i);
      if(StringFind(name,Name_KeyDialog())!=-1) ObjectDelete(0,name);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::ShowDemo(int x,int y)
  {
   string name=Name_Background()+"DEMO";
   CreateLabel(name,"DEMO",x,y,11,"Arial Black",clrGold);
   ObjectSetDouble(0,name,OBJPROP_ANGLE,-30);
  }

void names::KeyButtonOkEnable(void) { ObjectSetInteger(0,Name_KeyDialogOk(),OBJPROP_BGCOLOR,CONTROLS_BUTTONBGCOLOR_ENABLED); ObjectSetInteger(0,Name_KeyDialogOk(),OBJPROP_COLOR,CONTROLS_FONTCOLOR); }
void names::KeyButtonOkDisable(void) { ObjectSetInteger(0,Name_KeyDialogOk(),OBJPROP_BGCOLOR,CONTROLS_BUTTONBGCOLOR_DISABLED); ObjectSetInteger(0,Name_KeyDialogOk(),OBJPROP_COLOR,CONTROLS_FONTCOLOR_DISABLED); }
bool names::KeyButtonOkState(void) { if(ObjectGetInteger(0,Name_KeyDialogOk(),OBJPROP_BGCOLOR)==CONTROLS_BUTTONBGCOLOR_ENABLED) return(true); else return(false); }
void names::KeyButtonOkResetState(void) { ObjectSetInteger(0,Name_KeyDialogOk(),OBJPROP_STATE,0); }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::CreateLabel(string name,string txt,int x,int y,int FontSize,string font,color c)
  {
   ObjectDelete(0,name);
   ObjectCreate(0,name,OBJ_LABEL,0,0,0,0);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(0,name,OBJPROP_CORNER,0);
   ObjectSetInteger(0,name,OBJPROP_ANCHOR,0);
   ObjectSetString(0,name,OBJPROP_TEXT,txt);
   ObjectSetString(0,name,OBJPROP_FONT,font);
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSize);
   ObjectSetInteger(0,name,OBJPROP_COLOR,c);
   ObjectSetInteger(0,name,OBJPROP_BACK,false);
   ObjectSetString(0,name,OBJPROP_TOOLTIP,NULL);
   ObjectSetInteger(0,name,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,true);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::CreateRect(string name,int x,int y,int xsize,int ysize,int style,int border,int width,color col)
  {
   ObjectDelete(0,name);
   ObjectCreate(0,name,OBJ_RECTANGLE_LABEL,0,0,0,0);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(0,name,OBJPROP_XSIZE,xsize);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,ysize);
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,col);
   ObjectSetInteger(0,name,OBJPROP_BORDER_TYPE,border);
   ObjectSetInteger(0,name,OBJPROP_STYLE,style);
   ObjectSetInteger(0,name,OBJPROP_BACK,false);
   ObjectSetString(0,name,OBJPROP_TEXT,"");
   ObjectSetInteger(0,name,OBJPROP_WIDTH,width);
   ObjectSetInteger(0,name,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,true);

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::CreateButton(string name,string txt,int X,int Y,int xsize,int ysize,int fontsize)
  {
   ObjectDelete(0,name);
   ObjectCreate(0,name,OBJ_BUTTON,0,0,0,0);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,X);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,Y);
   ObjectSetInteger(0,name,OBJPROP_XSIZE,xsize);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,ysize);
   ObjectSetInteger(0,name,OBJPROP_CORNER,0);
   ObjectSetString(0,name,OBJPROP_TEXT,txt);
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,fontsize);
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,CONTROLS_BUTTONBGCOLOR_ENABLED);
   ObjectSetInteger(0,name,OBJPROP_COLOR,CONTROLS_FONTCOLOR);
   ObjectSetInteger(0,name,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,true);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::CreateBitmap(string name,int x,int y,int sizex,int sizey,string dest)
  {
   ObjectDelete(0,name);
   ObjectCreate(0,name,OBJ_BITMAP_LABEL,0,0,0);
   ObjectSetString(0,name,OBJPROP_BMPFILE,1,dest);
   ObjectSetString(0,name,OBJPROP_BMPFILE,0,dest);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(0,name,OBJPROP_XSIZE,sizex);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,sizey);
   ObjectSetInteger(0,name,OBJPROP_XOFFSET,0);
   ObjectSetInteger(0,name,OBJPROP_YOFFSET,0);
   ObjectSetInteger(0,name,OBJPROP_COLOR,clrBlack);
   ObjectSetInteger(0,name,OBJPROP_STYLE,STYLE_SOLID);
   ObjectSetInteger(0,name,OBJPROP_CORNER,0);
   ObjectSetInteger(0,name,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,true);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void names::CreateBitmapLabel(string name,int x,int y,int xsize,int ysize,int state,string txton,string txtoff)
  {
   ObjectCreate(0,name,OBJ_BITMAP_LABEL,0,0,0);
   ObjectSetString(0,name,OBJPROP_BMPFILE,1,txton);
   ObjectSetString(0,name,OBJPROP_BMPFILE,0,txtoff);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(0,name,OBJPROP_XSIZE,xsize);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,ysize);
   ObjectSetInteger(0,name,OBJPROP_XOFFSET,0);
   ObjectSetInteger(0,name,OBJPROP_YOFFSET,0);
   ObjectSetInteger(0,name,OBJPROP_COLOR,clrBlack);
   ObjectSetInteger(0,name,OBJPROP_STYLE,STYLE_SOLID);
   ObjectSetInteger(0,name,OBJPROP_STATE,state);
   ObjectSetInteger(0,name,OBJPROP_CORNER,0);
   ObjectSetInteger(0,name,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,true);
  }
//+------------------------------------------------------------------+
