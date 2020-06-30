package com.tea.web.entity.logback;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "logging_event")
public class loggingEvent implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Column(nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private long event_id;

	@Column
	private long timestmp;

	@Lob
	@Column(columnDefinition = "TEXT", nullable = false)
	private String formatted_message;

	@Column(length = 254, nullable = false)
	private String logger_name;

	@Column(length = 254, nullable = false)
	private String level_string;

	@Column(length = 254)
	private String thread_name;

	@Column(columnDefinition = "SMALLINT")
	private int reference_flag;

	@Column(length = 254)
	private String arg0;
	@Column(length = 254)
	private String arg1;
	@Column(length = 254)
	private String arg2;
	@Column(length = 254)
	private String arg3;
	@Column(length = 254)
	private String arg4;
	@Column(length = 254)
	private String arg5;

	@Column(length = 254, nullable = false)
	private String caller_filename;
	@Column(length = 254, nullable = false)
	private String caller_class;
	@Column(length = 254, nullable = false)
	private String caller_method;
	@Column(columnDefinition = "CHAR(4)", nullable = false)
	private char caller_line;

	public long getEvent_id() {
		return event_id;
	}

	public void setEvent_id(long event_id) {
		this.event_id = event_id;
	}

	public long getTimestmp() {
		return timestmp;
	}

	public void setTimestmp(long timestmp) {
		this.timestmp = timestmp;
	}

	public String getFormatted_message() {
		return formatted_message;
	}

	public void setFormatted_message(String formatted_message) {
		this.formatted_message = formatted_message;
	}

	public String getLogger_name() {
		return logger_name;
	}

	public void setLogger_name(String logger_name) {
		this.logger_name = logger_name;
	}

	public String getLevel_string() {
		return level_string;
	}

	public void setLevel_string(String level_string) {
		this.level_string = level_string;
	}

	public String getThread_name() {
		return thread_name;
	}

	public void setThread_name(String thread_name) {
		this.thread_name = thread_name;
	}

	public int getReference_flag() {
		return reference_flag;
	}

	public void setReference_flag(int reference_flag) {
		this.reference_flag = reference_flag;
	}

	public String getArg0() {
		return arg0;
	}

	public void setArg0(String arg0) {
		this.arg0 = arg0;
	}

	public String getArg1() {
		return arg1;
	}

	public void setArg1(String arg1) {
		this.arg1 = arg1;
	}

	public String getArg2() {
		return arg2;
	}

	public void setArg2(String arg2) {
		this.arg2 = arg2;
	}

	public String getArg3() {
		return arg3;
	}

	public void setArg3(String arg3) {
		this.arg3 = arg3;
	}

	public String getArg4() {
		return arg4;
	}

	public void setArg4(String arg4) {
		this.arg4 = arg4;
	}

	public String getArg5() {
		return arg5;
	}

	public void setArg5(String arg5) {
		this.arg5 = arg5;
	}

	public String getCaller_filename() {
		return caller_filename;
	}

	public void setCaller_filename(String caller_filename) {
		this.caller_filename = caller_filename;
	}

	public String getCaller_class() {
		return caller_class;
	}

	public void setCaller_class(String caller_class) {
		this.caller_class = caller_class;
	}

	public String getCaller_method() {
		return caller_method;
	}

	public void setCaller_method(String caller_method) {
		this.caller_method = caller_method;
	}

	public char getCaller_line() {
		return caller_line;
	}

	public void setCaller_line(char caller_line) {
		this.caller_line = caller_line;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
