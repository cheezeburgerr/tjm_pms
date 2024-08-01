import React from 'react';
import { Page, Text, View, Document, Image } from '@react-pdf/renderer';
import styles from './styles';
import moment from 'moment';


const OrdersReport = ({ data, month, status, artist }) => (
    <Document>
        <Page style={styles.container}>

            <View style={styles.details}>
                <Image
                    style={styles.image}
                    src="/images/TJM_Logo.png" // Replace with your image URL or path
                />
                <View style={styles.right}>
                    <Text style={[styles.heading, styles.rightChild]}>TJM SPORTSWEAR</Text>
                    <Text style={styles.fontBold}>Orders Report</Text>
                </View>
            </View>
            <View style={styles.details2}>


                {month && (
                    <View style={styles.details}>
                        <Text style={styles.p}>Date: </Text>
                        <Text style={styles.p}>{month}</Text>
                    </View>
                )}

                {status && (
                    <View style={styles.details}>
                        <Text style={styles.p}>Status: </Text>
                        <Text style={styles.p}>{status}</Text>
                    </View>
                )}
                {artist && (
                    <View style={styles.details}>
                        <Text style={styles.p}>Artist: </Text>
                        <Text style={styles.p}>{artist}</Text>
                    </View>
                )}

            </View>
            <View style={styles.hr} />
            <View style={styles.table}>
                <View style={styles.tableHeadings}>
                    <View style={styles.tableColSpan}>
                        <Text style={styles.tableCell}>Team Name</Text>
                    </View>
                    <View style={styles.tableCol}>
                        <Text style={styles.tableCell}>Due Date</Text>
                    </View>
                    <View style={styles.tableCol}>
                        <Text style={styles.tableCell}>Total Price</Text>
                    </View>
                    <View style={styles.tableCol}>
                        <Text style={styles.tableCell}>Products</Text>
                    </View>
                    <View style={styles.tableCol}>
                        <Text style={styles.tableCell}>Status</Text>
                    </View>
                    <View style={styles.tableCol}>
                        <Text style={styles.tableCell}>Date Ordered</Text>
                    </View>
                </View>

                {data.map(order => (
                    <View key={order.id} style={styles.tableRow}>
                        <View style={styles.tableColSpan}>
                            <Text style={styles.tableCell}>{order.team_name}</Text>
                        </View>
                        <View style={styles.tableCol}>
                            <Text style={styles.tableCell}>{moment(order.due_date).format('MMMM Do, YYYY')}</Text>
                        </View>
                        <View style={styles.tableCol}>
                            <Text style={styles.tableCell}>Php {order.total_price.toFixed(2)}</Text>
                        </View>
                        <View style={styles.tableCol}>
                            <Text style={styles.tableCell}>
                                {order.products.map(product => (
                                    <>
                                        {product.products.map(p => (
                                            <>
                                                {p.product_name},
                                            </>
                                        ))}
                                    </>
                                ))}
                            </Text>
                        </View>
                        <View style={styles.tableCol}>
                            <Text style={styles.tableCell}>{order.production.status}</Text>
                        </View>
                        <View style={styles.tableCol}>
                            <Text style={styles.tableCell}>{moment(order.created_at).format('MMMM Do, YYYY')}</Text>
                        </View>
                    </View>
                ))}

            </View>
        </Page>
    </Document>
);

export default OrdersReport;
