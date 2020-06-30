package com.tea.web.entity.logback;

import javax.persistence.*;

@Entity
@Table(name = "logging_event_exception")
public class loggingEventException {
	@EmbeddedId
	private loggingEventExceptionIdentity loggingEventExceptionIdentity;

	@Column(nullable = false, length = 254)
	private String trace_line;

	public loggingEventExceptionIdentity getLoggingEventExceptionIdentity() {
		return loggingEventExceptionIdentity;
	}

	public void setLoggingEventExceptionIdentity(loggingEventExceptionIdentity loggingEventExceptionIdentity) {
		this.loggingEventExceptionIdentity = loggingEventExceptionIdentity;
	}

	public String getTrace_line() {
		return trace_line;
	}

	public void setTrace_line(String trace_line) {
		this.trace_line = trace_line;
	}

}
