package com.sulake.habbo.communication.messages.parser.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.avatar.OutfitData;
   
   public class WardrobeMessageParser implements IMessageParser
   {
       
      
      private var var_1582:Array;
      
      private var var_30:int;
      
      public function WardrobeMessageParser()
      {
         super();
      }
      
      public function get outfits() : Array
      {
         return var_1582;
      }
      
      public function get state() : int
      {
         return var_30;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:* = null;
         var_30 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new OutfitData(param1);
            var_1582.push(_loc4_);
            _loc3_++;
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_30 = 0;
         var_1582 = [];
         return true;
      }
   }
}
