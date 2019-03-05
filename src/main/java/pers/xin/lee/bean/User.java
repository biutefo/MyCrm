package pers.xin.lee.bean;

public class User {
    private Integer userId;//用户id
    private String userCode;//用户账号
    private String userName;//用户名称
    private String userPassword;//用户密码
    private Integer userState;//用户状态

    public Integer getUserId() {
        return userId;
    }

    public User(Integer userId, String userCode, String userName, String userPassword, Integer userState) {
		super();
		this.userId = userId;
		this.userCode = userCode;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userState = userState;
	}

	public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode == null ? null : userCode.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public Integer getUserState() {
        return userState;
    }

    public void setUserState(Integer userState) {
        this.userState = userState;
    }

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userCode=" + userCode + ", userName=" + userName + ", userPassword="
				+ userPassword + ", userState=" + userState + "]";
	}
}