<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Amaze UI Admin index Examples</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png"
	href="<c:url value='/assets/i/favicon.png'/>">
<link rel="apple-touch-icon-precomposed"
	href="<c:url value='/assets/i/app-icon72x72@2x.png'/>">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet"
	href="<c:url value='/assets/css/amazeui.min.css'/>" />
<link rel="stylesheet" href="<c:url value='/assets/css/admin.css'/>">
<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
<script src="<c:url value='/assets/js/app.js'/>"></script>
</head>
<body>
<!--[if lte IE 9]><p class="browsehappy">升级你的浏览器吧！ <a href="http://se.360.cn/" target="_blank">升级浏览器</a>以获得更好的体验！</p><![endif]-->

</head>

<body>
<header class="am-topbar admin-header">
  <!--顶部导航条 -->
		<c:import url="/admin/header.jsp"></c:import>
</header>
<div class="am-cf admin-main">
  <!--侧边导航条 -->
		<c:import url="/admin/aside.jsp"></c:import>
  <div class=" admin-content">
    <div class="daohang">
      <ul>
        <li>
        <button type="button" class="am-btn am-btn-default am-radius am-btn-xs">
        首页
        </li>
        <li>
        <button type="button" class="am-btn am-btn-default am-radius am-btn-xs">
        帮助中心<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a>
        </button>
        </li>
        <li>
          <button type="button" class="am-btn am-btn-default am-radius am-btn-xs">
          奖金管理<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a>
          </button>
        </li>
        <li>
          <button type="button" class="am-btn am-btn-default am-radius am-btn-xs">
          产品管理<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a>
          </button>
        </li>
      </ul>
    </div>
    <div class="am-popup am-popup-inner" id="my-popup">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">添加商品一级分类</h4>
        <span data-am-modal-close
            class="am-close">&times;</span> </div>
      <div class="am-popup-bd">
        <form class="am-form tjlanmu">
          <div class="am-form-group">
            <div class="zuo">栏目名称：</div>
            <div class="you">
              <input type="email" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入标题">
            </div>
          </div>
          <div class="am-form-group">
            <div class="zuo">栏目关键词：</div>
            <div class="you">
              <input type="password" class="am-input-sm" id="doc-ipt-pwd-1" placeholder="请输入关键词">
            </div>
          </div>
          <div class="am-form-group am-cf">
            <div class="zuo">栏目描述：</div>
            <div class="you">
              <textarea class="" rows="2" id="doc-ta-1"></textarea>
            </div>
          </div>
          <div class="am-form-group am-cf">
            <div class="zuo">栏目图片：</div>
            <div class="you" style="height: 45px;">
              <input type="file" id="doc-ipt-file-1">
              <p class="am-form-help">请选择要上传的文件...</p>
            </div>
          </div>
          <div class="am-form-group am-cf">
            <div class="zuo">简介：</div>
            <div class="you">
              <textarea class="" rows="2" id="doc-ta-1"></textarea>
            </div>
          </div>
          <div class="am-form-group am-cf">
            <div class="zuo">状态：</div>
            <div class="you" style="margin-top: 3px;">
              <label class="am-checkbox-inline">
                <input type="checkbox" value="option1">
                显示 </label>
              <label class="am-checkbox-inline">
                <input type="checkbox" value="option2">
                隐藏 </label>
            </div>
          </div>
          <div class="am-form-group am-cf">
            <div class="you">
              <p>
                <button type="submit" class="am-btn am-btn-success am-radius">提交</button>
              </p>
            </div>
          </div>
        </form>
      </div>
    </div>
    
          <div class="am-popup am-popup-inner" id="my-popups">
        <div class="am-popup-hd">
          <h4 class="am-popup-title">详细库存信息（这里包含 销量 库存  损耗，  客服备注  销售的全部金额）</h4>
          <span data-am-modal-close class="am-close">&times;</span> </div>
        <div class="am-popup-bd">
        	
        	
        	
        	
          <form class="am-form tjlanmu">
            <div class="am-form-group am-cf">
              <div class="zuo">销量：</div>
              <div class="you">
                245234523452
              </div>
            </div>
            <div class="am-form-group am-cf">
              <div class="zuo"> 库存：</div>
              <div class="you">
                234523452
              </div>
            </div>


<div class="am-form-group am-cf">
              <div class="zuo"> 损耗：</div>
              <div class="you">
                234523452
              </div>
            </div>

<div class="am-form-group am-cf">
              <div class="zuo"> 购买信息：</div>
              <div class="you">
                234523452
              </div>
            </div>

