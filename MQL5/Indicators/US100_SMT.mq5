//+------------------------------------------------------------------+
//| US100_SMT.mq5                                                    |
//| US100 Smart Money Toolkit                                        |
//+------------------------------------------------------------------+
#property copyright "Charlton Odongo"
#property version   "1.000"
#property strict
#property indicator_chart_window
#property indicator_plots 0
#include "../Include/SMT_DailyLevels.mqh"
#include "../Include/SMT_Common.mqh"
#include "../Include/SMT_Sessions.mqh"

//--------------------------------------------------
// Inputs
//--------------------------------------------------
input bool EnableDebug = true;
CDailyLevels DailyLevels;
CAsiaSession AsiaSession;
//--------------------------------------------------
// Initialization
//--------------------------------------------------
int OnInit()
{
   if(EnableDebug)
      SMTLog("Framework initialized.");

   return(INIT_SUCCEEDED);
}

//--------------------------------------------------
// Deinitialization
//--------------------------------------------------
void OnDeinit(const int reason)
{
   DeleteToolkitObjects();

   if(EnableDebug)
      SMTLog("Framework removed.");
}

//--------------------------------------------------
// Main calculation
//--------------------------------------------------
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
   DailyLevels.Draw();
   AsiaSession.Draw();

   return(rates_total);
}