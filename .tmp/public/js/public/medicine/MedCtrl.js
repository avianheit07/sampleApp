app.controller("MedCtrl", [
  "$scope", "$http", function($scope, $http) {
    $scope.data = {
      medicines: [],
      symptom: {},
      symptoms: [],
      toggleModal: function() {
        return $scope.addMedicineModal = !$scope.addMedicineModal;
      },
      save: function() {
        var data;
        data = angular.fromJson(angular.toJson($scope.active.modal));
        return $http.post("/medicine/create", data).success(function(data) {
          if (data) {
            $scope.data.medicines.push(data);
            return $scope.hideModal();
          }
        });
      },
      symptomSave: function() {
        return $http.post("/symptoms", $scope.data.symptom).success(function(data) {
          if (data) {
            $scope.data.symptoms.push(data);
            $scope.data.symptom = {};
            return $scope.hideModal();
          }
        });
      }
    };
    $scope.search = {
      toggleModal: function() {
        return $scope.searchModal = !$scope.searchModal;
      }
    };
    $scope.symptom = {
      toggleModal: function() {
        return $scope.symptomModal = !$scope.symptomModal;
      }
    };
    $http.get("/medicine").success(function(data) {
      return $scope.data.medicines = data;
    });
    $http.get("/symptoms").success(function(data) {
      return $scope.data.symptoms = data;
    });
    $scope.active = {
      selected: {},
      logs: [],
      log: {},
      display: false,
      modal: [],
      toggleModal: function() {
        return $scope.getMedicineModal = !$scope.getMedicineModal;
      },
      select: function(data) {
        if (data.id !== $scope.active.id) {
          $scope.active.selected = data;
        }
        return $http.get("/logs").success(function(data) {
          console.log("logs", data);
          return $scope.active.logs = data;
        });
      },
      toDisplay: function(data) {
        if ($scope.active.getMed) {
          $scope.active.getMed = false;
        }
        if ($scope.active.selected.id === data.id) {
          return $scope.active.display = !$scope.active.display;
        } else if ($scope.active.selected.id !== data.id) {
          return $scope.active.display = true;
        }
      },
      save: function(data) {
        data.medicine = $scope.active.selected;
        return $http.post("/logs", data).success(function(data) {
          console.log('saved', data);
          if (data) {
            $scope.active.log = {};
            $scope.data.medicines.forEach(function(row) {
              if (row.id === data.id) {
                return row = data;
              }
            });
            $scope.hideModal();
            return $scope.$digest();
          }
        });
      }
    };
    $scope.getMedicineModal = false;
    $scope.addMedicineModal = false;
    $scope.searchModal = false;
    $scope.symptomModal = false;
    $scope.hideModal = function() {
      $scope.getMedicineModal = false;
      return $scope.addMedicineModal = false;
    };
    return $scope.counter = {
      count: 0,
      add: function(num) {
        this.count++;
        switch (num) {
          case 0:
            return $scope.active.modal.count = this.count;
          case 1:
            return $scope.active.log.count = this.count;
        }
      },
      subtract: function(num) {
        if (this.count === 0) {
          return this.count = this.count;
        } else {
          this.count--;
          switch (num) {
            case 0:
              return $scope.active.modal.count = this.count;
            case 1:
              return $scope.active.log.count = this.count;
          }
        }
      }
    };
  }
]);

//# sourceMappingURL=MedCtrl.js.map
