package com.biocor.controller.interfaces.ShopAndOrder;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;

import com.biocor.controller.base.BaseController;
import com.biocor.service.interfaces.ShopAndOrderService.Createservice;
import com.biocor.util.PageData;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

@RequestMapping(value = "interface/pdf")
public class CreatePdf extends BaseController {

	@Resource
	private Createservice createservice;

	@RequestMapping(value = "paypdf")
	public String createPDF(HttpServletRequest request, HttpServletResponse response, String comm) throws Exception {
		Rectangle rectangle = new Rectangle((float) 663.14, (float) 761.4);
		Document document = new Document(rectangle, 40, 50, 30, 60);// 建立一个Document对象
		// Document document=new Document(PageSize.A4,36,36,36,36);
		// document.setPageSize(PageSize.A4);// 设置页面大小
		// String billCode = "20121026181";
		String billCode = request.getParameter("orderId");
		PageData pd = new PageData();
		pd.put("orderId", billCode);
		List<PageData> reList = createservice.getpaypdf(pd);
		SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日");
		String time = df.format(new Date());
		try {
			ByteArrayOutputStream ops = new ByteArrayOutputStream();// 输出到客户段的流
			// OutputStream ops=new
			// FileOutputStream("e:/taony125-test.pdf");//保存进磁盘的流
			// 两个ops输出流用来切换，是保存进磁盘还是输出到客户端

			PdfWriter.getInstance(document, ops);// 建立一个PdfWriter对象
			document.open();
			BaseFont bfChinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);// 设置中文字体

			Font headFont1 = new Font(bfChinese, 14, Font.BOLD);// 设置字体大小
			Font headFontN = new Font(bfChinese, 13, Font.BOLD);// 设置字体大小
			Font headFont2 = new Font(bfChinese, 12, Font.BOLD);// 设置字体大小
			Font headFont3 = new Font(bfChinese, 10, Font.NORMAL);// 设置字体大小

			float[] widths = { 100, 110, 110, 110, 100, 110 };// 设置表格的列以及列宽
			PdfPTable table = new PdfPTable(widths);// 建立一个pdf表格

			table.setSpacingBefore(130f);// 设置表格上面空白宽度
			table.setTotalWidth(535);// 设置表格的宽度
			table.setLockedWidth(true);// 设置表格的宽度固定
			// table.getDefaultCell().setBorder(0);//设置表格默认为无边框
			PdfPCell cell = new PdfPCell(new Paragraph("石家庄瑞特维通讯网络有限公司充值业务单", headFont1));// 建立一个单元格
			// cell.setBorder(0);//设置单元格无边框

			cell.setBorder(0);
			cell.setFixedHeight(40);// 单元格高度
			cell.setColspan(6);// 设置合并单元格的列数
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);// 设置内容水平居中显示
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			table.addCell(cell);

			// 列标题
			cell = new PdfPCell(new Paragraph("NO:", headFontN));
			cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			cell.setBorder(0);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph(billCode, headFontN));
			cell.setBorder(0);
			cell.setColspan(3);
			table.addCell(cell);

			cell = new PdfPCell(new Paragraph(time, headFontN));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setColspan(2);
			cell.setBorder(0);
			table.addCell(cell);

			cell = new PdfPCell(new Paragraph("业务专员", headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_MIDDLE);
			cell.setVerticalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(20);
			table.addCell(cell);

			cell = new PdfPCell(new Paragraph(reList.get(0).get("").toString(), headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(20);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("企业号", headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(20);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph(reList.get(0).get("").toString(), headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(20);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("客服专员", headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(20);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph(reList.get(0).get("").toString(), headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(20);
			table.addCell(cell);

			cell = new PdfPCell(new Paragraph("公司名称", headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setFixedHeight(30);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph(reList.get(0).get("").toString(), headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setFixedHeight(30);
			cell.setColspan(3);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("新开", headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setFixedHeight(30);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("口  是  | 口  否", headFont3));
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			// Graphics grx = null ;
			// grx.s
			// grx.drawRect(0, 0, 2, 2);
			// 添加一个矩形
			// cell.addElement((Element) grx);

			table.addCell(cell);

			cell = new PdfPCell(new Paragraph("联系人", headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(20);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph(reList.get(0).get("").toString(), headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(20);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("联系电话", headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(20);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph(reList.get(0).get("").toString(), headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(20);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("充值单价", headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(20);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph(reList.get(0).get("").toString(), headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(20);
			table.addCell(cell);

			PdfPTable table2 = null;
			// cell.setRowspan(3);
			if (reList.size() < 2) {
				table2 = new PdfPTable(1);
				PageData creCharge = reList.get(0);
				cell = new PdfPCell(new Paragraph(
						"充值属性：" + creCharge.get("") + "   金额： " + creCharge.get("") + "         ", headFont3));
				cell.setBorder(0);
				// cell.setColspan(6);
				table2.addCell(cell);

			} else {

				table2 = new PdfPTable(2);
				for (PageData creCharge : reList) {
					cell = new PdfPCell(new Paragraph(
							"充值属性：" + creCharge.get("") + "   金额： " + creCharge.get("") + "         ", headFont3));
					cell.setBorder(0);
					// cell.setColspan(6);
					table2.addCell(cell);
				}
			}
			cell = new PdfPCell(table2);
			cell.setFixedHeight(80);
			cell.setColspan(6);
			table.addCell(cell);

			cell = new PdfPCell(new Paragraph("回款方式", headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			cell.setRotation(2);	
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("银行对公", headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(20);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph(" 口 中行    口    工行", headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(20);
			cell.setColspan(2);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("回款时间", headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(20);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph(" ", headFont3));
			cell.setFixedHeight(20);
			table.addCell(cell);

			cell = new PdfPCell(new Paragraph("银行对私", headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(20);
			table.addCell(cell);
			cell = new PdfPCell(
					new Paragraph("口  工行    口 建行    口  交行    口  农行   口  光大银行   口  张家口银行   口  现金", headFont3));
			cell.setFixedHeight(20);
			cell.setColspan(4);
			table.addCell(cell);

			cell = new PdfPCell(new Paragraph("充值确认", headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(20);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph(reList.get(0).get("").toString(), headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(20);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("  ", headFont3));
			cell.setFixedHeight(20);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("业务确认", headFont3));
			cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell.setFixedHeight(20);
			table.addCell(cell);
			cell = new PdfPCell(new Paragraph("", headFont3));
			cell.setFixedHeight(20);
			cell.setColspan(2);
			table.addCell(cell);

			cell = new PdfPCell(new Paragraph("备注：" + comm, headFont3));
			// cell.setBorder(0);
			cell.setFixedHeight(50);
			cell.setColspan(6);
			cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
			table.addCell(cell);

			document.add(table);
			document.close();

			// 输出到客户端 start,假如是保存进磁盘，则切换上面的流ops,且屏蔽此段代码即可
			response.setContentType("application/pdf");
			response.setContentLength(ops.size());
			ServletOutputStream out = response.getOutputStream();
			ops.writeTo(out);
			out.flush();
			// end

		} catch (DocumentException de) {
			System.err.println(de.getMessage());
			return null;
		} catch (IOException ioe) {
			System.err.println(ioe.getMessage());
			return null;
		}
		return null;
	}

}
