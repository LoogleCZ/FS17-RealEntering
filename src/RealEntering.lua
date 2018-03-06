--
-- Script for controling fertilizer ammount
--
-- Author: Martin Fabík (https://www.fb.com/LoogleCZ)
-- GitHub repository: https://github.com/LoogleCZ/FS17-RealEntering
--
-- Free for non-comerecial usage!
--
-- version ID   - 1.0.0
-- version date - 2018-06-06 20:14:00
--
-- used namespace: LRE
--
-- This is development version! DO not use it on release!
--

RealEntering = {};

function RealEntering.prerequisitesPresent(specializations)
	return true;
end;

function RealEntering:preLoad(savegame)
	print("RealEntering preload!");
	self.LRE = {};
end;

function RealEntering:load(savegame) end;
function RealEntering:postLoad(savegame) end;

function RealEntering:delete() end;
function RealEntering:update(dt) end;
function RealEntering:updateTick(dt) end;
function RealEntering:draw() end;
function RealEntering:readStream(streamId, connection) end;
function RealEntering:writeStream(streamId, connection) end;
function RealEntering:mouseEvent(posX, posY, isDown, isUp, button) end;
function RealEntering:keyEvent(unicode, sym, modifier, isDown) end;

function RealEntering:onEnter()
	print("Entered vehicle!");
end;

function RealEntering:onLeave()
	print("Leave vehicle!");
end;

