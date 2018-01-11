// Write your JavaScript code.
function koServerDataViewModel() {
	var self = this;
	self.serverData = ko.observableArray();

	self.doAGet = function () {
		$.getJSON('/Dashboard/KOData', self.serverData);
	};

	self.doA1Get = function () {
		$.ajax({
			type: 'GET',
			url: '/Dashboard/KOData2',
			success: function (data) {
				//console.log(datas);
				self.serverData = data;
				//console.log(self.serverData);
			},
			async: false
		});
	};
	self.doA2Get = function () {
		$.ajax({
			type: 'GET',
			url: '/Dashboard/KOData2',
			success: function (data) {
				//console.log(datas);
				self.serverData = ko.toJSON(data);
				//console.log(self.serverData);
			},
			async: false
		});
	};
	self.doA3Get = function () {
		$.getJSON('/Dashboard/KOData2', self.serverData);
	};
}


//function koServerDataViewModel() {
//	var self = this;
//	self.serverData = ko.observableArray();
//	self.serverData2 = ko.observableArray();
//	self.serverData3 = ko.observableArray();
//	$.getJSON('/Dashboard/KOData', self.serverData);

//	//$.ajax({
//	//	type: 'GET',
//	//	url: '/Dashboard/KOData',
//	//	dataType: 'json',
//	//	success: function (data) {
//	//		//console.log(datas);
//	//		self.serverData2 = JSON.parse(data);
//	//		//console.log(self.serverData);
//	//	},
//	//	async: false
//	//});

//	//$.getJSON('/Dashboard?handler=KOData', function (data) {
//	//	self.serverData = data;
//	//	console.log('Get Debug');
//	//});

//	self.doBGet = function () {
//		$.getJSON('/Dashboard/KOData', function (data) {
//			ko.mapping.fromJS(data, self.serverData);
//		});


//		$.getJSON('/Dashboard/KOData', function (data) {
//			self.serverData2 = data;
//		});

//		$.getJSON('/Dashboard/KOData2', function (data) {
//			ko.mapping.fromJS(data, self.serverData3);
//		});

//	};
//}


