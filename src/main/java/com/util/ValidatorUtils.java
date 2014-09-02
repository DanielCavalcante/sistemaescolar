package com.util;

import java.util.Collection;
import java.util.Map;

public class ValidatorUtils {
	
	@SuppressWarnings("rawtypes")
	public static boolean isEmpty(Object o) {
		if (o != null) {
			return 
				(o instanceof String && o.toString().trim().isEmpty()) || 
				(o instanceof Collection && ((Collection) o).isEmpty()) ||
				(o instanceof Map && ((Map) o).isEmpty());
		}
		return true;
	}
	
}
