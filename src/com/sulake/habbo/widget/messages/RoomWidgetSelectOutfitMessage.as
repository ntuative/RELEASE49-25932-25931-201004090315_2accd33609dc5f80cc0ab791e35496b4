package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_886:String = "select_outfit";
       
      
      private var var_2010:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_886);
         var_2010 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_2010;
      }
   }
}
