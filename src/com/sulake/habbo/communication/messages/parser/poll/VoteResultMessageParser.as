package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1275:int;
      
      private var var_1002:String;
      
      private var var_718:Array;
      
      private var var_1051:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_718.slice();
      }
      
      public function flush() : Boolean
      {
         var_1002 = "";
         var_1051 = [];
         var_718 = [];
         var_1275 = 0;
         return true;
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
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1002 = param1.readString();
         var_1051 = [];
         var_718 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_1051.push(param1.readString());
            var_718.push(param1.readInteger());
            _loc3_++;
         }
         var_1275 = param1.readInteger();
         return true;
      }
   }
}
