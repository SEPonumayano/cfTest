<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.NumberFormat" %>
<%
/** 登録か編集かの判断値**/
String menulist=(String)request.getAttribute("menulist");

/** もし値の受け渡しがある場合用**/
//日付
String day=(String) request.getAttribute("day");
//片道or往復
String route_no=(String) request.getAttribute("route_no");
String route_name=(String) request.getAttribute("route_name");
//交通機関
String transit_no=(String)request.getAttribute("transit_no");
String transit_name=(String)request.getAttribute("transit_name");
//出発駅
String from_st=(String)request.getAttribute("from_st");
//到着駅
String to_st=(String)request.getAttribute("to_st");
//金額
String price=(String)request.getAttribute("price");

/** 金額 処理変更**/
int Price=0;
if(price.isEmpty()){
price="0";
}else{
	Price=Integer.parseInt(price);
}
NumberFormat nf = NumberFormat.getNumberInstance();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="add.css">
<title>登録確認</title>
</head>
<body>
<p class="title">交通費登録システム：登録</p>

<form class="addlist"  method="post">

<dl>
<dt>日付：</dt>
<dd><%=day%></dd>

<dt>片道or往復：</dt>
<dd><%=route_name%></dd>

<dt>交通機関：</dt>
<dd><%=transit_name%></dd>

<dt>出発駅：</dt>
<dd>
<%=from_st%>&emsp;&emsp;&emsp;―到着駅：<%=to_st%>
</dd>

<!-- 金額処理変更 -->
<dt>金額：</dt>
<dd><%if(Price==0){%>
<%=price %>
<%}else{ %>
<%=nf.format(Price)%>
<%
}
%>
円</dd>


<!-- hidden用 -->
<input type="hidden" name="menulist" value="<%=menulist%>">
<input type="hidden" name="day" value="<%=day%>">
<input type="hidden" name="route_no" value="<%=route_no%>">
<input type="hidden" name="transit_no" value="<%=transit_no%>">
<input type="hidden" name="from_st" value="<%=from_st%>">
<input type="hidden" name="to_st" value="<%=to_st%>">
<input type="hidden" name="price" value="<%=price%>">
<br/>
<dt>&nbsp;</dt>
<dd>
<input class="transitionbt" type="submit" formaction="AddCheck" value="登録">
<input class="transitionbt" type="submit" formaction="Add" formmethod="get" value="戻る">
</dd>
</dl>
</form>
</body>
</html>