//|                                                      ProjectName |
//|                                      Copyright 2012, CompanyName |
//|                                       http://www.companyname.net |

void names::PanelExeObjeDelete(string sparam)
  {
   int poz=StringFind(sparam,"#");
   int n=(int)StringSubstr(sparam,poz+1,1);
   switch(n)
     {
      case 0:
         for(int i=ObjectsTotal();i>=0;i--)
           {
            string name=ObjectName(i);
            if(name!="OpenPanel") ObjectDelete(0,name);
           }
         return;
      case 1: ObjectsDeleteAll(0,-1,OBJ_VLINE); return;
      case 2: ObjectsDeleteAll(0,-1,OBJ_HLINE); return;
      case 3: ObjectsDeleteAll(0,-1,OBJ_TREND); return;
      case 4:
         ObjectsDeleteAll(0,-1,OBJ_FIBO);
         ObjectsDeleteAll(0,-1,OBJ_FIBOFAN);
         ObjectsDeleteAll(0,-1,OBJ_FIBOARC);
         ObjectsDeleteAll(0,-1,OBJ_FIBOCHANNEL);
         ObjectsDeleteAll(0,-1,OBJ_FIBOTIMES);
         return;
      case 5:
         ObjectsDeleteAll(0,-1,OBJ_ARROW);
         ObjectsDeleteAll(0,-1,OBJ_ARROW_BUY);
         ObjectsDeleteAll(0,-1,OBJ_ARROW_CHECK);
         ObjectsDeleteAll(0,-1,OBJ_ARROW_DOWN);
         ObjectsDeleteAll(0,-1,OBJ_ARROW_LEFT_PRICE);
         ObjectsDeleteAll(0,-1,OBJ_ARROW_RIGHT_PRICE);
         ObjectsDeleteAll(0,-1,OBJ_ARROW_SELL);
         ObjectsDeleteAll(0,-1,OBJ_ARROW_STOP);
         ObjectsDeleteAll(0,-1,OBJ_ARROW_THUMB_DOWN);
         ObjectsDeleteAll(0,-1,OBJ_ARROW_THUMB_UP);
         ObjectsDeleteAll(0,-1,OBJ_ARROW_UP);
         return;
      case 6: ObjectsDeleteAll(0,-1,OBJ_TRIANGLE); ObjectsDeleteAll(0,-1,OBJ_RECTANGLE); ObjectsDeleteAll(0,-1,OBJ_ELLIPSE); return;
      case 7: ObjectsDeleteAll(0,-1,OBJ_TEXT); ObjectsDeleteAll(0,-1,OBJ_LABEL); return;
      default: return;

     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::CheckAndChangePeriod(void)
  {
   if(CheckBoxSet[0]==1) return;
   if(CheckBoxSet[1]==1 && CheckBoxSet[2]==1) return;
   if(GlobalVariableCheck("AddKeys")) return;
   GlobalVariableSet("AddKeys",0);
   long id=ChartFirst();
   while(true)
     {
      if(id!=ChartID())
        {
         for(int i=0;i<ChartIndicatorsTotal(id,0);i++)
           {
            if(ChartIndicatorName(id,0,i)==IndShortName)
              {
               if(CheckBoxSet[2]==0 && ChartPeriod(id)!=Period()) ChartSetSymbolPeriod(id,ChartSymbol(id),Period());
               if(CheckBoxSet[1]==0 && ChartSymbol(id)!=Symbol()) ChartSetSymbolPeriod(id,Symbol(),ChartPeriod(id));
               break;
              }
           }
        }
      id=ChartNext(id);
      if(id<0) break;
     }
   GlobalVariableDel("AddKeys");
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::MoveCharts(int laikas)
  {
   long id=ChartFirst();
   while(true)
     {
      for(int i=0;i<ChartIndicatorsTotal(id,0);i++)
        {
         if(ChartIndicatorName(id,0,i)==IndShortName && id!=ChartID()) { EventChartCustom(id,115,laikas,0,""); break; }
        }
      id=ChartNext(id);
      if(id<0) break;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string SKeys::KeyChar(int lparam)
  {
   switch(lparam)
     {
      case 192: return("`");
      case 49: return("1");
      case 50: return("2");
      case 51: return("3");
      case 52: return("4");
      case 53: return("5");
      case 54: return("6");
      case 55: return("7");
      case 56: return("8");
      case 57: return("9");
      case 48: return("0");
      case 189: return("-"); //?
      case 187: return("+"); //?
      case 8: return("Backspace");
      case 27: return("Esc");
      case 9: return("Tab");
      case 81: return("Q");
      case 87: return("W");
      case 69: return("E");
      case 82: return("R");
      case 84: return("T");
      case 89: return("Y");
      case 85: return("U");
      case 73: return("I");
      case 79: return("O");
      case 80: return("P");
      case 219: return("[");
      case 221: return("]");
      case 220: return(" \ ");
      case 20: return("Caps Lock");
      case 65: return("A");
      case 83: return("S");
      case 68: return("D");
      case 70: return("F");
      case 71: return("G");
      case 72: return("H");
      case 74: return("J");
      case 75: return("K");
      case 76: return("L");
      case 186: return(";");
      case 222: return("'");
      case 13: return("Enter");    //?   
      case 16: return("Shift");
      case 90: return("Z");
      case 88: return("X");
      case 67: return("C");
      case 86: return("V");
      case 66: return("B");
      case 78: return("N");
      case 77: return("M");
      case 188: return("<");
      case 190: return(">");
      case 191: return("/");
      case 17: return("Ctrl");
      case 91: return("WinKey"); //?
      case 32: return("Space"); //?
      case 37: return("Left");  //?      
      case 39: return("Right"); //? 
      case 38: return("Up"); //?
      case 40: return("Down"); //?
      case 36: return("Home"); //?
      case 33: return("Pg Up"); //?  
      case 34: return("PG Dn");  //?
      case 35: return("End");//?
      case 144: return("Num Lock"); //?
      case 111: return("/");
      case 106: return("*");
      case 109: return("-"); //?
      case 103: return("Np 7");
      case 104: return("Np 8");
      case 105: return("Np 9");
      case 100: return("Np 4");
      case 101: return("Np 5");
      case 102: return("Np 6");
      case 97: return("Np 1");
      case 98: return("Np 2");
      case 99: return("Np 3");
      case 107: return("+"); //?
      case 96: return("Np 0");
      case 110: return(".");
      case 45: return("Ins");
      case 46: return("Del");
      case 19: return("Pause");
      default: return((string)lparam);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SKeys::CheckKey(int id)
  {
   switch(id)
     {
      case 27: return(false); //ESC
      case 116: return(false); //F5
      case 36: return(false); //Home
      case 34: return(false); //Pg Up
      case 33: return(false); //Pg Down
      case 35: return(false); //End
      case 109: return(false); //-
      case 107: return(false); //+
      case 13: return(false); // Enter
      case 37: return(false); //Left
      case 38: return(false); //Up
      case 39: return(false); //Right
      case 40: return(false); //Down
      case 93: return(false); //Right Button
      case 32: return(false); // Space
      case 91: return(false); //Win
      case 189: return(false); //-
      case 187: return(false); //+     
      case 12: return(false);
      default: return(true);
     }
   return(true);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::ChangeChartProperties(void)
  {

   if(CheckBoxSet[0]==1) return;
   if(CheckBoxSet[3]==1 && CheckBoxSet[5]==1) return;
   EventChartCustom(0,111,0,0,"");

   int scale=(int)ChartGetInteger(0,CHART_SCALE);
   int mode=(int)ChartGetInteger(0,CHART_MODE);
   int ascroll=(int)ChartGetInteger(0,CHART_AUTOSCROLL);
   int ohlc=(int)ChartGetInteger(0,CHART_SHOW_OHLC);
   int shift=(int)ChartGetInteger(0,CHART_SHIFT);
   int persep=(int)ChartGetInteger(0,CHART_SHOW_PERIOD_SEP);
   int grid=(int)ChartGetInteger(0,CHART_SHOW_GRID);
   int volumes=(int)ChartGetInteger(0,CHART_SHOW_VOLUMES);
   int cbackground =(int)ChartGetInteger(0,CHART_COLOR_BACKGROUND);
   int cforeground =(int) ChartGetInteger(0,CHART_COLOR_FOREGROUND);
   int cgrid=(int)ChartGetInteger(0,CHART_COLOR_GRID);
   int cvolume=(int)ChartGetInteger(0,CHART_COLOR_VOLUME);
   int cchartup=(int)ChartGetInteger(0,CHART_COLOR_CHART_UP);
   int cchartdown = (int)ChartGetInteger(0,CHART_COLOR_CHART_DOWN);
   int cchartline = (int)ChartGetInteger(0,CHART_COLOR_CHART_LINE);
   int ccandlebull = (int)ChartGetInteger(0,CHART_COLOR_CANDLE_BULL);
   int ccandlebear = (int)ChartGetInteger(0,CHART_COLOR_CANDLE_BEAR);
   int cbid = (int)ChartGetInteger(0,CHART_COLOR_BID);
   int cask = (int)ChartGetInteger(0,CHART_COLOR_ASK);
   int clast= (int)ChartGetInteger(0,CHART_COLOR_LAST);
   int cstoplevel=(int)ChartGetInteger(0,CHART_COLOR_STOP_LEVEL);
   int bid=(int)ChartGetInteger(0,CHART_SHOW_BID_LINE);
   int ask=(int)ChartGetInteger(0,CHART_SHOW_ASK_LINE);


   long id=ChartFirst();
   while(true)
     {
      for(int i=0;i<ChartIndicatorsTotal(id,0);i++)
        {
         if(ChartIndicatorName(id,0,i)==IndShortName && id!=ChartID())
           {
            EventChartCustom(id,111,0,0,"");

            if(ChartGetInteger(id,CHART_SCALE)!=scale && CheckBoxSet[3]==0) ChartSetInteger(id,CHART_SCALE,scale);
            if(CheckBoxSet[5]==0)
              {
               if(ChartGetInteger(id,CHART_MODE)!=mode) ChartSetInteger(id,CHART_MODE,mode);
               if(ChartGetInteger(id,CHART_AUTOSCROLL)!=ascroll) ChartSetInteger(id,CHART_AUTOSCROLL,ascroll);
               if(ChartGetInteger(id,CHART_SHOW_OHLC)!=ohlc) ChartSetInteger(id,CHART_SHOW_OHLC,ohlc);
               if(ChartGetInteger(id,CHART_SHIFT)!=shift) ChartSetInteger(id,CHART_SHIFT,shift);
               if(ChartGetInteger(id,CHART_SHOW_PERIOD_SEP)!=persep) ChartSetInteger(id,CHART_SHOW_PERIOD_SEP,persep);
               if(ChartGetInteger(id,CHART_SHOW_GRID)!=grid) ChartSetInteger(id,CHART_SHOW_GRID,grid);
               if(ChartGetInteger(id,CHART_SHOW_VOLUMES)!=volumes) ChartSetInteger(id,CHART_SHOW_VOLUMES,volumes);
               if(ChartGetInteger(id,CHART_COLOR_BACKGROUND)!=cbackground) ChartSetInteger(id,CHART_COLOR_BACKGROUND,cbackground);
               if(ChartGetInteger(id,CHART_COLOR_FOREGROUND)!=cforeground) ChartSetInteger(id,CHART_COLOR_FOREGROUND,cforeground);
               if(ChartGetInteger(id,CHART_COLOR_GRID)!=cgrid) ChartSetInteger(id,CHART_COLOR_GRID,cgrid);
               if(ChartGetInteger(id,CHART_COLOR_VOLUME)!=cvolume) ChartSetInteger(id,CHART_COLOR_VOLUME,cvolume);
               if(ChartGetInteger(id,CHART_COLOR_CHART_UP)!=cchartup) ChartSetInteger(id,CHART_COLOR_CHART_UP,cchartup);
               if(ChartGetInteger(id,CHART_COLOR_CHART_DOWN)!=cchartdown) ChartSetInteger(id,CHART_COLOR_CHART_DOWN,cchartdown);
               if(ChartGetInteger(id,CHART_COLOR_CHART_LINE)!=cchartline) ChartSetInteger(id,CHART_COLOR_CHART_LINE,cchartline);
               if(ChartGetInteger(id,CHART_COLOR_CANDLE_BULL)!=ccandlebull) ChartSetInteger(id,CHART_COLOR_CANDLE_BULL,ccandlebull);
               if(ChartGetInteger(id,CHART_COLOR_CANDLE_BEAR)!=ccandlebear) ChartSetInteger(id,CHART_COLOR_CANDLE_BEAR,ccandlebear);
               if(ChartGetInteger(id,CHART_COLOR_BID)!=cbid) ChartSetInteger(id,CHART_COLOR_BID,cbid);
               if(ChartGetInteger(id,CHART_COLOR_ASK)!=cask) ChartSetInteger(id,CHART_COLOR_ASK,cask);
               if(ChartGetInteger(id,CHART_COLOR_LAST)!=clast) ChartSetInteger(id,CHART_COLOR_LAST,clast);
               if(ChartGetInteger(id,CHART_COLOR_STOP_LEVEL)!=cstoplevel) ChartSetInteger(id,CHART_COLOR_STOP_LEVEL,cstoplevel);
               if(ChartGetInteger(id,CHART_SHOW_BID_LINE)!=bid) ChartSetInteger(id,CHART_SHOW_BID_LINE,bid);
               if(ChartGetInteger(id,CHART_SHOW_ASK_LINE)!=ask) ChartSetInteger(id,CHART_SHOW_ASK_LINE,ask);
              }

            ChartRedraw(id);
            EventChartCustom(id,222,0,0,"");
            break;
           }
        }
      id=ChartNext(id);
      if(id<0) break;
     }
   EventChartCustom(0,222,0,0,"");
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::RemoveActivePanels()
  {

   if(PColors.PanelStatus()) PColors.Remove();
   if(PStyle.PanelStatus()) PStyle.Remove();
   if(PWidth.PanelStatus()) PWidth.Remove();
   if(PObjDelete.PanelStatus()) PObjDelete.Remove();
   ActiveSidePanel=false;
   ChartRedraw(0);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::RadioSetup(string sparam)
  {
   int nr=MainBox.RadioState(sparam);
   ButtonAdd.ButtonDisable();
   List1.ListHighlightLine("#");
   List1.ListScrollReset();
   switch(nr)
     {
      case 1: SetSymbols(); break;
      case 2: SetPeriods();  break;
      case 3: SetProp(); break;
      default: break;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::CheckBoxSetup(string sparam)
  {
   int n=(int)StringSubstr(sparam,StringLen(MainBox.Name_CheckButton()),1);

   if(sparam==MainBox.Name_CheckButtonMain(n)) CheckBoxSet[n]=MainBox.CheckReturnState(n);
   else CheckBoxSet[n]=MainBox.CheckChangeState(n);
   if(n==0)
     {
      if(MainBox.CheckReturnState(n)==1)
        {
         for(int i=1;i<ArraySize(CheckBoxSet)-1;i++) { MainBox.CheckRemove(i); }
         MainBox.BackgroundChangeYsize(-45);
         ButtonOk.ButtonMove(-45);
        }
      else CreateChecks();
     }
   SaveSettings();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::List1ScrollUpdate(void)
  {
   ButtonAdd.ButtonDisable();
   switch(Nr_RadioButton)
     {
      case 1: List1.ListHighlightLine("#"); SetSymbols(); break;
      case 2: break;
      case 3: List1.ListHighlightLine("#"); SetProp();break;
      default:
         break;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::SetSymbols()
  {
   Nr_RadioButton=1;
   List1.ListScrollStatusSet(true);
   int j=List1.ListScrollGetPoz(SymbolsTotal(true));
   Nr_List1Start=j;
   for(int i=0;i<List1.ListResturnLineCount();i++)
     {
      string pair=SymbolName(j,true);
      List1.ListSetLineValue(i,pair,"Symbol : "+pair);
      j++;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::SetPeriods()
  {
   Nr_RadioButton=2;
   Nr_List1Start = 0;
   List1.ListScrollStatusSet(false);
   for(int i=0;i<List1.ListResturnLineCount();i++)
     {
      string period=ReturnPeriod(i);
      List1.ListSetLineValue(i,period,"Period : "+period);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::SetProp()
  {
   Nr_RadioButton=3;
   List1.ListScrollStatusSet(true);
   string txt,tip;
   int total=ReturnProperties(0,txt,tip);

   int j=List1.ListScrollGetPoz(total);
   Nr_List1Start=j;

   for(int i=0;i<List1.ListResturnLineCount();i++)
     {
      ReturnProperties(j,txt,tip);
      List1.ListSetLineValue(i,txt,tip);
      j++;
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string SKeys::CheckCordinates(int x,int y)
  {
   string name=List1.Name_ListScrollWheel(0);

   if(ObjectFind(0,name)!=-1 && List1.ListScrollStatusGet())
     {
      int XStart  = (int)ObjectGetInteger(0,name,OBJPROP_XDISTANCE);
      int YStart  = (int)ObjectGetInteger(0,name,OBJPROP_YDISTANCE);
      int XEnd    = XStart + (int)ObjectGetInteger(0,name,OBJPROP_XSIZE);
      int YEnd    = YStart + (int)ObjectGetInteger(0,name,OBJPROP_YSIZE);

      if(x>XStart && x<XEnd && y>YStart && y<YEnd)
        {
         Drag_X = x;
         Drag_Y = y;
         return(name);
        }
     }

   name=List2.Name_ListScrollWheel(0);

   if(ObjectFind(0,name)!=-1 && List2.ListScrollStatusGet())
     {
      int XStart  = (int)ObjectGetInteger(0,name,OBJPROP_XDISTANCE);
      int YStart  = (int)ObjectGetInteger(0,name,OBJPROP_YDISTANCE);
      int XEnd    = XStart + (int)ObjectGetInteger(0,name,OBJPROP_XSIZE);
      int YEnd    = YStart + (int)ObjectGetInteger(0,name,OBJPROP_YSIZE);

      if(x>XStart && x<XEnd && y>YStart && y<YEnd)
        {
         Drag_X = x;
         Drag_Y = y;
         return(name);
        }
     }

   name=MainBox.Name_Background();
   if(ObjectFind(0,name)!=-1)
     {
      int XStart  = (int)ObjectGetInteger(0,name,OBJPROP_XDISTANCE);
      int YStart  = (int)ObjectGetInteger(0,name,OBJPROP_YDISTANCE);
      int XEnd    = XStart + (int)ObjectGetInteger(0,name,OBJPROP_XSIZE);
      int YEnd    = YStart + (int)ObjectGetInteger(0,name,OBJPROP_YSIZE);

      if(x>XStart && x<XEnd && y>YStart && y<YEnd)
        {
         string DragXElements[2];
         DragXElements[0]=List1.Name_Background();
         DragXElements[1]=List2.Name_Background();

         for(int i=0;i<ArraySize(DragXElements);i++)
           {
            int osx  = (int)ObjectGetInteger(0,DragXElements[i],OBJPROP_XDISTANCE);
            int osy  = (int)ObjectGetInteger(0,DragXElements[i],OBJPROP_YDISTANCE);
            int oex    = osx + (int)ObjectGetInteger(0,DragXElements[i],OBJPROP_XSIZE);
            int oey    = osy + (int)ObjectGetInteger(0,DragXElements[i],OBJPROP_YSIZE);
            if(x>osx && x<oex && y>osy && y<oey) return("");
           }
         Drag_X = x;
         Drag_Y = y;
         return(name);
        }
     }
   return("");
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SKeys::MoveObjects(int x,int y,string name)
  {
   if(name==MainBox.Name_Background())
     {
      int X_dif = x - Drag_X;
      int Y_dif = y - Drag_Y;
      for(int i = 0; i < ObjectsTotal(); i++)
        {
         string ObjName=ObjectName(i);
         if(StringFind(ObjName,IndName)!=-1)
           {
            int objx = (int) ObjectGetInteger(0,ObjName,OBJPROP_XDISTANCE);
            int objy = (int) ObjectGetInteger(0,ObjName,OBJPROP_YDISTANCE);
            ObjectSetInteger(0,ObjName,OBJPROP_XDISTANCE,objx+X_dif);
            ObjectSetInteger(0,ObjName,OBJPROP_YDISTANCE,objy+Y_dif);
            // if(ObjName == IndName+"Background") { SetArray[0] = objx+X_dif; SetArray[1] =objy+Y_dif; } 
           }
        }
      Drag_X = x;
      Drag_Y = y;
     }
   if(name==List1.Name_ListScrollWheel(0))
     {

      int ymax=(int)ObjectGetInteger(0,List1.Name_ListScrollBox(),OBJPROP_YDISTANCE)+2;
      int weelsize=(int)ObjectGetInteger(0,List1.Name_ListScrollWheel(0),OBJPROP_YSIZE);
      int ymin=int(ObjectGetInteger(0,List1.Name_ListScrollBox(),OBJPROP_YDISTANCE)+ObjectGetInteger(0,List1.Name_ListScrollBox(),OBJPROP_YSIZE)-weelsize);
      int Y_dif=y-Drag_Y;
      int ya=int(y-ObjectGetInteger(0,List1.Name_ListScrollWheel(0),OBJPROP_YDISTANCE));
      if(ya>weelsize) ya=0;
      int objy=(int)ObjectGetInteger(0,List1.Name_ListScrollWheel(0),OBJPROP_YDISTANCE)+Y_dif;
      int yc=ymax;
      if(objy>ymax && objy<ymin && y>ymax && y<ymin) { yc=objy; }
      else
        {
         if(y<=ymax) {yc=ymax;}
         if(y>=ymin) { yc=ymin;}
        }
      ObjectSetInteger(0,List1.Name_ListScrollWheel(0),OBJPROP_YDISTANCE,yc);
      ObjectSetInteger(0,List1.Name_ListScrollWheel(1),OBJPROP_YDISTANCE,yc-1);
      ObjectSetInteger(0,List1.Name_ListScrollWheel(2),OBJPROP_YDISTANCE,yc+1);
      List1ScrollUpdate();

      Drag_Y=y;
     }

   if(name==List2.Name_ListScrollWheel(0))
     {

      int ymax=(int)ObjectGetInteger(0,List2.Name_ListScrollBox(),OBJPROP_YDISTANCE)+2;
      int weelsize=(int)ObjectGetInteger(0,List2.Name_ListScrollWheel(0),OBJPROP_YSIZE);
      int ymin=int(ObjectGetInteger(0,List2.Name_ListScrollBox(),OBJPROP_YDISTANCE)+ObjectGetInteger(0,List2.Name_ListScrollBox(),OBJPROP_YSIZE)-weelsize);
      int Y_dif=y-Drag_Y;

      int objy=(int)ObjectGetInteger(0,List2.Name_ListScrollWheel(0),OBJPROP_YDISTANCE)+Y_dif;
      int yc=ymax;
      if(objy>ymax && objy<ymin && y>ymax && y<ymin){ yc=objy;}
      else
        {
         if(y<=ymax){ yc=ymax;}
         if(y>=ymin){ yc=ymin;}
        }
      ObjectSetInteger(0,List2.Name_ListScrollWheel(0),OBJPROP_YDISTANCE,yc);
      ObjectSetInteger(0,List2.Name_ListScrollWheel(1),OBJPROP_YDISTANCE,yc-1);
      ObjectSetInteger(0,List2.Name_ListScrollWheel(2),OBJPROP_YDISTANCE,yc+1);
      ListShowData();
      Drag_Y=y;
     }
  }
//+------------------------------------------------------------------+
