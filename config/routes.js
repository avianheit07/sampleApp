
module.exports.routes = {
  '/': {
    controller: 'SiteController',
    action:'index'
  },
  'get /medicine':{
    controller: 'MedicineController',
    action:'list'
  },
  'get /logs':{
    controller: 'MedicineController',
    action:'logs'
  },
  'post /logs':{
    controller: 'MedicineController',
    action:'logsPost'
  },
  'post /symptoms':{
    controller: 'MedicineController',
    action:'symptomsPost'
  },
  'get /symptoms':{
    controller: 'MedicineController',
    action:'symptoms'
  }
};
