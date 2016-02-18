#property copyright   "Copyright 2015, Paulius 'zatec' R."                   
#property version     "1.0"                     
#property description "This utility lets you to create keyboard shortcuts to change chart period, symbol or to control other chart properties."
#property icon        "icon.ico";                                   
#property strict


#property indicator_chart_window
#include "Objects.mqh"
input bool HideArrow=false;

SKeys C();
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
   ChartSetInteger(0,CHART_SHOW_OBJECT_DESCR,true);
   ChartSetInteger(0,CHART_EVENT_MOUSE_MOVE,0,true);
   C.CheckAndChangePeriod();
   if(!HideArrow) C.Cog.CreateCog();
   else ObjectDelete(0,C.Cog.Name_Cog());
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   C.RemoveAll();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {

   return(rates_total);
  }
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
   C.ChartEvent(id,lparam,dparam,sparam);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
   C.Note.RemoveNote();
   EventKillTimer();
  }
