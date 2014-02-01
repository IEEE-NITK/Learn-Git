function Server() {
}
Server.prototype.init = function(address, onOpenSendMsg) {
    
    //console.log("Init....."+address);
    
    this.address = address;
    this.numProgressBars = 0;
    this.progressBars = new Array();
    this.averageProgress = 0;

    this.ws = new WebSocket(address);
    
    //console.log("Here.....");

    this.ws.onopen = function(){
       //this.send("id:<%= current_user.repos.where(course_id:params[:id]).first.id %>")
       //this.send("id:<%= current_user.repos.where(course_id:params[:id]).first.id %>")
       this.send(onOpenSendMsg);
    }
    this.ws.onmessage = function(msg){
        obj = jQuery.parseJSON(msg.data);
        //console.log(msg.data)
        console.log(obj.opt)
        var ws = this;
        switch( obj.opt ) {
            case "dir" :
                $('#treeView').jstree({
                "json_data" : {
                "data": obj.content
                },"plugins":["themes","json_data","ui"]
                }).bind("select_node.jstree", function(e, data){
                    var parents = [];
                    data.rslt.obj.parents("li").each(function () {
                        parents.push({ id: $(this).attr("id"), description: $(this).children("a").text() });
                    });
                    str="."
                    for(i=parents.length-1;i>=0;i--) {
                        str+="/"+trim_str(parents[i].description)
                    }
                    ws.send("open:"+str+"/"+trim_str(data.rslt.obj.text()))
                    editor.getSession().setValue("")
                });
                break;
            
            case "course-objective":
                $(".course-objective").html(obj.content)
                break;
        
            case "course-references":
                $(".course-references").html(obj.content)
                break;
            
            case "course-links":
                $(".course-links").html(obj.content)
                break;
            
            case "course-body":
                $(".course-body").html(obj.content)
                break;
        
            case "course-hint":
                $("#hint").html(obj.content)
                break;
        
            case "file-content":
                var myCode = editor.getSession().getValue();
                editor.getSession().setValue(myCode+obj.content)
                break;

            default :
                
                if ( obj.opt.substring(0,8) == "progress" ) {
                    // We have progress..... Get the index if exists or create one....
                    
                    // Get the index first....
                    var ind = obj.opt.substring(8);
                    
                    var index = parseInt(ind);
                    
                    if ( isNaN(index) ) {
                        // Error in the index
                        
                    }
                    else {
                        // No error
                        
                        if ( typeof window["s"].progressBars[index] == 'undefined' ){
                            // Does not exist......
                            // Create .....
                            temp = window["s"].progressBars[index] = new Progress();
                            temp.init(obj.size,obj.content);
                            window["s"].numProgressBars++;
                        }
                        else {
                            window["s"].progressBars[index].setCurrentValue(obj.content);
                        }

                        var sum = 0.0;
                        for ( var i=1; i<= window["s"].numProgressBars; i++ ){
                            sum += window["s"].progressBars[i].getProgressPercent()
                        }
                        if ( window["s"].numProgressBars > 0 ){
                            window["s"].averageProgress = (sum*1.0)/window["s"].numProgressBars;
                        }
                        else {
                            window["s"].averageProgress = 0   
                        }

                        console.log("Average - "+window["s"].averageProgress);
                        /*
                        if ( index > window["s"].numProgressBars ){
                            // Create as many progress bars .....
                            while ( index > window["s"].numProgressBars ) {
                                temp = window["s"].progressBars[(++window["s"].numProgressBars)] = new Progress();
                                if ( window["s"].numProgressBars == index ){
                                    temp.init(obj.size, 0);
                                }
                            }
                        }
                        
                        window["s"].progressBars[index].increment(obj.content);
                        // Should be reflected in UI ...  ?!!!
                        var sum = 0.0;
                        for ( var i=1; i<= window["s"].numProgressBars; i++ ){

                            sum += window["s"].progressBars[i].getProgressPercent()
                        }

                        if ( window["s"].numProgressBars > 0 ){
                            window["s"].averageProgress = (sum*1.0)/window["s"].numProgressBars;
                        }
                        else {
                            window["s"].averageProgress = 0   
                        }
                        */
                    }
                }
                else {
                    console.log("Not progress");
                    $(".terminal-output").append("<div>"+obj.content.replaceAll("<","&lt;").replaceAll(">","&gt;")+"<div>");
                    $(".terminal-output").css("line-height","initial");
                    $(".terminal-output").css("font-size","15px");
                    $(".terminal-output").css("color","yellowgreen");
                }
        }
    }

    this.ws.onclose = function(){
    }
}
    /*
    else if(obj.opt == "progress1")
    {
      console.log("sdiuhsdiuh");
      // alert("jfshioh");
      progress1(obj.content)
    }
    else if(obj.opt == "progress2")
    {
      console.log("vvvvvvvvvvv");
      // alert("jfshioh");
      progress2(obj.content)
    }
    
}
}

var ws;
var address;
/*





*/