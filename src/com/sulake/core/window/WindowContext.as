package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.IScrollableWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.utils.IInternalWindowServices;
   import com.sulake.core.window.utils.IMouseCursor;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.InternalWindowServices;
   import com.sulake.core.window.utils.KeyboardEventQueue;
   import com.sulake.core.window.utils.MouseCursorControl;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static var var_939:MouseEventQueue;
      
      public static var var_1606:IMouseCursor;
      
      public static const const_1463:int = 2;
      
      private static var var_1020:Factory;
      
      private static var var_135:IWindowRenderer;
      
      public static var var_1376:KeyboardEventQueue;
      
      public static const const_1512:int = 1;
      
      public static const ERROR_DURING_EVENT_HANDLING:int = 5;
      
      public static const const_1568:int = 0;
      
      public static const const_1533:int = 3;
      
      public static const const_1397:int = 4;
       
      
      protected var var_2284:IWindowFactory;
      
      private var _disposed:Boolean = false;
      
      private var var_695:WindowController;
      
      private var var_705:Date;
      
      protected var var_2283:IWindowParser;
      
      protected var var_945:Error;
      
      protected var var_2282:IInternalWindowServices;
      
      protected var var_92:WindowController;
      
      protected var var_1387:int = -1;
      
      protected var var_87:IDesktopWindow;
      
      private var var_1478:Boolean = false;
      
      protected var var_2366:Boolean = true;
      
      private var var_180:Boolean = false;
      
      protected var var_1111:SubstituteParentController;
      
      private var var_2312:Point;
      
      protected var var_324:DisplayObjectContainer;
      
      private var var_341:IWindowContextStateListener;
      
      private var _name:String;
      
      protected var _localization:ICoreLocalizationManager;
      
      private var var_592:Point;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         var_592 = new Point();
         var_2312 = new Point();
         super();
         _name = param1;
         var_135 = param2;
         _localization = param4;
         var_324 = param5;
         var_2282 = new InternalWindowServices(this,param5);
         var_2284 = param3;
         var_2283 = new WindowParser(this);
         var_705 = new Date();
         if(var_1020 == null)
         {
            var_1020 = new Factory();
         }
         if(var_939 == null)
         {
            var_939 = new MouseEventQueue(param5);
         }
         if(var_1376 == null)
         {
            var_1376 = new KeyboardEventQueue(param5);
         }
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         var_87 = new DesktopController("_CONTEXT_DESKTOP_" + _name,this,param6);
         var_324.addChild(var_87.getDisplayObject());
         var_324.doubleClickEnabled = true;
         var_324.addEventListener(Event.RESIZE,stageResizedHandler);
         var_92 = WindowController(var_87);
         var_1111 = new SubstituteParentController(this);
         var_341 = param7;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == var_87)
         {
            var_87 = null;
         }
         if(param1.state != WindowState.const_378)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:Class = var_1020.getWindowClassByType(param3);
         if(_loc12_ == null)
         {
            handleError(WindowContext.const_1397,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = var_1111;
            }
         }
         var _loc13_:IWindow = new _loc12_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : var_87,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc13_.caption = param2;
         }
         return _loc13_;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return var_87;
      }
      
      public function render(param1:uint) : void
      {
         var_1478 = true;
         var_135.update(param1);
         var_1478 = false;
      }
      
      public function dispose() : void
      {
         _disposed = true;
         var_324.removeEventListener(Event.RESIZE,stageResizedHandler);
         var_324.removeChild(IGraphicContextHost(var_87).getGraphicContext(true) as DisplayObject);
         var_87.destroy();
         var_87 = null;
         var_1111.destroy();
         var_1111 = null;
         var_1020 = null;
         var_135 = null;
         var_92 = null;
         var_705 = null;
         var_341 = null;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(var_87 != null && true)
         {
            if(var_324 is Stage)
            {
               var_87.width = Stage(var_324).stageWidth;
               var_87.height = Stage(var_324).stageHeight;
            }
            else
            {
               var_87.width = var_324.width;
               var_87.height = var_324.height;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         _localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : Boolean
      {
         var_135.addToRenderQueue(WindowController(param1),param2,param3);
         return true;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return var_2283;
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         _localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return var_2284;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_180 = true;
         if(var_945)
         {
            throw var_945;
         }
         var _loc6_:Point = new Point();
         var _loc7_:MouseEventQueue = WindowContext.var_939;
         _loc7_.begin();
         var_592.x = -1;
         var_592.y = -1;
         while(true)
         {
            _loc2_ = _loc7_.next() as MouseEvent;
            if(_loc2_ == null)
            {
               break;
            }
            if(_loc2_.stageX != var_592.x || _loc2_.stageY != var_592.y)
            {
               var_592.x = _loc2_.stageX;
               var_592.y = _loc2_.stageY;
               _loc5_ = new Array();
               var_87.groupChildrenUnderPoint(var_592,_loc5_);
            }
            _loc3_ = _loc5_ != null ? int(_loc5_.length) : 0;
            if(_loc3_ == 1)
            {
               if(_loc2_.type == MouseEvent.MOUSE_MOVE)
               {
                  if(var_92 != var_87 && true)
                  {
                     var_92.getGlobalPosition(_loc6_);
                     var_92.update(var_92,new MouseEvent(MouseEvent.MOUSE_OUT,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                     var_92 = WindowController(var_87);
                  }
               }
            }
            while(--_loc3_ > -1)
            {
               _loc4_ = passMouseEvent(WindowController(_loc5_[_loc3_]),_loc2_);
               if(_loc4_ != null && _loc4_.visible)
               {
                  if(_loc2_.type == MouseEvent.MOUSE_MOVE)
                  {
                     if(_loc4_ != var_92)
                     {
                        if(true)
                        {
                           var_92.getGlobalPosition(_loc6_);
                           var_92.update(var_92,new MouseEvent(MouseEvent.MOUSE_OUT,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                        }
                        if(!_loc4_.disposed)
                        {
                           _loc4_.getGlobalPosition(_loc6_);
                           _loc4_.update(_loc4_,new MouseEvent(MouseEvent.MOUSE_OVER,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                        }
                        if(!_loc4_.disposed)
                        {
                           var_92 = _loc4_;
                        }
                     }
                  }
                  else if(_loc2_.type == MouseEvent.MOUSE_UP || _loc2_.type == MouseEvent.CLICK)
                  {
                     if(var_92 && true)
                     {
                        if(var_341 != null)
                        {
                           var_341.mouseEventReceived(_loc2_.type,var_92);
                        }
                     }
                  }
                  if(_loc2_.altKey)
                  {
                     if(var_92)
                     {
                        Logger.log("HOVER: undefined");
                     }
                  }
                  if(_loc4_ != var_87)
                  {
                     _loc2_.stopPropagation();
                     _loc7_.remove();
                  }
                  break;
               }
            }
         }
         _loc7_.end();
         var_180 = false;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         var_945 = param2;
         var_1387 = param1;
         if(var_2366)
         {
            throw param2;
         }
      }
      
      public function getLastError() : Error
      {
         return var_945;
      }
      
      public function getMouseCursor() : IMouseCursor
      {
         if(var_1606 == null)
         {
            var_1606 = new MouseCursorControl(var_324);
         }
         return var_1606;
      }
      
      public function flushError() : void
      {
         var_945 = null;
         var_1387 = -1;
      }
      
      public function getLastErrorCode() : int
      {
         return var_1387;
      }
      
      private function passMouseEvent(param1:WindowController, param2:MouseEvent) : WindowController
      {
         if(param1.disposed)
         {
            return null;
         }
         if(!param1.testParamFlag(WindowParam.const_48))
         {
            return null;
         }
         if(param1.testStateFlag(WindowState.const_68))
         {
            return null;
         }
         var _loc3_:Point = new Point(param2.stageX,param2.stageY);
         param1.convertPointFromGlobalToLocalSpace(_loc3_);
         var _loc4_:BitmapData = var_135.getDrawBufferForRenderable(param1);
         if(!param1.validateLocalPointIntersection(_loc3_,_loc4_))
         {
            return null;
         }
         if(param1.testParamFlag(WindowParam.const_467))
         {
            if(param1.parent != null)
            {
               return passMouseEvent(WindowController(param1.parent),param2);
            }
         }
         var _loc5_:Boolean = true;
         switch(param2.type)
         {
            case MouseEvent.MOUSE_DOWN:
               var_695 = param1;
               break;
            case MouseEvent.CLICK:
               if(var_695 != param1)
               {
                  _loc5_ = false;
               }
               else
               {
                  var_695 = null;
               }
               break;
            case MouseEvent.DOUBLE_CLICK:
               if(var_695 != param1)
               {
                  _loc5_ = false;
               }
               else
               {
                  var_695 = null;
               }
               break;
            case MouseEvent.MOUSE_WHEEL:
               if(!(param1 is IScrollableWindow) && !(param1 is IScrollbarWindow))
               {
                  return null;
               }
               break;
         }
         if(_loc5_)
         {
            if(!param1.update(param1,param2))
            {
               if(param1.parent)
               {
                  return passMouseEvent(WindowController(param1.parent),param2);
               }
            }
         }
         return param1;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return var_87.findChildByName(param1);
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return var_2282;
      }
   }
}
