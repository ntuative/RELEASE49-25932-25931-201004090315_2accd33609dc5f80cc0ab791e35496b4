package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2342:int;
      
      private var var_2345:int;
      
      private var var_85:Array;
      
      private var var_222:Array;
      
      private var var_2341:int;
      
      private var var_2340:int;
      
      private var var_2344:int;
      
      private var var_2343:int;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_85 = new Array();
         this.var_222 = new Array();
         return true;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2342;
      }
      
      public function get friends() : Array
      {
         return this.var_222;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2341;
      }
      
      public function get categories() : Array
      {
         return this.var_85;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2345;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2343;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2343 = param1.readInteger();
         this.var_2341 = param1.readInteger();
         this.var_2342 = param1.readInteger();
         this.var_2344 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_85.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_222.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2345 = param1.readInteger();
         this.var_2340 = param1.readInteger();
         return true;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2344;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2340;
      }
   }
}
