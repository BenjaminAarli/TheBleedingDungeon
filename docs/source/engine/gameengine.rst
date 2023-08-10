===========
Game Engine
===========

**class_name** GameEngine

The game engine is the base of the entire game. All :ref:`cogs<cogs>` are processed and "turned" by the engine
and then converted into actions that the game engine controls; such as writing text to the screen, changing the background,
adding or remove effects such as rain and dialog trees. 

.. note:: 
    Anything marked with an **asterisk (*)** at it's end is required.

Nodes
=====

textnode* (richtextlabel)
------------------------
The textnode is the richtextlabel that the game engine writes to. 

effectnode* (control)
----------
The effectnode is where effects are added to, and removed from. 

.. note::
    Effects: You can only have 1 effect active. Once you activate an effect, the previous effect; if any, is removed.

Variables
---------

* file* :ref:`(Scripture)<scripture>`
* can_progress (bool)
* current_line (int)
* current_story (string)

