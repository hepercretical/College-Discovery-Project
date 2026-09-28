/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_1509042626")

  // update collection data
  unmarshal({
    "name": "foundation_foods"
  }, collection)

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_1509042626")

  // update collection data
  unmarshal({
    "name": "food_data"
  }, collection)

  return app.save(collection)
})
