package com.tea.util;

import java.util.ArrayList;
import java.util.List;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;

@Deprecated
public class gernerateReport {
  public static void main(String[] args) {
    String jsFile = "/Users/houzunyan/git/ProjectMoney/src/main/webapp/resources/report/report1.jasper";
    String outFile = "/Users/houzunyan/git/report/report3.pdf";
    try {

      JRDataSource source = createDataSource();

      JasperPrint print = JasperFillManager.fillReport(jsFile, null, source);
      // JRExporter exporter = new JRHtmlExporter();
      JRPdfExporter exporter = new JRPdfExporter();
      exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, outFile);
      exporter.setParameter(JRExporterParameter.JASPER_PRINT, print);
      exporter.exportReport();

    } catch (JRException e) {
      e.printStackTrace();
    }
  }

  private static JRDataSource createDataSource() {
    List<User> datasource = new ArrayList<>();

    User user = new User();
    user.setStud_id(1);
    user.setName("陳水扁");
    user.setEmail("ketton5255@yahoo.com.tw");
    user.setDob("1992/03/08");
    datasource.add(user);

    user = new User();
    user.setStud_id(2);
    user.setName("小猴子");
    user.setEmail("Amy@yahoo.com.tw");
    user.setDob("1998/05/11");
    datasource.add(user);

    user = new User();
    user.setStud_id(3);
    user.setName("黃曉明");
    user.setEmail("Peter@yahoo.com.tw");
    user.setDob("2000/05/11");
    datasource.add(user);

    user = new User();
    user.setStud_id(3);
    user.setName("德魯伊");
    user.setEmail("ketttt@yahoo.com.tw");
    user.setDob("1983/05/11");
    datasource.add(user);

    user = new User();
    user.setStud_id(3);
    user.setName("張韶涵");
    user.setEmail("sssss@yahoo.com.tw");
    user.setDob("1983/05/11");
    datasource.add(user);

    user = new User();
    user.setStud_id(6);
    user.setName("李玖哲");
    user.setEmail("sss@yahoo.com.tw");
    user.setDob("1983/05/11");
    datasource.add(user);

    user = new User();
    user.setStud_id(7);
    user.setName("習大曉");
    user.setEmail("sss@yahoo.com.tw");
    user.setDob("1983/05/11");
    datasource.add(user);

    user = new User();
    user.setStud_id(7);
    user.setName("安安安");
    user.setEmail("sss@yahoo.com.tw");
    user.setDob("1983/05/11");
    datasource.add(user);

    return new JRBeanCollectionDataSource(datasource);
  }

}
