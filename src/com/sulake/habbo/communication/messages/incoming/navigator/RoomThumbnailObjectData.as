package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1566:int;
      
      private var var_1565:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1566;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1566 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1566 = this.var_1566;
         _loc1_.var_1565 = this.var_1565;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1565 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1565;
      }
   }
}
