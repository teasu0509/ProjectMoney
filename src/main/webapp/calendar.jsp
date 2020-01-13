<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	//刪除event
	function deleteEvent() {
		var id = document.getElementById("event_id").value;
		$('#calendar').fullCalendar('removeEvents', id);
	}
	//新增event到資料庫
	function addEvent(id, title, start, end) {
		
		var a = {
			id : id,
			title : title,
			start : new Date(start),
			end : new Date(end)
		};
		$.ajax({
			url : "calendar/insert",
			type : "POST",
			datatype : "json",
			data : JSON.stringify(a),
			async : false,
			contentType : "application/json; charset=utf-8;",
			success : function() {

			},
			error : function() {

			}
		});
	}
</script>
<style>
#calendar {
	margin: 0 auto;
	margin-top: 15px;
	margin-bottom: 50px;
	margin-left: 15px;
	margin-right: 15px;
}
</style>
</head>
<body>
	<!-- 渲染日程 -->
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title text-center">行程管理</h3>
		</div>
		<div class="panel-body">
			<div id="calendar"></div>
		</div>
	</div>
	<!-- 修改日程視窗 -->
	<div id="ooo" class="modal inmodal fade" tabindex="-1" role="dialog"
		aria-hidden="true" data-backdrop="static" data-keyboard="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<div class="modal-title ">修改行程</div>
				</div>
				<div class="rhui-window" id="editCalendarWin">
					<div class="rhui-panel-body">
						<!-- 日程id -->
						<input class="rhui-field" type="hidden" id="event_id" />
						<table style="margin-left: 25px;">
							<tr>
								<td class="field-label" align="right">標題：</td>
								<td><input class="rhui-field" id="title" type="text" /></td>
							</tr>
							<tr>
								<td class="field-label" align="right">內容：</td>
								<td><textarea class="rhui-field" id="description"
										style="height: 100px; width: 500px;"></textarea></td>
							</tr>
							<tr>
								<td class="field-label">開始時間：</td>
								<td><input class="rhui-field" id="start" type='text' /></td>
							</tr>
							<tr>
								<td class="field-label">結束時間：</td>
								<td><input class="rhui-field" id="end" type="text" /></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn">確認</button>
					<button class="btn" data-dismiss="modal">取消</button>
					<button class="btn" data-dismiss="modal" onclick="deleteEvent();">刪除行程</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end 修改日程視窗 -->
</body>
<script>
	//初始化日曆-------------------------------------
	$("#calendar")
			.fullCalendar(
					{
						header : {
							left : 'title',
							center : 'agendaDay,agendaWeek,month',
							right : 'prev,next today'
						},
						monthNames : [ '一月', '二月', '三月', '四月', '五月', '六月',
								'七月', '八月', '九月', '十月', '十一月', '十二月' ],
						monthNamesShort : [ '一月', '二月', '三月', '四月', '五月', '六月',
								'七月', '八月', '九月', '十月', '十一月', '十二月' ],
						dayNames : [ 'Sunday', 'Monday', 'Tuesday',
								'Wednesday', 'Thursday', 'Friday', 'Saturday' ],
						dayNamesShort : [ '週日', '星期一', '星期二', '星期三', '星期四',
								'星期五', '週六' ],
						buttonText : {
							today : '當日',
							month : '月',
							week : '周',
							day : '日'
						},
						eventColor : '#2567b3', //事件顏色
						weekends : true, // 顯示星期六跟星期日
						editable : true, // 啟動拖曳調整日期
						selectable : true,
						firstDay : 0,
						eventSources : [ {//資料來源
							url : 'calendar/get'
						} ],
						select : function(start, end, allDay) {//點選日曆空白地方要新增事件時觸發
							var title = prompt('請輸入事件:');
							id = Math.floor(Math.random() * 999999999);//產生亂數id
							if (title) {
								$("#calendar").fullCalendar('renderEvent', {
									id : id,
									title : title,
									start : start,
									end : end,
									allDay : allDay
								}, true);
								addEvent(id, title, start, end);//新增事件至日曆
							}
							$("#calendar").fullCalendar('unselect');
						},
						eventClick : function(info) {//點選事件觸發動作
							//開啟修改視窗
							$("#ooo").modal('show');
							$("#event_id").val(info.id);
							$("#title").val(info.title);
							$("#description").val(info.description);
							$("#start").val(info.start);
							$("#end").val(info.end);
						},
						eventDrop : function (info) {//拖移事件處發動動作
							addEvent(info.id, info.title, info.start, info.end);
						}
					});
</script>
</html>