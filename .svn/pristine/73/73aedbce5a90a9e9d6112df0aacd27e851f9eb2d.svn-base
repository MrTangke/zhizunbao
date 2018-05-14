package www.zhizunbao.dto.manage;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ResourcesTree  implements Serializable{
	private Integer id;
	private Integer pId;
	private String name;
	private boolean open = false;
	private boolean checked = false;
	private Integer isSelect;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPId() {
		return pId;
	}
	public void setPId(Integer pId) {
		this.pId = pId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isOpen() {
		if (0==pId) {
			open=true;
		}
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}
	public boolean isChecked() {
		if (isSelect>0) {
			checked=true;
		}
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public Integer getIsSelect() {
		return isSelect;
	}
	public void setIsSelect(Integer isSelect) {
		this.isSelect = isSelect;
	}
	
}
