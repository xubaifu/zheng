package com.zheng.upms.dao.model;

import java.io.Serializable;
import java.util.Date;

public class UpmsDictData implements Serializable {
    /**
     * 字典编码
     *
     * @mbg.generated
     */
    private String dictCode;

    /**
     * 父级编号
     *
     * @mbg.generated
     */
    private String parentCode;

    /**
     * 所有父级编号
     *
     * @mbg.generated
     */
    private String parentCodes;

    /**
     * 本级排序号（升序）
     *
     * @mbg.generated
     */
    private Long treeSort;

    /**
     * 所有级别排序号
     *
     * @mbg.generated
     */
    private String treeSorts;

    /**
     * 是否最末级
     *
     * @mbg.generated
     */
    private String treeLeaf;

    /**
     * 层次级别
     *
     * @mbg.generated
     */
    private Short treeLevel;

    /**
     * 全节点名
     *
     * @mbg.generated
     */
    private String treeNames;

    /**
     * 字典标签
     *
     * @mbg.generated
     */
    private String dictLabel;

    /**
     * 字典键值
     *
     * @mbg.generated
     */
    private String dictValue;

    /**
     * 字典类型
     *
     * @mbg.generated
     */
    private String dictType;

    /**
     * 系统内置（1是 0否）
     *
     * @mbg.generated
     */
    private String isSys;

    /**
     * 字典描述
     *
     * @mbg.generated
     */
    private String description;

    /**
     * css样式（如：color:red)
     *
     * @mbg.generated
     */
    private String cssStyle;

    /**
     * css类名（如：red）
     *
     * @mbg.generated
     */
    private String cssClass;

    /**
     * 状态（0正常 1删除 2停用）
     *
     * @mbg.generated
     */
    private String status;

    /**
     * 创建者
     *
     * @mbg.generated
     */
    private String createBy;

    /**
     * 创建时间
     *
     * @mbg.generated
     */
    private Date createDate;

    /**
     * 更新者
     *
     * @mbg.generated
     */
    private String updateBy;

    /**
     * 更新时间
     *
     * @mbg.generated
     */
    private Date updateDate;

    /**
     * 备注信息
     *
     * @mbg.generated
     */
    private String remarks;

    /**
     * 归属集团Code
     *
     * @mbg.generated
     */
    private String corpCode;

    /**
     * 归属集团Name
     *
     * @mbg.generated
     */
    private String corpName;

    private static final long serialVersionUID = 1L;

    public String getDictCode() {
        return dictCode;
    }

    public void setDictCode(String dictCode) {
        this.dictCode = dictCode;
    }

    public String getParentCode() {
        return parentCode;
    }

    public void setParentCode(String parentCode) {
        this.parentCode = parentCode;
    }

    public String getParentCodes() {
        return parentCodes;
    }

    public void setParentCodes(String parentCodes) {
        this.parentCodes = parentCodes;
    }

    public Long getTreeSort() {
        return treeSort;
    }

    public void setTreeSort(Long treeSort) {
        this.treeSort = treeSort;
    }

    public String getTreeSorts() {
        return treeSorts;
    }

    public void setTreeSorts(String treeSorts) {
        this.treeSorts = treeSorts;
    }

    public String getTreeLeaf() {
        return treeLeaf;
    }

    public void setTreeLeaf(String treeLeaf) {
        this.treeLeaf = treeLeaf;
    }

    public Short getTreeLevel() {
        return treeLevel;
    }

    public void setTreeLevel(Short treeLevel) {
        this.treeLevel = treeLevel;
    }

    public String getTreeNames() {
        return treeNames;
    }

    public void setTreeNames(String treeNames) {
        this.treeNames = treeNames;
    }

    public String getDictLabel() {
        return dictLabel;
    }

    public void setDictLabel(String dictLabel) {
        this.dictLabel = dictLabel;
    }

    public String getDictValue() {
        return dictValue;
    }

    public void setDictValue(String dictValue) {
        this.dictValue = dictValue;
    }

    public String getDictType() {
        return dictType;
    }

    public void setDictType(String dictType) {
        this.dictType = dictType;
    }

    public String getIsSys() {
        return isSys;
    }

