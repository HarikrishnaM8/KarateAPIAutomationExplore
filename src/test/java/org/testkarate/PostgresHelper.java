package org.testkarate;

import java.sql.*;
import java.util.*;

public class PostgresHelper {

    // JDBC connection details
    private static final String URL = "jdbc:postgresql://localhost:5432/KovvurPGDump";
    private static final String USER = "postgres";
    private static final String PASSWORD = "abc123";

    // Optional: schema setting if table is in a different schema
    private static final String SCHEMA = "kovvur"; // set to your schema name

    /**
     * Run a SQL query and return results as List<Map<String, Object>>
     * Each Map represents a row: column name -> value
     */
    public static List<Map<String, Object>> runQuery(String query) throws Exception {
        List<Map<String, Object>> resultList = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement stmt = conn.createStatement()) {

            // Set the schema if required
            if (SCHEMA != null && !SCHEMA.isEmpty()) {
                stmt.execute("SET search_path TO " + SCHEMA);
            }

            // Execute the query
            try (ResultSet rs = stmt.executeQuery(query)) {

                ResultSetMetaData meta = rs.getMetaData();
                int colCount = meta.getColumnCount();

                while (rs.next()) {
                    Map<String, Object> row = new HashMap<>();
                    for (int i = 1; i <= colCount; i++) {
                        row.put(meta.getColumnLabel(i), rs.getObject(i));
                    }
                    // Debug print for verification
                    System.out.println("Row added: " + row);
                    resultList.add(row);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("DB query failed: " + e.getMessage(), e);
        }

        return resultList;
    }

    // Optional: test connection method
    public static void testConnection() {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            System.out.println("✅ Connected to PostgreSQL successfully");
        } catch (SQLException e) {
            System.out.println("❌ Connection failed");
            e.printStackTrace();
        }
    }

    // Main method to test queries independently
    public static void main(String[] args) throws Exception {
        testConnection();

        List<Map<String, Object>> result = runQuery(
                "SELECT count(*) AS total FROM kovvur.egpt_basic_property"
        );

        if (!result.isEmpty()) {
            int total = ((Number) result.get(0).get("total")).intValue();
            System.out.println("Total records: " + total);
        } else {
            System.out.println("Query returned no rows!");
        }
    }
}
