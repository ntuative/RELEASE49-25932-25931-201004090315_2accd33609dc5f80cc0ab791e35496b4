package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_964:String = "AssetLoaderEventUnload";
      
      public static const const_44:String = "AssetLoaderEventError";
      
      public static const const_861:String = "AssetLoaderEventOpen";
      
      public static const const_872:String = "AssetLoaderEventProgress";
      
      public static const const_821:String = "AssetLoaderEventStatus";
      
      public static const const_33:String = "AssetLoaderEventComplete";
       
      
      private var var_376:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         var_376 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return var_376;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,var_376);
      }
   }
}
