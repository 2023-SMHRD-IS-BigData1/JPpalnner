package com.jpPlanner.model;

import java.math.BigDecimal;
import java.util.List;

public class ScheduleData {
	// 1
	private List<Days> days;
	private String title;
	private List<CheckList> checkList;

	public List<CheckList> getCheckList() {
		return checkList;
	}

	public String getTitle() {
		return title;
	}

	public List<Days> getDays() {
		return days;
	}

	public ScheduleData(List<Days> days, String title, List<CheckList> checkList) {
		super();
		this.days = days;
		this.title = title;
		this.checkList = checkList;
	}

	// 2
	public static class Days {
		private String day;
		private List<Rows> rows;

		public String getDay() {
			return day;
		}

		public List<Rows> getRows() {
			return rows;
		}

		public Days(String day, List<Rows> rows) {
			super();
			this.day = day;
			this.rows = rows;
		}

		// 3
		public static class Rows {
			private String row;
			private Content content;

			public String getRow() {
				return row;
			}

			public Content getContent() {
				return content;
			}
			
			

			public Rows(String row, Content content) {
				super();
				this.row = row;
				this.content = content;
			}



			public Rows() {
				// TODO Auto-generated constructor stub
			}



			public static class Content {
				public String time;
				public String cont;
				public String price;
				public String note;

				public String getTime() {
					return time;
				}

				public String getCont() {
					return cont;
				}

				public String getPrice() {
					return price;
				}

				public String getNote() {
					return note;
				}

				public Content(String time, String cont, String price, String note) {
					super();
					this.time = time;
					this.cont = cont;
					this.price = price;
					this.note = note;
				}
			}
		}
	}

	// 2
	public static class CheckList {
		private BigDecimal check;
		private String checkListText;

		public BigDecimal getCheck() {
			return check;
		}

		public String getCheckListText() {
			return checkListText;
		}

		public CheckList(BigDecimal check, String checkListText) {
			super();
			this.check = check;
			this.checkListText = checkListText;
		}
	}
}