package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.tracking.LatencyPingResponseMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingReportMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingRequestMessageComposer;
   import com.sulake.habbo.communication.messages.parser.tracking.LatencyPingResponseMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LatencyTracker
   {
       
      
      private var var_143:Array;
      
      private var var_30:Boolean = false;
      
      private var var_1400:int = 0;
      
      private var var_1398:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_457:Map;
      
      private var var_1617:int = 0;
      
      private var var_1399:int = 0;
      
      private var var_154:IHabboConfigurationManager;
      
      private var var_1124:int = 0;
      
      private var _connection:IConnection;
      
      private var var_1401:int = 0;
      
      public function LatencyTracker()
      {
         super();
      }
      
      public function update(param1:uint) : void
      {
         if(!var_30)
         {
            return;
         }
         if(getTimer() - var_1400 > var_1398)
         {
            testLatency();
         }
      }
      
      private function testLatency() : void
      {
         var_1400 = getTimer();
         var_457.add(var_1124,var_1400);
         _connection.send(new LatencyPingRequestMessageComposer(var_1124));
         ++var_1124;
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function init() : void
      {
         if(var_154 == null || _communication == null || _connection == null)
         {
            return;
         }
         var_1398 = int(var_154.getKey("latencytest.interval"));
         var_1401 = int(var_154.getKey("latencytest.report.index"));
         var_1617 = int(var_154.getKey("latencytest.report.delta"));
         _communication.addHabboConnectionMessageEvent(new LatencyPingResponseMessageEvent(onPingResponse));
         if(var_1398 < 1)
         {
            return;
         }
         var_457 = new Map();
         var_143 = new Array();
         var_30 = true;
      }
      
      private function onPingResponse(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         if(var_457 == null || var_143 == null)
         {
            return;
         }
         var _loc2_:LatencyPingResponseMessageParser = (param1 as LatencyPingResponseMessageEvent).getParser();
         var _loc3_:int = var_457.getValue(_loc2_.requestId);
         var_457.remove(_loc2_.requestId);
         var _loc4_:int = getTimer() - _loc3_;
         var_143.push(_loc4_);
         if(var_143.length == var_1401 && var_1401 > 0)
         {
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < var_143.length)
            {
               _loc5_ += var_143[_loc8_];
               _loc8_++;
            }
            _loc9_ = _loc5_ / 0;
            _loc8_ = 0;
            while(_loc8_ < var_143.length)
            {
               if(var_143[_loc8_] < _loc9_ * 2)
               {
                  _loc6_ += var_143[_loc8_];
                  _loc7_++;
               }
               _loc8_++;
            }
            if(_loc7_ == 0)
            {
               var_143 = [];
               return;
            }
            _loc10_ = _loc6_ / _loc7_;
            if(Math.abs(_loc9_ - var_1399) > var_1617 || var_1399 == 0)
            {
               var_1399 = _loc9_;
               _loc11_ = new LatencyPingReportMessageComposer(_loc9_,_loc10_,var_143.length);
               _connection.send(_loc11_);
            }
            var_143 = [];
         }
      }
      
      public function dispose() : void
      {
         var_30 = false;
         var_154 = null;
         _communication = null;
         _connection = null;
         if(var_457 != null)
         {
            var_457.dispose();
            var_457 = null;
         }
         var_143 = null;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_154 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
