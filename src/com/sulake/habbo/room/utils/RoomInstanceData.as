package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_774:LegacyWallGeometry = null;
      
      private var var_549:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_550:TileHeightMap = null;
      
      private var var_1630:String = null;
      
      private var _roomId:int = 0;
      
      private var var_551:SelectedRoomObjectData = null;
      
      private var var_775:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_774 = new LegacyWallGeometry();
         var_775 = new RoomCamera();
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_549 != null)
         {
            var_549.dispose();
         }
         var_549 = param1;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_550 != null)
         {
            var_550.dispose();
         }
         var_550 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_1630 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_774;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return var_551;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_775;
      }
      
      public function dispose() : void
      {
         if(var_550 != null)
         {
            var_550.dispose();
            var_550 = null;
         }
         if(var_774 != null)
         {
            var_774.dispose();
            var_774 = null;
         }
         if(var_775 != null)
         {
            var_775.dispose();
            var_775 = null;
         }
         if(var_549 != null)
         {
            var_549.dispose();
            var_549 = null;
         }
         if(var_551 != null)
         {
            var_551.dispose();
            var_551 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_550;
      }
      
      public function get worldType() : String
      {
         return var_1630;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_551 != null)
         {
            var_551.dispose();
         }
         var_551 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_549;
      }
   }
}
