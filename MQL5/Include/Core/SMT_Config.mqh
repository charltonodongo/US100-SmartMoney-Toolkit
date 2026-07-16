//+------------------------------------------------------------------+
//|                                                SMT_Config.mqh    |
//|               US100 Smart Money Toolkit v0.2.0                   |
//+------------------------------------------------------------------+
#ifndef __SMT_CONFIG_MQH__
#define __SMT_CONFIG_MQH__

//=========================================================
// General
//=========================================================
input bool EnableDebug = true;

//=========================================================
// Display
//=========================================================
input bool ShowDailyLevels    = true;
input bool ShowSessions       = true;
input bool ShowLiquidity      = true;
input bool ShowStructure      = true;
input bool ShowFVG            = true;
input bool ShowVolumeProfile  = true;
input bool ShowDashboard      = true;

//=========================================================
// Timeframes
//=========================================================
input ENUM_TIMEFRAMES BiasTF      = PERIOD_H4;
input ENUM_TIMEFRAMES StructureTF = PERIOD_M5;
input ENUM_TIMEFRAMES EntryTF     = PERIOD_M1;

//=========================================================
// Session Times (Broker Time)
//=========================================================

// Asia
input int AsiaStartHour   = 0;
input int AsiaStartMinute = 0;

input int AsiaEndHour     = 6;
input int AsiaEndMinute   = 0;

// London
input int LondonStartHour   = 8;
input int LondonStartMinute = 0;

input int LondonEndHour     = 11;
input int LondonEndMinute   = 0;

// New York
input int NewYorkStartHour   = 13;
input int NewYorkStartMinute = 30;

input int NewYorkEndHour     = 16;
input int NewYorkEndMinute   = 0;

//=========================================================
// Daily Levels
//=========================================================
input color PDHColor = clrRed;
input color PDLColor = clrLime;
input color PDOColor = clrDodgerBlue;
input color PDCColor = clrOrange;
input color PDMColor = clrSilver;

//=========================================================
// Session Colours
//=========================================================
input color AsiaColor     = clrDodgerBlue;
input color LondonColor   = clrGold;
input color NewYorkColor  = clrTomato;

//=========================================================
// Liquidity
//=========================================================
input int EqualHighLowTolerancePoints = 10;

//=========================================================
// Fair Value Gap
//=========================================================
input int MinimumFVGPoints = 5;

//=========================================================
// Risk
//=========================================================
input double DefaultRiskReward = 2.0;
input bool MoveToBreakeven = true;
input double BreakevenRR = 1.0;

#endifgit add MQL5/Include/Core/SMT_Config.mqh
git commit -m "Add configuration module"
git push