package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_319:String;
      
      private var var_1344:String;
      
      private var var_1343:String;
      
      private var var_1221:int;
      
      private var var_560:int;
      
      private var var_1342:String;
      
      private var _name:String;
      
      private var var_1345:Boolean;
      
      private var var_740:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_560 = param1.readInteger();
         this.var_740 = param1.readBoolean();
         this.var_1345 = param1.readBoolean();
         this.var_319 = param1.readString();
         this.var_1221 = param1.readInteger();
         this.var_1343 = param1.readString();
         this.var_1344 = param1.readString();
         this.var_1342 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_560;
      }
      
      public function get realName() : String
      {
         return var_1342;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1343;
      }
      
      public function get categoryId() : int
      {
         return var_1221;
      }
      
      public function get online() : Boolean
      {
         return var_740;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1345;
      }
      
      public function get lastAccess() : String
      {
         return var_1344;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_319;
      }
   }
}
