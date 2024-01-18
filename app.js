const express = require('express');

const app = express();

app.use((request, response) => {
    const podName = process.env.HOSTNAME; // The name of the pod
    const node = process.env.MY_NODE;
    const namespace = process.env.MY_NAMESPACE;
    response.json({
        headers: request.headers,
        hostName: request.hostname,
        ip: request.ip,
        port: request.app.get('port'),
        path: request.path,
        podName,
        node,
        namespace
    });
});

module.exports = app;