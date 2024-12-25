// lambda/employee_handler/index.js
const AWS = require('aws-sdk');
const dynamodb = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event) => {
  try {
    const employee = JSON.parse(event.body);
    
    // Validate input
    if (!employee.employeeId || !employee.name || !employee.email || !employee.department) {
      return {
        statusCode: 400,
        body: JSON.stringify({ message: 'Missing required fields' })
      };
    }

    const params = {
      TableName: 'EmployeeInfo',
      Item: {
        employeeId: employee.employeeId,
        name: employee.name,
        email: employee.email,
        department: employee.department,
        createdAt: new Date().toISOString()
      }
    };

    await dynamodb.put(params).promise();

    return {
      statusCode: 200,
      body: JSON.stringify({ message: 'Employee information saved successfully' })
    };
  } catch (error) {
    return {
      statusCode: 500,
      body: JSON.stringify({ message: 'Error saving employee information' })
    };
  }
};