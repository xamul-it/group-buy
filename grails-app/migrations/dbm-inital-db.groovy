databaseChangeLog = {

    changeSet(author: "xamul (generated)", id: "1589796650534-1") {
        createTable(tableName: "address") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "addressPK")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "address1", type: "VARCHAR(35)") {
                constraints(nullable: "false")
            }

            column(name: "country_code", type: "VARCHAR(2)") {
                constraints(nullable: "false")
            }

            column(name: "postal_code", type: "VARCHAR(5)") {
                constraints(nullable: "false")
            }

            column(name: "address2", type: "VARCHAR(35)")

            column(name: "city", type: "VARCHAR(35)") {
                constraints(nullable: "false")
            }

            column(name: "district", type: "VARCHAR(2)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-2") {
        createTable(tableName: "contact_info") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "contact_infoPK")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "phone", type: "VARCHAR(10)")

            column(name: "mobile", type: "VARCHAR(10)")

            column(name: "email", type: "VARCHAR(50)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-3") {
        createTable(tableName: "customer") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "customerPK")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "user_id", type: "BIGINT")

            column(name: "delivery_address_address1", type: "VARCHAR(35)") {
                constraints(nullable: "false")
            }

            column(name: "delivery_address_country_code", type: "VARCHAR(2)") {
                constraints(nullable: "false")
            }

            column(name: "delivery_address_postal_code", type: "VARCHAR(5)") {
                constraints(nullable: "false")
            }

            column(name: "delivery_address_address2", type: "VARCHAR(35)")

            column(name: "delivery_address_city", type: "VARCHAR(35)") {
                constraints(nullable: "false")
            }

            column(name: "delivery_address_district", type: "VARCHAR(2)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-4") {
        createTable(tableName: "gbgroup") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "gbgroupPK")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "name", type: "VARCHAR(20)") {
                constraints(nullable: "false")
            }

            column(name: "owner_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "creation_date", type: "datetime") {
                constraints(nullable: "false")
            }

            column(name: "public_group", type: "BOOLEAN") {
                constraints(nullable: "false")
            }

            column(name: "description", type: "VARCHAR(200)") {
                constraints(nullable: "false")
            }

            column(name: "delivery_address_address1", type: "VARCHAR(35)") {
                constraints(nullable: "false")
            }

            column(name: "delivery_address_country_code", type: "VARCHAR(2)") {
                constraints(nullable: "false")
            }

            column(name: "delivery_address_postal_code", type: "VARCHAR(5)") {
                constraints(nullable: "false")
            }

            column(name: "delivery_address_address2", type: "VARCHAR(35)")

            column(name: "delivery_address_city", type: "VARCHAR(35)") {
                constraints(nullable: "false")
            }

            column(name: "delivery_address_district", type: "VARCHAR(2)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-5") {
        createTable(tableName: "gbgroup_user") {
            column(name: "group_members_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "user_id", type: "BIGINT")

            column(name: "members_idx", type: "INT")
        }
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-6") {
        createTable(tableName: "gborder") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "gborderPK")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "group_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "shipment_date", type: "datetime")

            column(name: "delivery_type", type: "VARCHAR(255)")

            column(name: "supplier_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "description", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "order_date", type: "datetime") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-7") {
        createTable(tableName: "gborder_order_voice") {
            column(name: "order_order_voice_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "order_voice_id", type: "BIGINT")
        }
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-8") {
        createTable(tableName: "order_status") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "order_statusPK")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-9") {
        createTable(tableName: "order_voice") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "order_voicePK")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "quantity_requested", type: "INT")

            column(name: "user_id", type: "BIGINT")

            column(name: "quantity_shipped", type: "INT")

            column(name: "estimated_price", type: "FLOAT")

            column(name: "final_price", type: "FLOAT")

            column(name: "insert_date", type: "datetime") {
                constraints(nullable: "false")
            }

            column(name: "description", type: "VARCHAR(255)")

            column(name: "product_code", type: "VARCHAR(255)")

            column(name: "product_price", type: "FLOAT")

            column(name: "product_supplier_id", type: "BIGINT")

            column(name: "product_description", type: "VARCHAR(255)")
        }
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-10") {
        createTable(tableName: "product") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "productPK")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "code", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "price", type: "FLOAT")

            column(name: "supplier_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "description", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-11") {
        createTable(tableName: "registration_code") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "registration_codePK")
            }

            column(name: "date_created", type: "datetime") {
                constraints(nullable: "false")
            }

            column(name: "username", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "token", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-12") {
        createTable(tableName: "role") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "rolePK")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "authority", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-13") {
        createTable(tableName: "supplier") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "supplierPK")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "name", type: "VARCHAR(20)") {
                constraints(nullable: "false")
            }

            column(name: "owner_id", type: "BIGINT")

            column(name: "creator_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "description", type: "VARCHAR(200)") {
                constraints(nullable: "false")
            }

            column(name: "shipping_address_address1", type: "VARCHAR(35)")

            column(name: "shipping_address_country_code", type: "VARCHAR(2)")

            column(name: "shipping_address_postal_code", type: "VARCHAR(5)")

            column(name: "shipping_address_address2", type: "VARCHAR(35)")

            column(name: "shipping_address_city", type: "VARCHAR(35)")

            column(name: "shipping_address_district", type: "VARCHAR(2)")

            column(name: "contact_info_phone", type: "VARCHAR(10)")

            column(name: "contact_info_mobile", type: "VARCHAR(10)")

            column(name: "contact_info_email", type: "VARCHAR(50)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-14") {
        createTable(tableName: "user") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "userPK")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "password_expired", type: "BOOLEAN") {
                constraints(nullable: "false")
            }

            column(name: "username", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "account_locked", type: "BOOLEAN") {
                constraints(nullable: "false")
            }

            column(name: "password", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "account_expired", type: "BOOLEAN") {
                constraints(nullable: "false")
            }

            column(name: "enabled", type: "BOOLEAN") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-15") {
        createTable(tableName: "user_role") {
            column(name: "user_id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "user_rolePK")
            }

            column(name: "role_id", type: "BIGINT") {
                constraints(primaryKey: "true", primaryKeyName: "user_rolePK")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-16") {
        addUniqueConstraint(columnNames: "name", constraintName: "UC_GBGROUPNAME_COL", tableName: "gbgroup")
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-17") {
        addUniqueConstraint(columnNames: "authority", constraintName: "UC_ROLEAUTHORITY_COL", tableName: "role")
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-18") {
        addUniqueConstraint(columnNames: "name", constraintName: "UC_SUPPLIERNAME_COL", tableName: "supplier")
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-19") {
        addUniqueConstraint(columnNames: "username", constraintName: "UC_USERUSERNAME_COL", tableName: "user")
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-20") {
        addForeignKeyConstraint(baseColumnNames: "supplier_id", baseTableName: "product", constraintName: "FK2kxvbr72tmtscjvyp9yqb12by", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "supplier", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-21") {
        addForeignKeyConstraint(baseColumnNames: "product_supplier_id", baseTableName: "order_voice", constraintName: "FK6fctk5if52xhahc8p6rxq3hj7", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "supplier", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-22") {
        addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "user_role", constraintName: "FK859n2jvi8ivhui0rl0esws6o", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-23") {
        addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "gbgroup_user", constraintName: "FK97t57wviuvg8okq5winshr5qr", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-24") {
        addForeignKeyConstraint(baseColumnNames: "group_id", baseTableName: "gborder", constraintName: "FK9o6m2xo8qv09wd5lrcboqgexa", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "gbgroup", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-25") {
        addForeignKeyConstraint(baseColumnNames: "role_id", baseTableName: "user_role", constraintName: "FKa68196081fvovjhkek5m97n3y", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "role", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-26") {
        addForeignKeyConstraint(baseColumnNames: "owner_id", baseTableName: "supplier", constraintName: "FKap38m2kjnyqojmsejdrqhyft2", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-27") {
        addForeignKeyConstraint(baseColumnNames: "supplier_id", baseTableName: "gborder", constraintName: "FKfmjdcted2e98fomklp3tq2a9j", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "supplier", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-28") {
        addForeignKeyConstraint(baseColumnNames: "creator_id", baseTableName: "supplier", constraintName: "FKfx0xxctppou5d8phemxn5o4ha", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-29") {
        addForeignKeyConstraint(baseColumnNames: "order_voice_id", baseTableName: "gborder_order_voice", constraintName: "FKg5dj9w6cemtvj5ehpj2g0wyku", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "order_voice", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-30") {
        addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "customer", constraintName: "FKj8dlm21j202cadsbfkoem0s58", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-31") {
        addForeignKeyConstraint(baseColumnNames: "owner_id", baseTableName: "gbgroup", constraintName: "FKk9rxpho6clon9vawqm4lqun83", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-32") {
        addForeignKeyConstraint(baseColumnNames: "order_order_voice_id", baseTableName: "gborder_order_voice", constraintName: "FKr5dw68g2gqybqo32w1cxw2p6c", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "gborder", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1589796650534-33") {
        addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "order_voice", constraintName: "FKxqhopob8kefrpyoic350hbby", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", validate: "true")
    }
}
