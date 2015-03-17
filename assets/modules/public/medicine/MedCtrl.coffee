app.controller "MedCtrl", [
  "$scope",
  "$http",
  ($scope, $http) ->
    $scope.data =
      medicines: []
      symptom: {}
      symptoms: []
      toggleModal: () ->
        $scope.addMedicineModal = !$scope.addMedicineModal

      save: () ->
        data = angular.fromJson(angular.toJson($scope.active.modal))
        $http.post "/medicine/create", data
        .success (data) ->
          if data
            $scope.data.medicines.push data
            $scope.hideModal()
      symptomSave: () ->
        $http.post "/symptoms", ($scope.data.symptom)
        .success (data) ->
          if data
            $scope.data.symptoms.push data
            $scope.data.symptom = {}
            $scope.hideModal()
    $scope.search =
      toggleModal: () ->
        $scope.searchModal = !$scope.searchModal
    $scope.symptom =
      toggleModal: () ->
        $scope.symptomModal = !$scope.symptomModal


    $http.get "/medicine"
    .success (data) ->
      $scope.data.medicines = data

    $http.get "/symptoms"
    .success (data) ->
      $scope.data.symptoms = data

    $scope.active =
      selected: {}
      logs: []
      log: {}
      display: false
      modal: []
      toggleModal: () ->
        $scope.getMedicineModal = !$scope.getMedicineModal
      select: (data) ->        
        if data.id isnt $scope.active.id
          $scope.active.selected = data

        $http.get "/logs"
        .success (data) ->
          console.log "logs", data
          $scope.active.logs = data

      toDisplay: (data) ->
        if $scope.active.getMed
          $scope.active.getMed = false

        if $scope.active.selected.id is data.id
          $scope.active.display = !$scope.active.display
        else if $scope.active.selected.id isnt data.id
          $scope.active.display = true

      save: (data) ->
        data.medicine = $scope.active.selected
        $http.post "/logs", data
        .success (data) ->
          console.log 'saved', data
          if data
            $scope.active.log = {}
            $scope.data.medicines.forEach (row) ->
              if row.id is data.id
                row = data
            $scope.hideModal()
            $scope.$digest()


    $scope.getMedicineModal = false
    $scope.addMedicineModal = false
    $scope.searchModal      = false
    $scope.symptomModal     = false


    # $scope.toggleModal = (data) ->
    #   $scope.active =
    #     modal: {
    #       count: 0
    #     }
    #     index: null
    #   $scope.modalShown = !$scope.modalShown

    $scope.hideModal = () ->
      $scope.getMedicineModal  = false
      $scope.addMedicineModal  = false
    
    $scope.counter =
      count: 0
      add: (num) ->
        @count++
        switch num
          when 0
            $scope.active.modal.count = @count
          when 1
            $scope.active.log.count = @count
      subtract: (num)->
        if @count is 0
          @count = @count
        else
          @count--

          switch num
            when 0
              $scope.active.modal.count = @count
            when 1
              $scope.active.log.count = @count

]
