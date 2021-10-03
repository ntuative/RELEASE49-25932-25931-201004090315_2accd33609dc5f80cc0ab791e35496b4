package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1295:String = "WN_CREATED";
      
      public static const const_948:String = "WN_DISABLE";
      
      public static const const_890:String = "WN_DEACTIVATED";
      
      public static const const_935:String = "WN_OPENED";
      
      public static const const_882:String = "WN_CLOSED";
      
      public static const const_1000:String = "WN_DESTROY";
      
      public static const const_1615:String = "WN_ARRANGED";
      
      public static const const_460:String = "WN_PARENT_RESIZED";
      
      public static const const_901:String = "WN_ENABLE";
      
      public static const const_843:String = "WN_RELOCATE";
      
      public static const const_911:String = "WN_FOCUS";
      
      public static const const_866:String = "WN_PARENT_RELOCATED";
      
      public static const const_406:String = "WN_PARAM_UPDATED";
      
      public static const const_565:String = "WN_PARENT_ACTIVATED";
      
      public static const const_166:String = "WN_RESIZED";
      
      public static const const_945:String = "WN_CLOSE";
      
      public static const const_865:String = "WN_PARENT_REMOVED";
      
      public static const const_272:String = "WN_CHILD_RELOCATED";
      
      public static const const_603:String = "WN_ENABLED";
      
      public static const const_273:String = "WN_CHILD_RESIZED";
      
      public static const const_937:String = "WN_MINIMIZED";
      
      public static const const_619:String = "WN_DISABLED";
      
      public static const const_211:String = "WN_CHILD_ACTIVATED";
      
      public static const const_413:String = "WN_STATE_UPDATED";
      
      public static const const_600:String = "WN_UNSELECTED";
      
      public static const const_459:String = "WN_STYLE_UPDATED";
      
      public static const const_1519:String = "WN_UPDATE";
      
      public static const const_407:String = "WN_PARENT_ADDED";
      
      public static const const_630:String = "WN_RESIZE";
      
      public static const const_635:String = "WN_CHILD_REMOVED";
      
      public static const const_1527:String = "";
      
      public static const const_975:String = "WN_RESTORED";
      
      public static const const_316:String = "WN_SELECTED";
      
      public static const const_979:String = "WN_MINIMIZE";
      
      public static const const_888:String = "WN_FOCUSED";
      
      public static const const_1169:String = "WN_LOCK";
      
      public static const const_322:String = "WN_CHILD_ADDED";
      
      public static const const_963:String = "WN_UNFOCUSED";
      
      public static const const_365:String = "WN_RELOCATED";
      
      public static const const_972:String = "WN_DEACTIVATE";
      
      public static const const_1298:String = "WN_CRETAE";
      
      public static const const_816:String = "WN_RESTORE";
      
      public static const const_339:String = "WN_ACTVATED";
      
      public static const const_1286:String = "WN_LOCKED";
      
      public static const const_384:String = "WN_SELECT";
      
      public static const const_1022:String = "WN_MAXIMIZE";
      
      public static const const_827:String = "WN_OPEN";
      
      public static const const_662:String = "WN_UNSELECT";
      
      public static const const_1473:String = "WN_ARRANGE";
      
      public static const const_1268:String = "WN_UNLOCKED";
      
      public static const const_1614:String = "WN_UPDATED";
      
      public static const const_1021:String = "WN_ACTIVATE";
      
      public static const const_1300:String = "WN_UNLOCK";
      
      public static const const_955:String = "WN_MAXIMIZED";
      
      public static const const_836:String = "WN_DESTROYED";
      
      public static const const_980:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1607,cancelable);
      }
   }
}
