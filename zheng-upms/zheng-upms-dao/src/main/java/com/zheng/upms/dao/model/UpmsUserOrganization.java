package com.zheng.upms.dao.model;

import java.io.Serializable;

public class UpmsUserOrganization implements Serializable {
    /**
     * 编号
     *
     * @mbg.generated
     */
    private Integer userOrganizationId;

    /**
     * 用户编号
     *
     * @mbg.generated
     */
    private String userId;

    /**
     * 组织编号
     *
     * @mbg.generated
     */
    private String organizationId;

    private static final long serialVersionUID = 1L;

    public Integer getUserOrganizationId() {
        return userOrganizationId;
    }

    public void setUserOrganizationId(Integer userOrganizationId) {
        this.userOrganizationId = userOrganizationId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(String organizationId) {
        this.organizationId = organizationId;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", userOrganizationId=").append(userOrganizationId);
        sb.append(", userId=").append(userId);
        sb.append(", organizationId=").append(organizationId);
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
        UpmsUserOrganization other = (UpmsUserOrganization) that;
        return (this.getUserOrganizationId() == null ? other.getUserOrganizationId() == null : this.getUserOrganizationId().equals(other.getUserOrganizationId()))
            && (this.getUserId() == null ? other.getUserId() == null : this.getUserId().equals(other.getUserId()))
            && (this.getOrganizationId() == null ? other.getOrganizationId() == null : this.getOrganizationId().equals(other.getOrganizationId()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getUserOrganizationId() == null) ? 0 : getUserOrganizationId().hashCode());
        result = prime * result + ((getUserId() == null) ? 0 : getUserId().hashCode());
        result = prime * result + ((getOrganizationId() == null) ? 0 : getOrganizationId().hashCode());
        return result;
    }
}