# Enhance the xml program to handle attributes: if the first argument is a map (with the curly braces syntax) add attributes

OperatorTable addAssignOperator(":", "atPutToMap")
curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg,
      r doMessage(arg)
    )
    r
)

Map atPutToMap := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""
        ),
        call evalArgAt(1)
    )
)

Map asHTMLAttributes := method(
    self keys map(key, (key asString).." = \""..(self at(key) asString).."\"") join(" ")
)


Builder := Object clone
Builder spaces := 0
Builder space := method(" " repeated(spaces))
Builder forward := method(
    if(call message arguments size == 0, writeln(space, "<", call message name, ">"))
    spaces = spaces + 4
    call message arguments foreach(
        i,
        arg,
        attributes := ""
        content := self doMessage(arg)   
        if(content type == "Map", attributes = " "..(content asHTMLAttributes))
        if(i == 0, writeln(space, "<", call message name, attributes, ">"))
        if(content type == "Sequence", writeln(space, content))    
        )
    spaces = spaces - 4
    writeln(space, "</", call message name, ">")
)

Builder ul(
    doString("{\"author\":\"Tate\"}"),
    li("Io"),
    li("Lua"),
    li("JavaScript")
)