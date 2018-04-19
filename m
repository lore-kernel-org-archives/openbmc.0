Return-Path: <mkbrown32@hotmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hotmail.com
 (client-ip=40.92.8.107; helo=nam03-dm3-obe.outbound.protection.outlook.com;
 envelope-from=mkbrown32@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="BkUdX1SD"; 
 dkim-atps=neutral
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-oln040092008107.outbound.protection.outlook.com [40.92.8.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RTK92Zr6zF22W
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 16:16:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=vNtjtfsa1k0kSOwh8Y4LpkK1in5Ch90OiLNttq/3u+c=;
 b=BkUdX1SDswhGWSrQwLYIIQ7LgA0FLhz7raXWvlywgQdbpKJvzNE09XGsryyHXY7E15s/ld+IrDUDF+5mL60xHeOnZFij93+YXLELq378tmJtlaWTT54uEd+Wu2XvdLeJv7JX/THAxuJU1NrKfWZAfoxzljRcy+VRvuKTsL5r+Lyese55J5gURUGmrrbwTrDZAdXjbQHnV6HC/QhsWqVoptvVr2Ml1NiHTHuv5voTY10UZOHGMKkP/9HrIPCxlf7c6ZwXaG7deHqu6q6GUHvOOSJm2QndNfw/q4GPM6ktubTMGcRkK4yZplDv2Thz56kYZWgMVDYomQjw/OWQHf4XEg==
Received: from CO1NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (10.152.80.56) by CO1NAM03HT196.eop-NAM03.prod.protection.outlook.com
 (10.152.80.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.675.14; Thu, 19
 Apr 2018 06:16:40 +0000
Received: from BY2PR02MB1330.namprd02.prod.outlook.com (10.152.80.55) by
 CO1NAM03FT053.mail.protection.outlook.com (10.152.81.201) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.20.675.14 via Frontend Transport; Thu, 19 Apr 2018 06:16:40 +0000
Received: from BY2PR02MB1330.namprd02.prod.outlook.com
 ([fe80::4471:ff0c:38cc:55fa]) by BY2PR02MB1330.namprd02.prod.outlook.com
 ([fe80::4471:ff0c:38cc:55fa%9]) with mapi id 15.20.0696.013; Thu, 19 Apr 2018
 06:16:40 +0000
From: Mark Brown <mkbrown32@hotmail.com>
To: Andrew Jeffery <andrew@aj.id.au>, Lei YU <mine260309@gmail.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Storage requirements for OpenBMC VirtualBox/Ubuntu build
Thread-Topic: Storage requirements for OpenBMC VirtualBox/Ubuntu build
Thread-Index: AQHT05RPMBfvkwn4bEqBfGfPCQgvYKQHjtWAgAAEb6uAAA8cAIAAAZua
Date: Thu, 19 Apr 2018 06:16:40 +0000
Message-ID: <BY2PR02MB13309DE59A88051E5FB73ABFAEB50@BY2PR02MB1330.namprd02.prod.outlook.com>
References: <BY2PR02MB133014C176DE4E0F77659D8CAEB20@BY2PR02MB1330.namprd02.prod.outlook.com>
 <CAARXrtmD2-BDutebA2ahwzf+LQ2J-BuAUKHBzudR-LW3Jmwaog@mail.gmail.com>
 <BY2PR02MB1330876176E682C90130B503AEB50@BY2PR02MB1330.namprd02.prod.outlook.com>,
 <1524118080.2476417.1343258432.7A83D343@webmail.messagingengine.com>
In-Reply-To: <1524118080.2476417.1343258432.7A83D343@webmail.messagingengine.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:63431E2031A25CCF62DD7E92ED49B4A2B0CA10821913D2E31223C16BD0E4D0B9;
 UpperCasedChecksum:818C5BDD72FF814F1CB3FF19025F8AE071621EE6AAF6D1E27763BBDE7063E764;
 SizeAsReceived:7537; Count:47
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [z5JeILZilmVJ2JYFA2dttRZC7/or7VuYqqIpQOQk+vbiwnLli/805ge91geUWLwC]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CO1NAM03HT196;
 7:hL+jstuJxq0VeirXC1ztPvZiV/3Q3ZAAQHwNs0WlNAUESeZpd9WjPRTamVoGNuDDKdW3QGRh3nejRuvAbm+RdryqfKIDXd01SrEAZwcSpinq34LK0q69vV2RA6bogiywr8n1IdimhytvzSIVclyh865ImUHmQBoX+Q3lGCbu/jOQ8qjlahe4bqbGkR01lPYqJvbijSTWOwS8QVCOCr8o7oYNWqOEj3bQiCoW1zp2e0RQgIjluZ11WingnY+cr0A+
x-incomingheadercount: 47
x-eopattributedmessage: 0
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322404)(1603101448)(1601125374)(1701031045);
 SRVR:CO1NAM03HT196; 
x-ms-traffictypediagnostic: CO1NAM03HT196:
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(444000031);
 SRVR:CO1NAM03HT196; BCL:0; PCL:0; RULEID:; SRVR:CO1NAM03HT196; 
x-forefront-prvs: 0647963F84
x-forefront-antispam-report: SFV:NSPM; SFS:(7070007)(98901004); DIR:OUT;
 SFP:1901; SCL:1; SRVR:CO1NAM03HT196; H:BY2PR02MB1330.namprd02.prod.outlook.com;
 FPR:; SPF:None; LANG:; 
x-microsoft-antispam-message-info: WDTL7g526ABZt6bQWhfaSe8mLTnuCjdjduMTHpwnepNn5Wkt7lTrK8Qfbls/xKNSZXzelfMP4uZ+vzAIoP2Fkk1trkWKs5h31Js6rv+EDjMVBbPNIJ9gGvoWLZP1Ld09LttgBIIFHJaLWCoiKyRV2QtDmvSkYNJ49DgE6+mLOv/F5mZvjY5QD1TXpJ0rboHX
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 8fde59a7-1db3-454c-da03-08d5a5bd1d65
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 54485d23-c432-40fe-8436-6091d627118c
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fde59a7-1db3-454c-da03-08d5a5bd1d65
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 54485d23-c432-40fe-8436-6091d627118c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2018 06:16:40.2398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM03HT196
X-Mailman-Approved-At: Fri, 20 Apr 2018 11:24:20 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2018 06:16:46 -0000

Yes, I remember that it was "quilt" with reference to "u-boot".
What is the exact git command sequence to update the=20
openbmc clone I have to merge with your fix ?

________________________________________
From: Andrew Jeffery <andrew@aj.id.au>
Sent: Wednesday, April 18, 2018 11:08 PM
To: Mark Brown; Lei YU
Cc: openbmc@lists.ozlabs.org
Subject: Re: Storage requirements for OpenBMC VirtualBox/Ubuntu build

On Thu, 19 Apr 2018, at 14:54, Mark Brown wrote:
> In my Ubuntu 16.04.4, I used Vboxmanage to increase to 40GB (33GB sda1),
> which was not enough,
> so I doubled it to 80GB (73GB sda1) and
> then it ran through approximately 3,000 of the 4,000 tasks,
> then had an Error "/bin/sh"..."not found"..."quilt".
> whereis shows that "quilt" is installed, so this makes no sense.
> I am running Ubuntu 16.04.4, not 14.04 .
> Any ideas ?
>

I accidentally broke the u-boot recipe recently whilst resolving other bugs=
[1], but the break has been fixed[2]. Try updating your local branch and bu=
ilding again.

Hope that helps,

Andrew

[1] https://gerrit.openbmc-project.xyz/#/c/9954/
[2] https://gerrit.openbmc-project.xyz/#/c/10117/
