# Enhance the XML program to add spaces to show the indentation structure

Builder := Object clone
Builder spaces := 0
Builder space := method(" " repeated(spaces))
Builder forward := method(
    writeln(space, "<", call message name, ">")
    spaces = spaces + 4
    call message arguments foreach(
        arg,
        content := self doMessage(arg)       
        if(content type == "Sequence", writeln(space, content))    
        )
    spaces = spaces - 4
    writeln(space, "</", call message name, ">")
)
Builder ul(
    li("Io"),
    li("Lua"),
    li("JavaScript")
)
