proc/isatom(A) return istype(A, /atom)

client/show_popup_menus = 0

client
    var
        Mouse = 0 // true if the mouse is pressed
        MouseLeft = 0 // true if the left mouse button is being pressed
        MouseRight = 0 // true if the right mouse button is being pressed
        MouseMiddle = 0 // true if the middle mouse button is being pressed

        under_mouse // the object currently under the mouse

        mouse_px = 0 // mouse coordinates in pixels on the map
        mouse_py = 0 // mouse coordinates in pixels on the map

        mouse_x = 0 // the x coordinate of the mouse on the map
        mouse_y = 0 // the y coordinate of the mouse on the map
        mouse_x_offset = 0 // the x offset in pixels of the mouse on a certain object
        mouse_y_offset = 0 // the y offset in pixels of the mouse on a certain object
    //Warning: Don't mess with the following procs until you get to the next note or
    //unless you know what you're doing
    Click(object,location,control,params)
        var/list/Params = params2list( params )
        under_mouse = object
        if(isatom(under_mouse))
            var/atom/A = under_mouse
            mouse_x = A.x
            mouse_y = A.y
            mouse_x_offset = text2num(Params["icon_x"])
            mouse_y_offset = text2num(Params["icon_y"])
            mouse_px = mouse_x*32+mouse_x_offset
            mouse_py = mouse_y*32+mouse_y_offset
        ..()
    MouseEntered(object,location,control,params)
        ..()
        src.mouseMoved()
        var/list/Params = params2list( params )
        under_mouse = object
        if(isatom(under_mouse))
            var/atom/A = under_mouse
            mouse_px = A.x*32+text2num(Params["icon_x"])
            mouse_py = A.y*32+text2num(Params["icon_y"])
    MouseDown(object,location,control,params)
        ..()
        Mouse = 1
        var/list/Params = params2list( params )
        MouseRight = Params["right"]
        MouseLeft = Params["left"]
        MouseMiddle = Params["middle"]
        if( MouseRight ) RightClick(object,location,control,params,usr)
        if( MouseLeft ) LeftClick(object,location,control,params,usr)
        if( MouseMiddle ) MiddleClick(object,location,control,params,usr)
        under_mouse = object
        if(isatom(under_mouse))
            var/atom/A = under_mouse
            mouse_x = A.x
            mouse_y = A.y
            mouse_x_offset = text2num(Params["icon_x"])
            mouse_y_offset = text2num(Params["icon_y"])
            mouse_px = mouse_x*32+mouse_x_offset
            mouse_py = mouse_y*32+mouse_y_offset
        src.PressedMouse()
    MouseUp(object,location,control,params)
        ..()
        var/list/Params = params2list( params )
        MouseLeft = Params["left"]
        MouseRight = Params["right"]
        MouseMiddle = Params["middle"]
        Mouse = 0
        under_mouse = object
        if(isatom(under_mouse))
            var/atom/A = under_mouse
            mouse_x = A.x
            mouse_y = A.y
            mouse_x_offset = text2num(Params["icon_x"])
            mouse_y_offset = text2num(Params["icon_y"])
            mouse_px = mouse_x*32+mouse_x_offset
            mouse_py = mouse_y*32+mouse_y_offset
        src.ReleasedMouse()
    MouseDrag(src_object,over_object,src_location,over_location,src_control,over_control,params)
        ..()
        under_mouse = over_object
        if(isatom(under_mouse))
            var/list/Params = params2list(params)
            var/atom/A = under_mouse
            mouse_x = A.x
            mouse_y = A.y
            mouse_x_offset = text2num(Params["icon_x"])
            mouse_y_offset = text2num(Params["icon_y"])
            mouse_px = mouse_x*32+mouse_x_offset
            mouse_py = mouse_y*32+mouse_y_offset
        src.MouseMoved()
        src.mouseMoved()
client
    proc
        LeftClick(object,location,control,params)
            if(isatom(object)) object:LeftClick(location,control,params)
            return ..()
        RightClick(object,location,control,params)
            if(isatom(object)) object:RightClick(location,control,params)
            return ..()
        MiddleClick(object,location,control,params)
            if(isatom(object)) object:MiddleClick(location,control,params)
            return ..()
    //Note: The long awaited note.

atom
    proc
        LeftClick(location,control,params) return ..()// Called when the player left clicks
        RightClick(location,control,params) return ..()// Called when the player right clicks
        MiddleClick(location,control,params) return ..()// called when the player middle clicks

client
    proc
        PressedMouse()// called when a mouse button is pressed.
            mob.PressedMouse()
            return ..()
        ReleasedMouse()// called when a mouse button is released.
            mob.ReleasedMouse()
            return ..()
        MouseMoved()//only called when a button is being pressed while dragging the mouse.
            mob.MouseMoved()
            return ..()
        mouseMoved()//catches as much movement as it can
            mob.mouseMoved()
            return ..()

mob
    //these are called from the client. look at the above procs
    proc
        PressedMouse()
            return ..()
        ReleasedMouse()
            return ..()
        MouseMoved()//only called when a button is being pressed while dragging the mouse.
            return ..()
        mouseMoved()//catches as much as it can
            return ..()