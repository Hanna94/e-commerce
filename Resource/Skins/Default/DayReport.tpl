<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Daily Report</title>
    <style>
    </style>
</head>
<body>
    <div style="width: 100%; max-width:800px; font-size: 14px; padding: 20px; margin: 0 auto;">
        <table border="1" style="border-collapse: collapse; margin-bottom: 30px;">
            <caption style="text-align: left;"><h1>Daily Report&nbsp;<span style="font-size: 12px; font-weight: normal;">{时间段}</span></h1></caption>
            <tr style="background-color: #B7B7B7; text-align: left;">
                <td colspan="10" style="padding: 5px; font-size:18px;">Channel Group Report</td>
            </tr>
            <tr style="background-color: #B7B7B7; text-align: left;">
                <td colspan="6" style="padding: 5px; font-size:18px;">Today</td>
                <td colspan="2" style="padding: 5px; font-size:18px;">OutStock</td>
                <td colspan="2" style="padding: 5px; font-size:18px;">Out Of Stock</td>
            </tr>
            <tr style="text-align: center;">
                <td style="padding: 5px; max-width: 100px;">Team</td>
                <td style="padding: 5px; max-width: 100px;">Order</td>
                <td style="padding: 5px; max-width: 100px;">GMV</td>
                <td style="padding: 5px; max-width: 100px;">Goal</td>
                <td style="padding: 5px; max-width: 100px;">Month</td>
                <td style="padding: 5px; max-width: 100px;">Rate</td>
                <td style="padding: 5px; max-width: 100px;">Order</td>
                <td style="padding: 5px; max-width: 100px;">GMV</td>
                <td style="padding: 5px; max-width: 100px;">Order</td>
                <td style="padding: 5px; max-width: 100px;">GMV</td>
            </tr>
            <!-- BEGIN 账号组报表 ATTRIB= -->
            <tr style="text-align: center;">
                <td style="padding: 5px;">{TeamName}</td>
                <td style="padding: 5px;">{OrderQuantity}</td>
                <td style="padding: 5px;">{GMV}</td>
                <td style="padding: 5px;">{MonthGoal}</td>
                <td style="padding: 5px;">{MonthGMV}</td>
                <td style="padding: 5px;">{MonthRate}</td>
                <td style="padding: 5px;">{OutStockQuantity}</td>
                <td style="padding: 5px;">{OutStockGMV}</td>
                <td style="padding: 5px;">{UnOutStockQuantity}</td>
                <td style="padding: 5px;">{UnOutStockGMV}</td>
            </tr>
            <!-- END 账号组报表 -->
        </table>
        <table border="1" style="border-collapse: collapse;">
            <tr style="background-color: #B7B7B7; text-align: left;">
                <td colspan="10" style="padding: 5px; font-size:18px;">Product Group Report</td>
            </tr>
            <tr style="background-color: #B7B7B7; text-align: left;">
                <td colspan="6" style="padding: 5px; font-size:18px;">Today</td>
                <td colspan="2" style="padding: 5px; font-size:18px;">OutStock</td>
                <td colspan="2" style="padding: 5px; font-size:18px;">Out Of Stock</td>
            </tr>
            <tr style="text-align: center;">
                <td style="padding: 5px; max-width: 100px;">Team</td>
                <td style="padding: 5px; max-width: 100px;">Order</td>
                <td style="padding: 5px; max-width: 100px;">GMV</td>
                <td style="padding: 5px; max-width: 100px;">Goal</td>
                <td style="padding: 5px; max-width: 100px;">Month</td>
                <td style="padding: 5px; max-width: 100px;">Rate</td>
                <td style="padding: 5px; max-width: 100px;">Order</td>
                <td style="padding: 5px; max-width: 100px;">GMV</td>
                <td style="padding: 5px; max-width: 100px;">Order</td>
                <td style="padding: 5px; max-width: 100px;">GMV</td>
            </tr>
            <!-- BEGIN 产品组报表 ATTRIB= -->
            <tr style="text-align: center;">
                <td style="padding: 5px;">{TeamName}</td>
                <td style="padding: 5px;">{OrderQuantity}</td>
                <td style="padding: 5px;">{GMV}</td>
                <td style="padding: 5px;">{MonthGoal}</td>
                <td style="padding: 5px;">{MonthGMV}</td>
                <td style="padding: 5px;">{MonthRate}</td>
                <td style="padding: 5px;">{OutStockQuantity}</td>
                <td style="padding: 5px;">{OutStockGMV}</td>
                <td style="padding: 5px;">{UnOutStockQuantity}</td>
                <td style="padding: 5px;">{UnOutStockGMV}</td>
            </tr>
            <!-- END 产品组报表 -->
        </table>
    </div>
</body>
</html>