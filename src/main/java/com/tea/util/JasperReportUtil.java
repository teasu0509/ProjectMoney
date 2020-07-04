package com.tea.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;

public class JasperReportUtil {
  private static final Logger logger = LoggerFactory.getLogger(JasperReportUtil.class);
  private static final String REPORT_TEMPLATE_PATH_PREFIX = "report/";

  private JasperReportUtil() {
  }

  public static File exportToPDF(Map<String, Object> params, String reportTemplateName, JRDataSource data) {
    if (params == null || params.isEmpty()) {
      throw new IllegalArgumentException("params");
    }
    if (StringUtils.isBlank(reportTemplateName)) {
      throw new IllegalArgumentException("reportTemplateName");
    }
    File pdfTempFile = null;
    try {
      Resource template = new ClassPathResource(REPORT_TEMPLATE_PATH_PREFIX + reportTemplateName);
      pdfTempFile = File.createTempFile("temp", ".pdf");
      JRPdfExporter exporter = new JRPdfExporter();
      exporter.setExporterInput(
          new SimpleExporterInput(JasperFillManager.fillReport(template.getInputStream(), params, data)));
      exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(pdfTempFile));
      return pdfTempFile;
    } catch (IOException | JRException e) {
      logger.error(e.toString(), e);
      if (pdfTempFile != null && pdfTempFile.exists()) {
        pdfTempFile.deleteOnExit();
      }
    }
    return null;
  }

  public static JRDataSource createDataSource() {
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
