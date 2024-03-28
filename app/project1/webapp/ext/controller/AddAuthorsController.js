sap.ui.define([
    "sap/m/MessageToast",
    "sap/ui/core/Fragment",
], function (MessageToast, Fragment) {
    'use strict';

    return {
        onAdd: function (oEvent) {
            MessageToast.show("Custom handler invoked.");
            let oView = this.editFlow.getView()

            if (!this.editFlow.getView().byId("createNode")) {
                // load asynchronous XML fragment
                Fragment.load({
                    id: oView.getId(),
                    name: "project1.ext.fragment.OpeanPopUp",
                    controller: this
                }).then(function (oDialog) {
                    // connect dialog to the root view 
                    //of this component (models, lifecycle)
                    oView.addDependent(oDialog);
                    oDialog.open();
                });
            } else {
                this.editFlow.getView().byId("createNode").open();
            }
        },
        onClose: function () {
            this.editFlow.getView().byId("createNode").close()
        }
    }

});
