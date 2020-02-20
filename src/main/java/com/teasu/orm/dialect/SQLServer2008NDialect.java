package com.teasu.orm.dialect;

import java.sql.Types;

import org.hibernate.dialect.SQLServer2008Dialect;

public class SQLServer2008NDialect extends SQLServer2008Dialect {
  private static final int MAX_LENGTH = 8000;
  private static final String MAX_NVARCHAR = "nvarchar(MAX)";

  public SQLServer2008NDialect() {
    super();
    registerColumnType(Types.LONGVARCHAR, MAX_NVARCHAR);
    registerColumnType(Types.VARCHAR, MAX_NVARCHAR);
    registerColumnType(Types.VARCHAR, MAX_LENGTH, "nvarchar($l)");
    registerColumnType(Types.LONGNVARCHAR, MAX_NVARCHAR);
    registerColumnType(Types.NVARCHAR, MAX_NVARCHAR);
    registerColumnType(Types.NVARCHAR, MAX_LENGTH, "nvarchar($l)");
  }
}
