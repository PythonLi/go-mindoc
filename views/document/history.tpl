
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="renderer" content="webkit" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="SmartWiki" />
    <title>历史版本 - Powered by MinDoc</title>

    <!-- Bootstrap -->
    <link href="{{cdncss "/static/bootstrap/css/bootstrap.min.css"}}" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="/static/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="/static/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="{{cdnjs "/static/jquery/1.12.4/jquery.min.js"}}"></script>
    <style type="text/css">
        .container{margin: 5px auto;}
    </style>
</head>
<body>
<div class="container">
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
            <tr>
                <td>#</td>
                <td class="col-sm-6">修改时间</td>
                <td class="col-sm-2">修改人</td>
                <td class="col-sm=2">版本</td>
                <td class="col-sm-2">操作</td>
            </tr>
            </thead>
            <tbody>
            {{range $index,$item := .List}}
            <tr>
                <td>{{$item.HistoryId}}</td>
                <td>{{date $item.ModifyTime "Y-m-d H:i:s"}}</td>
                <td>{{$item.ModifyName}}</td>
                <td>{{$item.Version}}</td>
                <td>
                    <button class="btn btn-danger btn-sm delete-btn" data-id="{{$item.HistoryId}}" data-loading-text="删除中...">
                        删除
                    </button>
                    <button class="btn btn-success btn-sm restore-btn" data-id="{{$item.HistoryId}}" data-loading-text="恢复中...">
                        恢复
                    </button>
                    {{if eq $.Model.Editor "markdown"}}
                    <button class="btn btn-success btn-sm compare-btn" data-id="{{$item.HistoryId}}">
                        合并
                    </button>
                    {{end}}
                </td>
            </tr>
            {{else}}
            <tr>
                <td colspan="6" class="text-center">暂无数据</td>
            </tr>
            {{end}}
            </tbody>
        </table>
    </div>
    <nav>
        {{.PageHtml}}
    </nav>
</div>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="{{cdnjs "/static/bootstrap/js/bootstrap.min.js"}}"></script>
<script src="{{cdnjs "/static/layer/layer.js"}}" type="text/javascript" ></script>
<script type="text/javascript">
    $(function () {
        $(".delete-btn").on("click",function () {
            var id = $(this).attr('data-id');
            var $btn = $(this).button('loading');
            var $then = $(this);

            if(!id){
                layer.msg('参数错误');
            }else{
                $.ajax({
                    url : "{{urlfor "DocumentController.DeleteHistory"}}",
                    type : "post",
                    dataType : "json",
                    data : { "identify" : "{{.Model.Identify}}","doc_id" : "{{.Document.DocumentId}}" ,"history_id" : id },
                    success :function (res) {
                        if(res.errcode === 0){
                            $then.parents('tr').remove().empty();
                        }else{
                            layer.msg(res.message);
                        }
                    },
                    error : function () {
                        $btn.button('reset');
                    }
                })
            }
        });

        $(".restore-btn").on("click",function () {
            var id = $(this).attr('data-id');
            var $btn = $(this).button('loading');
            var $then = $(this);
            var index = parent.layer.getFrameIndex(window.name);

            if(!id){
                layer.msg('参数错误');
            }else{
                $.ajax({
                    url : "{{urlfor "DocumentController.RestoreHistory"}}",
                    type : "post",
                    dataType : "json",
                    data : { "identify" : "{{.Model.Identify}}","doc_id" : "{{.Document.DocumentId}}" ,"history_id" : id },
                    success :function (res) {
                        if(res.errcode === 0){
                            var $node = { "node" : { "id" : res.data.doc_id}};

                            parent.loadDocument($node);
                            parent.layer.close(index);
                        }else{
                            layer.msg(res.message);
                        }
                    },
                    error : function () {
                        $btn.button('reset');
                    }
                })
            }
        });
        $(".compare-btn").on("click",function () {
            var historyId = $(this).attr("data-id");

            window.compareIndex = window.top.layer.open({
                type: 2,
                title: '文档比较【左侧为历史文档，右侧为当前文档，请将文档合并到右侧】',
                shade: 0.8,
                area: ['380px', '90%'],
                content: "{{urlfor "DocumentController.Compare" ":key" .Model.Identify ":id" ""}}" + historyId
            });
            window.top.layer.full(window.compareIndex);
        });
    });
</script>
</body>
</html>