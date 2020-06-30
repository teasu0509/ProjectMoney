package com.tea.web.entity.logback;


import javax.persistence.*;
import java.io.Serializable;

@Embeddable
public class loggingEventExceptionIdentity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "event_id", nullable = false, foreignKey = @ForeignKey(name = "FOREIGN_EXCEPTION_EVENT", value = ConstraintMode.CONSTRAINT))
	private loggingEvent loggingEvent;

	@Column(columnDefinition = "SMALLINT", nullable = false)
	private int i;

	public loggingEvent getLoggingEvent() {
		return loggingEvent;
	}

	public void setLoggingEvent(loggingEvent loggingEvent) {
		this.loggingEvent = loggingEvent;
	}

	public int getI() {
		return i;
	}

	public void setI(int i) {
		this.i = i;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
