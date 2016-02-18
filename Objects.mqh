//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2012, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#resource "RadioButtonOn.bmp"
#resource "RadioButtonOff.bmp"
#resource "Cog1.bmp"
#resource "Cog2.bmp"
#resource "CheckboxOn.bmp"
#resource "CheckboxOff.bmp"
#resource "Style0.bmp"
#resource "Style1.bmp"
#resource "Style2.bmp"
#resource "Style3.bmp"
#resource "Style4.bmp"
#resource "Width0.bmp"
#resource "Width1.bmp"
#resource "Width2.bmp"
#resource "Width3.bmp"
#resource "Width4.bmp"
#include "ObjNames.mqh"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class SKeys
  {
public:
   names             Cog;
   names             Note;
   void              CreateObjects(void);
   void              ChartEvent(const int id,const long &lparam,const double &dparam,const string &sparam);
   void              CheckAndChangePeriod(void);
   void              RemoveAll();
   void              LoadSettings(void);
                     SKeys(void);
                    ~SKeys(void);
private:

   names             MainBox;
   names             KeySetupBox;
   names             ButtonAdd;
   names             ButtonRemove;
   names             ButtonClear;
   names             ButtonOk;
   names             List1;
   names             List2;
   names             PColors;
   names             PStyle;
   names             PWidth;
   names             PObjDelete;
   Exe               Go;

   int               Nr_RadioButton;
   int               Nr_List1Line;
   int               Nr_List2Line;
   int               Nr_List1Start;
   int               Nr_List2Start;

   int               Nr_Key;
   int               Drag_X,Drag_Y;
   string            IndName;
   string            IndShortName;
   int               CheckBoxSet[7];
   int               DB_Int[][2];
   string            DB_Func[];
   bool              DisableChartChangeEvent;

   bool              WaitingForInput;
   bool              mouseflag;
   string            box_name;

   bool              allowdraging;
   bool              ActiveSidePanel;
   int               mx;
   int               my;
   //--- Synch
   void              MoveCharts(int laikas);
   void              ChangeChartProperties(void);

   //--- Controls
   void              RadioSetup(string sparam);
   void              CheckBoxSetup(string sparam);
   void              CreateChecks(void);
   void              List1ScrollUpdate(void);
   void              SetSymbols(void);
   void              SetPeriods(void);
   void              SetProp(void);
   void              ListShowData();

   //--- KeySetup/Exe
   void              CloseKeySetupWindow(void) { MainBox.KeySetupRemove(); };
   void              KeyWaitingForInput(int id,long lparam,string sparam);
   string            KeyChar(int lparam);
   int               SearchDB(long lparam);
   bool              CheckKey(int id);
   void              ExeInput(long lparam);

   //--- Panels
   color             ReturnColorCode(int nr);
   string            ReturnPeriod(int nr);
   int               ReturnProperties(int nr,string &text,string &tip);
   string            ReturnObjDeletePos(int nr);
   void              RemoveActivePanels();

   //--- DB
   void              SaveToDB();
   void              DBclear();
   void              DBremove();
   void              SaveSettings(void);

   string            ReturnSettingsFileName(void) { return(IndShortName+"//Settings.bin"); }

   //---
   void              MoveObjects(int x,int y,string name);
   string            CheckCordinates(int x,int y);
   void              LoadSettingOnAll(void);
   void              CloseMainPanel(void);

  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
SKeys::SKeys(void)
  {
   IndName="AdditionalShortcuts";
   IndShortName="Additional Shortcuts";
   IndicatorShortName(IndShortName);
   LoadSettings();
  }
SKeys::~SKeys(void) {}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
SKeys::RemoveAll(void)
  {
   MainBox.Remove();
   RemoveActivePanels();
   ObjectDelete(0,Cog.Name_Cog());
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::SaveSettings(void)
  {
   int handle=FileOpen(ReturnSettingsFileName(),FILE_WRITE|FILE_BIN|FILE_ANSI);
   if(handle>=0)
     {
      FileWriteInteger(handle,ArraySize(CheckBoxSet),INT_VALUE);
      for(int i=0;i<ArraySize(CheckBoxSet);i++) FileWriteInteger(handle,CheckBoxSet[i],INT_VALUE);
      FileWriteInteger(handle,ArraySize(DB_Func),INT_VALUE);
      for(int i=0;i<ArraySize(DB_Func);i++)
        {
         // if(i>2) break;  //For DEMO
         FileWriteInteger(handle,DB_Int[i][0],INT_VALUE);
         FileWriteInteger(handle,DB_Int[i][1],INT_VALUE);
         int len=StringLen(DB_Func[i]);
         FileWriteInteger(handle,len,INT_VALUE);
         FileWriteString(handle,DB_Func[i],len);

        }
     }
   FileClose(handle);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::LoadSettings(void)
  {
   if(!FileIsExist(ReturnSettingsFileName()))
     {
      ArrayInitialize(CheckBoxSet,0);
      ArrayResize(DB_Int,0);
      ArrayResize(DB_Func,0);
      return;
     }
   int handle=FileOpen(ReturnSettingsFileName(),FILE_READ|FILE_BIN|FILE_ANSI);
   if(handle>=0)
     {
      int csize= FileReadInteger(handle,INT_VALUE);
      for(int i=0;i<csize;i++) CheckBoxSet[i] = FileReadInteger(handle,INT_VALUE);
      int dbsize=FileReadInteger(handle,INT_VALUE);
      ArrayResize(DB_Int,dbsize);
      ArrayResize(DB_Func,dbsize);
      for(int i=0;i<dbsize;i++)
        {
         DB_Int[i][0] = FileReadInteger(handle,INT_VALUE);
         DB_Int[i][1] = FileReadInteger(handle,INT_VALUE);
         int len=FileReadInteger(handle,INT_VALUE);
         DB_Func[i]=FileReadString(handle,len);
        }
      FileClose(handle);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
color SKeys::ReturnColorCode(int nr)
  {
   color c[16]={ clrBlack,clrGray,clrMaroon,clrOlive,clrGreen,clrTeal,clrNavy,clrPurple,clrWhite,clrSilver,clrRed,clrYellow,clrLime,clrAqua,clrBlue,clrFuchsia };
   return(c[nr]);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string SKeys::ReturnPeriod(int nr)
  {
   string Periods[9]={"PERIOD_M1","PERIOD_M5","PERIOD_M15","PERIOD_M30","PERIOD_H1","PERIOD_H4","PERIOD_D1","PERIOD_W1","PERIOD_MN1"};
   return(Periods[nr]);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int SKeys::ReturnProperties(int nr,string &text,string &tip)
  {
   string Prop[24][2]=
     {
      "Bid Line","Display Bid values as a horizontal line in a chart",
      "Ask Line","Display Ask values as a horizontal line in a chart",
      "Trade Levels","Display trade levels of open orders, SL, TP and pending orders",
      "OHLC","Show Open/High/Low/Close values in the upper left corner",
      "Date Scale","Enable/disable the mode of displaying the time scale on a chart",
      "Price Scale","Enable/disable the mode of displaying the price scale on a chart",
      "Grid","Enable/disable the chart grid",
      "Period Sep.","Enable/disable vertical separators between adjacent periods",
      "Show Volume","Display volume in the chart",
      "Scale Fix","Turns on/off fixed scale mode",
      "Change Chart Type","Bar chart/candlesticks/line",
      "Chart Shift","Mode of price chart indent from the right border",
      "Chart Autoscroll","Mode of automatic moving to the right border of the chart",
      "Zoom In","Change chart scale",
      "Zoom Out","Change chart scale",
      "Chart Mouse Scroll","Disable/enable horizontal chart scrolling",
      "Select All","Selects all objects on the current chart",
      "Change Color","Change the color of a selected object",
      "Change Style","Change the style of a selected object",
      "Change Width","Change the width of a selected object",
      "Delete All Objects","Removes all objects from the chart",
      "Delete Obj by Type","Removes objects of the specified type from the chart",
      "Chart Sync","Enable/disable chart synchronization",
      "Edit Shortcuts","Open/Close 'Shortcut Assistant"
     };
   text= Prop[nr][0];
   tip = Prop[nr][1];
   return(ArraySize(Prop)/2);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::SaveToDB(void)
  {
   int size=ArraySize(DB_Func);
   ArrayResize(DB_Int,size+1);
   ArrayResize(DB_Func,size+1);
   int buf1[][2];
   string buf2[];
   ArrayCopy(buf1,DB_Int);
   ArrayCopy(buf2,DB_Func);
   int j=0;
   bool once= true;
   for(int i=0;i<size+1;i++)
     {
      if((buf1[j][0]>=Nr_RadioButton || size==0 || i==size) && once)
        {
         once=false;
         if(Nr_RadioButton==1)
           {
            DB_Int[i][0] = Nr_RadioButton;
            DB_Int[i][1] = Nr_Key;
            DB_Func[i]=SymbolName(Nr_List1Start+Nr_List1Line,true);
           }
         else
           {
            DB_Int[i][0] = Nr_RadioButton;
            DB_Int[i][1] = Nr_Key;
            DB_Func[i]=string(Nr_List1Start+Nr_List1Line);
           }
        }
      else
        {
         DB_Int[i][0]=buf1[j][0];
         DB_Int[i][1]=buf1[j][1];
         DB_Func[i]=buf2[j];
         j++;
        }
     }
   SaveSettings();
   ListShowData();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::DBclear()
  {
   ArrayResize(DB_Int,0);
   ArrayResize(DB_Func,0);
   ListShowData();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::DBremove(void)
  {
   int size=ArraySize(DB_Func);
   int buf1[][2];
   string buf2[];
   ArrayCopy(buf1,DB_Int);
   ArrayCopy(buf2,DB_Func);

   ArrayResize(DB_Int,size-1);
   ArrayResize(DB_Func,size-1);
   int j=0;
   for(int i=0;i<size-1;i++)
     {
      if(j==(Nr_List2Start+Nr_List2Line)) j++;
      DB_Int[i][0]=buf1[j][0];
      DB_Int[i][1]=buf1[j][1];
      DB_Func[i]=buf2[j];
      j++;
     }
   ListShowData();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::ListShowData()
  {
   List2.ListHighlightLine2("#");
   ButtonRemove.ButtonDisable();
   int size=ArraySize(DB_Func);
   int j=List2.ListScrollGetPoz(size);
   Nr_List2Start=j;
   if(size<=List2.ListResturnLineCount()) {  List2.ListScrollStatusSet(false);  List2.ListScrollReset(); }
   else List2.ListScrollStatusSet(true);
   string tip;
   for(int i=0;i<List2.ListResturnLineCount();i++)
     {
      if(j>=size)
        {
         ObjectSetString(0,List2.Name_ListLabel(i)+"1",OBJPROP_TEXT,"");
         ObjectSetString(0,List2.Name_ListLabel(i)+"2",OBJPROP_TEXT,"");
         continue;
        }
      string txt;
      switch(DB_Int[j][0])
        {
         case  1:
            ObjectSetString(0,List2.Name_ListLabel(i)+"1",OBJPROP_TEXT,DB_Func[j]);
            ObjectSetString(0,List2.Name_ListLabel(i)+"2",OBJPROP_TEXT,KeyChar(DB_Int[j][1]));
            tip="Symbol:  "+DB_Func[j]+"  ( "+KeyChar(DB_Int[j][1])+" )";
            ObjectSetString(0,List2.Name_ListLabel(i)+"1",OBJPROP_TOOLTIP,tip);
            ObjectSetString(0,List2.Name_ListLabel(i)+"2",OBJPROP_TOOLTIP,tip);
            break;
         case 2:
            ObjectSetString(0,List2.Name_ListLabel(i)+"1",OBJPROP_TEXT,ReturnPeriod((int)DB_Func[j]));
            ObjectSetString(0,List2.Name_ListLabel(i)+"2",OBJPROP_TEXT,KeyChar(DB_Int[j][1]));
            tip="Period:  "+ReturnPeriod((int)DB_Func[j])+"  ( "+KeyChar(DB_Int[j][1])+" )";
            ObjectSetString(0,List2.Name_ListLabel(i)+"1",OBJPROP_TOOLTIP,tip);
            ObjectSetString(0,List2.Name_ListLabel(i)+"2",OBJPROP_TOOLTIP,tip);
            break;
         case 3:

            ReturnProperties((int)DB_Func[j],txt,tip);
            ObjectSetString(0,List2.Name_ListLabel(i)+"1",OBJPROP_TEXT,txt);
            ObjectSetString(0,List2.Name_ListLabel(i)+"2",OBJPROP_TEXT,KeyChar(DB_Int[j][1]));
            tip=txt+"  ( "+KeyChar(DB_Int[j][1])+" )";
            ObjectSetString(0,List2.Name_ListLabel(i)+"1",OBJPROP_TOOLTIP,tip);
            ObjectSetString(0,List2.Name_ListLabel(i)+"2",OBJPROP_TOOLTIP,tip);
            break;
         default:
            break;
        }
      j++;
     }

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::ExeInput(long lparam)
  {

   int n= SearchDB(lparam);
   if(n == -1) return;

   if(DB_Int[n][0]==1) Go.ChangeSymbol(DB_Func[n]);
   if(DB_Int[n][0]==2) Go.ChangePeriod((int)DB_Func[n]);
   if(DB_Int[n][0]==3)
     {

      switch((int)DB_Func[n])
        {
         case 0: Go.ChangeShowAskLine(); ChangeChartProperties(); break;
         case 1: Go.ChangeShowBidLine(); ChangeChartProperties(); break;
         case 2: Go.ChangeTradeLevels(); ChangeChartProperties(); break;
         case 3: Go.ChangeOHLC(); ChangeChartProperties(); break;
         case 4: Go.ChangeDateScale(); break;
         case 5: Go.ChangePriceScale(); break;
         case 6: Go.ChangeGrid(); ChangeChartProperties(); break;
         case 7: Go.ChanePeriodSep(); ChangeChartProperties(); break;
         case 8: Go.ChangeVolume(); ChangeChartProperties(); break;
         case 9: Go.ChangeScaleFix(); ChangeChartProperties(); break;
         case 10: Go.ChangeChartType(); ChangeChartProperties(); break;
         case 11: Go.ChangeShift(); ChangeChartProperties(); break;
         case 12: Go.ChangeAutoscroll(); ChangeChartProperties(); break;

         case 13: Go.ChangeZoomIn(); break;
         case 14: Go.ChangeZoomOut(); break;
         case 15: Go.ChangeMouseScroll(); ChangeChartProperties();  break;
         case 16: Go.SelectAll();  break;
         case 17:
            if(!PColors.PanelStatus())
              { RemoveActivePanels(); ActiveSidePanel=true; PColors.PanelColorsCreate(mx,my); }
            else PColors.Remove(); break;
         case 18:
            if(!PStyle.PanelStatus())
              { RemoveActivePanels(); ActiveSidePanel=true; PStyle.PanelStyleCreate(mx,my); }
            else PStyle.Remove(); break;
         case 19:
            if(!PWidth.PanelStatus())
              { RemoveActivePanels(); ActiveSidePanel=true; PWidth.PanelWidthCreate(mx,my); }
            else PWidth.Remove(); break;
         case 20: Go.RemoveAll(); break;
         case 21:
            if(!PObjDelete.PanelStatus())
              { RemoveActivePanels(); ActiveSidePanel=true; PObjDelete.PanelObjDeleteCreate(mx,my); }
            else PObjDelete.Remove(); break;
         case 22:
            if(CheckBoxSet[0]==0)
              {  CheckBoxSet[0]=1;  LoadSettingOnAll(); Note.CreateNote("Sync OFF"); }
            else
              { CheckBoxSet[0]=0; LoadSettingOnAll();  Note.CreateNote("Sync ON"); }
            break;
         case 23: CreateObjects(); Cog.CogChangeState(1);  break;
         default:
            break;
        }
      ChartRedraw(0);
      return;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int SKeys::SearchDB(long lparam)
  {
   for(int i=0;i<ArraySize(DB_Func);i++) if(lparam == DB_Int[i][1]) return(i);
   return(-1);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::ChartEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
  {
   if(id==CHARTEVENT_OBJECT_CLICK && sparam==Cog.Name_Cog())
     {
      if(ObjectFind(0,MainBox.Name_Background())==-1) CreateObjects();
      else  CloseMainPanel();
      return;
     }

   if(id==CHARTEVENT_KEYDOWN && CheckBoxSet[6]==0 && !MainBox.Status()) { if(ActiveSidePanel) {RemoveActivePanels();}  ExeInput(lparam);  return; }

   if((id==CHARTEVENT_KEYDOWN || id==CHARTEVENT_OBJECT_CLICK) && MainBox.KeyMenuStatus()) { KeyWaitingForInput(id,lparam,sparam); return; }

   if(id==CHARTEVENT_KEYDOWN && MainBox.Status())
     {
      int n=SearchDB(lparam);
      if(DB_Int[n][0]==3 && (int)DB_Func[n]==23) CloseMainPanel();
      return;
     }

   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      if(ActiveSidePanel)
        {
         if(StringFind(sparam,PColors.Name_PanelColor())!=-1) { PColors.PanelExeColors(sparam); PColors.Remove(); ActiveSidePanel=false; }
         if(StringFind(sparam,PStyle.Name_PanelStyle())!=-1) { PStyle.PanelExeStyle(sparam); PStyle.Remove(); ActiveSidePanel=false;  }
         if(StringFind(sparam,PWidth.Name_PanelWidth())!=-1) { PWidth.PanelExeWidth(sparam); PWidth.Remove(); ActiveSidePanel=false;  }
         if(StringFind(sparam,PObjDelete.Name_PanelObjDelete())!=-1) { PObjDelete.PanelExeObjeDelete(sparam); PObjDelete.Remove(); ActiveSidePanel=false;  }
         return;
        }

      if(StringFind(sparam,List1.Name_ListRect())!=-1) { Nr_List1Line=List1.ListHighlightLine(sparam); ButtonAdd.ButtonEnable(); }
      if(StringFind(sparam,List2.Name_ListRect())!=-1) { Nr_List2Line=List2.ListHighlightLine2(sparam); ButtonRemove.ButtonEnable(); }
      if(StringFind(sparam,MainBox.Name_RadioButton())!=-1) RadioSetup(sparam);
      if(StringFind(sparam,MainBox.Name_CheckButton())!=-1) CheckBoxSetup(sparam);
      if(StringFind(sparam,ButtonClear.Name_Background())!=-1) { DBclear(); ButtonClear.ButtonResetState(); return; }
      if(StringFind(sparam,ButtonRemove.Name_Background())!=-1) { DBremove();  ButtonRemove.ButtonResetState(); return; }
      if(StringFind(sparam,ButtonOk.Name_Background())!=-1) CloseMainPanel();

      if(StringFind(sparam,ButtonAdd.Name_Background())!=-1)
        {
         if(ButtonAdd.ButtonState())
           {
            string comm;
            if(Nr_RadioButton==1) comm = SymbolName(Nr_List1Start+Nr_List1Line,true);
            if(Nr_RadioButton==2) comm = ReturnPeriod(Nr_List1Line);
            if(Nr_RadioButton==3)
              {
               string tip;
               ReturnProperties(Nr_List1Start+Nr_List1Line,comm,tip);
              }
            MainBox.KeySetupCreate(comm);
            Nr_Key=-1;
           }
         ButtonAdd.ButtonResetState();
         return;
        }
      return;
     }
   if(id==CHARTEVENT_CHART_CHANGE && !DisableChartChangeEvent) {  ChangeChartProperties(); }
   if(id==CHARTEVENT_MOUSE_MOVE)
     {
      DisableChartChangeEvent=false;
      if(sparam=="1" && CheckBoxSet[0]==0 && CheckBoxSet[4]==0)
        {
         DisableChartChangeEvent=true;
         MoveCharts((int)iTime(Symbol(),Period(),WindowFirstVisibleBar()-WindowBarsPerChart()/2));
        }
      mx=(int)lparam;
      my=(int)dparam;
      if(!allowdraging) { if(sparam=="0") allowdraging=true; else return; }
      if(sparam=="1" && !mouseflag && allowdraging)
        {
         box_name=CheckCordinates((int)lparam,(int)dparam);
         if(box_name=="") { allowdraging=false; return; }
         ChartSetInteger(0,CHART_MOUSE_SCROLL,false);
         mouseflag=true;
        }
      if(sparam=="0" && mouseflag && box_name!="")
        {
         mouseflag= false;
         box_name = "";
         ChartSetInteger(0,CHART_MOUSE_SCROLL,true);
         ChartRedraw(0);
         return;
        }
      if(mouseflag && box_name!="")
        {
         MoveObjects((int)lparam,(int)dparam,box_name);
         ChartRedraw(0);
        }

      return;
     }

   if(id==CHARTEVENT_CUSTOM+111) DisableChartChangeEvent = true;
   if(id==CHARTEVENT_CUSTOM+222) DisableChartChangeEvent = false;
   if(id==CHARTEVENT_CUSTOM+66) LoadSettings();

   if(id==CHARTEVENT_CUSTOM+115)
     {
      DisableChartChangeEvent=true;
      int i=iBarShift(Symbol(),Period(),lparam);
      ChartNavigate(0,CHART_BEGIN,Bars-i-WindowBarsPerChart()/2);
      DisableChartChangeEvent=false;
      return;
     }

   if(ActiveSidePanel && id==CHARTEVENT_CLICK) RemoveActivePanels();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::CloseMainPanel(void)
  {
   SaveSettings();
   MainBox.Remove();
   Cog.CogChangeState(0);
   LoadSettingOnAll();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::LoadSettingOnAll(void)
  {
   SaveSettings();
   long id=ChartFirst();
   while(true)
     {
      for(int i=0;i<ChartIndicatorsTotal(id,0);i++)
        {
         if(ChartIndicatorName(id,0,i)==IndShortName)
           {
            EventChartCustom(id,66,0,0,"");
            break;
           }
        }
      id=ChartNext(id);
      if(id<0) break;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::CreateObjects(void)
  {
   LoadSettings();
   int X=20;
   int Y=40;
   int xsize = 275;
   int ysize = 373;

   MainBox.SetName(IndName);
   MainBox.CreateBackground(X,Y,xsize,ysize);

   int bx = X+170;
   int by = Y+15;
   MainBox.CreateDotRect(1,bx,by,95,85);

   MainBox.RadioCreate(1,bx+10,by+10,"Symbols",0);
   MainBox.RadioCreate(2,bx+10,by+35,"Periods",1);
   MainBox.RadioCreate(3,bx+10,by+60,"Settings",1);
// MainBox.ShowDemo(X+235,Y-2);
   ButtonAdd.ButtonCreate(IndName+"Button#Add",X+175,Y+115,85,40,"Add");
   ButtonAdd.ButtonDisable();

   MainBox.CheckCreate(6,X+80,Y+280,115,"Enable Hotkeys","Enable/disable keyboard shortcuts",CheckBoxSet[6]);

   List1.SetName(IndName+"1ListBox");
   List1.ListCreate(X+10,Y+10,150,9);

   SetSymbols();

   List2.SetName(IndName+"2ListBox");
   List2.ListCreate2(X+10,Y+170,255,6);


   ButtonRemove.ButtonCreate(IndName+"Button#Remove",X+200,Y+280,55,20,"Remove");
   ButtonRemove.ButtonDisable();

   ButtonClear.ButtonCreate(IndName+"Button#Clear",X+20,Y+280,55,20,"Clear");

   MainBox.CreateDotRect(2,X+10,Y+305,255,30);
   CreateChecks();

   ButtonOk.ButtonCreate(IndName+"Button#Ok",X+200,Y+340,60,25,"Ok");
   if(CheckBoxSet[0]==0) ButtonOk.ButtonMove(45);
   ListShowData();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::CreateChecks()
  {
   int X=(int) ObjectGetInteger(0,MainBox.Name_Background(),OBJPROP_XDISTANCE);
   int Y=(int) ObjectGetInteger(0,MainBox.Name_Background(),OBJPROP_YDISTANCE);
   int bx = X+10;
   int by = Y+305;


   int i=0;
   if(ObjectFind(0,MainBox.Name_CheckButtonMain(i))==-1)
     {
      MainBox.CheckCreate(i,bx+5,by+5,160,"Enable synchronization","Enable/disable synchronization",CheckBoxSet[i]);
     }
   if(CheckBoxSet[i] == 1) return;
   i=1;
   if(ObjectFind(0,MainBox.Name_CheckButtonMain(i))==-1)
     {
      MainBox.CheckCreate(i,bx+5,by+30,70,"Symbol","Synchronize Symbols",CheckBoxSet[i]);
     }
   i=2;
   if(ObjectFind(0,MainBox.Name_CheckButtonMain(i))==-1)
     {
      MainBox.CheckCreate(i,bx+5,by+50,70,"Period","Synchronize Periods",CheckBoxSet[i]);
     }
   i=3;
   if(ObjectFind(0,MainBox.Name_CheckButtonMain(i))==-1)
     {
      MainBox.CheckCreate(i,bx+75,by+30,90,"Chart scale","Synchronize scale",CheckBoxSet[i]);
     }
   i=4;
   if(ObjectFind(0,MainBox.Name_CheckButtonMain(i))==-1)
     {
      MainBox.CheckCreate(i,bx+165,by+30,85,"Scrolling","Synchronous scrolling",CheckBoxSet[i]);
     }
   i=5;
   if(ObjectFind(0,MainBox.Name_CheckButtonMain(i))==-1)
     {
      MainBox.CheckCreate(i,bx+75,by+50,120,"Chart properties","Synchronize chart type/colors...",CheckBoxSet[i]);
     }

   MainBox.BackgroundChangeYsize(45);
   ButtonOk.ButtonMove(45);
  }

#include "Objects2.mqh"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::KeyWaitingForInput(int id,long lparam,string sparam)
  {
   if(id==CHARTEVENT_KEYDOWN)
     {
      if(lparam==27) CloseKeySetupWindow();

      MainBox.KeyShowInput(KeyChar((int)lparam));
      if(CheckKey((int)lparam))
        {
         if(SearchDB(lparam)==-1)
           {
            Nr_Key=(int)lparam;
            MainBox.KeyShowInput2("");
            MainBox.KeyButtonOkEnable();
            return;
           }
         else
           {
            MainBox.KeyShowInput2("This key is already used");
            MainBox.KeyButtonOkDisable();
            return;
           }
        }
      else
        {
         MainBox.KeyShowInput2("Not awailable");
         MainBox.KeyButtonOkDisable();
         Nr_Key=-1;
         return;
        }
     }
   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      if(sparam==MainBox.Name_KeyDialogOk())
        {
         if(Nr_Key!=-1) { SaveToDB(); CloseKeySetupWindow(); }
         else MainBox.KeyButtonOkResetState();
         return;
        }
      if(sparam==MainBox.Name_KeyDialogCancel()) CloseKeySetupWindow();
      return;
     }
   return;
  }
//+------------------------------------------------------------------+
