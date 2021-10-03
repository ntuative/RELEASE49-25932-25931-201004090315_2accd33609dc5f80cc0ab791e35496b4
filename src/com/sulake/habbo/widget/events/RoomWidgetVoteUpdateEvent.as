package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_112:String = "RWPUE_VOTE_RESULT";
      
      public static const const_122:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1275:int;
      
      private var var_1002:String;
      
      private var var_718:Array;
      
      private var var_1051:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_1002 = param2;
         var_1051 = param3;
         var_718 = param4;
         if(var_718 == null)
         {
            var_718 = [];
         }
         var_1275 = param5;
      }
      
      public function get votes() : Array
      {
         return var_718.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1275;
      }
      
      public function get question() : String
      {
         return var_1002;
      }
      
      public function get choices() : Array
      {
         return var_1051.slice();
      }
   }
}
