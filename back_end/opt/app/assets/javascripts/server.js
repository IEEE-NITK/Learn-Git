function Server() {
}
Server.prototype.init = function(address, onOpenSendMsg) {
    
    //console.log("Init....."+address);
    
    this.address = address;
    this.numProgressBars = 0;
    this.progressBars = new Array();
    

    this.ws = new WebSocket(address);
    
    //console.log("Here.....");

    this.ws.onopen = function(){
       //this.send("id:<%= current_user.repos.where(course_id:params[:id]).first.id %>")
       //this.send("id:<%= current_user.repos.where(course_id:params[:id]).first.id %>")
       this.send(onOpenSendMsg);
    }
    this.ws.onmessage = function(msg){
        obj = jQuery.parseJSON(msg.data);
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
                if ( obj.opt.substring(0,7) == "progress" ) {
                    // We have progress..... Get the index if exists or create one....
                    console.log("We have progress type....");
                    // Get the index first....
                    var index = obj.opt.substring(8);
                    if ( parseInt(index).isNan() ) {
                        // Error in the index

                    }
                    else {
                        // No error
                        if ( index > this.numProgressBars ){
                            // Create as many progress bars .....
                            while ( index > this.numProgressBars ) {
                                this.progressBars[++this.numProgressBars] = new Progress();
                                console.log("progress bars created....");
                            }
                        }

                        this.progressBars[index].increment(obj.content);
                        // Should be reflected in UI ...  ?!!!
                        sum = 0.0;
                        for ( var i=1; i<=numProgressBars; i++ ){
                            sum += this.progressBars[i].getProgressPercent()
                        }
                        this.averageProgress = (sum*1.0)/this.numProgressBars;

                        console.log("average progress = "+this.averageProgress);
                    }
                }
                else {
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