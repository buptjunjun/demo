/**
 * Created by Admin on 14-7-12.
 */


/**
 *  usage: set class to tooltip
 */
    function loadtips()
    {
        var x = 10;
        var y = 20;
        $(".mytips").on("mouseover",function(e){
            this.myTitle = this.title;
            this.title = "";
            var tooltip = "<div id='tooltip'>"+ this.myTitle +"<\/div>"; //创建 div 元素 文字提示
            $("body").append(tooltip);    //把它追加到文档中
            $("#tooltip")
                .css({
                    "top": (e.pageY+y) + "px",
                    "left": (e.pageX+x)  + "px"
                }).show(0);      //设置x坐标和y坐标，并且显示
        }).on("mouseout",function(){
            this.title = this.myTitle;
            $("#tooltip").remove();   //移除
        }).on("mousemove",function(e){
            $("#tooltip")
                .css({
                    "top": (e.pageY+y) + "px",
                    "left": (e.pageX+x)  + "px"
                });
        });
    }

    $(function(){
        loadtips();
    })
