package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_319:String;
      
      private var var_2332:String;
      
      private var var_2335:int;
      
      private var var_2334:int;
      
      private var var_580:String;
      
      private var var_1342:String;
      
      private var _name:String;
      
      private var var_462:int;
      
      private var var_781:int;
      
      private var var_2333:int;
      
      private var var_2069:int;
      
      private var var_2331:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2334;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1342;
      }
      
      public function get customData() : String
      {
         return this.var_2332;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_462;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2335;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2331;
      }
      
      public function get figure() : String
      {
         return this.var_319;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2069;
      }
      
      public function get sex() : String
      {
         return this.var_580;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_319 = param1.readString();
         this.var_580 = param1.readString();
         this.var_2332 = param1.readString();
         this.var_1342 = param1.readString();
         this.var_2333 = param1.readInteger();
         this.var_2331 = param1.readString();
         this.var_2335 = param1.readInteger();
         this.var_2334 = param1.readInteger();
         this.var_2069 = param1.readInteger();
         this.var_781 = param1.readInteger();
         this.var_462 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2333;
      }
      
      public function get respectLeft() : int
      {
         return this.var_781;
      }
   }
}
