//
//  CryptoCoinModel.swift
//  future-up-ios
//
//  Created by Alex Bardea on 22.03.2022.
//

import Foundation

// TO DO - Update Model with quantity and value of current holdings

struct CryptoCoinModel: Identifiable, Codable {
    public var tagID = UUID().uuidString
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H: Double?
    let priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let quantityCurrentHoldings: Int?
    var valueCurrentHoldings: Double?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case quantityCurrentHoldings = "quantity_current_holdings"
        case valueCurrentHoldings = "value_current_holdings"
    }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}

// Created for providing preview
let myCoin = CryptoCoinModel(
    id: "bitcoin",
    symbol: "btc",
    name: "Bitcoin",
    image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
    currentPrice: 43908,
    marketCap: 833414815098,
    marketCapRank: 1,
    fullyDilutedValuation: 921500086905,
    totalVolume: 25636954630,
    high24H: 43916,
    low24H: 42089,
    priceChange24H: 1213.77,
    priceChangePercentage24H: 6.87944,
    marketCapChange24H: 25188596233,
    marketCapChangePercentage24H: 3.11653,
    circulatingSupply: 18992631,
    totalSupply: 21000000,
    maxSupply: 21000000,
    ath: 69045,
    athChangePercentage: -0.97589,
    athDate: "2021-11-10T14:24:11.849Z",
    atl: 67.81,
    atlChangePercentage: 64561.0402,
    atlDate: "2013-07-06T00:00:00.000Z",
    lastUpdated: "2022-03-24T15:47:17.108Z",
    sparklineIn7D: SparklineIn7D(price: [
        40768.230901303854,
                        41005.3113004114,
                        41071.31913134101,
                        40889.164186187474,
                        40925.6487071971,
                        40823.40714525256,
                        40840.5902231867,
                        40829.33756770281,
                        40840.78814143565,
                        40783.63682137506,
                        40962.70555541926,
                        41015.98195142964,
                        41001.70957801974,
                        40712.691098369716,
                        40590.07467511413,
                        40565.36279836173,
                        40563.712006534464,
                        40652.41274265585,
                        40799.88090728682,
                        40754.15562529224,
                        40612.63661958296,
                        40597.31477874975,
                        40555.73885712383,
                        40465.26411959411,
                        40445.755422684284,
                        40468.0007877402,
                        40590.56936572492,
                        40583.876935225344,
                        40929.97626940468,
                        41414.78786626699,
                        41656.84230583477,
                        41723.205287456854,
                        41919.13889789344,
                        41861.661476271314,
                        41799.410933178304,
                        41778.15778565683,
                        41837.41313797566,
                        41916.637402650435,
                        41781.74805111194,
                        41785.39160719793,
                        41803.64750056388,
                        41828.97174051087,
                        41760.6888335557,
                        41783.37894687464,
                        41632.696509077025,
                        41726.37197585852,
                        41693.74565541053,
                        41699.91268066034,
                        41747.247602142284,
                        41835.23488199481,
                        41766.747032085375,
                        41823.786665859385,
                        41974.049306458786,
                        42005.28015313712,
                        41905.176694056885,
                        42008.898642217304,
                        42037.48112784869,
                        42241.361850445,
                        42186.64634200785,
                        41959.42109435703,
                        42201.939920688186,
                        42039.261950265056,
                        41968.11027628634,
                        41825.679548226486,
                        41968.291621551325,
                        41876.86701485217,
                        41928.38615481458,
                        41944.607057628935,
                        41878.37349592518,
                        41892.19217190622,
                        41771.94073768242,
                        41817.751614304005,
                        41686.79716106635,
                        41687.33458316866,
                        41546.73937179682,
                        41450.35878303224,
                        41399.31392337106,
                        41335.61342782906,
                        41029.13551845392,
                        41224.47315968807,
                        41406.92400956295,
                        41314.898883813126,
                        41370.54698803537,
                        41386.078567869095,
                        41249.33316098489,
                        41387.72304546921,
                        41225.78445464155,
                        40733.51993068625,
                        40878.42415379017,
                        40913.23271383735,
                        40974.76771023744,
                        40896.31305563323,
                        41086.69151515923,
                        41239.05994723585,
                        41303.79073368092,
                        41328.36144205215,
                        41284.75253742445,
                        41220.02875546474,
                        41241.22210531826,
                        40957.00049917298,
                        41198.77468257722,
                        40842.44873156697,
                        41030.28147863076,
                        40983.024147887634,
                        41142.27614881979,
                        41214.67706050706,
                        41301.14458605765,
                        41178.32068789192,
                        41061.81589384987,
                        41089.61890343331,
                        41152.86107256775,
                        41862.727551667194,
                        42204.52011480064,
                        42994.7314717725,
                        42869.52132761208,
                        42176.70594424896,
                        42235.85272785427,
                        42536.128413685095,
                        42466.764855661975,
                        42835.55075992346,
                        42934.47003609997,
                        42927.27001787339,
                        42865.01665179204,
                        42819.447262853064,
                        42659.67890603176,
                        42552.108193483844,
                        42594.25894235249,
                        42566.80585622548,
                        42393.01082195025,
                        42572.414282050864,
                        42814.06593377567,
                        42540.24263943805,
                        42369.9465541391,
                        42406.03634726256,
                        42372.94251102159,
                        42382.36088742517,
                        42154.80034315666,
                        41920.672852785356,
                        42084.05952517483,
                        42244.29887848717,
                        42119.07961254729,
                        42295.40783555332,
                        42189.75794278735,
                        42211.314543337736,
                        42016.11656474574,
                        42338.44925867036,
                        42064.66129642704,
                        42321.26054724114,
                        42649.92622463832,
                        42554.068081438934,
                        42104.73693159017,
                        42140.870527561834,
                        42256.08355155688,
                        42332.7698752271,
                        42391.756185498394,
                        42523.117979144554,
                        42844.971614152244,
                        43044.67353036166,
                        42798.94311450663,
                        42908.98214917548,
                        42729.049701393305,
                        42925.34271906018,
                        43002.96530560417,
                        43173.50530595823,
                        43086.740932684246,
                        43041.3442727603,
                        43029.950174740414,
                        43024.21248272343,

    ]),
    priceChangePercentage24HInCurrency: 2.8428964973680455,
    quantityCurrentHoldings: 0,
    valueCurrentHoldings: 0
)
