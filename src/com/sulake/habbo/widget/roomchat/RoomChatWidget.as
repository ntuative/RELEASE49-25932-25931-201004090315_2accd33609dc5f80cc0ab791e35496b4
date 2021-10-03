package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetChatUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChatSelectAvatarMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class RoomChatWidget extends RoomWidgetBase implements IUpdateReceiver
   {
      
      private static const const_752:int = 10;
      
      private static const const_486:int = 25;
      
      private static const const_1047:int = 6000;
      
      private static const const_1048:int = 9;
      
      private static const const_753:int = 4000;
      
      private static const const_1045:int = 3;
      
      private static const const_99:int = 18;
      
      private static const const_1044:int = 25;
      
      private static const const_1046:int = 1;
      
      private static const const_275:int = 9;
      
      private static const const_487:int = 8;
      
      private static const const_341:int = 0;
      
      private static const const_485:int = (const_487 + const_341) * const_99 + const_99;
       
      
      private var var_788:Number = 1;
      
      private var _disposed:Boolean = false;
      
      private var var_562:int = 18;
      
      private var var_336:IItemListWindow;
      
      private var var_655:int = 0;
      
      private var var_34:IWindowContainer;
      
      private var var_446:Boolean = false;
      
      private var var_147:int;
      
      private var var_1698:int = 0;
      
      private var var_1150:Boolean = false;
      
      private var var_121:IWindowContainer;
      
      private var _itemList:Array;
      
      private var var_24:RoomChatHistoryViewer;
      
      private var var_1700:int = 150;
      
      private var var_469:Number = 1;
      
      private var var_62:Array;
      
      private var var_213:Array;
      
      private var var_657:int = 0;
      
      private var var_1699:int;
      
      private var var_656:Point;
      
      private var var_1418:Number = 0;
      
      private var var_21:Component = null;
      
      public function RoomChatWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager, param5:int, param6:Component)
      {
         _itemList = new Array();
         var_62 = new Array();
         var_213 = new Array();
         var_656 = new Point();
         var_147 = const_485 + const_275;
         super(param1,param2,param3);
         var_1699 = param5;
         var_34 = param1.createWindow("chat_container","",HabboWindowType.const_59,HabboWindowStyle.const_39,HabboWindowParam.const_40,new Rectangle(0,0,200,var_147 + RoomChatHistoryPulldown.const_76),null,0) as IWindowContainer;
         var_34.background = true;
         var_34.color = 33554431;
         var_34.tags.push("room_widget_chat");
         var_336 = param1.createWindow("chat_contentlist","",HabboWindowType.const_1011,HabboWindowStyle.const_40,0 | 0,new Rectangle(0,0,200,var_147),null,0) as IItemListWindow;
         var_34.addChild(var_336);
         var_121 = param1.createWindow("chat_active_content","",HabboWindowType.const_59,HabboWindowStyle.const_40,HabboWindowParam.const_71,new Rectangle(0,0,200,var_147),null,0) as IWindowContainer;
         var_336.addListItem(var_121);
         var_24 = new RoomChatHistoryViewer(this,param1,var_34,param2);
         var_1700 = int(param4.getKey("chat.history.item.max.count","150"));
         var _loc7_:Boolean = int(param4.getKey("chat.history.disabled","0")) == 1 ? true : false;
         if(var_24 != null)
         {
            var_24.disabled = _loc7_;
         }
         if(param6 != null)
         {
            var_21 = param6;
            var_21.registerUpdateReceiver(this,1);
         }
      }
      
      public function onPulldownCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(var_24 != null)
         {
            var_24.hideHistoryViewer();
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetChatUpdateEvent.const_727,onChatMessage);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_256,onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_525,onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_708,onRoomViewUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function get mainWindow() : IWindow
      {
         return var_34;
      }
      
      public function onItemMouseOver(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      public function resetArea() : void
      {
         if(var_24 == null)
         {
            return;
         }
         animationStop();
         var_147 = const_485 + const_275;
         var_34.height = var_147 + var_24.pulldownBarHeight;
         var_336.width = 0 - 0;
         var_336.height = var_147;
         var_121.width = 0 - 0;
         if(historyViewerActive())
         {
            var_121.height = getTotalContentHeight() + const_275;
         }
         else
         {
            var_121.height = var_147;
         }
         var_336.scrollV = 1;
         if(!historyViewerActive())
         {
            var_24.containerResized(var_34.rectangle);
         }
         purgeItems();
         alignItems();
      }
      
      public function resizeContainerToLowestItem() : void
      {
         var _loc4_:* = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc4_ = _itemList[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_62.length)
         {
            _loc4_ = var_62[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc1_ += const_486;
         _loc1_ = _loc1_ < 0 ? 0 : int(_loc1_);
         var _loc3_:int = var_34.rectangle.bottom;
         stretchAreaBottomTo(var_34.rectangle.top + _loc1_);
         _loc3_ -= var_34.rectangle.bottom;
         if(Math.abs(_loc3_) < RoomChatHistoryViewer.const_867)
         {
            resetArea();
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc4_ = _itemList[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_62.length)
         {
            _loc4_ = var_62[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         var_1150 = true;
      }
      
      private function processBuffer() : void
      {
         if(var_446)
         {
            return;
         }
         if(false)
         {
            return;
         }
         while(var_62.length > const_1046 || historyViewerActive() && false)
         {
            activateItemFromBuffer();
         }
         var _loc1_:Boolean = false;
         if(false)
         {
            _loc1_ = true;
         }
         else
         {
            _loc1_ = checkLastItemAllowsAdding(var_62[0]);
         }
         if(_loc1_)
         {
            activateItemFromBuffer();
            var_655 = getTimer() + const_753;
         }
         else
         {
            if(false && false)
            {
               var_562 = getItemSpacing(_itemList["-1"],var_62[0]);
            }
            else
            {
               var_562 = const_99;
            }
            animationStart();
         }
      }
      
      private function setChatItemLocHorizontal(param1:RoomChatItem) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         if(param1 == null || var_24 == null)
         {
            return;
         }
         var _loc2_:Number = (param1.senderX + var_656.x) * var_788;
         var _loc3_:Number = _loc2_ - param1.width / 2;
         var _loc4_:Number = _loc3_ + param1.width;
         var _loc5_:Number = 0 - const_752;
         var _loc6_:Number = 0 + const_752 - 0;
         var _loc7_:Boolean = _loc3_ >= _loc5_ && _loc3_ <= _loc6_;
         var _loc8_:Boolean = _loc4_ >= _loc5_ && _loc4_ <= _loc6_;
         if(_loc7_ && _loc8_)
         {
            _loc9_ = _loc3_;
            _loc10_ = _loc9_;
         }
         else if(_loc2_ >= 0)
         {
            _loc9_ = _loc6_ - param1.width;
         }
         else
         {
            _loc9_ = _loc5_;
         }
         param1.x = _loc9_ + 0 + var_34.x;
         if(_loc2_ < _loc5_ || _loc2_ > _loc6_)
         {
            param1.hidePointer();
         }
         else
         {
            param1.setPointerOffset(_loc3_ - _loc9_);
         }
      }
      
      public function onItemMouseOut(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      private function checkLastItemAllowsAdding(param1:RoomChatItem) : Boolean
      {
         if(false)
         {
            return true;
         }
         var _loc2_:RoomChatItem = _itemList["-1"];
         if(param1 == null || _loc2_ == null)
         {
            return false;
         }
         if(_loc2_.view == null)
         {
            return true;
         }
         if(var_121.rectangle.bottom - (var_121.y + _loc2_.y + _loc2_.height) <= getItemSpacing(_loc2_,param1))
         {
            return false;
         }
         return true;
      }
      
      public function mouseUp() : void
      {
         var _loc1_:Number = var_34.rectangle.bottom - 0;
         if(_loc1_ < const_485)
         {
            if(_loc1_ <= var_147 + var_34.y)
            {
               if(historyViewerActive())
               {
                  hideHistoryViewer();
               }
               resetArea();
               return;
            }
         }
         if(var_1150 && !historyViewerActive())
         {
            resetArea();
            var_1150 = false;
         }
      }
      
      private function getFreeItemId() : String
      {
         return "chat_" + var_1699.toString() + "_item_" + (var_1698++).toString();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(_disposed)
         {
            return;
         }
         while(false)
         {
            _loc1_ = var_213.shift();
         }
         var_24.dispose();
         var_24 = null;
         while(false)
         {
            _loc1_ = _itemList.shift();
            _loc1_.dispose();
         }
         while(false)
         {
            _loc1_ = var_62.shift();
            _loc1_.dispose();
         }
         var_34.dispose();
         if(var_21 != null)
         {
            var_21.removeUpdateReceiver(this);
            var_21 = null;
         }
         super.dispose();
         _disposed = true;
      }
      
      private function animationStop() : void
      {
         var_446 = false;
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetChatUpdateEvent.const_727,onChatMessage);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_256,onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_525,onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_708,onRoomViewUpdate);
      }
      
      public function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(var_24 != null)
         {
            var_24.beginDrag(param1.stageY,true);
         }
      }
      
      private function alignItems() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(var_24 == null)
         {
            return;
         }
         _loc1_ = -1;
         while(_loc1_ >= 0)
         {
            _loc2_ = _itemList[_loc1_];
            if(_loc2_ != null)
            {
               setChatItemLocHorizontal(_loc2_);
               setChatItemLocVertical(_loc2_);
            }
            _loc1_--;
         }
         _loc1_ = 0;
         while(_loc1_ < _itemList.length)
         {
            _loc2_ = _itemList[_loc1_];
            if(_loc2_ != null)
            {
               setChatItemRenderable(_loc2_);
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < var_62.length)
         {
            _loc2_ = var_62[_loc1_];
            if(_loc2_ != null)
            {
               setChatItemLocHorizontal(_loc2_);
            }
            _loc1_++;
         }
      }
      
      private function onChatMessage(param1:RoomWidgetChatUpdateEvent) : void
      {
         var _loc2_:RoomChatItem = new RoomChatItem(this,windowManager,assets,getFreeItemId(),localizations);
         _loc2_.define(param1);
         if(var_788 != 1)
         {
            _loc2_.senderX /= var_788;
         }
         _loc2_.senderX -= 0;
         setChatItemLocHorizontal(_loc2_);
         var_62.push(_loc2_);
         processBuffer();
      }
      
      private function setChatItemLocVertical(param1:RoomChatItem) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1 != null)
         {
            _loc2_ = _itemList.indexOf(param1);
            _loc3_ = !!historyViewerActive() ? 0 : Number(var_469);
            if(_loc2_ == -1)
            {
               param1.y = getAreaBottom() - (_loc3_ + 1) * const_99 - const_275;
            }
            else
            {
               _loc4_ = _itemList[_loc2_ + 1].aboveLevels;
               if(_loc4_ < 2)
               {
                  param1.y = _itemList[_loc2_ + 1].y - getItemSpacing(param1,_itemList[_loc2_ + 1]);
               }
               else
               {
                  param1.y = _itemList[_loc2_ + 1].y - _loc4_ * const_99;
               }
            }
         }
      }
      
      public function disableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_62.length)
         {
            _loc1_ = var_62[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
      }
      
      private function animationStart() : void
      {
         if(var_446)
         {
            return;
         }
         selectItemsToMove();
         var_446 = true;
      }
      
      public function hideHistoryViewer() : void
      {
         if(var_24 != null)
         {
            var_24.hideHistoryViewer();
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         if(getTimer() > var_655 && var_655 > 0)
         {
            var_655 = -1;
            animationStart();
         }
         if(var_446)
         {
            _loc2_ = param1 / const_1044 * const_1045;
            if(_loc2_ + var_657 > var_562)
            {
               _loc2_ = var_562 - var_657;
            }
            if(_loc2_ > 0)
            {
               moveItemsUp(_loc2_);
               var_657 += _loc2_;
            }
            if(var_657 >= var_562)
            {
               var_562 = const_99;
               var_657 = 0;
               animationStop();
               processBuffer();
               var_655 = getTimer() + const_753;
            }
         }
         if(var_24 != null)
         {
            var_24.update(param1);
         }
      }
      
      public function getTotalContentHeight() : int
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc3_];
            if(_loc1_ != null)
            {
               if(_loc3_ == 0)
               {
                  _loc2_ += const_99;
               }
               else
               {
                  _loc2_ += getItemSpacing(_itemList[_loc3_ - 1],_loc1_);
               }
               _loc2_ += (_loc1_.aboveLevels - 1) * const_99;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function onRoomViewUpdate(param1:RoomWidgetRoomViewUpdateEvent) : void
      {
         var _loc2_:Rectangle = param1.rect;
         if(param1.scale > 0)
         {
            if(var_1418 == 0)
            {
               var_1418 = param1.scale;
            }
            else
            {
               var_788 = param1.scale / var_1418;
            }
         }
         if(param1.positionDelta != null)
         {
            var_656.x += param1.positionDelta.x / var_788;
            var_656.y += param1.positionDelta.y / var_788;
         }
         if(param1.rect != null)
         {
            if(var_24 == null)
            {
               return;
            }
            var_34.width = _loc2_.width;
            var_34.height = var_147 + var_24.pulldownBarHeight;
            var_336.width = 0 - 0;
            var_336.height = var_147;
            var_336.x = var_34.x;
            var_336.y = var_34.y;
            var_121.width = 0 - 0;
            var_121.height = var_147;
            if(historyViewerActive())
            {
               reAlignItemsToHistoryContent();
            }
            var_24.containerResized(var_34.rectangle,true);
         }
         alignItems();
      }
      
      private function getAreaBottom() : Number
      {
         if(historyViewerActive())
         {
            return var_121.height;
         }
         return var_147 + var_34.y;
      }
      
      private function purgeItems() : void
      {
         var _loc2_:* = null;
         if(historyViewerActive())
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         while(_itemList.length > var_1700)
         {
            _loc2_ = _itemList.shift();
            _loc3_ = var_213.indexOf(_loc2_);
            if(_loc3_ > -1)
            {
               var_213.splice(_loc3_,1);
            }
            if(_loc2_.view != null)
            {
               var_121.removeChild(_loc2_.view);
               _loc2_.hideView();
            }
            _loc2_.dispose();
            _loc2_ = null;
         }
         var _loc4_:Boolean = false;
         _loc1_ = 0;
         for(; _loc1_ < _itemList.length; _loc1_++)
         {
            _loc2_ = _itemList[_loc1_];
            if(_loc2_ != null)
            {
               if(_loc2_.y > -const_486)
               {
                  _loc4_ = true;
               }
               _loc2_.aboveLevels = 1;
               if(_loc2_.view != null)
               {
                  _loc3_ = var_213.indexOf(_loc2_);
                  if(_loc3_ > -1)
                  {
                     var_213.splice(_loc3_,1);
                  }
                  var_121.removeChild(_loc2_.view);
                  _loc2_.hideView();
               }
               continue;
               break;
            }
         }
         if(false)
         {
            _loc4_ = true;
         }
         if(getTotalContentHeight() > const_99 && !_loc4_ && !historyViewerActive())
         {
            if(var_24 != null)
            {
               stretchAreaBottomTo(var_34.y);
               alignItems();
               if(!historyViewerActive())
               {
                  var_24.showHistoryViewer();
               }
               if(!historyViewerVisible())
               {
                  var_24.visible = true;
               }
            }
         }
         else if(historyViewerVisible())
         {
            var_24.visible = false;
         }
      }
      
      public function stretchAreaBottomBy(param1:Number) : void
      {
         var _loc2_:Number = var_34.rectangle.bottom + param1 - 0;
         stretchAreaBottomTo(_loc2_);
      }
      
      private function activateItemFromBuffer() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(false)
         {
            return;
         }
         if(historyViewerMinimized())
         {
            resetArea();
            hideHistoryViewer();
         }
         if(!checkLastItemAllowsAdding(var_62[0]))
         {
            selectItemsToMove();
            moveItemsUp(getItemSpacing(_itemList["-1"],var_62[0]));
            if(!checkLastItemAllowsAdding(var_62[0]))
            {
               var_121.height += const_99;
               if(var_24 != null)
               {
                  var_24.containerResized(var_34.rectangle);
               }
            }
         }
         _loc1_ = var_62.shift();
         if(_loc1_ != null)
         {
            _loc1_.renderView();
            _loc2_ = _loc1_.view;
            if(_loc2_ != null)
            {
               var_121.addChild(_loc2_);
               _loc1_.timestamp = new Date().time;
               _itemList.push(_loc1_);
               _loc3_ = 0;
               if(false)
               {
                  _loc3_ = _itemList["-2"].screenLevel;
                  if(historyViewerActive())
                  {
                     _loc1_.screenLevel = _loc3_ + 1;
                  }
                  else
                  {
                     _loc1_.screenLevel = _loc3_ + Math.max(var_469,1);
                  }
               }
               else
               {
                  _loc1_.screenLevel = 100;
               }
               _loc1_.aboveLevels = var_469;
               if(_loc1_.aboveLevels > const_487 + const_341 + 2)
               {
                  _loc1_.aboveLevels = const_487 + const_341 + 2;
               }
               var_469 = 0;
               setChatItemLocHorizontal(_loc1_);
               setChatItemLocVertical(_loc1_);
               setChatItemRenderable(_loc1_);
            }
         }
      }
      
      public function stretchAreaBottomTo(param1:Number) : void
      {
         var _loc2_:int = var_34.context.getDesktopWindow().height - 0;
         param1 = Math.min(param1,_loc2_);
         var_147 = param1 - 0;
         var_34.height = var_147 + RoomChatHistoryPulldown.const_76;
         if(var_24 != null)
         {
            var_24.containerResized(var_34.rectangle);
         }
      }
      
      public function onItemMouseClick(param1:int, param2:String, param3:int, param4:int, param5:int, param6:WindowMouseEvent) : void
      {
         if(param6.shiftKey)
         {
            if(var_24 != null)
            {
               var_24.toggleHistoryViewer();
            }
            return;
         }
         var _loc7_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_296,param1,param3);
         messageListener.processWidgetMessage(_loc7_);
         var _loc8_:RoomWidgetChatSelectAvatarMessage = new RoomWidgetChatSelectAvatarMessage(RoomWidgetChatSelectAvatarMessage.const_704,param1,param2,param4,param5);
         messageListener.processWidgetMessage(_loc8_);
      }
      
      private function selectItemsToMove() : void
      {
         var _loc4_:* = null;
         if(var_446)
         {
            return;
         }
         purgeItems();
         var_213 = new Array();
         var _loc1_:int = new Date().time;
         var _loc2_:int = 0;
         if(false)
         {
            var_469 = 1;
            return;
         }
         if(historyViewerActive())
         {
            return;
         }
         ++var_469;
         var _loc3_:int = -1;
         while(_loc3_ >= 0)
         {
            _loc4_ = _itemList[_loc3_];
            if(_loc4_.view != null)
            {
               if(_loc4_.screenLevel > const_341 || _loc4_.screenLevel == _loc2_ - 1 || _loc1_ - _loc4_.timestamp >= const_1047)
               {
                  _loc4_.timestamp = _loc1_;
                  _loc2_ = _loc4_.screenLevel;
                  --_loc4_.screenLevel;
                  var_213.push(_loc4_);
               }
            }
            _loc3_--;
         }
      }
      
      public function enableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_62.length)
         {
            _loc1_ = var_62[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
      }
      
      public function reAlignItemsToHistoryContent() : void
      {
         if(historyViewerActive())
         {
            var_121.height = getTotalContentHeight() + const_275;
            alignItems();
         }
      }
      
      private function setChatItemRenderable(param1:RoomChatItem) : void
      {
         if(param1 != null)
         {
            if(param1.y < -const_486)
            {
               if(param1.view != null)
               {
                  var_121.removeChild(param1.view);
                  param1.hideView();
               }
            }
            else if(param1.view == null)
            {
               param1.renderView();
               if(param1.view != null)
               {
                  var_121.addChild(param1.view);
               }
            }
         }
      }
      
      private function historyViewerMinimized() : Boolean
      {
         return true;
      }
      
      private function moveItemsUp(param1:int) : void
      {
         var _loc3_:Boolean = false;
         if(var_213 == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc4_:int = -1;
         var _loc5_:int = -1;
         while(_loc5_ >= 0)
         {
            _loc2_ = var_213[_loc5_];
            if(_loc2_ != null)
            {
               if(_loc4_ == -1)
               {
                  _loc4_ = _itemList.indexOf(_loc2_);
               }
               else
               {
                  _loc4_++;
               }
               _loc3_ = true;
               if(historyViewerActive())
               {
                  if(_loc2_.y - param1 + _loc2_.height < 0)
                  {
                     _loc3_ = false;
                  }
               }
               if(_loc4_ > 0)
               {
                  if(_itemList[_loc4_ - 1].view != null)
                  {
                     if(_loc2_.y - param1 - _itemList[_loc4_ - 1].y < getItemSpacing(_itemList[_loc4_ - 1],_loc2_))
                     {
                        _loc3_ = false;
                     }
                  }
               }
               if(_loc3_)
               {
                  _loc2_.y -= param1;
               }
            }
            _loc5_--;
         }
      }
      
      private function historyViewerActive() : Boolean
      {
         return var_24 == null ? false : Boolean(var_24.active);
      }
      
      private function getItemSpacing(param1:RoomChatItem, param2:RoomChatItem) : Number
      {
         if(param1.checkOverlap(param2.x,param1.y,param2.width,param2.height))
         {
            return const_99;
         }
         return const_1048;
      }
      
      public function onItemMouseDown(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
         if(historyViewerVisible())
         {
            return;
         }
         if(var_24 != null)
         {
            var_24.beginDrag(param5.stageY);
         }
      }
      
      private function historyViewerVisible() : Boolean
      {
         return var_24 == null ? false : Boolean(var_24.visible);
      }
   }
}
