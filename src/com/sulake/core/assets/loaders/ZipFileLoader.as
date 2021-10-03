package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   
   public class ZipFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_103:URLStream;
      
      protected var var_941:String;
      
      protected var _type:String;
      
      public function ZipFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_941 = param2 == null ? "" : param2.url;
         _type = param1;
         var_103 = new URLStream();
         var_103.addEventListener(Event.COMPLETE,loadEventHandler);
         var_103.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_103.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_103.addEventListener(Event.OPEN,loadEventHandler);
         var_103.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_103.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return var_103.bytesAvailable;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_103.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_103.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_103.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_103.removeEventListener(Event.OPEN,loadEventHandler);
            var_103.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_103.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            var_103.close();
            var_103 = null;
            _type = null;
            var_941 = null;
         }
      }
      
      public function load(param1:URLRequest) : void
      {
         var_941 = param1.url;
         var_103.load(param1);
      }
      
      public function get mimeType() : String
      {
         return _type;
      }
      
      public function get url() : String
      {
         return var_941;
      }
      
      public function get bytesLoaded() : uint
      {
         return var_103.bytesAvailable;
      }
      
      public function get content() : Object
      {
         return var_103;
      }
   }
}
