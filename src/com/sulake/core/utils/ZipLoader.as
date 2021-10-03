package com.sulake.core.utils
{
   import deng.fzip.FZip;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   
   public class ZipLoader extends LibraryLoader
   {
       
      
      private var var_403:FZip;
      
      private var var_1208:Array;
      
      private var var_1843:uint = 0;
      
      private var var_822:int = 0;
      
      private var var_2380:Array;
      
      public function ZipLoader(param1:Boolean)
      {
         super(param1);
         var_1208 = new Array();
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log(param1.text);
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,0));
      }
      
      public function get resources() : Array
      {
         return var_1208;
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var _loc2_:LoaderInfo = param1.target as LoaderInfo;
         var _loc3_:String = getQualifiedClassName(var_16.content);
         var_1208.push(var_16.contentLoaderInfo.applicationDomain.getDefinition(_loc3_));
         ++var_822;
         if(var_1208.length == var_1843)
         {
            var_16.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoaderComplete);
            var_16.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,0));
         }
         else
         {
            var_16.loadBytes(var_403.getFileAt(var_822).content);
         }
      }
      
      override public function load(param1:URLRequest, param2:LoaderContext = null, param3:int = 1) : void
      {
         var_326 = param1;
         if(var_403)
         {
            var_403.close();
         }
         var_403 = new FZip();
         var_403.addEventListener(Event.COMPLETE,onComplete);
         var_403.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_403.addEventListener(ProgressEvent.PROGRESS,onProgress);
         var_403.load(var_326);
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,0));
      }
      
      private function onComplete(param1:Event) : void
      {
         var_822 = 0;
         var_1843 = var_403.getFileCount();
         removeEventListeners();
         var_16.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
         var_16.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_16.loadBytes(var_403.getFileAt(var_822).content);
      }
   }
}
