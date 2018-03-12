package com.zheng.upms.dao.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UpmsDictDataExample implements Serializable {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private static final long serialVersionUID = 1L;

    public UpmsDictDataExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria implements Serializable {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andDictCodeIsNull() {
            addCriterion("dict_code is null");
            return (Criteria) this;
        }

        public Criteria andDictCodeIsNotNull() {
            addCriterion("dict_code is not null");
            return (Criteria) this;
        }

        public Criteria andDictCodeEqualTo(String value) {
            addCriterion("dict_code =", value, "dictCode");
            return (Criteria) this;
        }

        public Criteria andDictCodeNotEqualTo(String value) {
            addCriterion("dict_code <>", value, "dictCode");
            return (Criteria) this;
        }

        public Criteria andDictCodeGreaterThan(String value) {
            addCriterion("dict_code >", value, "dictCode");
            return (Criteria) this;
        }

        public Criteria andDictCodeGreaterThanOrEqualTo(String value) {
            addCriterion("dict_code >=", value, "dictCode");
            return (Criteria) this;
        }

        public Criteria andDictCodeLessThan(String value) {
            addCriterion("dict_code <", value, "dictCode");
            return (Criteria) this;
        }

        public Criteria andDictCodeLessThanOrEqualTo(String value) {
            addCriterion("dict_code <=", value, "dictCode");
            return (Criteria) this;
        }

        public Criteria andDictCodeLike(String value) {
            addCriterion("dict_code like", value, "dictCode");
            return (Criteria) this;
        }

        public Criteria andDictCodeNotLike(String value) {
            addCriterion("dict_code not like", value, "dictCode");
            return (Criteria) this;
        }

        public Criteria andDictCodeIn(List<String> values) {
            addCriterion("dict_code in", values, "dictCode");
            return (Criteria) this;
        }

        public Criteria andDictCodeNotIn(List<String> values) {
            addCriterion("dict_code not in", values, "dictCode");
            return (Criteria) this;
        }

        public Criteria andDictCodeBetween(String value1, String value2) {
            addCriterion("dict_code between", value1, value2, "dictCode");
            return (Criteria) this;
        }

        public Criteria andDictCodeNotBetween(String value1, String value2) {
            addCriterion("dict_code not between", value1, value2, "dictCode");
            return (Criteria) this;
        }

        public Criteria andParentCodeIsNull() {
            addCriterion("parent_code is null");
            return (Criteria) this;
        }

        public Criteria andParentCodeIsNotNull() {
            addCriterion("parent_code is not null");
            return (Criteria) this;
        }

        public Criteria andParentCodeEqualTo(String value) {
            addCriterion("parent_code =", value, "parentCode");
            return (Criteria) this;
        }

        public Criteria andParentCodeNotEqualTo(String value) {
            addCriterion("parent_code <>", value, "parentCode");
            return (Criteria) this;
        }

        public Criteria andParentCodeGreaterThan(String value) {
            addCriterion("parent_code >", value, "parentCode");
            return (Criteria) this;
        }

        public Criteria andParentCodeGreaterThanOrEqualTo(String value) {
            addCriterion("parent_code >=", value, "parentCode");
            return (Criteria) this;
        }

        public Criteria andParentCodeLessThan(String value) {
            addCriterion("parent_code <", value, "parentCode");
            return (Criteria) this;
        }

        public Criteria andParentCodeLessThanOrEqualTo(String value) {
            addCriterion("parent_code <=", value, "parentCode");
            return (Criteria) this;
        }

        public Criteria andParentCodeLike(String value) {
            addCriterion("parent_code like", value, "parentCode");
            return (Criteria) this;
        }

        public Criteria andParentCodeNotLike(String value) {
            addCriterion("parent_code not like", value, "parentCode");
            return (Criteria) this;
        }

        public Criteria andParentCodeIn(List<String> values) {
            addCriterion("parent_code in", values, "parentCode");
            return (Criteria) this;
        }

        public Criteria andParentCodeNotIn(List<String> values) {
            addCriterion("parent_code not in", values, "parentCode");
            return (Criteria) this;
        }

        public Criteria andParentCodeBetween(String value1, String value2) {
            addCriterion("parent_code between", value1, value2, "parentCode");
            return (Criteria) this;
        }

        public Criteria andParentCodeNotBetween(String value1, String value2) {
            addCriterion("parent_code not between", value1, value2, "parentCode");
            return (Criteria) this;
        }

        public Criteria andParentCodesIsNull() {
            addCriterion("parent_codes is null");
            return (Criteria) this;
        }

        public Criteria andParentCodesIsNotNull() {
            addCriterion("parent_codes is not null");
            return (Criteria) this;
        }

        public Criteria andParentCodesEqualTo(String value) {
            addCriterion("parent_codes =", value, "parentCodes");
            return (Criteria) this;
        }

        public Criteria andParentCodesNotEqualTo(String value) {
            addCriterion("parent_codes <>", value, "parentCodes");
            return (Criteria) this;
        }

        public Criteria andParentCodesGreaterThan(String value) {
            addCriterion("parent_codes >", value, "parentCodes");
            return (Criteria) this;
        }

        public Criteria andParentCodesGreaterThanOrEqualTo(String value) {
            addCriterion("parent_codes >=", value, "parentCodes");
            return (Criteria) this;
        }

        public Criteria andParentCodesLessThan(String value) {
            addCriterion("parent_codes <", value, "parentCodes");
            return (Criteria) this;
        }

        public Criteria andParentCodesLessThanOrEqualTo(String value) {
            addCriterion("parent_codes <=", value, "parentCodes");
            return (Criteria) this;
        }

        public Criteria andParentCodesLike(String value) {
            addCriterion("parent_codes like", value, "parentCodes");
            return (Criteria) this;
        }

        public Criteria andParentCodesNotLike(String value) {
            addCriterion("parent_codes not like", value, "parentCodes");
            return (Criteria) this;
        }

        public Criteria andParentCodesIn(List<String> values) {
            addCriterion("parent_codes in", values, "parentCodes");
            return (Criteria) this;
        }

        public Criteria andParentCodesNotIn(List<String> values) {
            addCriterion("parent_codes not in", values, "parentCodes");
            return (Criteria) this;
        }

        public Criteria andParentCodesBetween(String value1, String value2) {
            addCriterion("parent_codes between", value1, value2, "parentCodes");
            return (Criteria) this;
        }

        public Criteria andParentCodesNotBetween(String value1, String value2) {
            addCriterion("parent_codes not between", value1, value2, "parentCodes");
            return (Criteria) this;
        }

        public Criteria andTreeSortIsNull() {
            addCriterion("tree_sort is null");
            return (Criteria) this;
        }

        public Criteria andTreeSortIsNotNull() {
            addCriterion("tree_sort is not null");
            return (Criteria) this;
        }

        public Criteria andTreeSortEqualTo(Long value) {
            addCriterion("tree_sort =", value, "treeSort");
            return (Criteria) this;
        }

        public Criteria andTreeSortNotEqualTo(Long value) {
            addCriterion("tree_sort <>", value, "treeSort");
            return (Criteria) this;
        }

        public Criteria andTreeSortGreaterThan(Long value) {
            addCriterion("tree_sort >", value, "treeSort");
            return (Criteria) this;
        }

        public Criteria andTreeSortGreaterThanOrEqualTo(Long value) {
            addCriterion("tree_sort >=", value, "treeSort");
            return (Criteria) this;
        }

        public Criteria andTreeSortLessThan(Long value) {
            addCriterion("tree_sort <", value, "treeSort");
            return (Criteria) this;
        }

        public Criteria andTreeSortLessThanOrEqualTo(Long value) {
            addCriterion("tree_sort <=", value, "treeSort");
            return (Criteria) this;
        }

        public Criteria andTreeSortIn(List<Long> values) {
            addCriterion("tree_sort in", values, "treeSort");
            return (Criteria) this;
        }

        public Criteria andTreeSortNotIn(List<Long> values) {
            addCriterion("tree_sort not in", values, "treeSort");
            return (Criteria) this;
        }

        public Criteria andTreeSortBetween(Long value1, Long value2) {
            addCriterion("tree_sort between", value1, value2, "treeSort");
            return (Criteria) this;
        }

        public Criteria andTreeSortNotBetween(Long value1, Long value2) {
            addCriterion("tree_sort not between", value1, value2, "treeSort");
            return (Criteria) this;
        }

        public Criteria andTreeSortsIsNull() {
            addCriterion("tree_sorts is null");
            return (Criteria) this;
        }

        public Criteria andTreeSortsIsNotNull() {
            addCriterion("tree_sorts is not null");
            return (Criteria) this;
        }

        public Criteria andTreeSortsEqualTo(String value) {
            addCriterion("tree_sorts =", value, "treeSorts");
            return (Criteria) this;
        }

        public Criteria andTreeSortsNotEqualTo(String value) {
            addCriterion("tree_sorts <>", value, "treeSorts");
            return (Criteria) this;
        }

        public Criteria andTreeSortsGreaterThan(String value) {
            addCriterion("tree_sorts >", value, "treeSorts");
            return (Criteria) this;
        }

        public Criteria andTreeSortsGreaterThanOrEqualTo(String value) {
            addCriterion("tree_sorts >=", value, "treeSorts");
            return (Criteria) this;
        }

        public Criteria andTreeSortsLessThan(String value) {
            addCriterion("tree_sorts <", value, "treeSorts");
            return (Criteria) this;
        }

        public Criteria andTreeSortsLessThanOrEqualTo(String value) {
            addCriterion("tree_sorts <=", value, "treeSorts");
            return (Criteria) this;
        }

        public Criteria andTreeSortsLike(String value) {
            addCriterion("tree_sorts like", value, "treeSorts");
            return (Criteria) this;
        }

        public Criteria andTreeSortsNotLike(String value) {
            addCriterion("tree_sorts not like", value, "treeSorts");
            return (Criteria) this;
        }

        public Criteria andTreeSortsIn(List<String> values) {
            addCriterion("tree_sorts in", values, "treeSorts");
            return (Criteria) this;
        }

        public Criteria andTreeSortsNotIn(List<String> values) {
            addCriterion("tree_sorts not in", values, "treeSorts");
            return (Criteria) this;
        }

        public Criteria andTreeSortsBetween(String value1, String value2) {
            addCriterion("tree_sorts between", value1, value2, "treeSorts");
            return (Criteria) this;
        }

        public Criteria andTreeSortsNotBetween(String value1, String value2) {
            addCriterion("tree_sorts not between", value1, value2, "treeSorts");
            return (Criteria) this;
        }

        public Criteria andTreeLeafIsNull() {
            addCriterion("tree_leaf is null");
            return (Criteria) this;
        }

        public Criteria andTreeLeafIsNotNull() {
            addCriterion("tree_leaf is not null");
            return (Criteria) this;
        }

        public Criteria andTreeLeafEqualTo(String value) {
            addCriterion("tree_leaf =", value, "treeLeaf");
            return (Criteria) this;
        }

        public Criteria andTreeLeafNotEqualTo(String value) {
            addCriterion("tree_leaf <>", value, "treeLeaf");
            return (Criteria) this;
        }

        public Criteria andTreeLeafGreaterThan(String value) {
            addCriterion("tree_leaf >", value, "treeLeaf");
            return (Criteria) this;
        }

        public Criteria andTreeLeafGreaterThanOrEqualTo(String value) {
            addCriterion("tree_leaf >=", value, "treeLeaf");
            return (Criteria) this;
        }

        public Criteria andTreeLeafLessThan(String value) {
            addCriterion("tree_leaf <", value, "treeLeaf");
            return (Criteria) this;
        }

        public Criteria andTreeLeafLessThanOrEqualTo(String value) {
            addCriterion("tree_leaf <=", value, "treeLeaf");
            return (Criteria) this;
        }

        public Criteria andTreeLeafLike(String value) {
            addCriterion("tree_leaf like", value, "treeLeaf");
            return (Criteria) this;
        }

        public Criteria andTreeLeafNotLike(String value) {
            addCriterion("tree_leaf not like", value, "treeLeaf");
            return (Criteria) this;
        }

        public Criteria andTreeLeafIn(List<String> values) {
            addCriterion("tree_leaf in", values, "treeLeaf");
            return (Criteria) this;
        }

        public Criteria andTreeLeafNotIn(List<String> values) {
            addCriterion("tree_leaf not in", values, "treeLeaf");
            return (Criteria) this;
        }

        public Criteria andTreeLeafBetween(String value1, String value2) {
            addCriterion("tree_leaf between", value1, value2, "treeLeaf");
            return (Criteria) this;
        }

        public Criteria andTreeLeafNotBetween(String value1, String value2) {
            addCriterion("tree_leaf not between", value1, value2, "treeLeaf");
            return (Criteria) this;
        }

        public Criteria andTreeLevelIsNull() {
            addCriterion("tree_level is null");
            return (Criteria) this;
        }

        public Criteria andTreeLevelIsNotNull() {
            addCriterion("tree_level is not null");
            return (Criteria) this;
        }

        public Criteria andTreeLevelEqualTo(Short value) {
            addCriterion("tree_level =", value, "treeLevel");
            return (Criteria) this;
        }

        public Criteria andTreeLevelNotEqualTo(Short value) {
            addCriterion("tree_level <>", value, "treeLevel");
            return (Criteria) this;
        }

        public Criteria andTreeLevelGreaterThan(Short value) {
            addCriterion("tree_level >", value, "treeLevel");
            return (Criteria) this;
        }

        public Criteria andTreeLevelGreaterThanOrEqualTo(Short value) {
            addCriterion("tree_level >=", value, "treeLevel");
            return (Criteria) this;
        }

        public Criteria andTreeLevelLessThan(Short value) {
            addCriterion("tree_level <", value, "treeLevel");
            return (Criteria) this;
        }

        public Criteria andTreeLevelLessThanOrEqualTo(Short value) {
            addCriterion("tree_level <=", value, "treeLevel");
            return (Criteria) this;
        }

        public Criteria andTreeLevelIn(List<Short> values) {
            addCriterion("tree_level in", values, "treeLevel");
            return (Criteria) this;
        }

        public Criteria andTreeLevelNotIn(List<Short> values) {
            addCriterion("tree_level not in", values, "treeLevel");
            return (Criteria) this;
        }

        public Criteria andTreeLevelBetween(Short value1, Short value2) {
            addCriterion("tree_level between", value1, value2, "treeLevel");
            return (Criteria) this;
        }

        public Criteria andTreeLevelNotBetween(Short value1, Short value2) {
            addCriterion("tree_level not between", value1, value2, "treeLevel");
            return (Criteria) this;
        }

        public Criteria andTreeNamesIsNull() {
            addCriterion("tree_names is null");
            return (Criteria) this;
        }

        public Criteria andTreeNamesIsNotNull() {
            addCriterion("tree_names is not null");
            return (Criteria) this;
        }

        public Criteria andTreeNamesEqualTo(String value) {
            addCriterion("tree_names =", value, "treeNames");
            return (Criteria) this;
        }

        public Criteria andTreeNamesNotEqualTo(String value) {
            addCriterion("tree_names <>", value, "treeNames");
            return (Criteria) this;
        }

        public Criteria andTreeNamesGreaterThan(String value) {
            addCriterion("tree_names >", value, "treeNames");
            return (Criteria) this;
        }

        public Criteria andTreeNamesGreaterThanOrEqualTo(String value) {
            addCriterion("tree_names >=", value, "treeNames");
            return (Criteria) this;
        }

        public Criteria andTreeNamesLessThan(String value) {
            addCriterion("tree_names <", value, "treeNames");
            return (Criteria) this;
        }

        public Criteria andTreeNamesLessThanOrEqualTo(String value) {
            addCriterion("tree_names <=", value, "treeNames");
            return (Criteria) this;
        }

        public Criteria andTreeNamesLike(String value) {
            addCriterion("tree_names like", value, "treeNames");
            return (Criteria) this;
        }

        public Criteria andTreeNamesNotLike(String value) {
            addCriterion("tree_names not like", value, "treeNames");
            return (Criteria) this;
        }

        public Criteria andTreeNamesIn(List<String> values) {
            addCriterion("tree_names in", values, "treeNames");
            return (Criteria) this;
        }

        public Criteria andTreeNamesNotIn(List<String> values) {
            addCriterion("tree_names not in", values, "treeNames");
            return (Criteria) this;
        }

        public Criteria andTreeNamesBetween(String value1, String value2) {
            addCriterion("tree_names between", value1, value2, "treeNames");
            return (Criteria) this;
        }

        public Criteria andTreeNamesNotBetween(String value1, String value2) {
            addCriterion("tree_names not between", value1, value2, "treeNames");
            return (Criteria) this;
        }

        public Criteria andDictLabelIsNull() {
            addCriterion("dict_label is null");
            return (Criteria) this;
        }

        public Criteria andDictLabelIsNotNull() {
            addCriterion("dict_label is not null");
            return (Criteria) this;
        }

        public Criteria andDictLabelEqualTo(String value) {
            addCriterion("dict_label =", value, "dictLabel");
            return (Criteria) this;
        }

        public Criteria andDictLabelNotEqualTo(String value) {
            addCriterion("dict_label <>", value, "dictLabel");
            return (Criteria) this;
        }

        public Criteria andDictLabelGreaterThan(String value) {
            addCriterion("dict_label >", value, "dictLabel");
            return (Criteria) this;
        }

        public Criteria andDictLabelGreaterThanOrEqualTo(String value) {
            addCriterion("dict_label >=", value, "dictLabel");
            return (Criteria) this;
        }

        public Criteria andDictLabelLessThan(String value) {
            addCriterion("dict_label <", value, "dictLabel");
            return (Criteria) this;
        }

        public Criteria andDictLabelLessThanOrEqualTo(String value) {
            addCriterion("dict_label <=", value, "dictLabel");
            return (Criteria) this;
        }

        public Criteria andDictLabelLike(String value) {
            addCriterion("dict_label like", value, "dictLabel");
            return (Criteria) this;
        }

        public Criteria andDictLabelNotLike(String value) {
            addCriterion("dict_label not like", value, "dictLabel");
            return (Criteria) this;
        }

        public Criteria andDictLabelIn(List<String> values) {
            addCriterion("dict_label in", values, "dictLabel");
            return (Criteria) this;
        }

        public Criteria andDictLabelNotIn(List<String> values) {
            addCriterion("dict_label not in", values, "dictLabel");
            return (Criteria) this;
        }

        public Criteria andDictLabelBetween(String value1, String value2) {
            addCriterion("dict_label between", value1, value2, "dictLabel");
            return (Criteria) this;
        }

        public Criteria andDictLabelNotBetween(String value1, String value2) {
            addCriterion("dict_label not between", value1, value2, "dictLabel");
            return (Criteria) this;
        }

        public Criteria andDictValueIsNull() {
            addCriterion("dict_value is null");
            return (Criteria) this;
        }

        public Criteria andDictValueIsNotNull() {
            addCriterion("dict_value is not null");
            return (Criteria) this;
        }

        public Criteria andDictValueEqualTo(String value) {
            addCriterion("dict_value =", value, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueNotEqualTo(String value) {
            addCriterion("dict_value <>", value, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueGreaterThan(String value) {
            addCriterion("dict_value >", value, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueGreaterThanOrEqualTo(String value) {
            addCriterion("dict_value >=", value, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueLessThan(String value) {
            addCriterion("dict_value <", value, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueLessThanOrEqualTo(String value) {
            addCriterion("dict_value <=", value, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueLike(String value) {
            addCriterion("dict_value like", value, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueNotLike(String value) {
            addCriterion("dict_value not like", value, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueIn(List<String> values) {
            addCriterion("dict_value in", values, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueNotIn(List<String> values) {
            addCriterion("dict_value not in", values, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueBetween(String value1, String value2) {
            addCriterion("dict_value between", value1, value2, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictValueNotBetween(String value1, String value2) {
            addCriterion("dict_value not between", value1, value2, "dictValue");
            return (Criteria) this;
        }

        public Criteria andDictTypeIsNull() {
            addCriterion("dict_type is null");
            return (Criteria) this;
        }

        public Criteria andDictTypeIsNotNull() {
            addCriterion("dict_type is not null");
            return (Criteria) this;
        }

        public Criteria andDictTypeEqualTo(String value) {
            addCriterion("dict_type =", value, "dictType");
            return (Criteria) this;
        }

        public Criteria andDictTypeNotEqualTo(String value) {
            addCriterion("dict_type <>", value, "dictType");
            return (Criteria) this;
        }

        public Criteria andDictTypeGreaterThan(String value) {
            addCriterion("dict_type >", value, "dictType");
            return (Criteria) this;
        }

        public Criteria andDictTypeGreaterThanOrEqualTo(String value) {
            addCriterion("dict_type >=", value, "dictType");
            return (Criteria) this;
        }

        public Criteria andDictTypeLessThan(String value) {
            addCriterion("dict_type <", value, "dictType");
            return (Criteria) this;
        }

        public Criteria andDictTypeLessThanOrEqualTo(String value) {
            addCriterion("dict_type <=", value, "dictType");
            return (Criteria) this;
        }

        public Criteria andDictTypeLike(String value) {
            addCriterion("dict_type like", value, "dictType");
            return (Criteria) this;
        }

        public Criteria andDictTypeNotLike(String value) {
            addCriterion("dict_type not like", value, "dictType");
            return (Criteria) this;
        }

        public Criteria andDictTypeIn(List<String> values) {
            addCriterion("dict_type in", values, "dictType");
            return (Criteria) this;
        }

        public Criteria andDictTypeNotIn(List<String> values) {
            addCriterion("dict_type not in", values, "dictType");
            return (Criteria) this;
        }

        public Criteria andDictTypeBetween(String value1, String value2) {
            addCriterion("dict_type between", value1, value2, "dictType");
            return (Criteria) this;
        }

        public Criteria andDictTypeNotBetween(String value1, String value2) {
            addCriterion("dict_type not between", value1, value2, "dictType");
            return (Criteria) this;
        }

        public Criteria andIsSysIsNull() {
            addCriterion("is_sys is null");
            return (Criteria) this;
        }

        public Criteria andIsSysIsNotNull() {
            addCriterion("is_sys is not null");
            return (Criteria) this;
        }

        public Criteria andIsSysEqualTo(String value) {
            addCriterion("is_sys =", value, "isSys");
            return (Criteria) this;
        }

        public Criteria andIsSysNotEqualTo(String value) {
            addCriterion("is_sys <>", value, "isSys");
            return (Criteria) this;
        }

        public Criteria andIsSysGreaterThan(String value) {
            addCriterion("is_sys >", value, "isSys");
            return (Criteria) this;
        }

        public Criteria andIsSysGreaterThanOrEqualTo(String value) {
            addCriterion("is_sys >=", value, "isSys");
            return (Criteria) this;
        }

        public Criteria andIsSysLessThan(String value) {
            addCriterion("is_sys <", value, "isSys");
            return (Criteria) this;
        }

        public Criteria andIsSysLessThanOrEqualTo(String value) {
            addCriterion("is_sys <=", value, "isSys");
            return (Criteria) this;
        }

        public Criteria andIsSysLike(String value) {
            addCriterion("is_sys like", value, "isSys");
            return (Criteria) this;
        }

        public Criteria andIsSysNotLike(String value) {
            addCriterion("is_sys not like", value, "isSys");
            return (Criteria) this;
        }

        public Criteria andIsSysIn(List<String> values) {
            addCriterion("is_sys in", values, "isSys");
            return (Criteria) this;
        }

        public Criteria andIsSysNotIn(List<String> values) {
            addCriterion("is_sys not in", values, "isSys");
            return (Criteria) this;
        }

        public Criteria andIsSysBetween(String value1, String value2) {
            addCriterion("is_sys between", value1, value2, "isSys");
            return (Criteria) this;
        }

        public Criteria andIsSysNotBetween(String value1, String value2) {
            addCriterion("is_sys not between", value1, value2, "isSys");
            return (Criteria) this;
        }

        public Criteria andDescriptionIsNull() {
            addCriterion("description is null");
            return (Criteria) this;
        }

        public Criteria andDescriptionIsNotNull() {
            addCriterion("description is not null");
            return (Criteria) this;
        }

        public Criteria andDescriptionEqualTo(String value) {
            addCriterion("description =", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotEqualTo(String value) {
            addCriterion("description <>", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionGreaterThan(String value) {
            addCriterion("description >", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionGreaterThanOrEqualTo(String value) {
            addCriterion("description >=", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionLessThan(String value) {
            addCriterion("description <", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionLessThanOrEqualTo(String value) {
            addCriterion("description <=", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionLike(String value) {
            addCriterion("description like", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotLike(String value) {
            addCriterion("description not like", value, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionIn(List<String> values) {
            addCriterion("description in", values, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotIn(List<String> values) {
            addCriterion("description not in", values, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionBetween(String value1, String value2) {
            addCriterion("description between", value1, value2, "description");
            return (Criteria) this;
        }

        public Criteria andDescriptionNotBetween(String value1, String value2) {
            addCriterion("description not between", value1, value2, "description");
            return (Criteria) this;
        }

        public Criteria andCssStyleIsNull() {
            addCriterion("css_style is null");
            return (Criteria) this;
        }

        public Criteria andCssStyleIsNotNull() {
            addCriterion("css_style is not null");
            return (Criteria) this;
        }

        public Criteria andCssStyleEqualTo(String value) {
            addCriterion("css_style =", value, "cssStyle");
            return (Criteria) this;
        }

        public Criteria andCssStyleNotEqualTo(String value) {
            addCriterion("css_style <>", value, "cssStyle");
            return (Criteria) this;
        }

        public Criteria andCssStyleGreaterThan(String value) {
            addCriterion("css_style >", value, "cssStyle");
            return (Criteria) this;
        }

        public Criteria andCssStyleGreaterThanOrEqualTo(String value) {
            addCriterion("css_style >=", value, "cssStyle");
            return (Criteria) this;
        }

        public Criteria andCssStyleLessThan(String value) {
            addCriterion("css_style <", value, "cssStyle");
            return (Criteria) this;
        }

        public Criteria andCssStyleLessThanOrEqualTo(String value) {
            addCriterion("css_style <=", value, "cssStyle");
            return (Criteria) this;
        }

        public Criteria andCssStyleLike(String value) {
            addCriterion("css_style like", value, "cssStyle");
            return (Criteria) this;
        }

        public Criteria andCssStyleNotLike(String value) {
            addCriterion("css_style not like", value, "cssStyle");
            return (Criteria) this;
        }

        public Criteria andCssStyleIn(List<String> values) {
            addCriterion("css_style in", values, "cssStyle");
            return (Criteria) this;
        }

        public Criteria andCssStyleNotIn(List<String> values) {
            addCriterion("css_style not in", values, "cssStyle");
            return (Criteria) this;
        }

        public Criteria andCssStyleBetween(String value1, String value2) {
            addCriterion("css_style between", value1, value2, "cssStyle");
            return (Criteria) this;
        }

        public Criteria andCssStyleNotBetween(String value1, String value2) {
            addCriterion("css_style not between", value1, value2, "cssStyle");
            return (Criteria) this;
        }

        public Criteria andCssClassIsNull() {
            addCriterion("css_class is null");
            return (Criteria) this;
        }

        public Criteria andCssClassIsNotNull() {
            addCriterion("css_class is not null");
            return (Criteria) this;
        }

        public Criteria andCssClassEqualTo(String value) {
            addCriterion("css_class =", value, "cssClass");
            return (Criteria) this;
        }

        public Criteria andCssClassNotEqualTo(String value) {
            addCriterion("css_class <>", value, "cssClass");
            return (Criteria) this;
        }

        public Criteria andCssClassGreaterThan(String value) {
            addCriterion("css_class >", value, "cssClass");
            return (Criteria) this;
        }

        public Criteria andCssClassGreaterThanOrEqualTo(String value) {
            addCriterion("css_class >=", value, "cssClass");
            return (Criteria) this;
        }

        public Criteria andCssClassLessThan(String value) {
            addCriterion("css_class <", value, "cssClass");
            return (Criteria) this;
        }

        public Criteria andCssClassLessThanOrEqualTo(String value) {
            addCriterion("css_class <=", value, "cssClass");
            return (Criteria) this;
        }

        public Criteria andCssClassLike(String value) {
            addCriterion("css_class like", value, "cssClass");
            return (Criteria) this;
        }

        public Criteria andCssClassNotLike(String value) {
            addCriterion("css_class not like", value, "cssClass");
            return (Criteria) this;
        }

        public Criteria andCssClassIn(List<String> values) {
            addCriterion("css_class in", values, "cssClass");
            return (Criteria) this;
        }

        public Criteria andCssClassNotIn(List<String> values) {
            addCriterion("css_class not in", values, "cssClass");
            return (Criteria) this;
        }

        public Criteria andCssClassBetween(String value1, String value2) {
            addCriterion("css_class between", value1, value2, "cssClass");
            return (Criteria) this;
        }

        public Criteria andCssClassNotBetween(String value1, String value2) {
            addCriterion("css_class not between", value1, value2, "cssClass");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(String value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(String value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(String value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(String value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(String value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(String value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLike(String value) {
            addCriterion("status like", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotLike(String value) {
            addCriterion("status not like", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<String> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<String> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(String value1, String value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(String value1, String value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andCreateByIsNull() {
            addCriterion("create_by is null");
            return (Criteria) this;
        }

        public Criteria andCreateByIsNotNull() {
            addCriterion("create_by is not null");
            return (Criteria) this;
        }

        public Criteria andCreateByEqualTo(String value) {
            addCriterion("create_by =", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByNotEqualTo(String value) {
            addCriterion("create_by <>", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByGreaterThan(String value) {
            addCriterion("create_by >", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByGreaterThanOrEqualTo(String value) {
            addCriterion("create_by >=", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByLessThan(String value) {
            addCriterion("create_by <", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByLessThanOrEqualTo(String value) {
            addCriterion("create_by <=", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByLike(String value) {
            addCriterion("create_by like", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByNotLike(String value) {
            addCriterion("create_by not like", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByIn(List<String> values) {
            addCriterion("create_by in", values, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByNotIn(List<String> values) {
            addCriterion("create_by not in", values, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByBetween(String value1, String value2) {
            addCriterion("create_by between", value1, value2, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByNotBetween(String value1, String value2) {
            addCriterion("create_by not between", value1, value2, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateDateIsNull() {
            addCriterion("create_date is null");
            return (Criteria) this;
        }

        public Criteria andCreateDateIsNotNull() {
            addCriterion("create_date is not null");
            return (Criteria) this;
        }

        public Criteria andCreateDateEqualTo(Date value) {
            addCriterion("create_date =", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotEqualTo(Date value) {
            addCriterion("create_date <>", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThan(Date value) {
            addCriterion("create_date >", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThanOrEqualTo(Date value) {
            addCriterion("create_date >=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThan(Date value) {
            addCriterion("create_date <", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThanOrEqualTo(Date value) {
            addCriterion("create_date <=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateIn(List<Date> values) {
            addCriterion("create_date in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotIn(List<Date> values) {
            addCriterion("create_date not in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateBetween(Date value1, Date value2) {
            addCriterion("create_date between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotBetween(Date value1, Date value2) {
            addCriterion("create_date not between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andUpdateByIsNull() {
            addCriterion("update_by is null");
            return (Criteria) this;
        }

        public Criteria andUpdateByIsNotNull() {
            addCriterion("update_by is not null");
            return (Criteria) this;
        }

        public Criteria andUpdateByEqualTo(String value) {
            addCriterion("update_by =", value, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateByNotEqualTo(String value) {
            addCriterion("update_by <>", value, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateByGreaterThan(String value) {
            addCriterion("update_by >", value, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateByGreaterThanOrEqualTo(String value) {
            addCriterion("update_by >=", value, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateByLessThan(String value) {
            addCriterion("update_by <", value, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateByLessThanOrEqualTo(String value) {
            addCriterion("update_by <=", value, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateByLike(String value) {
            addCriterion("update_by like", value, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateByNotLike(String value) {
            addCriterion("update_by not like", value, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateByIn(List<String> values) {
            addCriterion("update_by in", values, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateByNotIn(List<String> values) {
            addCriterion("update_by not in", values, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateByBetween(String value1, String value2) {
            addCriterion("update_by between", value1, value2, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateByNotBetween(String value1, String value2) {
            addCriterion("update_by not between", value1, value2, "updateBy");
            return (Criteria) this;
        }

        public Criteria andUpdateDateIsNull() {
            addCriterion("update_date is null");
            return (Criteria) this;
        }

        public Criteria andUpdateDateIsNotNull() {
            addCriterion("update_date is not null");
            return (Criteria) this;
        }

        public Criteria andUpdateDateEqualTo(Date value) {
            addCriterion("update_date =", value, "updateDate");
            return (Criteria) this;
        }

        public Criteria andUpdateDateNotEqualTo(Date value) {
            addCriterion("update_date <>", value, "updateDate");
            return (Criteria) this;
        }

        public Criteria andUpdateDateGreaterThan(Date value) {
            addCriterion("update_date >", value, "updateDate");
            return (Criteria) this;
        }

        public Criteria andUpdateDateGreaterThanOrEqualTo(Date value) {
            addCriterion("update_date >=", value, "updateDate");
            return (Criteria) this;
        }

        public Criteria andUpdateDateLessThan(Date value) {
            addCriterion("update_date <", value, "updateDate");
            return (Criteria) this;
        }

        public Criteria andUpdateDateLessThanOrEqualTo(Date value) {
            addCriterion("update_date <=", value, "updateDate");
            return (Criteria) this;
        }

        public Criteria andUpdateDateIn(List<Date> values) {
            addCriterion("update_date in", values, "updateDate");
            return (Criteria) this;
        }

        public Criteria andUpdateDateNotIn(List<Date> values) {
            addCriterion("update_date not in", values, "updateDate");
            return (Criteria) this;
        }

        public Criteria andUpdateDateBetween(Date value1, Date value2) {
            addCriterion("update_date between", value1, value2, "updateDate");
            return (Criteria) this;
        }

        public Criteria andUpdateDateNotBetween(Date value1, Date value2) {
            addCriterion("update_date not between", value1, value2, "updateDate");
            return (Criteria) this;
        }

        public Criteria andRemarksIsNull() {
            addCriterion("remarks is null");
            return (Criteria) this;
        }

        public Criteria andRemarksIsNotNull() {
            addCriterion("remarks is not null");
            return (Criteria) this;
        }

        public Criteria andRemarksEqualTo(String value) {
            addCriterion("remarks =", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotEqualTo(String value) {
            addCriterion("remarks <>", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksGreaterThan(String value) {
            addCriterion("remarks >", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksGreaterThanOrEqualTo(String value) {
            addCriterion("remarks >=", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksLessThan(String value) {
            addCriterion("remarks <", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksLessThanOrEqualTo(String value) {
            addCriterion("remarks <=", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksLike(String value) {
            addCriterion("remarks like", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotLike(String value) {
            addCriterion("remarks not like", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksIn(List<String> values) {
            addCriterion("remarks in", values, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotIn(List<String> values) {
            addCriterion("remarks not in", values, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksBetween(String value1, String value2) {
            addCriterion("remarks between", value1, value2, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotBetween(String value1, String value2) {
            addCriterion("remarks not between", value1, value2, "remarks");
            return (Criteria) this;
        }

        public Criteria andCorpCodeIsNull() {
            addCriterion("corp_code is null");
            return (Criteria) this;
        }

        public Criteria andCorpCodeIsNotNull() {
            addCriterion("corp_code is not null");
            return (Criteria) this;
        }

        public Criteria andCorpCodeEqualTo(String value) {
            addCriterion("corp_code =", value, "corpCode");
            return (Criteria) this;
        }

        public Criteria andCorpCodeNotEqualTo(String value) {
            addCriterion("corp_code <>", value, "corpCode");
            return (Criteria) this;
        }

        public Criteria andCorpCodeGreaterThan(String value) {
            addCriterion("corp_code >", value, "corpCode");
            return (Criteria) this;
        }

        public Criteria andCorpCodeGreaterThanOrEqualTo(String value) {
            addCriterion("corp_code >=", value, "corpCode");
            return (Criteria) this;
        }

        public Criteria andCorpCodeLessThan(String value) {
            addCriterion("corp_code <", value, "corpCode");
            return (Criteria) this;
        }

        public Criteria andCorpCodeLessThanOrEqualTo(String value) {
            addCriterion("corp_code <=", value, "corpCode");
            return (Criteria) this;
        }

        public Criteria andCorpCodeLike(String value) {
            addCriterion("corp_code like", value, "corpCode");
            return (Criteria) this;
        }

        public Criteria andCorpCodeNotLike(String value) {
            addCriterion("corp_code not like", value, "corpCode");
            return (Criteria) this;
        }

        public Criteria andCorpCodeIn(List<String> values) {
            addCriterion("corp_code in", values, "corpCode");
            return (Criteria) this;
        }

        public Criteria andCorpCodeNotIn(List<String> values) {
            addCriterion("corp_code not in", values, "corpCode");
            return (Criteria) this;
        }

        public Criteria andCorpCodeBetween(String value1, String value2) {
            addCriterion("corp_code between", value1, value2, "corpCode");
            return (Criteria) this;
        }

        public Criteria andCorpCodeNotBetween(String value1, String value2) {
            addCriterion("corp_code not between", value1, value2, "corpCode");
            return (Criteria) this;
        }

        public Criteria andCorpNameIsNull() {
            addCriterion("corp_name is null");
            return (Criteria) this;
        }

        public Criteria andCorpNameIsNotNull() {
            addCriterion("corp_name is not null");
            return (Criteria) this;
        }

        public Criteria andCorpNameEqualTo(String value) {
            addCriterion("corp_name =", value, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameNotEqualTo(String value) {
            addCriterion("corp_name <>", value, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameGreaterThan(String value) {
            addCriterion("corp_name >", value, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameGreaterThanOrEqualTo(String value) {
            addCriterion("corp_name >=", value, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameLessThan(String value) {
            addCriterion("corp_name <", value, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameLessThanOrEqualTo(String value) {
            addCriterion("corp_name <=", value, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameLike(String value) {
            addCriterion("corp_name like", value, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameNotLike(String value) {
            addCriterion("corp_name not like", value, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameIn(List<String> values) {
            addCriterion("corp_name in", values, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameNotIn(List<String> values) {
            addCriterion("corp_name not in", values, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameBetween(String value1, String value2) {
            addCriterion("corp_name between", value1, value2, "corpName");
            return (Criteria) this;
        }

        public Criteria andCorpNameNotBetween(String value1, String value2) {
            addCriterion("corp_name not between", value1, value2, "corpName");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria implements Serializable {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion implements Serializable {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}