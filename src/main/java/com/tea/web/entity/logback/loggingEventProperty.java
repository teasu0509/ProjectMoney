package com.tea.web.entity.logback;

import javax.persistence.*;

@Entity
@Table(name = "logging_event_property")
public class loggingEventProperty {
	@EmbeddedId
	private loggingEventPropertyIdentity loggingEventPropertyIdentity;

	@Lob
	@Column(columnDefinition = "TEXT")
	private String mapped_value;

	public loggingEventPropertyIdentity getLoggingEventPropertyIdentity() {
		return loggingEventPropertyIdentity;
	}

	public void setLoggingEventPropertyIdentity(loggingEventPropertyIdentity loggingEventPropertyIdentity) {
		this.loggingEventPropertyIdentity = loggingEventPropertyIdentity;
	}

	public String getMapped_value() {
		return mapped_value;
	}

	public void setMapped_value(String mapped_value) {
		this.mapped_value = mapped_value;
	}

}
