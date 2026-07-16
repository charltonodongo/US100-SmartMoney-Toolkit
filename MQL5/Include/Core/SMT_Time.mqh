//+------------------------------------------------------------------+
//| SMT_Time.mqh                                                     |
//| US100 Smart Money Toolkit                                        |
//| Time & Session Engine v1.0                                       |
//+------------------------------------------------------------------+
#ifndef __SMT_TIME_MQH__
#define __SMT_TIME_MQH__

class CSMTTime
{
public:

   //==============================================================
   // Return today's midnight (server time)
   //==============================================================
   datetime Today()
   {
      MqlDateTime dt;
      TimeToStruct(TimeCurrent(), dt);

      dt.hour = 0;
      dt.min  = 0;
      dt.sec  = 0;

      return StructToTime(dt);
   }

   //==============================================================
   // Build a session time for today
   //==============================================================
   datetime SessionTime(const int hour,
                        const int minute = 0)
   {
      MqlDateTime dt;
      TimeToStruct(TimeCurrent(), dt);

      dt.hour = hour;
      dt.min  = minute;
      dt.sec  = 0;

      return StructToTime(dt);
   }

   //==============================================================
   // Find bar index nearest to a datetime
   //==============================================================
   int BarIndex(ENUM_TIMEFRAMES tf,
                datetime when)
   {
      return iBarShift(_Symbol, tf, when, false);
   }

   //==============================================================
   // Highest price in a session
   //==============================================================
   double SessionHigh(ENUM_TIMEFRAMES tf,
                      datetime start,
                      datetime finish)
   {
      double high = -DBL_MAX;

      int startBar = BarIndex(tf, finish);
      int endBar   = BarIndex(tf, start);

      if(startBar < 0 || endBar < 0)
         return EMPTY_VALUE;

      for(int i = startBar; i <= endBar; i++)
      {
         double h = iHigh(_Symbol, tf, i);

         if(h > high)
            high = h;
      }

      return high;
   }

   //==============================================================
   // Lowest price in a session
   //==============================================================
   double SessionLow(ENUM_TIMEFRAMES tf,
                     datetime start,
                     datetime finish)
   {
      double low = DBL_MAX;

      int startBar = BarIndex(tf, finish);
      int endBar   = BarIndex(tf, start);

      if(startBar < 0 || endBar < 0)
         return EMPTY_VALUE;

      for(int i = startBar; i <= endBar; i++)
      {
         double l = iLow(_Symbol, tf, i);

         if(l < low)
            low = l;
      }

      return low;
   }

   //==============================================================
   // Session midpoint
   //==============================================================
   double SessionMid(ENUM_TIMEFRAMES tf,
                     datetime start,
                     datetime finish)
   {
      double high = SessionHigh(tf, start, finish);
      double low  = SessionLow(tf, start, finish);

      if(high == EMPTY_VALUE || low == EMPTY_VALUE)
         return EMPTY_VALUE;

      return (high + low) / 2.0;
   }

   //==============================================================
   // Session range (price units)
   //==============================================================
   double SessionRange(ENUM_TIMEFRAMES tf,
                       datetime start,
                       datetime finish)
   {
      double high = SessionHigh(tf, start, finish);
      double low  = SessionLow(tf, start, finish);

      if(high == EMPTY_VALUE || low == EMPTY_VALUE)
         return EMPTY_VALUE;

      return high - low;
   }

   //==============================================================
   // Check if current server time is inside a session
   //==============================================================
   bool InSession(datetime start,
                  datetime finish)
   {
      datetime now = TimeCurrent();

      return (now >= start && now <= finish);
   }

};

#endif
