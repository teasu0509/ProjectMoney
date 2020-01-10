package com.tea.web.entity.ec;

import java.sql.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.tea.web.entity.User;

@Entity
@Table(name = "TeaSchedule")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Schedule {
	@Id
	@Column(name = "id", columnDefinition = "int", nullable = false)
	private int id;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@Column(name = "title", columnDefinition = "nvarchar(255)", nullable = false)
	private String title;

	@Column(name = "startTime", columnDefinition = "datetime", nullable = false)
	private Date start;

	@Column(name = "endTime", columnDefinition = "datetime", nullable = false)
	private Date end;
	
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
}
