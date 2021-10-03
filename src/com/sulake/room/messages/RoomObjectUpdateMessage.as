package com.sulake.room.messages
{
   import com.sulake.room.utils.IVector3d;
   
   public class RoomObjectUpdateMessage
   {
       
      
      protected var var_67:IVector3d;
      
      protected var var_218:IVector3d;
      
      public function RoomObjectUpdateMessage(param1:IVector3d, param2:IVector3d)
      {
         super();
         var_67 = param1;
         var_218 = param2;
      }
      
      public function get loc() : IVector3d
      {
         return var_67;
      }
      
      public function get dir() : IVector3d
      {
         return var_218;
      }
   }
}
