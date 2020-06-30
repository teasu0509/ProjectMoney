package com.tea.web.entity.logback;

import javax.persistence.*;
import java.io.Serializable;

@Embeddable
public class loggingEventPropertyIdentity implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "event_id", nullable = false, foreignKey = @ForeignKey(name = "FOREIGN_PROPERTY_EVENT", value = ConstraintMode.CONSTRAINT))
	private loggingEvent loggingEvent;

	@Column(length = 254, nullable = false)
	private String mapped_key;

	public loggingEvent getLoggingEvent() {
		return loggingEvent;
	}

	public void setLoggingEvent(loggingEvent loggingEvent) {
		this.loggingEvent = loggingEvent;
	}

	public String getMapped_key() {
		return mapped_key;
	}

	public void setMapped_key(String mapped_key) {
		this.mapped_key = mapped_key;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
