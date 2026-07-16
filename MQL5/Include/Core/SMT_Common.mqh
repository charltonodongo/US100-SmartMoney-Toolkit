//+------------------------------------------------------------------+
//| SMT_Common.mqh                                                   |
//| US100 Smart Money Toolkit                                        |
//+------------------------------------------------------------------+
#ifndef __SMT_COMMON_MQH__
#define __SMT_COMMON_MQH__

#define SMT_PREFIX "US100SMT_"

//--------------------------------------------------
// Logging
//--------------------------------------------------
inline void SMTLog(const string text)
{
   Print("[US100 SMT] ", text);
}

//--------------------------------------------------
// Build object name
//--------------------------------------------------
inline string ObjName(const string suffix)
{
   return StringFormat("%s%s", SMT_PREFIX, suffix);
}

//--------------------------------------------------
// Delete all toolkit objects
//--------------------------------------------------
inline void DeleteToolkitObjects()
{
   for(int i = ObjectsTotal(0) - 1; i >= 0; i--)
   {
      string name = ObjectName(0, i);

      if(StringFind(name, SMT_PREFIX) == 0)
         ObjectDelete(0, name);
   }
}

//--------------------------------------------------
// Create or update horizontal line
//--------------------------------------------------
inline bool DrawHLine(const string name,
                      const double price,
                      const color clr,
                      const ENUM_LINE_STYLE style = STYLE_SOLID,
                      const int width = 2)
{
   if(ObjectFind(0, name) < 0)
   {
      if(!ObjectCreate(0, name, OBJ_HLINE, 0, 0, price))
         return false;
   }

   ObjectSetDouble(0, name, OBJPROP_PRICE, price);
   ObjectSetInteger(0, name, OBJPROP_COLOR, clr);
   ObjectSetInteger(0, name, OBJPROP_STYLE, style);
   ObjectSetInteger(0, name, OBJPROP_WIDTH, width);
   ObjectSetInteger(0, name, OBJPROP_SELECTABLE, false);
   ObjectSetInteger(0, name, OBJPROP_SELECTED, false);
   ObjectSetInteger(0, name, OBJPROP_BACK, false);

   return true;
}

#endif