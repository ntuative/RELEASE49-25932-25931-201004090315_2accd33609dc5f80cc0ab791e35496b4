package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2306:Boolean;
      
      private var var_2309:int;
      
      private var var_2307:Boolean;
      
      private var var_1550:String;
      
      private var var_1342:String;
      
      private var var_1819:int;
      
      private var var_2116:String;
      
      private var var_2308:String;
      
      private var var_2117:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1819 = param1.readInteger();
         this.var_1550 = param1.readString();
         this.var_2116 = param1.readString();
         this.var_2306 = param1.readBoolean();
         this.var_2307 = param1.readBoolean();
         param1.readString();
         this.var_2309 = param1.readInteger();
         this.var_2117 = param1.readString();
         this.var_2308 = param1.readString();
         this.var_1342 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1342;
      }
      
      public function get avatarName() : String
      {
         return this.var_1550;
      }
      
      public function get avatarId() : int
      {
         return this.var_1819;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2306;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2308;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2117;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2307;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2116;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2309;
      }
   }
}
