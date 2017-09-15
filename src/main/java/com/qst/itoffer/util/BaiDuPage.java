package com.qst.itoffer.util;

public class BaiDuPage {
	// page当前页,last最后一页,maxSizeNum为上一页和下一页之间的页数
	private static final int maxPageSizeNum = 10;
	public static final int pagelistnum = 10;

	public static String getPageHtml(int currentPage, int lastPage) {
		return getPageHtml(currentPage, lastPage, maxPageSizeNum);
	}

	public static String getPageHtml(int currentPage, int lastPage, int maxPageSizeNum) {
		String pageString = "<ul class='paginList'>";
		if (currentPage <= lastPage) {
			if (maxPageSizeNum > 0) {
				if (lastPage > 0) {
					if (currentPage != 1) {
						pageString += "<li class='paginItem'><a href='javascript:gotopage(" + (currentPage - 1) + ");'>上一页</a></li>";
					}
					if (lastPage <= maxPageSizeNum) {
						for (int i = 1; i <= lastPage; i++) {
							if (currentPage != i) {
								pageString += "<li class='paginItem'><a href='javascript:gotopage(" + i + ");'>" + i + "</a></li>";
							} else {
								pageString += "<li class='paginItem current'><a href='javascript:;'>" + i + "</a></li>";
							}
						}
					}
					if (lastPage > maxPageSizeNum) {
						int avgNum = maxPageSizeNum / 2 + 1;
						if (currentPage <= avgNum) {
							for (int i = 1; i <= maxPageSizeNum; i++) {
								if (currentPage != i) {
									pageString += "<li class='paginItem'><a href='javascript:gotopage(" + i + ");'>" + i + "</a></li>";
								} else {
									pageString += "<li class='paginItem current'><a href='javascript:;'>" + i + "</a></li>";
								}
							}
						}
						if (currentPage > avgNum) {
							if (lastPage - currentPage >= avgNum) {
								for (int i = currentPage - maxPageSizeNum / 2; i <= (currentPage - maxPageSizeNum / 2)
										+ maxPageSizeNum - 1; i++) {
									if (currentPage != i) {
										pageString += "<li class='paginItem'><a href='javascript:gotopage(" + i + ");'>" + i + "</a></li>";
									} else {
										pageString += "<li class='paginItem current'><a href='javascript:;'>" + i + "</a></li>";
									}
								}
							} else {
								for (int i = currentPage
										- (maxPageSizeNum - 1 - (lastPage - currentPage)); i <= lastPage; i++) {
									if (currentPage != i) {
										pageString += "<li class='paginItem'><a href='javascript:gotopage(" + i + ");'>" + i + "</a></li>";
									} else {
										pageString += "<li class='paginItem current'><a href='javascript:;'>" + i + "</a></li>";
									}
								}
							}
						}
					}
				}
				if (currentPage != lastPage) {
					pageString += "<li class='paginItem'><a href='javascript:gotopage(" + (currentPage + 1) + ");'>下一页</a></li>";
				}
			}
		}
		return pageString + "</ul>";
	}
}