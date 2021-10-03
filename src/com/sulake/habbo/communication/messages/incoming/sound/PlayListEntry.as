package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1674:int;
      
      private var var_1777:int = 0;
      
      private var var_1778:String;
      
      private var var_1780:int;
      
      private var var_1779:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1674 = param1;
         var_1780 = param2;
         var_1779 = param3;
         var_1778 = param4;
      }
      
      public function get length() : int
      {
         return var_1780;
      }
      
      public function get name() : String
      {
         return var_1779;
      }
      
      public function get creator() : String
      {
         return var_1778;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_1777;
      }
      
      public function get id() : int
      {
         return var_1674;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_1777 = param1;
      }
   }
}
