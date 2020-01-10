<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/calendar.css" rel="stylesheet">
<script src="resources/js/calendar.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>
<script type="text/javascript">
	//刪除event
	function deleteEvent(id) {
		$('#calendar').fullCalendar('removeEvents', id);
	}
	//新增event到資料庫
	function addEvent(id, title, start, end) {
		var params = {
			id : id,
			title : title,
			start : start,
			end : end
		};
		/* $.ajax({
			type : "POST",
			url : "schedule/insert",
			data : JSON.stringify(params),//json序列化 
			datatype : "json", //此處不能省略 
			contentType : "application/json; charset=utf-8",//此處不能省略 
			success : function() {
				alert("OK");
			},
			error : function() {
				alert("no ok")
			}
		}); */
	}
</script>
</head>
<body>
	<!-- 渲染日程 -->
	<div id="div1" class="tab-content">
		<div id='calendar'></div>
	</div>
	<!-- 修改日程視窗 -->
	<div class="rhui-window" id="editCalendarWin" style="display:none;">
		<div class="rhui-panel-body">
			<!-- 日程id -->
			<input type="hidden" name="id" />
			<table style="margin-left:25px;">
				<tr>
					<td class="field-label">日程標題：</td>
					<td><input class="rhui-field" name="title" type="text" /></td>
				</tr>
				<tr>
					<td class="field-label">日程內容：</td>
					<td><textarea class="rhui-field" name="content" style="height:62px;"></textarea></td>
				</tr>
				<tr>
					<td class="field-label">開始時間：</td>
					<td><input class="rhui-field" name="start" type="text"/></td>
				</tr>
				<tr>
					<td class="field-label">結束時間：</td>
					<td><input class="rhui-field" name="end" type="text"/></td>
				</tr>
			</table>
		</div>
	</div>
	<!-- end 修改日程視窗 -->	
</body>
<script>
	$(document).ready(function() {
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		var id;

		$('#external-events div.external-event').each(function() {

			var eventObject = {
				title : $.trim($(this).text())
			};
			$(this).data('eventObject', eventObject);
			$(this).draggable({
				zIndex : 999,
				revert : true,
				revertDuration : 0
			});
		});
		//初始化日曆-------------------------------------
		var calendar = $('#calendar').fullCalendar({
			header : {
				left : 'title',
				center : 'agendaDay,agendaWeek,month',
				right : 'prev,next today'
			},
			editable : true,
			firstDay : 0, //  1(Monday) this can be changed to 0(Sunday) for the USA system
			selectable : true,
			defaultView : 'month',
			weekends : true,
			axisFormat : 'hh:mm',
			columnFormat : {
				month : 'ddd', // Mon
				week : 'ddd d', // Mon 7
				day : 'dddd M/d', // Monday 9/7
				agendaDay : 'dddd d'
			},
			titleFormat : {
				month : 'MMMM yyyy', // September 2009
				week : "MMMM yyyy", // September 2009
				day : 'MMMM yyyy' // Tuesday, Sep 8, 2009
			},
			allDaySlot : false,
			selectHelper : true,
			select : function(start, end, allDay) {
				var title = prompt('請輸入事件:');
				id = Math.floor(Math.random() * 999999999999999999);//產生亂數id
				if (title) {
					calendar.fullCalendar('renderEvent', {
						id : id,
						title : title,
						start : start,
						end : end,
						allDay : allDay
					}, true // make the event "stick"
					);
					addEvent(id, title, start, end);//新增事件至日曆
				}
				calendar.fullCalendar('unselect');
			},
			eventSources : [ {
				url : 'schedule/get'
			} ],
			eventClick:function(info){//點選事件觸發事件
				//alert(JSON.stringify(info));
				//alert(info.title);
			}
		});
	});
</script>
</html>