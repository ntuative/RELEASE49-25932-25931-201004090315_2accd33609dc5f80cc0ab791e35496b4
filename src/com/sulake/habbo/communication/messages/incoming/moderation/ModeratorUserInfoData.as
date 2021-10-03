package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_1902:int;
      
      private var var_1899:int;
      
      private var var_1898:int;
      
      private var _userName:String;
      
      private var var_1897:int;
      
      private var var_1900:int;
      
      private var var_1901:int;
      
      private var _userId:int;
      
      private var var_740:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_1900 = param1.readInteger();
         var_1897 = param1.readInteger();
         var_740 = param1.readBoolean();
         var_1898 = param1.readInteger();
         var_1899 = param1.readInteger();
         var_1902 = param1.readInteger();
         var_1901 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_1901;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_740;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_1897;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_1899;
      }
      
      public function get cautionCount() : int
      {
         return var_1902;
      }
      
      public function get cfhCount() : int
      {
         return var_1898;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_1900;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
