package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1368:String = "F";
      
      public static const const_1010:String = "M";
       
      
      private var var_82:Number = 0;
      
      private var var_319:String = "";
      
      private var var_1687:int = 0;
      
      private var var_1684:String = "";
      
      private var var_1688:int = 0;
      
      private var var_1689:int = 0;
      
      private var var_1686:String = "";
      
      private var var_580:String = "";
      
      private var _id:int = 0;
      
      private var var_183:Boolean = false;
      
      private var var_218:int = 0;
      
      private var var_1685:String = "";
      
      private var _name:String = "";
      
      private var var_1683:int = 0;
      
      private var _y:Number = 0;
      
      private var var_81:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_81;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_218;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_183)
         {
            var_218 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_183)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_1687;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_183)
         {
            var_1688 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_1685;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_183)
         {
            var_1686 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_183)
         {
            var_1685 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_183)
         {
            var_1689 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_183)
         {
            var_319 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_183)
         {
            var_1687 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_183)
         {
            var_580 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1688;
      }
      
      public function get groupID() : String
      {
         return var_1686;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_183)
         {
            var_1683 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_183)
         {
            var_1684 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_183 = true;
      }
      
      public function get sex() : String
      {
         return var_580;
      }
      
      public function get figure() : String
      {
         return var_319;
      }
      
      public function get webID() : int
      {
         return var_1683;
      }
      
      public function get custom() : String
      {
         return var_1684;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_183)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_183)
         {
            var_81 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_183)
         {
            var_82 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_82;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1689;
      }
   }
}
