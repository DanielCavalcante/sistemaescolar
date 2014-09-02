var myApp = angular.module('myApp', []);

myApp.directive('soNumeros', function() {
	return {
		require : 'ngModel',
		link : function(scope, element, attrs, modelCtrl) {
			modelCtrl.$parsers.push(function(inputValue) {
				if (inputValue == undefined)
					return ''
				var transformedInput = inputValue.replace(/[^0-9]/g, '');
				if (transformedInput != inputValue) {
					modelCtrl.$setViewValue(transformedInput);
					modelCtrl.$render();
				}

				return transformedInput;
			});
		}
	};
});

myApp.directive('semEspaco', function() {
	return {
		require : 'ngModel',
		link : function(scope, element, attrs, modelCtrl) {
			modelCtrl.$parsers.push(function(inputValue) {
				if (inputValue == undefined)
					return ''
				var transformedInput = inputValue.replace(/ /g, '');
				if (transformedInput != inputValue) {
					modelCtrl.$setViewValue(transformedInput);
					modelCtrl.$render();
				}

				return transformedInput;
			});
		}
	};
});

function selectAll(checkbox, items) {
	var list = document.getElementsByName(items);
	for (var i=0; i < list.length; i++) {
		list[i].checked = checkbox.checked;
	}
}