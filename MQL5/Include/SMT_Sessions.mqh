//+------------------------------------------------------------------+
//| SMT_Sessions.mqh                                                 |
//+------------------------------------------------------------------+
#ifndef __SMT_SESSIONS_MQH__
#define __SMT_SESSIONS_MQH__

#include "SMT_Common.mqh"

class CAsiaSession
{
public:

   void Draw()
   {
      DrawAsiaLevels();
   }

private:

   void DrawAsiaLevels()
   {
      datetime today = iTime(_Symbol, PERIOD_D1, 0);

      double asiaHigh = -DBL_MAX;
      double asiaLow  =  DBL_MAX;

      // Scan first 6 H1 candles (00:00–06:00 server time)
      for(int i = 0; i < 6; i++)
      {
         double h = iHigh(_Symbol, PERIOD_H1, i);
         double l = iLow(_Symbol, PERIOD_H1, i);

         if(h > asiaHigh)
            asiaHigh = h;

         if(l < asiaLow)
            asiaLow = l;
      }

      DrawHLine(ObjName("ASIA_HIGH"), asiaHigh, clrDodgerBlue);
      DrawHLine(ObjName("ASIA_LOW"),  asiaLow,  clrDodgerBlue);
      DrawHLine(ObjName("ASIA_MID"),
                (asiaHigh + asiaLow) / 2.0,
                clrAqua,
                STYLE_DOT);
   }
};

#endif