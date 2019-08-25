
/obj/hacking

/obj/hacking/ui_data(mob/user, ui_key)
    var/list/data = list()

    data["size"] = 5 // square layout, 5x5 cells. 0:0 is the top-left corner
    // Associative list. Possible keys: io, folder, antivirus, goal. IF YOU ADD MORE HERE, YOU HAVE TO EDIT THE .TMPL TOO!
    data["cellsData"] = list("io" = list(0,0),
                            "folder" = list(1,0),
                            "antivirus" = list(1,1),
                            "goal" = list(2,0))

    return data

/obj/hacking/ui_interact(mob/user, ui_key, datum/nanoui/ui, force_open, datum/nano_ui/master_ui, datum/topic_state/state)
    var/list/data = ui_data()
    ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
    to_chat(world, "a")
    if(!ui)
        to_chat(world, "b")
        ui = new(user, src, ui_key, "hacking.tmpl", "Hacking", 500, 500, state = state)
        ui.set_initial_data(data)
        ui.open()

/mob/verb/hack_test()
    var/obj/hacking/H = new(src)
    H.ui_interact(src)
    tempVar = H

/mob/var/tempVar