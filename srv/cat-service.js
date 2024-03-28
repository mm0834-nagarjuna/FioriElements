const cds = require("@sap/cds");

module.exports = cds.service.impl(async (srv) => {
    srv.on('addBooks', async (req) => {

        let QueryData = await cds.run(req.query)
        console.log(QueryData[0]);
        if (QueryData[0].price > 10) {

            console.log(QueryData[0].ID);

            // let db_data = SELECT.from('MY_BOOKSHOP_Books')
            // let content = await cds.run(db_data)
            // console.log(content);

            let updateQuery = "UPDATE MY_BOOKSHOP_Books SET ISDELATABLE = true WHERE ID = " + QueryData[0].ID
            await cds.run(updateQuery)
        } else {
            let updateQuery = "UPDATE MY_BOOKSHOP_Books SET ISDELATABLE = false WHERE ID = " + QueryData[0].ID
            await cds.run(updateQuery)
        }

    })
})
