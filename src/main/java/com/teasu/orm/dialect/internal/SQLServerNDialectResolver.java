package com.teasu.orm.dialect.internal;

import com.teasu.orm.dialect.SQLServer2005NDialect;
import com.teasu.orm.dialect.SQLServer2008NDialect;
import com.teasu.orm.dialect.SQLServer2012NDialect;

public final class SQLServerNDialectResolver implements org.hibernate.engine.jdbc.dialect.spi.DialectResolver {

  private static final long serialVersionUID = 1L;

  @Override
  public org.hibernate.dialect.Dialect resolveDialect(
      org.hibernate.engine.jdbc.dialect.spi.DialectResolutionInfo info) {
    final String databaseName = info.getDatabaseName();
    if (databaseName.startsWith("Microsoft SQL Server")) {
      final int majorVersion = info.getDatabaseMajorVersion();
      switch (majorVersion) {
        case 8:
          return new org.hibernate.dialect.SQLServerDialect();
        case 9:
          return new SQLServer2005NDialect();
        case 10:
          return new SQLServer2008NDialect();
        case 11:
        case 12:
        case 13:
          return new SQLServer2012NDialect();
        default:
          if (majorVersion < 8) {
            return new org.hibernate.dialect.SQLServerDialect();
          } else {
            // assume `majorVersion > 13`
            return new SQLServer2012NDialect();
          }
      }
    }
    return null;
  }

}
