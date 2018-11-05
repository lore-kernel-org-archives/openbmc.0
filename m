Return-Path: <pmao@linkedin.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linkedin.com
 (client-ip=108.174.0.123; helo=mail723.linkedin.com;
 envelope-from=pmao@linkedin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=linkedin.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linkedin.com header.i=@linkedin.com header.b="KTvXeyUX";
 dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.onmicrosoft.com
 header.i=@microsoft.onmicrosoft.com header.b="HkUnKCey"; 
 dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at bilbo;
 Tue, 06 Nov 2018 05:01:04 AEDT
Received: from mail723.linkedin.com (mail723.linkedin.com [108.174.0.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42pgTX6HFjzDrHF
 for <openbmc@lists.ozlabs.org>; Tue,  6 Nov 2018 05:01:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linkedin.com;
 s=d2048-201806-01; t=1541440428;
 bh=ge/ndeSl3Tf5q1Y+9Haax81vWguVmemR9+jrpixESeI=;
 h=From:To:Subject:Date:Content-Type:MIME-Version;
 b=KTvXeyUX9B01irejkmhBsT9h+InfVmrMNWCxcGkaLDvEQiokAoACJP/hqt2TluMYK
 BfQju1QSwGZ2RZsgTl3qPDMpw5FGk7400VQv8og371NNuHknn3irWLvNYFBGwo8eRS
 MVwyhXszgP8Y8qneHhYlk9xK74LENR0niqGeM6pwZdjCw/7teADvFSNz0UVS3uxN05
 rSLYFF9HTA1k3GMrLFE/ubx7mw/m8wu1Jf29OUhXZ0gMIcKQA+I+1YuBSOuCEYpbHC
 7m/t2ajkHU62Gr/JjDM5dIvMPSmcylU1ftW9GMxG/w1re/PVK70XyFFHodwpaLf/4n
 EK746dzivsP4Q==
Authentication-Results: mail723.prod.linkedin.com
 x-tls.subject="/C=US/ST=Washington/L=Redmond/O=Microsoft
 Corporation/CN=mail.protection.outlook.com";
 auth=pass (cipher=ECDHE-RSA-AES256-SHA384)
Authentication-Results: mail723.prod.linkedin.com;
 iprev=pass policy.iprev="2a01:111:f400:7e41::203";
 spf=softfail smtp.mailfrom="pmao@linkedin.com"
 smtp.helo="nam01-bn3-obe.outbound.protection.outlook.com";
 dkim=pass header.d=microsoft.onmicrosoft.com;
 tls=pass (verified) key.ciphersuite="TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384"
 key.length="256" tls.v="tlsv1.2"
 cert.client="C=US,ST=Washington,L=Redmond,O=Microsoft
 Corporation,CN=mail.protection.outlook.com"
 cert.clientissuer="C=BE,O=GlobalSign nv-sa,CN=GlobalSign Organization
 Validation CA - SHA256 - G3"
Received: from [2a01:111:f400:7e41::203] ([2a01:111:f400:7e41::203.43130]
 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by mail723.prod.linkedin.com (envelope-from <pmao@linkedin.com>)
 (ecelerity 4.2.1.55028 r(Core:4.2.1.12)) with ESMTPS
 (cipher=ECDHE-RSA-AES256-SHA384
 subject="/C=US/ST=Washington/L=Redmond/O=Microsoft
 Corporation/CN=mail.protection.outlook.com") 
 id 11/64-21201-CA380EB5; Mon, 05 Nov 2018 17:53:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.onmicrosoft.com; s=selector1-microsoft-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ge/ndeSl3Tf5q1Y+9Haax81vWguVmemR9+jrpixESeI=;
 b=HkUnKCeypKfi0KMv7KNStrwvEfuL8nOXXRN6erlmt4GFbcv/ac32fiC3W7g07LgAHOdJQ4Vrf9jPscrWaMxV34gIjhzLf303rMQruCRnIdW8iiGu7X0Sgd4SR97W/Jb+FabzXkxMsneF925NvBorQ501MgVpaAwpa9zaf0vkS14=
Received: from SN6PR2101MB1069.namprd21.prod.outlook.com (52.132.115.18) by
 SN6PR2101MB0893.namprd21.prod.outlook.com (52.132.116.158) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1339.4; Mon, 5 Nov 2018 17:53:47 +0000
Received: from SN6PR2101MB1069.namprd21.prod.outlook.com
 ([fe80::84f0:727:1faa:90b0]) by SN6PR2101MB1069.namprd21.prod.outlook.com
 ([fe80::84f0:727:1faa:90b0%8]) with mapi id 15.20.1339.006; Mon, 5 Nov 2018
 17:53:46 +0000
From: Ping Mao <pmao@linkedin.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Andrew Geissler
 <geissonator@gmail.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Infrastructure Workgroup?
Thread-Topic: Infrastructure Workgroup?
Thread-Index: AQHUcGjqWdWv80Pa6UWx6gBzlij5s6U8QNyAgAS5NQA=
Date: Mon, 5 Nov 2018 17:53:46 +0000
Message-ID: <178875A5-C26D-499D-9DF3-F5319A242EDD@linkedin.biz>
References: <CALLMt=qiyO0HHqp3fj=XFqCnMx2XWqR-m8Wn+OgSTGBKS5f=-w@mail.gmail.com>
 <8EF9B854-0495-47F4-ACE9-EC7EC10EF181@fuzziesquirrel.com>
In-Reply-To: <8EF9B854-0495-47F4-ACE9-EC7EC10EF181@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:119:5003:20c:8814:8545:650e:801]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN6PR2101MB0893;
 6:CTGLkZESwnkiygjJzFCDWAIzCycXZfDLQgyg0yLZebr0viA35AbkLZMUSxRSBaZ1UbZoD0T1pp9UZKhAOpZ+ZdgWAVH4aR1kEToDE2o6kZnpbd9/K+YZ9gLAq4ojVe5+Ky6tAU+ee4atFo9U/kxQRgsOBn0Z4WLUECSaVG5XtFU/oivJrZJjjHAA9zQUnKGztz0M4aQo9Mo01KQPQVvFyIym8zXRYOkWuTSnpvso1Bd9etuKGnR51j19qLmdwPDEGw6gO2ZdQkevTmNJO30fOwZwZD2eYI7hlX9gneIfT7cyYbWFgPZKsFTf2g0OH0XtaftdT/6xzZgOgFuHEhnLC/CM571YkTtW6+TnYFA3BORzv1jeoH90qJrJYEbVlC38hQNb9Ycwo6EtLslcW/Dcmm2QDTkSWdvIluKkLLiJI7yDCbHr1W2AJOu+aqeOu6hXb6hCV1+adfQjr7mnddi29w==;
 5:UvRRD40D0D8JIIo7RlastMZ+Og7gZiGe/RJtGQMSyuue6MsXLyUQIVxHZFqD3eIze4bEs/yc82mzfhWqHbWAdvN00hdi3M6KOT4QOyQFaXAKNwUm1XfsAJUCXQQiDs8MN+aPrV03L76gf+JyJDYDQQeinUGlTRLgxT/7NmqDohs=;
 7:ubseaZAPd0WM6BLKm88l5IhhML2UOw2K3HcqLMRLO2DCwD/JI+q7Q15UkXZGxm8H6IA67qbk0qCUc+NBEucGIc9zqFhaAV8cPxMTsMlUocP75gwNbajDeov0Pcu6y6f4fcQ2jJJeAw6YRpyY+qTCpw==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 00940aec-da52-4f04-e3d2-08d64347a2a2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:SN6PR2101MB0893; 
x-ms-traffictypediagnostic: SN6PR2101MB0893:
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pmao@linkedin.com; 
x-o365ent-eop-header: Message Processed By - CBR_LInkedIn_Mail_To_External
x-microsoft-antispam-prvs: <SN6PR2101MB0893348E6C8098868E0E759FA0CA0@SN6PR2101MB0893.namprd21.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(8220035)(2401047)(5005006)(8121501046)(3231382)(944501410)(52105095)(2018427008)(10201501046)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:SN6PR2101MB0893; BCL:0; PCL:0; RULEID:; SRVR:SN6PR2101MB0893; 
x-forefront-prvs: 08476BC6EF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(366004)(39860400002)(136003)(376002)(189003)(47662002)(199004)(6512007)(9686003)(33896004)(53546011)(6506007)(102836004)(256004)(6436002)(36756003)(81166006)(14454004)(81156014)(305945005)(8676002)(25786009)(76176011)(486006)(82746002)(316002)(476003)(3480700004)(5660300001)(446003)(4326008)(2906002)(97736004)(7736002)(6486002)(11346002)(8936002)(186003)(6246003)(86362001)(39060400002)(46003)(558084003)(2900100001)(7116003)(110136005)(33656002)(53936002)(83716004)(71190400001)(105586002)(79102999)(99286004)(68736007)(10090500001)(6116002)(71200400001)(229853002)(478600001)(106356001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR2101MB0893;
 H:SN6PR2101MB1069.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: linkedin.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: I3+VnDHSsJxFAgDAwQKghIsGLZYAdO2UC6bhd/wDx3eu1K1hF25EAjKwZW+A+WLNXCgmLx/BxVnhxHFB24s8/+/9qV/Gjt7p5WzvI53X7Kz4oDZ/2ZxqM+RnfuuFY6t459BvFBuXie9JeT4uGLAyUYX5kLTynICYhTB9XamJ5gPha4sFDJguzLOsskaAeYUygxOosaJl6D9Zyvl9XkybUOTPTp9Gqrcr95Shga0/mnahyGwZ3z3Nlb6yPJo5y38wvOB3KlofVDD0fOZ31N92pt5PzQxyDiEdsFUpALcRe4ywb1kAtmACbiLxwY4A9ihj8kW5iIqiLILTt5MdY/R6yg1ZXkOQd6CXiaOJwf1p4pw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CA9FB3718C47646AFDA7015B82798F8@namprd21.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: linkedin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00940aec-da52-4f04-e3d2-08d64347a2a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2018 17:53:46.7935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR2101MB0893
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Nov 2018 18:01:06 -0000

SGksICBCcmFkOg0KDQpXaGVyZSBjYW4gSSBjaGVjayB5b3VyIHJlcGxpZXM/DQoNClRoYW5rcywN
ClBpbmcNCg0K77u/T24gMTEvMi8xOCwgMjo0NiBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIEJy
YWQgQmlzaG9wIiA8b3BlbmJtYy1ib3VuY2VzK3BtYW89bGlua2VkaW4uY29tQGxpc3RzLm96bGFi
cy5vcmcgb24gYmVoYWxmIG9mIGJyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbT4gd3JvdGU6DQoN
CiAgICANCiAgICA+IE9uIE9jdCAzMCwgMjAxOCwgYXQgMTE6NDkgQU0sIEFuZHJldyBHZWlzc2xl
ciA8Z2Vpc3NvbmF0b3JAZ21haWwuY29tPiB3cm90ZToNCiAgICA+IA0KICAgID4gVGhvdWdodHMg
b3IgaW50ZXJlc3Q/DQogICAgDQogICAgVGhhbmtzIGZvciBkb2luZyB0aGlzIEFuZHJldy4gIEni
gJlkIGxpa2UgdG8gcGFydGljaXBhdGUuDQogICAgDQogICAgLWJyYWQNCg0K
