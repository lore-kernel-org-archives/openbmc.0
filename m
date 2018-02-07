Return-Path: <ed.tanous@intel.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zc5qG53SdzF10W
 for <openbmc@lists.ozlabs.org>; Thu,  8 Feb 2018 03:08:49 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2018 08:08:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,473,1511856000"; d="scan'208";a="28163563"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
 by fmsmga004.fm.intel.com with ESMTP; 07 Feb 2018 08:08:45 -0800
Received: from orsmsx111.amr.corp.intel.com (10.22.240.12) by
 ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Wed, 7 Feb 2018 08:08:44 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.245]) by
 ORSMSX111.amr.corp.intel.com ([169.254.12.253]) with mapi id 14.03.0319.002;
 Wed, 7 Feb 2018 08:08:44 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Yugi Mani <yupalani@microsoft.com>, Ali Larijani <alirhas@microsoft.com>, 
 "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>, "hramasub@in.ibm.com"
 <hramasub@in.ibm.com>, "Michael.E.Brown@dell.com" <Michael.E.Brown@dell.com>
CC: "Balaji.B.Rao@dell.com" <Balaji.B.Rao@dell.com>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 "jwcarman@us.ibm.com" <jwcarman@us.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "pradeep.kumar36@tcs.com"
 <pradeep.kumar36@tcs.com>, "rolfb@us.ibm.com" <rolfb@us.ibm.com>, Chris Ong
 <Chris.Ong@microsoft.com>
Subject: RE: Redfish on OpenBMC
Thread-Topic: Redfish on OpenBMC
Thread-Index: AQHTmjMIXx4JxIn4mE+JYQ1EktHYUaOOt7sAgAESj4CAAJbigIAABbkAgAh2bQCAAEmyAA==
Date: Wed, 7 Feb 2018 16:08:44 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169932F663F86@ORSMSX114.amr.corp.intel.com>
References: <9FBE92B9-4D49-41CD-9AF7-A5A9E48B25F3@fuzziesquirrel.com>
 <c62f69455ae74650a086a167c7434d37@ausx13mps334.AMER.DELL.COM>
 <OFF0C73A52.E22304BC-ON65258227.0026CCEB-65258227.0032425A@notes.na.collabserv.com>
 <c73bb370335c45dab208cb0e708a08f4@AUSX13MPS306.AMER.DELL.COM>
 <BL0PR2101MB09150499921D8E104CEB9618ADFA0@BL0PR2101MB0915.namprd21.prod.outlook.com>
 <MWHPR21MB0864D2D2F00B56C21A5917F4D6FC0@MWHPR21MB0864.namprd21.prod.outlook.com>
In-Reply-To: <MWHPR21MB0864D2D2F00B56C21A5917F4D6FC0@MWHPR21MB0864.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOGU3OTdhYWMtOWVjNy00YjhlLTllMTItYjdkN2I0NzU5ODNiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6IjV2QWVBU2h1N1hySE4wcUtzQ0V6MnJrXC9kMHRmNWdpWFAwVStqNGF5UDBNPSJ9
x-originating-ip: [10.22.254.140]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Feb 2018 16:08:59 -0000

PiA+IFBlcmZvcm1hbmNlDQo+ID4gSG93IGZhc3QgaXMgaXQ/DQo+IFN5bmNocm9ub3VzIEFQSSBm
b3IgU2Vuc29ycyBhbmQgU0VMIHRha2VzIGxvbmdlciB0byByZXNwb25kLg0KPiBJdCB0YWtlcyBh
Ym91dCAxOSBzZWNvbmRzIGZvciAxMDAgc2Vuc29ycyBhbmQgbW9yZSB0aGFuIDYgbWludXRlcyBm
b3IgNDAwMA0KPiBldmVudHMuDQo+IDEwIGNvbmN1cnJlbnQgcmVxdWVzdHMgY2FuIG1ha2UgdGhl
bSA0LTUgdGltZXMgc2xvd2VyIHRoYW4gdXN1YWwuDQo+IEFzeW5jaHJvbm91cyBBUEkgZm9yIEJN
QyBhbmQgY29tcG9uZW50IGZpcm13YXJlIHVwZGF0ZSB0YWtlcyA1LTEwDQo+IG1pbnV0ZXMgYXMg
ZXhwZWN0ZWQuDQo+IFRoZXNlIHJlc3VsdHMgYXJlIG9uIEFTVDI0MDAuDQoNCkRvIHlvdSBoYXZl
IHRoZSBzYW1lIGRhdGEgZm9yIHlvdXIgMjUwMCBwbGF0Zm9ybXM/DQoNCg==
