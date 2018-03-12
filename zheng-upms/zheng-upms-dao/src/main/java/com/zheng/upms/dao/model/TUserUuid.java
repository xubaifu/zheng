package com.zheng.upms.dao.model;

import java.io.Serializable;

public class TUserUuid implements Serializable {
    private Integer id;

    private String subId;

    private String userId;

    private String enTableName;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSubId() {
        return subId;
    }

    public void setSubId(String subId) {
        this.subId = subId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getEnTableName() {
        return enTableName;
    }

    public void setEnTableName(String enTableName) {
        this.enTableName = enTableName;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", subId=").append(subId);
        sb.append(", userId=").append(userId);
        sb.append(", enTableName=").append(enTableName);
        sb.append("]");
        return sb.toString();
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        TUserUuid other = (TUserUuid) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getSubId() == null ? other.getSubId() == null : this.getSubId().equals(other.getSubId()))
            && (this.getUserId() == null ? other.getUserId() == null : this.getUserId().equals(other.getUserId()))
            && (this.getEnTableName() == null ? other.getEnTableName() == null : this.getEnTableName().equals(other.getEnTableName()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getSubId() == null) ? 0 : getSubId().hashCode());
        result = prime * result + ((getUserId() == null) ? 0 : getUserId().hashCode());
        result = prime * result + ((getEnTableName() == null) ? 0 : getEnTableName().hashCode());
        return result;
    }
}