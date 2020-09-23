databaseChangeLog = {

    changeSet(author: "xamul (generated)", id: "1599985598031-1") {
        createTable(tableName: "address") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true")
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

    changeSet(author: "xamul (generated)", id: "1599985598031-2") {
        createTable(tableName: "contact_info") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true")
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

    changeSet(author: "xamul (generated)", id: "1599985598031-3") {
        createTable(tableName: "customer") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "user_id", type: "BIGINT")

            column(name: "delivery_address_address1", type: "VARCHAR(20)") {
                constraints(nullable: "false")
            }

            column(name: "delivery_address_country_code", type: "VARCHAR(2)") {
                constraints(nullable: "false")
            }

            column(name: "delivery_address_postal_code", type: "VARCHAR(5)") {
                constraints(nullable: "false")
            }

            column(name: "delivery_address_address2", type: "VARCHAR(20)")

            column(name: "delivery_address_city", type: "VARCHAR(20)") {
                constraints(nullable: "false")
            }

            column(name: "delivery_address_district", type: "VARCHAR(2)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-4") {
        createTable(tableName: "gbgroup") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "name", type: "VARCHAR(20)") {
                constraints(nullable: "false", unique: "true")
            }

            column(name: "owner_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "creation_date", type: "datetime") {
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

            column(name: "public_group", type: "BIT(1)") {
                constraints(nullable: "false")
            }

            column(name: "deleted", type: "BIT(1)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-5") {
        createTable(tableName: "gbgroup_customer") {
            column(name: "group_members_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "customer_id", type: "BIGINT")

            column(name: "members_idx", type: "INT")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-6") {
        createTable(tableName: "gbgroup_user") {
            column(name: "group_members_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "user_id", type: "BIGINT")

            column(name: "members_idx", type: "INT")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-7") {
        createTable(tableName: "gborder") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true")
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

            column(name: "order_date", type: "datetime") {
                constraints(nullable: "false")
            }

            column(name: "description", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-8") {
        createTable(tableName: "gborder_order_voice") {
            column(name: "order_order_voice_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "order_voice_id", type: "BIGINT")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-9") {
        createTable(tableName: "order_status") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-10") {
        createTable(tableName: "order_voice") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "quantity_requested", type: "INT")

            column(name: "quantity_shipped", type: "INT")

            column(name: "customer_id", type: "BIGINT")

            column(name: "estimated_price", type: "FLOAT(12)")

            column(name: "final_price", type: "FLOAT(12)")

            column(name: "insert_date", type: "datetime") {
                constraints(nullable: "false")
            }

            column(name: "description", type: "VARCHAR(255)")

            column(name: "product_code", type: "VARCHAR(255)")

            column(name: "product_price", type: "FLOAT(12)")

            column(name: "product_supplier_id", type: "BIGINT")

            column(name: "product_description", type: "VARCHAR(150)")

            column(name: "user_id", type: "BIGINT")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-11") {
        createTable(tableName: "product") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "code", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "price", type: "FLOAT(12)") {
                constraints(nullable: "false")
            }

            column(name: "supplier_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "description", type: "VARCHAR(150)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-12") {
        createTable(tableName: "registration_code") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true")
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

    changeSet(author: "xamul (generated)", id: "1599985598031-13") {
        createTable(tableName: "role") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "authority", type: "VARCHAR(255)") {
                constraints(nullable: "false", unique: "true")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-14") {
        createTable(tableName: "shop") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "frienly_name", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "portablepos", type: "BIT(1)") {
                constraints(nullable: "false")
            }

            column(name: "url_name", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "only_cash", type: "BIT(1)") {
                constraints(nullable: "false")
            }

            column(name: "user_id", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "delivery", type: "BIT(1)") {
                constraints(nullable: "false")
            }

            column(name: "max_delivery_distance", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "short_description", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "internet_payments", type: "BIT(1)") {
                constraints(nullable: "false")
            }

            column(name: "description", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "min_delivery_amount", type: "FLOAT(12)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-15") {
        createTable(tableName: "supplier") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "name", type: "VARCHAR(20)") {
                constraints(nullable: "false", unique: "true")
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

    changeSet(author: "xamul (generated)", id: "1599985598031-16") {
        createTable(tableName: "user") {
            column(autoIncrement: "true", name: "id", type: "BIGINT") {
                constraints(primaryKey: "true")
            }

            column(name: "version", type: "BIGINT") {
                constraints(nullable: "false")
            }

            column(name: "password_expired", type: "BIT(1)") {
                constraints(nullable: "false")
            }

            column(name: "username", type: "VARCHAR(255)") {
                constraints(nullable: "false", unique: "true")
            }

            column(name: "account_locked", type: "BIT(1)") {
                constraints(nullable: "false")
            }

            column(name: "password", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }

            column(name: "account_expired", type: "BIT(1)") {
                constraints(nullable: "false")
            }

            column(name: "enabled", type: "BIT(1)") {
                constraints(nullable: "false")
            }

            column(name: "email", type: "VARCHAR(255)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-17") {
        createTable(tableName: "user_role") {
            column(name: "user_id", type: "BIGINT") {
                constraints(primaryKey: "true")
            }

            column(name: "role_id", type: "BIGINT") {
                constraints(primaryKey: "true")
            }
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-18") {
        createIndex(indexName: "FK2kxvbr72tmtscjvyp9yqb12by", tableName: "product") {
            column(name: "supplier_id")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-19") {
        createIndex(indexName: "FK6fctk5if52xhahc8p6rxq3hj7", tableName: "order_voice") {
            column(name: "product_supplier_id")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-20") {
        createIndex(indexName: "FK97t57wviuvg8okq5winshr5qr", tableName: "gbgroup_user") {
            column(name: "user_id")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-21") {
        createIndex(indexName: "FK9k5mg3nd82ci4b5on1tu7gs", tableName: "gbgroup_customer") {
            column(name: "customer_id")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-22") {
        createIndex(indexName: "FK9o6m2xo8qv09wd5lrcboqgexa", tableName: "gborder") {
            column(name: "group_id")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-23") {
        createIndex(indexName: "FKa68196081fvovjhkek5m97n3y", tableName: "user_role") {
            column(name: "role_id")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-24") {
        createIndex(indexName: "FKap38m2kjnyqojmsejdrqhyft2", tableName: "supplier") {
            column(name: "owner_id")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-25") {
        createIndex(indexName: "FKbvacjlebv8vvnanxcxwajodp7", tableName: "order_voice") {
            column(name: "customer_id")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-26") {
        createIndex(indexName: "FKfmjdcted2e98fomklp3tq2a9j", tableName: "gborder") {
            column(name: "supplier_id")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-27") {
        createIndex(indexName: "FKfx0xxctppou5d8phemxn5o4ha", tableName: "supplier") {
            column(name: "creator_id")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-28") {
        createIndex(indexName: "FKg5dj9w6cemtvj5ehpj2g0wyku", tableName: "gborder_order_voice") {
            column(name: "order_voice_id")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-29") {
        createIndex(indexName: "FKj8dlm21j202cadsbfkoem0s58", tableName: "customer") {
            column(name: "user_id")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-30") {
        createIndex(indexName: "FKj97brjwss3mlgdt7t213tkchl", tableName: "shop") {
            column(name: "user_id")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-31") {
        createIndex(indexName: "FKk9rxpho6clon9vawqm4lqun83", tableName: "gbgroup") {
            column(name: "owner_id")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-32") {
        createIndex(indexName: "FKr5dw68g2gqybqo32w1cxw2p6c", tableName: "gborder_order_voice") {
            column(name: "order_order_voice_id")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-33") {
        createIndex(indexName: "FKxqhopob8kefrpyoic350hbby", tableName: "order_voice") {
            column(name: "user_id")
        }
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-34") {
        addForeignKeyConstraint(baseColumnNames: "supplier_id", baseTableName: "product", constraintName: "FK2kxvbr72tmtscjvyp9yqb12by", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "supplier", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-35") {
        addForeignKeyConstraint(baseColumnNames: "product_supplier_id", baseTableName: "order_voice", constraintName: "FK6fctk5if52xhahc8p6rxq3hj7", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "supplier", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-36") {
        addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "user_role", constraintName: "FK859n2jvi8ivhui0rl0esws6o", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "user", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-37") {
        addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "gbgroup_user", constraintName: "FK97t57wviuvg8okq5winshr5qr", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "user", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-38") {
        addForeignKeyConstraint(baseColumnNames: "customer_id", baseTableName: "gbgroup_customer", constraintName: "FK9k5mg3nd82ci4b5on1tu7gs", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "customer", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-39") {
        addForeignKeyConstraint(baseColumnNames: "group_id", baseTableName: "gborder", constraintName: "FK9o6m2xo8qv09wd5lrcboqgexa", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "gbgroup", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-40") {
        addForeignKeyConstraint(baseColumnNames: "role_id", baseTableName: "user_role", constraintName: "FKa68196081fvovjhkek5m97n3y", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "role", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-41") {
        addForeignKeyConstraint(baseColumnNames: "owner_id", baseTableName: "supplier", constraintName: "FKap38m2kjnyqojmsejdrqhyft2", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "user", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-42") {
        addForeignKeyConstraint(baseColumnNames: "customer_id", baseTableName: "order_voice", constraintName: "FKbvacjlebv8vvnanxcxwajodp7", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "user", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-43") {
        addForeignKeyConstraint(baseColumnNames: "supplier_id", baseTableName: "gborder", constraintName: "FKfmjdcted2e98fomklp3tq2a9j", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "supplier", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-44") {
        addForeignKeyConstraint(baseColumnNames: "creator_id", baseTableName: "supplier", constraintName: "FKfx0xxctppou5d8phemxn5o4ha", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "user", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-45") {
        addForeignKeyConstraint(baseColumnNames: "order_voice_id", baseTableName: "gborder_order_voice", constraintName: "FKg5dj9w6cemtvj5ehpj2g0wyku", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "order_voice", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-46") {
        addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "customer", constraintName: "FKj8dlm21j202cadsbfkoem0s58", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "user", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-47") {
        addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "shop", constraintName: "FKj97brjwss3mlgdt7t213tkchl", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "user", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-48") {
        addForeignKeyConstraint(baseColumnNames: "owner_id", baseTableName: "gbgroup", constraintName: "FKk9rxpho6clon9vawqm4lqun83", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "user", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-49") {
        addForeignKeyConstraint(baseColumnNames: "order_order_voice_id", baseTableName: "gborder_order_voice", constraintName: "FKr5dw68g2gqybqo32w1cxw2p6c", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "gborder", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-50") {
        addForeignKeyConstraint(baseColumnNames: "customer_id", baseTableName: "order_voice", constraintName: "FKt2l17kbv0qk4wt79ewcuvnmw", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "customer", validate: "true")
    }

    changeSet(author: "xamul (generated)", id: "1599985598031-51") {
        addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "order_voice", constraintName: "FKxqhopob8kefrpyoic350hbby", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "user", validate: "true")
    }
}
