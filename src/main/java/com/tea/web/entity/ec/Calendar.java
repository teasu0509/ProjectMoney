package com.tea.web.entity.ec;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.tea.web.entity.User;

@Entity
@Table(name = "TeaCalendar")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Calendar {
	@Id
	@Column(name = "id", columnDefinition = "int", nullable = false)
	private int id;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@Column(name = "title", columnDefinition = "nvarchar(255)", nullable = false)
	private String title;

	@Column(name = "description", columnDefinition = "nvarchar(1024)", nullable = true)
	private String description;

	@Column(name = "startTime", columnDefinition = "datetime", nullable = false)
	private Date start;

	@Column(name = "endTime", columnDefinition = "datetime", nullable = false)
	private Date end;

	@Column(name = "allDay", nullable = false)
	private boolean allDay;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isAllDay() {
		return allDay;
	}

	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}

}
