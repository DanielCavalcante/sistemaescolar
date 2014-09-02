var $scope;
function nacionalidadeController($scope) {
    $scope.nacionalidadeSelection = '';
    $scope.isNacionalidadeSelected = function(index) {
        return index === $scope.nacionalidadeSelection;
    };
}
function modeloSelection($scope) {
    $scope.nacionalidadeSelection = '';
    $scope.isNacionalidadeSelected = function(index) {
        return index === $scope.nacionalidadeSelection;
    };
}
$(function () {
    $('#professorDataNascimento').datetimepicker({
        pickTime: false,
        language: 'pt-BR',
        useCurrent: false
    });
});
$(function () {
    $('#professorDataExpedicao').datetimepicker({
        pickTime: false,
        language: 'pt-BR',
        useCurrent: false
    });
});
