Return-Path: <prvs=454139529f=cov@fb.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=454139529f=cov@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="j0o9JXZZ"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="OGf1Q30M"; dkim-atps=neutral
X-Greylist: delayed 1947 seconds by postgrey-1.36 at bilbo;
 Wed, 03 Jan 2018 13:55:14 AEDT
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zBFsZ4gqKzF0Pf
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jan 2018 13:55:13 +1100 (AEDT)
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 w032JIGi018466; Tue, 2 Jan 2018 18:22:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=bvFA1zyPPrB3EB/PTPmye0KN9GkL5FkwnZ4vr7LaFho=;
 b=j0o9JXZZRZqBbYr366seGTf3d9K+qe5nyNL/+aY9mtz5YEe7JrZGv9STO7gDM7vF5a3G
 0z1VV4NwGOfvh9W2+1rTdF9MYKTSpf0lE7s4YcgBLwwXZAFKK2TwEEjjDdRC6ltzP/Sc
 A9+u9TY1dw9z+nUgOeIj0eijwcApOnCw+e0= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2f8kqegb1t-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 02 Jan 2018 18:22:42 -0800
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.30) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Tue, 2 Jan 2018 21:22:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=bvFA1zyPPrB3EB/PTPmye0KN9GkL5FkwnZ4vr7LaFho=;
 b=OGf1Q30MvrCZ8KMtXOYHChRCsNCDE01TCQ8kWWmva7oeMHeZr6fwRdop+/v4QkphQMewU0PDl3pc6K30vigciQqCVlOcgwAr7MNtIXKzNYjL+YoDtpdFoZgjYDmHWc9p3Pbo7f+U02M9GqrVcXQBaaHfQkJtblm7/0h33/Iozc8=
Received: from CY1PR15MB0077.namprd15.prod.outlook.com (10.162.45.27) by
 CY1PR15MB0080.namprd15.prod.outlook.com (10.162.46.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.366.8; Wed, 3 Jan 2018 02:22:39 +0000
Received: from CY1PR15MB0077.namprd15.prod.outlook.com ([10.162.45.27]) by
 CY1PR15MB0077.namprd15.prod.outlook.com ([10.162.45.27]) with mapi id
 15.20.0366.007; Wed, 3 Jan 2018 02:22:39 +0000
From: Christopher Covington <cov@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Michael_E_Brown@Dell.com" <Michael_E_Brown@Dell.com>, "venture@google.com"
 <venture@google.com>
Subject: Re: Metrics vs Logging, Continued
Thread-Topic: Metrics vs Logging, Continued
Thread-Index: AQHThC5V+HlUW7hNdEGfHqxadxe+JA==
Date: Wed, 3 Jan 2018 02:22:39 +0000
Message-ID: <CY1PR15MB0077EC76B1E96D62AF70ECCACB1E0@CY1PR15MB0077.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.201.64.132]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY1PR15MB0080;
 7:fSYpv61iTsUbhJPPI7oiZdDFUJh29HBCdXxYPH70+BlGJayPIlynMM/gsCtiYxFjH9N9rSiMturRcLvJm+Ux/pnDrZR/MGSDvzLpOkc0qFOG9ZRX457XY6cliPkOraabgPw6z9fHX1k/vaHg4kMjDiOg0vwi/jxSG3cup3/Us9x3piCW8B5vhPW56jRZrW/QJQAfw//XSVz6Pzi49xdbigJkSb84ahY+QKCeHWibiNZBnukqE7xQiC29XvpW7UK4;
 20:DJLaJdgV/XIxlMCZ+42HGsER9yYR2MTChtwIIkvSP4oYeAUbqFP9s/e8BulsnWLViRRPV1hitLlEX5ogzBckFUrlqyJ6q7k4ihCMUcLFhUkgpYTWFvrmo/k0IZowjaRk6F94WX46Qx8MsqETx7FTJ2O3TjcufHF/nSABBg1PH4Q=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 3b0d644d-e605-4ecf-fdb4-08d55250dc8d
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(3008032)(2017052603307)(7153060);
 SRVR:CY1PR15MB0080; 
