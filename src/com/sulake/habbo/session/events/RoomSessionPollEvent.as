package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPollEvent extends RoomSessionEvent
   {
      
      public static const const_119:String = "RSPE_POLL_CONTENT";
      
      public static const const_124:String = "RSPE_POLL_OFFER";
      
      public static const const_65:String = "RSPE_POLL_ERROR";
       
      
      private var var_1066:Array = null;
      
      private var var_1304:String = "";
      
      private var var_1189:String;
      
      private var var_1303:String = "";
      
      private var var_1065:int = 0;
      
      private var _id:int = -1;
      
      public function RoomSessionPollEvent(param1:String, param2:IRoomSession, param3:int)
      {
         _id = param3;
         super(param1,param2);
      }
      
      public function get questionArray() : Array
      {
         return var_1066;
      }
      
      public function get startMessage() : String
      {
         return var_1304;
      }
      
      public function get summary() : String
      {
         return var_1189;
      }
      
      public function set startMessage(param1:String) : void
      {
         var_1304 = param1;
      }
      
      public function set numQuestions(param1:int) : void
      {
         var_1065 = param1;
      }
      
      public function set summary(param1:String) : void
      {
         var_1189 = param1;
      }
      
      public function get numQuestions() : int
      {
         return var_1065;
      }
      
      public function set endMessage(param1:String) : void
      {
         var_1303 = param1;
      }
      
      public function get endMessage() : String
      {
         return var_1303;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set questionArray(param1:Array) : void
      {
         var_1066 = param1;
      }
   }
}