<div class="am-form-group am-cf">
              <div class="zuo"> 销售金额：</div>
              <div class="you">
                234523452
              </div>
            </div>
            
            
            <div class="am-form-group am-cf">
              <div class="zuo"> 成本：</div>
              <div class="you">
                234523452
              </div>
            </div>
            
                     <div class="am-form-group am-cf">
              <div class="zuo"> 利润：</div>
              <div class="you">
                234523452
              </div>
            </div>

          </form>
        </div>
      </div>
    
    
    
    
    
    
    <div class="am-popup am-popup-inner" id="my-popupss">
        <div class="am-popup-hd">
          <h4 class="am-popup-title">复制栏目</h4>
          <span data-am-modal-close class="am-close">&times;</span> </div>
        <div class="am-popup-bd">
          <form class="am-form tjlanmu">
          
          
          <div class="am-form-group">
              <div class="zuo">复制到：</div>
              <div class="you">
              
  <select data-am-selected="{btnWidth: 200, btnSize: 'sm', btnStyle: 'danger'}">
  <option value="a">Apple</option>
  <option value="b">Banana</option>
  <option value="o">Orange</option>
  <option value="m">Mango</option>
</select>
 顶级栏目选默认

              </div>
            </div>
          
          
            <div class="am-form-group">
              <div class="zuo">新栏目名称：</div>
              <div class="you">
                <input type="email" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入标题">
              </div>
            </div>
            <div class="am-form-group">
              <div class="zuo">栏目关键词：</div>
              <div class="you">
                <input type="password" class="am-input-sm" id="doc-ipt-pwd-1" placeholder="请输入关键词">
              </div>
            </div>
            <div class="am-form-group am-cf">
              <div class="zuo">栏目描述：</div>
              <div class="you">
                <textarea class="" rows="2" id="doc-ta-1"></textarea>
              </div>
            </div>
            <div class="am-form-group am-cf">
              <div class="zuo">栏目图片：</div>
              <div class="you" style="height: 45px;">
                <input type="file" id="doc-ipt-file-1">
                <p class="am-form-help">请选择要上传的文件...</p>
              </div>
            </div>
            <div class="am-form-group am-cf">
              <div class="zuo">简介：</div>
              <div class="you">
                <textarea class="" rows="2" id="doc-ta-1"></textarea>
              </div>
            </div>
            <div class="am-form-group am-cf">
              <div class="zuo">状态：</div>
              <div class="you" style="margin-top: 3px;">
                <label class="am-checkbox-inline">
                  <input type="checkbox" value="option1">
                  显示 </label>
                <label class="am-checkbox-inline">
                  <input type="checkbox" value="option2">
                  隐藏 </label>
              </div>
            </div>
            <div class="am-form-group am-cf">
              <div class="you">
                <p>
                  <button type="submit" class="am-btn am-btn-success am-radius">提交</button>
                </p>
              </div>
            </div>
          </form>
        </div>
      </div>
    
    
    
    
    
    
    
    
    
    
    <div class="admin-biaogelist">
      <div class="listbiaoti am-cf">
        <ul class="am-icon-flag on">
          库存管理
        </ul>
        <dl class="am-icon-home" style="float: right;">
          当前位置： 首页 > <a href="#">用户评论</a>
        </dl>
        <dl>
          <button type="button" class="am-btn am-btn-danger am-round am-btn-xs am-icon-plus" data-am-modal="{target: '#my-popup'}"> 给商品添加评论</button>
        </dl>
        <!--data-am-modal="{target: '#my-popup'}" 弹出层 ID  弹出层 190行 开始  271行结束--> 
        
      </div>
      <form class="am-form am-g">
        <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
          <thead>
            <tr class="am-success">
              <th class="table-check"><input type="checkbox" /></th>
              <th class="table-id">排序</th>
              <th class="table-id am-text-center">ID</th>
              <th class="table-title">商品名称</th>
              <th class="table-type">进销存</th>
              <th class="table-author am-hide-sm-only">已销售金额</th>
             
              <th width="125px" class="table-set">操作</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><input type="checkbox" /></td>
              <td><input type="text" class="am-form-field am-radius am-input-sm"/></td>
              <td class="am-text-center">14</td>
              <td><a href="#">Business management</a></td>
              <td>进货：456件&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销售：677件&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;库存： 555件&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;损耗：5件</td>
              <td class="am-hide-sm-only">访问</td>
              
              <td><div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
                  <a class="am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-file" data-am-modal="{target: '#my-popups'}" title="详细库存信息（这里包含 销量 库存  损耗，会员全部购买信息  客服备注  销售的全部金额）"></a>
                  
                  
                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="修改库存信息"><span class="am-icon-pencil-square-o" ></span></button>
                    <!-- 用按钮的时候 弹层 后缀需要加 问好 ？#的 时候才有效 真恶心 .html?# -->
                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round"  title="删除"><span class="am-icon-trash-o"></span></button>
                  </div>
                </div></td>
            </tr>
            
            

            
                      <tr>
              <td><input type="checkbox" /></td>
              <td><input type="text" class="am-form-field am-radius am-input-sm"/></td>
              <td class="am-text-center">3</td>
              <td><a href="#">Business management</a></td>
              <td>default</td>
              <td class="am-hide-sm-only">访问</td>
              
              <td><div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
                  <a class="am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-file" data-am-modal="{target: '#my-popups'}" title="置顶（前台显示热门评论）"></a>
                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="添加（随机虚拟用户ID ）"><span class="am-icon-pencil-square-o" ></span></button>
                    <!-- 用按钮的时候 弹层 后缀需要加 问好 ？#的 时候才有效 真恶心 .html?# -->
                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round"  title="删除"><span class="am-icon-trash-o"></span></button>
                  </div>
                </div></td>
            </tr>
            
            
            
                      <tr>
              <td><input type="checkbox" /></td>
              <td><input type="text" class="am-form-field am-radius am-input-sm"/></td>
              <td class="am-text-center">4</td>
              <td><a href="#">Business management</a></td>
              <td>default</td>
              <td class="am-hide-sm-only">访问</td>
              
              <td><div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
                  <a class="am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-file" data-am-modal="{target: '#my-popups'}" title="置顶（前台显示热门评论）"></a>
                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="添加（随机虚拟用户ID ）"><span class="am-icon-pencil-square-o" ></span></button>
                    <!-- 用按钮的时候 弹层 后缀需要加 问好 ？#的 时候才有效 真恶心 .html?# -->
                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round"  title="删除"><span class="am-icon-trash-o"></span></button>
                  </div>
                </div></td>
            </tr>
            
            
                      <tr>
              <td><input type="checkbox" /></td>
              <td><input type="text" class="am-form-field am-radius am-input-sm"/></td>
              <td class="am-text-center">5</td>
              <td><a href="#">Business management</a></td>
              <td>default</td>
              <td class="am-hide-sm-only">访问</td>
              
              <td><div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
                  <a class="am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-file" data-am-modal="{target: '#my-popups'}" title="置顶（前台显示热门评论）"></a>
                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="添加（随机虚拟用户ID ）"><span class="am-icon-pencil-square-o" ></span></button>
                    <!-- 用按钮的时候 弹层 后缀需要加 问好 ？#的 时候才有效 真恶心 .html?# -->
                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round"  title="删除"><span class="am-icon-trash-o"></span></button>
                  </div>
                </div></td>
            </tr>
            
                      <tr>
              <td><input type="checkbox" /></td>
              <td><input type="text" class="am-form-field am-radius am-input-sm"/></td>
              <td class="am-text-center">6</td>
              <td><a href="#">Business management</a></td>
              <td>default</td>
              <td class="am-hide-sm-only">访问</td>
              
              <td><div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
                  <a class="am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-file" data-am-modal="{target: '#my-popups'}" title="置顶（前台显示热门评论）"></a>
                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="添加（随机虚拟用户ID ）"><span class="am-icon-pencil-square-o" ></span></button>
                    <!-- 用按钮的时候 弹层 后缀需要加 问好 ？#的 时候才有效 真恶心 .html?# -->
                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round"  title="删除"><span class="am-icon-trash-o"></span></button>
                  </div>
                </div></td>
            </tr>
            
            
            <tr>
              <td><input type="checkbox" /></td>
              <td><input type="text" class="am-form-field am-radius am-input-sm"/></td>
              <td class="am-text-center">15</td>
              <td><a href="#">Business management</a></td>
              <td>default</td>
              <td class="am-hide-sm-only"><i class="am-icon-close am-text-primary"></i></td>
              
              <td><div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
                  <a class="am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-file" data-am-modal="{target: '#my-popups'}" title="置顶（前台显示热门评论）"></a>
                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" data-am-modal="{target: '#my-popups'}" title="添加（随机虚拟用户ID ）"><span class="am-icon-pencil-square-o" ></span></button>
                    <!-- 用按钮的时候 弹层 后缀需要加 问好 ？#的 时候才有效 真恶心 .html?# -->
                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-round"  title="删除"><span class="am-icon-trash-o"></span></button>
                  </div>
                </div></td>
            </tr>
          </tbody>
        </table>
        <div class="am-btn-group am-btn-group-xs">
          <button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 删除</button>
          <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 上架</button>
          <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 下架</button>
          <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 移动</button>
          <button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增</button>
          <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
          <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 移动</button>
          <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
        </div>
 <c:import url="/pager.jsp"></c:import>	
        <hr />
        <p>
        备注：操作图标含义
         <a class="am-text-success am-icon-file" title="添加子栏目"> 添加子栏目</a> 
         <a class="am-icon-pencil-square-o am-text-secondary" title="修改"> 修改栏目</a> 
         <a class="am-icon-copy am-text-warning" title="复制"> 复制栏目</a> 
         <a class="am-icon-trash-o am-text-danger" title="删除"> 删除栏目</a>
         

        
        
        
        
        </p>
      </form>

      <div class="foods">
        <ul>
          版权所有@2015
        </ul>
        <dl>
          <a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
        </dl>
      </div>
    </div>
  </div>
</div>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]--> 

<!--[if (gte IE 9)|!(IE)]><!--> 
<script src="assets/js/amazeui.min.js"></script> 
<!--<![endif]-->

</body>
</html>