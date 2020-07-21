module github.com/apuigsech/circuit/models/namespace

go 1.14

require (
	github.com/apuigsech/circuit/utils/models v0.0.0-00010101000000-000000000000
	github.com/apuigsech/rest-layer-sql v0.0.0-20200217220619-cf9c157299cc
	github.com/jessevdk/go-flags v1.4.0 // indirect
	github.com/rs/rest-layer v0.2.0
	github.com/rs/rest-layer-mongo v0.1.0 // indirect
	gopkg.in/mgo.v2 v2.0.0-20190816093944-a6b53ec6cb22 // indirect
)

replace github.com/apuigsech/circuit/utils/models => ../../utils/models
