package com.sulake.habbo.notifications
{
   public class HabboNotificationItem
   {
       
      
      private var var_77:HabboNotificationItemStyle;
      
      private var var_18:String;
      
      private var var_21:HabboNotifications;
      
      public function HabboNotificationItem(param1:String, param2:HabboNotificationItemStyle, param3:HabboNotifications)
      {
         super();
         var_18 = param1;
         var_77 = param2;
         var_21 = param3;
      }
      
      public function ExecuteUiLinks() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_77.componentLinks;
         for each(_loc2_ in _loc1_)
         {
            if(var_21 != null)
            {
               var_21.onExecuteLink(_loc2_);
            }
         }
      }
      
      public function get style() : HabboNotificationItemStyle
      {
         return var_77;
      }
      
      public function get content() : String
      {
         return var_18;
      }
   }
}
