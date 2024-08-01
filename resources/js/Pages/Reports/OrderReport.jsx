import React from 'react';
import { Page, Text, View, Document, Image } from '@react-pdf/renderer';
import styles from './styles';
import moment from 'moment';


const OrderReport = ({ data }) => (
    <Document>
        <Page style={styles.container}>

            <View style={styles.details}>
                <Image
                    style={styles.image}
                    src="/images/TJM_Logo.png" // Replace with your image URL or path
                />
                <View style={styles.right}>
                    <Text style={[styles.heading, styles.rightChild]}>TJM SPORTSWEAR</Text>
                    <Text style={styles.fontBold}>Order Form</Text>
                </View>
            </View>

            <View style={styles.details2}>
                <Text style={styles.pBorder}>
                    Team Name: {data.team_name}
                </Text>
                <Text style={styles.pBorder}>
                    Due Date: {moment(data.due_date).format('MMMM Do, YYYY')}
                </Text>
            </View>

            <View style={[styles.pBorder, styles.p]}>
                <Text>Products:</Text>
                {data.products.map(product => (
                    <>
                        <View style={{ display: 'flex', flexDirection: 'row', gap: 50, paddingVertical: 5, borderBottom: 1, borderColor: 'gray' }}>
                        {product.products.map(p => (
                            <>

                                    <Text style={{ fontWeight:'bold', width: '25%', textAlign: 'center' }}>{p.product_name}</Text>

                            </>
                        ))}
                        <View style={{ width: '50%', display: 'flex', flexDirection: 'row', gap: 50 }}>
                        {product.variations.map(v => (
                            <>
                                <View>
                                <Text style={{ fontSize: 8 }}>{v.category.category_name}</Text>
                                <Text>{v.variations.variation_name}</Text>
                                </View>
                            </>
                        ))}
                        </View>
                        <Text style={{ width: '25%', textAlign: 'center' }}>{product.subtotal}</Text>
                        </View>
                    </>
                ))}
            </View>
            <View style={styles.details2}>




            </View>
            <View style={styles.hr} />
            <View style={styles.table}>
                <View style={styles.tableHeadings}>
                    <View style={styles.tableColSpan}>
                        <Text style={styles.tableCell}>Player Name</Text>
                    </View>
                    <View style={styles.tableCol}>
                        <Text style={styles.tableCell}>Details</Text>
                    </View>
                    <View style={styles.tableCol}>
                        <Text style={styles.tableCell}>Classification</Text>
                    </View>
                    <View style={styles.tableCol}>
                        <Text style={styles.tableCell}>Gender</Text>
                    </View>
                    <View style={styles.tableCol}>
                        <Text style={styles.tableCell}>Upper Size</Text>
                    </View>
                    <View style={styles.tableCol}>
                        <Text style={styles.tableCell}>Lower Size</Text>
                    </View>
                    <View style={styles.tableCol}>
                        <Text style={styles.tableCell}>Product</Text>
                    </View>
                    <View style={styles.tableCol}>
                        <Text style={styles.tableCell}>Remarks</Text>
                    </View>
                </View>

                {data.lineups.map(lineup => (
                    <View key={lineup.id} style={styles.tableRow}>
                        <View style={styles.tableColSpan}>
                            <Text style={styles.tableCell}>{lineup.player_name}</Text>
                        </View>
                        <View style={styles.tableCol}>
                            <Text style={styles.tableCell}>{lineup.player_details}</Text>
                        </View>
                        <View style={styles.tableCol}>
                            <Text style={styles.tableCell}>{lineup.classification}</Text>
                        </View>

                        <View style={styles.tableCol}>
                            <Text style={styles.tableCell}>{lineup.gender}</Text>
                        </View>
                        <View style={styles.tableCol}>
                            <Text style={styles.tableCell}>{lineup.upper_size}</Text>
                        </View>
                        <View style={styles.tableCol}>
                            <Text style={styles.tableCell}>{lineup.lower_size}</Text>
                        </View>
                        <View style={styles.tableCol}>
                            <Text style={styles.tableCell}>{lineup.products.product_name}</Text>
                        </View>
                        <View style={styles.tableCol}>
                            <Text style={styles.tableCell}>{lineup.remarks}</Text>
                        </View>

                    </View>
                ))}

            </View>
            <View style={{ fontSize: 12,  display: 'flex', flexDirection: 'row' }}>
            <View style={{ padding: 10, border: 1, borderColor: 'gray', width: '50%' }}>
            <Text>CSR: {data.employees.filter(emp => emp.employee_role === 'CSR').map(e => (
                <>
                    {e.employee.name}
                </>
            ))}</Text>
                <Text>Artist: {data.employees.filter(emp => emp.employee_role === 'Artist').map(e => (
                <>
                    {e.employee.name}
                </>
            ))}</Text>
                <Text>Printer: {data.employees.filter(emp => emp.employee_role === 'Printer').map(e => (
                <>
                    {e.employee.name}
                </>
            ))}</Text>
                <Text>Sewer: {data.employees.filter(emp => emp.employee_role === 'Sewer').map(e => (
                <>
                    {e.employee.name}
                </>
            ))}</Text>
                <Text>Checker: {data.employees.filter(emp => emp.employee_role === 'Checker').map(e => (
                <>
                    {e.employee.name}
                </>
            ))}</Text>
            <Text>Final Checker: {data.employees.filter(emp => emp.employee_role === 'Final Checker').map(e => (
                <>
                    {e.employee.name}
                </>
            ))}</Text>
            </View>
            <View style={{ padding: 10, border: 1, borderColor: 'gray', width: '50%' }}>
                <Text style={{ fontSize: 16, fontWeight: 'bold' }}>Total Price: Php {data.total_price.toFixed(2)}</Text>
                <Text>Downpayment: </Text>
                <Text>Final Balance: </Text>
            </View>
            </View>
        </Page>
    </Document>
);

export default OrderReport;
