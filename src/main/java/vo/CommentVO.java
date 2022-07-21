package vo;

import java.io.Serializable;

public class CommentVO implements Serializable{
	private String seq;
	private int mySeq;
	private String logId; //글쓴 아이디
	private String myId; // 로그인된 아이디
	private String com;
	private String date;
	private String uploadfile;
	
	public String getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(String uploadfile) {
		this.uploadfile = uploadfile;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public int getMySeq() {
		return mySeq;
	}
	public void setMySeq(int mySeq) {
		this.mySeq = mySeq;
	}
	public String getLogId() {
		return logId;
	}
	public void setLogId(String logId) {
		this.logId = logId;
	}
	public String getMyId() {
		return myId;
	}
	public void setMyId(String myId) {
		this.myId = myId;
	}
	public String getCom() {
		return com;
	}
	public void setCom(String com) {
		this.com = com;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "CommentVO [seq=" + seq + ", mySeq=" + mySeq + ", logId=" + logId + ", myId=" + myId + ", com=" + com
				+ ", date=" + date + "]";
	}
	
}
