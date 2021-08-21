package com.mulcam.project.vo;

public class HealthyDietDetailVO {
	
	private int idx;
	private int compositionno;
	private int cid;
	private String title;
	private String recipe;
	private String ingredients;
	
	public HealthyDietDetailVO() {};
	
	public HealthyDietDetailVO(int idx, int compositionno, int cid, String title, String recipe, String ingredients) {
		super();
		this.idx = idx;
		this.compositionno = compositionno;
		this.cid = cid;
		this.title = title;
		this.recipe = recipe;
		this.ingredients = ingredients;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getCompositionno() {
		return compositionno;
	}

	public void setCompositionno(int compositionno) {
		this.compositionno = compositionno;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRecipe() {
		return recipe;
	}

	public void setRecipe(String recipe) {
		this.recipe = recipe;
	}

	public String getIngredients() {
		return ingredients;
	}

	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}
	
	
	
	
	

}
