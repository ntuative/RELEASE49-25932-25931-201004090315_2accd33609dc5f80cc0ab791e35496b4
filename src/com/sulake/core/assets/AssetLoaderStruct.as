package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_758:IAssetLoader;
      
      private var var_1148:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1148 = param1;
         var_758 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_758;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_758 != null)
            {
               if(true)
               {
                  var_758.dispose();
                  var_758 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1148;
      }
   }
}
