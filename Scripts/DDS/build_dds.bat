d:
cd "d:\data\acer\book\scripts\dds"
sqlcmd -i db_dds.sql                                >> ddsout.txt
sqlcmd -i dim_campaign.sql                          >> ddsout.txt
sqlcmd -i dim_channel.sql                           >> ddsout.txt
sqlcmd -i dim_communication.sql                     >> ddsout.txt
sqlcmd -i dim_customer.sql                          >> ddsout.txt
sqlcmd -i dim_date.sql                              >> ddsout.txt
sqlcmd -i dim_delivery_status.sql                   >> ddsout.txt
sqlcmd -i dim_format.sql                            >> ddsout.txt
sqlcmd -i dim_lead.sql                              >> ddsout.txt
sqlcmd -i dim_package.sql                           >> ddsout.txt
sqlcmd -i dim_product.sql                           >> ddsout.txt
sqlcmd -i dim_store.sql                             >> ddsout.txt
sqlcmd -i dim_subscription_status.sql               >> ddsout.txt
sqlcmd -i dim_supplier.sql                          >> ddsout.txt
sqlcmd -i dim_week.sql                              >> ddsout.txt
sqlcmd -i fact_product_sales.sql                    >> ddsout.txt
sqlcmd -i fact_subscription_sales.sql               >> ddsout.txt
sqlcmd -i fact_supplier_performance.sql             >> ddsout.txt
sqlcmd -i fact_communication_subscription.sql       >> ddsout.txt
sqlcmd -i fact_campaign_result.sql                  >> ddsout.txt
