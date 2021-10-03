package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_112:String = "RSPE_VOTE_RESULT";
      
      public static const const_122:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1275:int = 0;
      
      private var var_1002:String = "";
      
      private var var_718:Array;
      
      private var var_1051:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_1051 = [];
         var_718 = [];
         super(param1,param2,param7,param8);
         var_1002 = param3;
         var_1051 = param4;
         var_718 = param5;
         if(var_718 == null)
         {
            var_718 = [];
         }
         var_1275 = param6;
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
