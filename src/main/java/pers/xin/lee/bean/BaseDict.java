package pers.xin.lee.bean;

public class BaseDict{
    private String dictId;// 数据字典id
    private String dictTypeCode;// 数据字典类别代码
    private String dictTypeName;// 数据字典类别名称
    private String dictItemName;// 数据字典项目名称
    private String dictItemCode;// 数据字典项目代码
    private Integer dictSort;// 排序字段
    private String dictEnable;// 是否可用
    private String dictMemo;// 备注

    public String getDictId() {
        return dictId;
    }

    public BaseDict(String dictId, String dictTypeCode, String dictTypeName, String dictItemName, String dictItemCode,
			Integer dictSort, String dictEnable, String dictMemo) {
		super();
		this.dictId = dictId;
		this.dictTypeCode = dictTypeCode;
		this.dictTypeName = dictTypeName;
		this.dictItemName = dictItemName;
		this.dictItemCode = dictItemCode;
		this.dictSort = dictSort;
		this.dictEnable = dictEnable;
		this.dictMemo = dictMemo;
	}

	public void setDictId(String dictId) {
        this.dictId = dictId == null ? null : dictId.trim();
    }

    public String getDictTypeCode() {
        return dictTypeCode;
    }

    public void setDictTypeCode(String dictTypeCode) {
        this.dictTypeCode = dictTypeCode == null ? null : dictTypeCode.trim();
    }

    public String getDictTypeName() {
        return dictTypeName;
    }

    public void setDictTypeName(String dictTypeName) {
        this.dictTypeName = dictTypeName == null ? null : dictTypeName.trim();
    }

    public String getDictItemName() {
        return dictItemName;
    }

    public void setDictItemName(String dictItemName) {
        this.dictItemName = dictItemName == null ? null : dictItemName.trim();
    }

    public String getDictItemCode() {
        return dictItemCode;
    }

    public void setDictItemCode(String dictItemCode) {
        this.dictItemCode = dictItemCode == null ? null : dictItemCode.trim();
    }

    public Integer getDictSort() {
        return dictSort;
    }

    public void setDictSort(Integer dictSort) {
        this.dictSort = dictSort;
    }

    public String getDictEnable() {
        return dictEnable;
    }

    public void setDictEnable(String dictEnable) {
        this.dictEnable = dictEnable == null ? null : dictEnable.trim();
    }

    public String getDictMemo() {
        return dictMemo;
    }

    public void setDictMemo(String dictMemo) {
        this.dictMemo = dictMemo == null ? null : dictMemo.trim();
    }

	@Override
	public String toString() {
		return "BaseDict [dictId=" + dictId + ", dictTypeCode=" + dictTypeCode + ", dictTypeName=" + dictTypeName
				+ ", dictItemName=" + dictItemName + ", dictItemCode=" + dictItemCode + ", dictSort=" + dictSort
				+ ", dictEnable=" + dictEnable + ", dictMemo=" + dictMemo + "]";
	}
}