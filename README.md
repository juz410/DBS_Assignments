# SuperStore Database Setup Guide

This README provides step-by-step instructions to setup the SuperStore database.

## Prerequisites

Ensure you have necessary permissions and software installed to run SQL scripts, such as SQL Server Management Studio (SSMS) or any other preferred database client with access to your SQL Server.

## Steps

1. Open your SQL Server Management Studio or preferred SQL client.
2. Connect to the SQL Server instance where you wish to create and configure the SuperStore database.
3. Run the SQL scripts in the following order:

    1. **Table creation**: Execute the script located in `table_creation.sql` to create necessary tables for the system.
    2. **Encryption setup**: Run the script in `encryption/encryption_creation.sql` to setup necessary encryption for sensitive data.
    3. **Data creation**: Run these scripts in `data_creation` folder in the following order:
       - `role_data_creation.sql`
       - `user_data_creation.sql`
       - `membership_data_creation.sql`
       - `items_data_creation.sql`
       - `transactions_data_creation.sql`
       - `transactions_item_data_creation.sql`
       
       These scripts populate the database with necessary initial data.
       
    4. **Role and User setup**: Run these scripts in `role` folder in the following order:
       - `role_creation.sql`
       - `user_creation.sql`
       - `role_access_granting.sql`
       - `role_assignation.sql`
       
       These scripts create and assign the roles and users with necessary permissions.
       
    5. **Row-Level Security setup**: Run the script `row_level_security/row_level_policies.sql` to setup row-level security policies.
    6. **Trigger setup**: Run these scripts in `triggers` folder in the following order:
       - `limit_stock_per_transactions_trigger.sql`
       - `stock_validation_trigger.sql`
       - `update_total_price_trigger.sql`
       
       These scripts setup necessary triggers for the system.

Congratulations! You have successfully setup the SuperStore database system and it's now ready for use.

For any issues during the setup process, please refer to accompanying documentation or contact your database administrator.
