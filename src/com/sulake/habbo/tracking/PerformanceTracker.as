package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1598:GarbageMonitor = null;
      
      private var var_1369:int = 0;
      
      private var var_1272:Boolean = false;
      
      private var var_2076:String = "";
      
      private var var_1597:String = "";
      
      private var var_366:Number = 0;
      
      private var var_1367:int = 10;
      
      private var var_2346:Array;
      
      private var var_643:int = 0;
      
      private var var_1370:int = 60;
      
      private var var_1095:int = 0;
      
      private var var_1094:int = 0;
      
      private var var_2072:String = "";
      
      private var var_2250:Number = 0;
      
      private var var_1366:int = 1000;
      
      private var var_2249:Boolean = true;
      
      private var var_2248:Number = 0.15;
      
      private var var_154:IHabboConfigurationManager = null;
      
      private var var_2071:String = "";
      
      private var var_1368:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2346 = [];
         super();
         var_1597 = Capabilities.version;
         var_2076 = Capabilities.os;
         var_1272 = Capabilities.isDebugger;
         var_2071 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1598 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1369 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1598.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1598.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_366;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1370 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1597;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_1094;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1366)
         {
            ++var_1095;
            _loc3_ = true;
         }
         else
         {
            ++var_643;
            if(var_643 <= 1)
            {
               var_366 = param1;
            }
            else
            {
               _loc4_ = Number(var_643);
               var_366 = var_366 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1369 > var_1370 * 1000 && var_1368 < var_1367)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_366);
            _loc5_ = true;
            if(var_2249 && var_1368 > 0)
            {
               _loc6_ = differenceInPercents(var_2250,var_366);
               if(_loc6_ < var_2248)
               {
                  _loc5_ = false;
               }
            }
            var_1369 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_2250 = var_366;
               if(sendReport())
               {
                  ++var_1368;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1367 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1366 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_2071,var_1597,var_2076,var_2072,var_1272,_loc4_,_loc3_,var_1094,var_366,var_1095);
            _connection.send(_loc1_);
            var_1094 = 0;
            var_366 = 0;
            var_643 = 0;
            var_1095 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_154 = param1;
         var_1370 = int(var_154.getKey("performancetest.interval","60"));
         var_1366 = int(var_154.getKey("performancetest.slowupdatelimit","1000"));
         var_1367 = int(var_154.getKey("performancetest.reportlimit","10"));
         var_2248 = Number(var_154.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_2249 = Boolean(int(var_154.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
