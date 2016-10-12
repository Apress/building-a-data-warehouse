d:
cd "d:\data\acer\book\scripts\nds"
echo create database
sqlcmd -i db_nds.sql                          >> ndsout.txt
echo contact                                  >> ndsout.txt
sqlcmd -i contact.sql                         >> ndsout.txt
echo supplier_status                          >> ndsout.txt
sqlcmd -i supplier_status.sql                 >> ndsout.txt
echo artist                                   >> ndsout.txt
sqlcmd -i artist.sql                          >> ndsout.txt
echo product_status                           >> ndsout.txt
sqlcmd -i product_status.sql                  >> ndsout.txt
echo product_category                         >> ndsout.txt
sqlcmd -i product_category.sql                >> ndsout.txt
echo product_type                             >> ndsout.txt
sqlcmd -i product_type.sql                    >> ndsout.txt
echo country                                  >> ndsout.txt
sqlcmd -i country.sql                         >> ndsout.txt
echo state                                    >> ndsout.txt
sqlcmd -i state.sql                           >> ndsout.txt
echo city                                     >> ndsout.txt
sqlcmd -i city.sql                            >> ndsout.txt
echo address                                  >> ndsout.txt
sqlcmd -i address.sql                         >> ndsout.txt
echo address_type                             >> ndsout.txt
sqlcmd -i address_type.sql                    >> ndsout.txt
echo phone_number                             >> ndsout.txt
sqlcmd -i phone_number.sql                    >> ndsout.txt
echo phone_number_type                        >> ndsout.txt
sqlcmd -i phone_number_type.sql               >> ndsout.txt
echo email_address                            >> ndsout.txt
sqlcmd -i email_address.sql                   >> ndsout.txt
echo email_address_type                       >> ndsout.txt
sqlcmd -i email_address_type.sql              >> ndsout.txt
echo currency                                 >> ndsout.txt
sqlcmd -i currency.sql                        >> ndsout.txt
echo currency rate                            >> ndsout.txt
sqlcmd -i currency_rate.sql                   >> ndsout.txt
echo media                                    >> ndsout.txt
sqlcmd -i media.sql                           >> ndsout.txt
echo format                                   >> ndsout.txt
sqlcmd -i format.sql                          >> ndsout.txt
echo package_type                             >> ndsout.txt
sqlcmd -i package_type.sql                    >> ndsout.txt
echo package                                  >> ndsout.txt
sqlcmd -i package.sql                         >> ndsout.txt
echo lead                                     >> ndsout.txt
sqlcmd -i lead.sql                            >> ndsout.txt
echo store_type                               >> ndsout.txt
sqlcmd -i store_type.sql                      >> ndsout.txt
echo division                                 >> ndsout.txt
sqlcmd -i division.sql                        >> ndsout.txt
echo region                                   >> ndsout.txt
sqlcmd -i region.sql                          >> ndsout.txt
echo occupation                               >> ndsout.txt
sqlcmd -i occupation.sql                      >> ndsout.txt
echo subscriber_band                          >> ndsout.txt
sqlcmd -i subscriber_band.sql                 >> ndsout.txt
echo subscriber_classs                        >> ndsout.txt
sqlcmd -i subscriber_class.sql                >> ndsout.txt
echo household_income                         >> ndsout.txt
sqlcmd -i household_income.sql                >> ndsout.txt
echo interest                                 >> ndsout.txt
sqlcmd -i interest.sql                        >> ndsout.txt
echo permission                               >> ndsout.txt
sqlcmd -i permission.sql                      >> ndsout.txt
echo customer_status                          >> ndsout.txt
sqlcmd -i customer_status.sql                 >> ndsout.txt
echo customer_type                            >> ndsout.txt
sqlcmd -i customer_type.sql                   >> ndsout.txt
echo subscription_status                      >> ndsout.txt
sqlcmd -i subscription_status.sql             >> ndsout.txt
echo business_unit                            >> ndsout.txt
sqlcmd -i business_unit.sql                   >> ndsout.txt
echo communication_category                   >> ndsout.txt
sqlcmd -i communication_category.sql          >> ndsout.txt
echo language                                 >> ndsout.txt
sqlcmd -i language.sql                        >> ndsout.txt
echo campaign                                 >> ndsout.txt
sqlcmd -i campaign.sql                        >> ndsout.txt
echo delivery_status_category                 >> ndsout.txt
sqlcmd -i delivery_status_category.sql        >> ndsout.txt
echo delivery_status                          >> ndsout.txt
sqlcmd -i delivery_status.sql                 >> ndsout.txt
echo store                                    >> ndsout.txt
sqlcmd -i store.sql                           >> ndsout.txt
echo supplier                                 >> ndsout.txt
sqlcmd -i supplier.sql                        >> ndsout.txt
echo product                                  >> ndsout.txt
sqlcmd -i product.sql                         >> ndsout.txt
echo channel                                  >> ndsout.txt
sqlcmd -i channel.sql                         >> ndsout.txt
echo communication                            >> ndsout.txt
sqlcmd -i communication.sql                   >> ndsout.txt
echo customer                                 >> ndsout.txt
sqlcmd -i customer.sql                        >> ndsout.txt
echo communication_subscription               >> ndsout.txt
sqlcmd -i communication_subscription.sql      >> ndsout.txt
echo campaign_result                          >> ndsout.txt
sqlcmd -i campaign_result.sql                 >> ndsout.txt
echo supplier_performance                     >> ndsout.txt
sqlcmd -i supplier_performance.sql            >> ndsout.txt
echo subscription_sales                       >> ndsout.txt
sqlcmd -i subscription_sales.sql              >> ndsout.txt
echo order_header                             >> ndsout.txt
sqlcmd -i order_header.sql                    >> ndsout.txt
echo order_item                               >> ndsout.txt
sqlcmd -i order_item.sql                      >> ndsout.txt
echo address_junction                         >> ndsout.txt
sqlcmd -i address_junction.sql                >> ndsout.txt
echo phone_number_junction                    >> ndsout.txt
sqlcmd -i phone_number_junction.sql           >> ndsout.txt
echo email_address_junction                   >> ndsout.txt
sqlcmd -i email_address_junction.sql          >> ndsout.txt
echo interest_junction                        >> ndsout.txt
sqlcmd -i interest_junction.sql               >> ndsout.txt
echo channel_junction                         >> ndsout.txt
sqlcmd -i channel_junction.sql                >> ndsout.txt