    public void setIsSys(String isSys) {
        this.isSys = isSys;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCssStyle() {
        return cssStyle;
    }

    public void setCssStyle(String cssStyle) {
        this.cssStyle = cssStyle;
    }

    public String getCssClass() {
        return cssClass;
    }

    public void setCssClass(String cssClass) {
        this.cssClass = cssClass;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getCorpCode() {
        return corpCode;
    }

    public void setCorpCode(String corpCode) {
        this.corpCode = corpCode;
    }

    public String getCorpName() {
        return corpName;
    }

    public void setCorpName(String corpName) {
        this.corpName = corpName;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", dictCode=").append(dictCode);
        sb.append(", parentCode=").append(parentCode);
        sb.append(", parentCodes=").append(parentCodes);
        sb.append(", treeSort=").append(treeSort);
        sb.append(", treeSorts=").append(treeSorts);
        sb.append(", treeLeaf=").append(treeLeaf);
        sb.append(", treeLevel=").append(treeLevel);
        sb.append(", treeNames=").append(treeNames);
        sb.append(", dictLabel=").append(dictLabel);
        sb.append(", dictValue=").append(dictValue);
        sb.append(", dictType=").append(dictType);
        sb.append(", isSys=").append(isSys);
        sb.append(", description=").append(description);
        sb.append(", cssStyle=").append(cssStyle);
        sb.append(", cssClass=").append(cssClass);
        sb.append(", status=").append(status);
        sb.append(", createBy=").append(createBy);
        sb.append(", createDate=").append(createDate);
        sb.append(", updateBy=").append(updateBy);
        sb.append(", updateDate=").append(updateDate);
        sb.append(", remarks=").append(remarks);
        sb.append(", corpCode=").append(corpCode);
        sb.append(", corpName=").append(corpName);
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
        UpmsDictData other = (UpmsDictData) that;
        return (this.getDictCode() == null ? other.getDictCode() == null : this.getDictCode().equals(other.getDictCode()))
            && (this.getParentCode() == null ? other.getParentCode() == null : this.getParentCode().equals(other.getParentCode()))
            && (this.getParentCodes() == null ? other.getParentCodes() == null : this.getParentCodes().equals(other.getParentCodes()))
            && (this.getTreeSort() == null ? other.getTreeSort() == null : this.getTreeSort().equals(other.getTreeSort()))
            && (this.getTreeSorts() == null ? other.getTreeSorts() == null : this.getTreeSorts().equals(other.getTreeSorts()))
            && (this.getTreeLeaf() == null ? other.getTreeLeaf() == null : this.getTreeLeaf().equals(other.getTreeLeaf()))
            && (this.getTreeLevel() == null ? other.getTreeLevel() == null : this.getTreeLevel().equals(other.getTreeLevel()))
            && (this.getTreeNames() == null ? other.getTreeNames() == null : this.getTreeNames().equals(other.getTreeNames()))
            && (this.getDictLabel() == null ? other.getDictLabel() == null : this.getDictLabel().equals(other.getDictLabel()))
            && (this.getDictValue() == null ? other.getDictValue() == null : this.getDictValue().equals(other.getDictValue()))
            && (this.getDictType() == null ? other.getDictType() == null : this.getDictType().equals(other.getDictType()))
            && (this.getIsSys() == null ? other.getIsSys() == null : this.getIsSys().equals(other.getIsSys()))
            && (this.getDescription() == null ? other.getDescription() == null : this.getDescription().equals(other.getDescription()))
            && (this.getCssStyle() == null ? other.getCssStyle() == null : this.getCssStyle().equals(other.getCssStyle()))
            && (this.getCssClass() == null ? other.getCssClass() == null : this.getCssClass().equals(other.getCssClass()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getCreateBy() == null ? other.getCreateBy() == null : this.getCreateBy().equals(other.getCreateBy()))
            && (this.getCreateDate() == null ? other.getCreateDate() == null : this.getCreateDate().equals(other.getCreateDate()))
            && (this.getUpdateBy() == null ? other.getUpdateBy() == null : this.getUpdateBy().equals(other.getUpdateBy()))
            && (this.getUpdateDate() == null ? other.getUpdateDate() == null : this.getUpdateDate().equals(other.getUpdateDate()))
            && (this.getRemarks() == null ? other.getRemarks() == null : this.getRemarks().equals(other.getRemarks()))
            && (this.getCorpCode() == null ? other.getCorpCode() == null : this.getCorpCode().equals(other.getCorpCode()))
            && (this.getCorpName() == null ? other.getCorpName() == null : this.getCorpName().equals(other.getCorpName()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getDictCode() == null) ? 0 : getDictCode().hashCode());
        result = prime * result + ((getParentCode() == null) ? 0 : getParentCode().hashCode());
        result = prime * result + ((getParentCodes() == null) ? 0 : getParentCodes().hashCode());
        result = prime * result + ((getTreeSort() == null) ? 0 : getTreeSort().hashCode());
        result = prime * result + ((getTreeSorts() == null) ? 0 : getTreeSorts().hashCode());
        result = prime * result + ((getTreeLeaf() == null) ? 0 : getTreeLeaf().hashCode());
        result = prime * result + ((getTreeLevel() == null) ? 0 : getTreeLevel().hashCode());
        result = prime * result + ((getTreeNames() == null) ? 0 : getTreeNames().hashCode());
        result = prime * result + ((getDictLabel() == null) ? 0 : getDictLabel().hashCode());
        result = prime * result + ((getDictValue() == null) ? 0 : getDictValue().hashCode());
        result = prime * result + ((getDictType() == null) ? 0 : getDictType().hashCode());
        result = prime * result + ((getIsSys() == null) ? 0 : getIsSys().hashCode());
        result = prime * result + ((getDescription() == null) ? 0 : getDescription().hashCode());
        result = prime * result + ((getCssStyle() == null) ? 0 : getCssStyle().hashCode());
        result = prime * result + ((getCssClass() == null) ? 0 : getCssClass().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getCreateBy() == null) ? 0 : getCreateBy().hashCode());
        result = prime * result + ((getCreateDate() == null) ? 0 : getCreateDate().hashCode());
        result = prime * result + ((getUpdateBy() == null) ? 0 : getUpdateBy().hashCode());
        result = prime * result + ((getUpdateDate() == null) ? 0 : getUpdateDate().hashCode());
        result = prime * result + ((getRemarks() == null) ? 0 : getRemarks().hashCode());
        result = prime * result + ((getCorpCode() == null) ? 0 : getCorpCode().hashCode());
        result = prime * result + ((getCorpName() == null) ? 0 : getCorpName().hashCode());
        return result;
    }
}