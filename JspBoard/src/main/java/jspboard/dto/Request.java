package jspboard.dto;

public class Request {

	private String uri;
	private String method;
	
	public Request(String uri, String method) {
		this.uri = uri;
		this.method = method;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}
	
	// hashCode : 재료로 고유 번호를 만들어 객체를 구분
	@Override
	public int hashCode() {
		return uri.hashCode() + method.hashCode();
	}
	
	// equals : 두 객체가 같은지 비교하는 메서드
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Request) {
			Request o1 = this;
			Request o2 = (Request)obj;
			
			return o1.method.equals(o2.method) &&
					o1.uri.equals(o2.uri);
		} else {
			return false;
		}
	}
}
