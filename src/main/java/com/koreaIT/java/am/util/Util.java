package com.koreaIT.java.am.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Util {
	
	public static String formatDateTime(LocalDateTime dateTime) {
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		return dateTime.format(dateTimeFormatter);
	}
}
