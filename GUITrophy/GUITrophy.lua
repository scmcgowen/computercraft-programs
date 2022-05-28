GuiApi = require("GuiH")
mon = peripheral.wrap("up")
gui = GuiApi.new(mon)
bf = require("bigfont")
JavaErrorCount = 69
if fs.exists("JavaErrors") then
local JE = fs.open("JavaErrors","r")
JavaErrorCount = JE.readAll()
JE.close()
else
	JE = fs.open("JavaErrors","w")
	JE.write(tostring(JavaErrorCount))
	JE.close()
end
local function build_window(gui,title)
    local fg_rect = gui.create.rectangle({
        x = 1,
        y = 1,
        width = gui.w,
        height = gui.h,
        color=colors.lightGray,
        graphic_order=-1
    })

    fg_rect.symbols.side_top.bg = colors.gray
    fg_rect.symbols.top_right.bg = colors.gray

    

    gui.create.text({
        text=gui.text{
            x = 1,
            y = 1,
            text = title,
            bg=colors.gray,
            fg=colors.white
        },
        graphic_order=1
    })



end
group = gui.create.group({
x=1,
y=2,
width = gui.w,
height = gui.h-1,
})

render_script = gui.create.script({
graphic = function()
	group.window.setBackgroundColor(colors.lightGray)
	group.window.clear()
	bf.writeOn(group.window,1,"Java Errors",12,5)
	bf.writeOn(group.window,1,tostring(JavaErrorCount))
end,
graphic_order = 2
})

gui.create.button{
x=50,
y=20,
width=4,
height=3,
background_color=colors.red,
text = gui.text{
	centered=true,
	transparent=true,
	text= "+1"
},
graphic_order=3,
on_click = function()
	JavaErrorCount = JavaErrorCount +1
	JE = fs.open("JavaErrors","w")
	JE.write(tostring(JavaErrorCount))
	JE.close()
	render_script.code()
end
}

build_window(gui,"Java Error Counter v2147483647")

gui.execute()