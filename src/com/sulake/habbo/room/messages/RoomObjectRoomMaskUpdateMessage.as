package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectRoomMaskUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_1159:String = "door";
      
      public static const const_395:String = "window";
      
      public static const const_581:String = "RORMUM_ADD_MASK";
      
      public static const const_363:String = "RORMUM_ADD_MASK";
      
      public static const const_201:String = "hole";
       
      
      private var var_2001:String = "";
      
      private var var_2002:String = "";
      
      private var var_2000:String = "window";
      
      private var var_1999:Vector3d = null;
      
      private var _type:String = "";
      
      public function RoomObjectRoomMaskUpdateMessage(param1:String, param2:String, param3:String = null, param4:IVector3d = null, param5:String = "window")
      {
         super(null,null);
         _type = param1;
         var_2002 = param2;
         var_2001 = param3;
         if(param4 != null)
         {
            var_1999 = new Vector3d(param4.x,param4.y,param4.z);
         }
         var_2000 = param5;
      }
      
      public function get maskCategory() : String
      {
         return var_2000;
      }
      
      public function get maskId() : String
      {
         return var_2002;
      }
      
      public function get maskLocation() : IVector3d
      {
         return var_1999;
      }
      
      public function get maskType() : String
      {
         return var_2001;
      }
      
      public function get type() : String
      {
         return _type;
      }
   }
}
