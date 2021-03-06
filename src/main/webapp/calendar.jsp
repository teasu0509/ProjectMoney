<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	//刪除event
	function deleteEvent() {
		var id = document.getElementById("event_id").value;
		$('#calendar').fullCalendar('removeEvents', id);

		$.ajax({
			url : "calendar/delete?id=" + id,
			type : "POST",
			datatype : "json",
			data : {},
			contentType : "application/json; charset=utf-8;",
			success : function() {
				alert("OK");
			},
			error : function() {
				alert("NO OK");
			}
		});
	}
	//新增event
	function addEvent(id, title, start, end, type) {
		var event = {
			id : id,
			title : title,
			start : new Date(start),
			end : new Date(end)
		};

		if (type == "month") {//若於月份模式新增事件則allDay欄位必須為true不然在切換（日/周）時候會佔全版面而不是在all-day上面顯示
			event.allDay = true;
		}

		$.ajax({
			url : "calendar/insert",
			type : "POST",
			datatype : "json",
			data : JSON.stringify(event),
			async : false,
			contentType : "application/json; charset=utf-8;",
			success : function() {

			},
			error : function() {

			}
		});
	}
	//修改event
	function updateEvent() {
		var event = {};
		var id = document.getElementById("event_id").value;
		var allDay = document.getElementById("event_allDay").value;
		var title = document.getElementById("title").value;
		var description = document.getElementById("description").value;
		var start = document.getElementById("start").value;
		var end = document.getElementById("end").value;

		if ($("#mark").prop("checked")) {
			event.color = "orange";
		}

		event.id = id;
		event.title = title;
		event.description = description;
		event.start = new Date(start);
		event.end = new Date(end);
		if (allDay == "true") {//若於月份模式修改事件需判斷event的allDay是否為true|false，再進行修改不然會出錯
			event.allDay = true;
		}
		
		$.ajax({
			url : "calendar/update",
			type : "POST",
			datatype : "json",
			data : JSON.stringify(event),
			async : false,
			contentType : "application/json; charset=utf-8;",
			success : function() {
				$("#ooo").modal('hide');
				$('#calendar').fullCalendar('removeEvents', id);
				$("#calendar").fullCalendar('refetchEvents');
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
.fc-widget-header{
    background-color:#d1d1e0;
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
					<div class="modal-title">修改行程</div>
				</div>
				<br>
				<div class="rhui-window" id="editCalendarWin">
					<div class="rhui-panel-body">
						<!-- 日程id -->
						<input class="rhui-field" type="hidden" id="event_id" /> <input
							class="rhui-field" type="hidden" id="event_allDay" />

						<table style="margin-left: 25px;">
							<tr>
								<td class="field-label" align="right">標題：</td>
								<td><input class="form-control" id="title"
									style="width: 500px;" type="text" /></td>
							</tr>
							<tr>
								<td class="field-label" align="right" valign="top">內容：</td>
								<td><textarea class="form-control" id="description"
										style="height: 150px; width: 500px; resize: none;"></textarea></td>
							</tr>
							<tr>
								<td class="field-label">開始時間：</td>
								<td>
									<div class='input-group date' id='datetimepicker5'>
										<input type='text' class="form-control" style="width: 300px;"
											id="start" /> <span class="input-group-addon"> <span
											class="glyphicon glyphicon-calendar"></span>
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<td class="field-label">結束時間：</td>
								<td>
									<div class='input-group date' id='datetimepicker6'>
										<input type='text' class="form-control" style="width: 300px;"
											id="end" /> <span class="input-group-addon"> <span
											class="glyphicon glyphicon-calendar"></span>
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<td class="field-label"></td>
								<td><input type="checkbox" id="mark"> 是否為重要事件</td>
							</tr>
						</table>
						<br>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn" onclick="updateEvent();">
						<i class="glyphicon glyphicon-ok"></i> 確認
					</button>
					<button class="btn" data-dismiss="modal">
						<i class="glyphicon glyphicon-remove"></i> 取消
					</button>
					<button class="btn" data-dismiss="modal" onclick="deleteEvent();">
						<i class="glyphicon glyphicon-trash"></i> 取消行程
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end 修改日程視窗 -->
</body>
<script>
	//初始化日期選擇器--------------------------------
	$('#datetimepicker5').datetimepicker({
		defaultDate: new Date(),
		stepping: 30,
		sideBySide: true
	});
	$('#datetimepicker6').datetimepicker({
		defaultDate: new Date(),
		stepping: 30,
		sideBySide: true
	});
	//初始化日曆-------------------------------------
	$("#calendar")
			.fullCalendar(
					{
						timezone:"local",
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
						eventMouseover : function(event, jsEvent, view) {
							if (view.name == "month") {
								$(jsEvent.target).attr('title', event.title);
							}
							$(this).css('backgroundColor', '#80bfff');
						},
						eventMouseout : function(event, jsEvent, view) {
							if (event.color != null) {
								$(this).css('backgroundColor', event.color);
							} else {
								$(this).css('backgroundColor', '#2567b3');
							}
						},
						select : function(start, end, allDay, view) {//點選日曆空白地方要新增事件時觸發
							var title = prompt('請輸入事件:');
							var type = view.name;//判斷使用者在那個模式下新增事件（月｜周日）
							id = Math.floor(Math.random() * 999999999);//產生亂數id							
							if (title) {
								$("#calendar").fullCalendar('renderEvent', {
									id : id,
									title : title,
									start : start,
									end : end
								}, true);
								addEvent(id, title, start, end, type);//新增事件至日曆
							}
							$("#calendar").fullCalendar('unselect');
						},
						eventClick : function(info) {//點選事件觸發動作
							//開啟修改視窗
							$("#ooo").modal('show');
							$("#event_id").val(info.id);
							$("#event_allDay").val(info.allDay);
							$("#title").val(info.title);
							$("#description").val(info.description);
							$("#start").val(info.start);
							$("#end").val(info.end);
							$('#datetimepicker5').data("DateTimePicker").date(new Date(info.start));
							$('#datetimepicker6').data("DateTimePicker").date(new Date(info.end));
							if (info.color == 'orange') {
								$('#mark').prop('checked', true);
							} else {
								$('#mark').prop('checked', false);
							}
						},
						eventDrop : function(info) {//拖移事件處發動動作
							addEvent(info.id, info.title, info.start, info.end);
						}
					});
</script>
</html>