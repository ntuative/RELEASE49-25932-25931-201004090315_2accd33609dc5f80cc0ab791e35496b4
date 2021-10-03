package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_260:String = "WE_CHILD_RESIZED";
      
      public static const const_1311:String = "WE_CLOSE";
      
      public static const const_1391:String = "WE_DESTROY";
      
      public static const const_141:String = "WE_CHANGE";
      
      public static const const_1232:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1592:String = "WE_PARENT_RESIZE";
      
      public static const const_96:String = "WE_UPDATE";
      
      public static const const_1277:String = "WE_MAXIMIZE";
      
      public static const const_358:String = "WE_DESTROYED";
      
      public static const const_803:String = "WE_UNSELECT";
      
      public static const const_1296:String = "WE_MAXIMIZED";
      
      public static const const_1483:String = "WE_UNLOCKED";
      
      public static const const_412:String = "WE_CHILD_REMOVED";
      
      public static const const_175:String = "WE_OK";
      
      public static const const_45:String = "WE_RESIZED";
      
      public static const const_1382:String = "WE_ACTIVATE";
      
      public static const const_245:String = "WE_ENABLED";
      
      public static const const_397:String = "WE_CHILD_RELOCATED";
      
      public static const const_1345:String = "WE_CREATE";
      
      public static const const_683:String = "WE_SELECT";
      
      public static const const_174:String = "";
      
      public static const const_1514:String = "WE_LOCKED";
      
      public static const const_1441:String = "WE_PARENT_RELOCATE";
      
      public static const const_1613:String = "WE_CHILD_REMOVE";
      
      public static const const_1526:String = "WE_CHILD_RELOCATE";
      
      public static const const_1491:String = "WE_LOCK";
      
      public static const const_204:String = "WE_FOCUSED";
      
      public static const const_507:String = "WE_UNSELECTED";
      
      public static const const_798:String = "WE_DEACTIVATED";
      
      public static const const_1308:String = "WE_MINIMIZED";
      
      public static const const_1564:String = "WE_ARRANGED";
      
      public static const const_1578:String = "WE_UNLOCK";
      
      public static const const_1479:String = "WE_ATTACH";
      
      public static const const_1288:String = "WE_OPEN";
      
      public static const const_1354:String = "WE_RESTORE";
      
      public static const const_1588:String = "WE_PARENT_RELOCATED";
      
      public static const const_1212:String = "WE_RELOCATE";
      
      public static const const_1525:String = "WE_CHILD_RESIZE";
      
      public static const const_1623:String = "WE_ARRANGE";
      
      public static const const_1206:String = "WE_OPENED";
      
      public static const const_1306:String = "WE_CLOSED";
      
      public static const const_1509:String = "WE_DETACHED";
      
      public static const const_1552:String = "WE_UPDATED";
      
      public static const const_1327:String = "WE_UNFOCUSED";
      
      public static const const_381:String = "WE_RELOCATED";
      
      public static const const_1287:String = "WE_DEACTIVATE";
      
      public static const const_215:String = "WE_DISABLED";
      
      public static const const_647:String = "WE_CANCEL";
      
      public static const const_524:String = "WE_ENABLE";
      
      public static const const_1231:String = "WE_ACTIVATED";
      
      public static const const_1215:String = "WE_FOCUS";
      
      public static const const_1558:String = "WE_DETACH";
      
      public static const const_1204:String = "WE_RESTORED";
      
      public static const const_1272:String = "WE_UNFOCUS";
      
      public static const const_60:String = "WE_SELECTED";
      
      public static const const_1196:String = "WE_PARENT_RESIZED";
      
      public static const const_1251:String = "WE_CREATED";
      
      public static const const_1522:String = "WE_ATTACHED";
      
      public static const const_1202:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1607:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1384:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1607 = param3;
         var_1384 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1384;
      }
      
      public function get related() : IWindow
      {
         return var_1607;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1384 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