x-ms-traffictypediagnostic: CY1PR15MB0080:
x-microsoft-antispam-prvs: <CY1PR15MB008011B1BD46B77A69C32B80CB1E0@CY1PR15MB0080.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863)(278428928389397)(72170088055959)(166708455590820)(81227570615382);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040470)(2401047)(5005006)(8121501046)(3231023)(11241501184)(944501075)(93006095)(93001095)(3002001)(10201501046)(6041268)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(6072148)(201708071742011);
 SRVR:CY1PR15MB0080; BCL:0; PCL:0; RULEID:(100000803101)(100110400095);
 SRVR:CY1PR15MB0080; 
x-forefront-prvs: 0541031FF6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(39380400002)(366004)(376002)(39860400002)(189003)(199004)(51914003)(2501003)(2201001)(14454004)(74316002)(316002)(7696005)(305945005)(77096006)(33656002)(25786009)(6436002)(7736002)(2900100001)(478600001)(3846002)(6116002)(110136005)(966005)(53936002)(229853002)(86362001)(81156014)(6246003)(97736004)(106356001)(105586002)(9686003)(6306002)(8936002)(3660700001)(6506007)(8676002)(66066001)(55016002)(5660300001)(102836004)(8666007)(2906002)(68736007)(99286004)(3280700002)(81166006)(42262002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR15MB0080;
 H:CY1PR15MB0077.namprd15.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: Klznij/AXV0ma2COJqd9cb7lF3IaecZDTVYY2RTa33P452C7JoPNvZRfsMFltzsKeufztptRiBMnfyamqQGHuw==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0d644d-e605-4ecf-fdb4-08d55250dc8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2018 02:22:39.3010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR15MB0080
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-03_01:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Jan 2018 02:55:15 -0000

Hi Michael, Patrick,

I probably should have hopped on this list months ago. Thanks for your pati=
ence as I come up to
speed on your code, configure my mail client to suit this list, and so on.

> Prometheus metrics is fundamentally a pull model, not a push model. If yo=
u have a pull model,
> it greatly simplifies the dependencies:

>	- Pull metrics internally or externally (daemons listen on 127.0.0.1, opt=
ionally reverse proxy
>	  that through your web service).

An option for on-demand metrics (as opposed to periodic, always-on monitori=
ng) is nice. I would
use it to more highly scrutinize upgrades in progress for example.

>	- Optionally run the metrics server or not depending on configuration.

I agree it should fail gracefully when there is no server present, and thin=
k this generalizes to
other network services, even NTP and DHCP.

>	- Pull model naturally self-limits in performance-limited cases... you do=
n=92t have a thundering
>	  herd of daemons trying to push metrics. In case metrics server gets loa=
ded it will naturally
>	  slow down polls to backend daemons.

At large scale you'll either need multiple pollers or load-balancing for th=
e receiving server. I'm
not sure what the best solution is. Is load-balancing perhaps more commonpl=
ace?

> But what I think would be pretty nice is if you could point graphana/Prom=
etheus towards every
> BMC on your network to get nice graphs of temp, fan speeds, etc.

For metrics/counters, I've been centrally pulling/polling from a fleet runn=
ing the following RESTful
API:

https://github.com/facebook/openbmc/tree/helium/common/recipes-rest/rest-ap=
i/files

But polling the whole fleet doesn't seem ideal, so I'm wondering about a pu=
sh model.

Prometheus looks interesting, thanks for the pointer. It does seem to suppo=
rt a push model
https://prometheus.io/docs/instrumenting/pushing/

Do Go language applications run reasonably well on ASpeed 2400 SoCs?

I've heard that OpenWRT uses collectd: https://wiki.openwrt.org/doc/howto/s=
tatistic.collectd

Thanks,
Christopher Covington=
