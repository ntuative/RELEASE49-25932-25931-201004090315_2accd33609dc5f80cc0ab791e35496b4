package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_2104:int;
      
      private var var_2103:int;
      
      private var var_2149:Boolean;
      
      private var var_2150:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2148:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_2103 = param1;
         var_2104 = param2;
         var_2150 = param3;
         var_2148 = param4;
         var_2149 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2103,var_2104,var_2150,var_2148,int(var_2149)];
      }
      
      public function dispose() : void
      {
      }
   }
}
