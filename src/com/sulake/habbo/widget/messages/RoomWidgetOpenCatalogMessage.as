package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_977:String = "RWOCM_CLUB_MAIN";
      
      public static const const_726:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1784:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_726);
         var_1784 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1784;
      }
   }
}
