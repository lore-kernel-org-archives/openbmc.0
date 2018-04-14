Return-Path: <mkbrown32@hotmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hotmail.com
 (client-ip=40.92.2.30; helo=nam01-sn1-obe.outbound.protection.outlook.com;
 envelope-from=mkbrown32@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="UpwgL8Lp"; 
 dkim-atps=neutral
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-oln040092002030.outbound.protection.outlook.com [40.92.2.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40NJ513FGlzF1Rl
 for <openbmc@lists.ozlabs.org>; Sat, 14 Apr 2018 12:10:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=eLI5wNOXHAizEWIksZkhFXifZOVgpGYpjz1OZHP6qfM=;
 b=UpwgL8LpJTiAovWtEY3RaLxBZE+imgvRCFNYlmCwaE2nVLnYXpqKozgYeqxmM8yRTsLAYGcJkteatO2DbL9X5K9CQWxNMsMEtDQcl9zZAKxhyLieF5613DEQUwq4469KSrlKjnSj+hQrviLzPxVSetTPoBWDspG+tO+W94e3S4eQ9ZEzz9yheOFKiynnzKTchKyGnBGe02OfMdrQ8HJ8Of8NdyGH5FmzWp/EunVP9Oki+JwD86GGIk4fMai8Qhcgz2YQ1gfGf66ScF909HXxUmKgAjRsRvZSpu2RKKid9jS7JU9uHeDKpPb9oVqadU0yWQzpbPCS1m43S50ZdrwyWQ==
Received: from BY2NAM01FT054.eop-nam01.prod.protection.outlook.com
 (10.152.68.57) by BY2NAM01HT051.eop-nam01.prod.protection.outlook.com
 (10.152.69.108) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.20.653.8; Sat, 14
 Apr 2018 02:10:05 +0000
Received: from BY2PR02MB1330.namprd02.prod.outlook.com (10.152.68.51) by
 BY2NAM01FT054.mail.protection.outlook.com (10.152.68.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.20.653.8 via Frontend Transport; Sat, 14 Apr 2018 02:10:05 +0000
Received: from BY2PR02MB1330.namprd02.prod.outlook.com
 ([fe80::4471:ff0c:38cc:55fa]) by BY2PR02MB1330.namprd02.prod.outlook.com
 ([fe80::4471:ff0c:38cc:55fa%7]) with mapi id 15.20.0675.012; Sat, 14 Apr 2018
 02:10:05 +0000
From: Mark Brown <mkbrown32@hotmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Storage requirements for OpenBMC VirtualBox/Ubuntu build
Thread-Topic: Storage requirements for OpenBMC VirtualBox/Ubuntu build
Thread-Index: AQHT05RPMBfvkwn4bEqBfGfPCQgvYA==
Date: Sat, 14 Apr 2018 02:10:05 +0000
Message-ID: <BY2PR02MB133014C176DE4E0F77659D8CAEB20@BY2PR02MB1330.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:0180D6D09DAA1E8861BB0A81EBD23A7E22376FE48A2C2ED72E9CBE076A33F919;
 UpperCasedChecksum:35B4676555EE360EAA5AAC4C47A83F7753476148031CF0645E1CB02B777320D5;
 SizeAsReceived:7070; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [WqhE0S2pNT9uhQSjytrokM3tnKzD4+6Y5V/BVjZvEFr46qWiPfGQY7cqkRzNztRFp0pm3WBerCw=]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY2NAM01HT051;
 7:2bYZC2isCUR15hJPVk+txrEDO0HrGHoqDMNvPXeGpvKzQkoeOlGACuVYryhNq/oTSlNSMETP6OuU0QcEc4qhOIz3DB145Te9Qda3RS76nQx3mrkBpXBVlCd2clCfEwxFGuRT/8M7mrULCyIS5h13WgtyVE56phZl+UGv0HJDsM+q04XLhHAU8bj5fHPb/2rjJtLn9gCczA4Ts0p8pYLfcOcI6tIV9CWY9kG5hJ7S49jAuXAop+L6kWUJPAfhZ8g1
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322404)(1601125374)(1603101448)(1701031045);
 SRVR:BY2NAM01HT051; 
x-ms-traffictypediagnostic: BY2NAM01HT051:
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(444000031);
 SRVR:BY2NAM01HT051; BCL:0; PCL:0; RULEID:; SRVR:BY2NAM01HT051; 
x-forefront-prvs: 0642A5E7BA
x-forefront-antispam-report: SFV:NSPM; SFS:(7070007)(98901004); DIR:OUT;
 SFP:1901; SCL:1; SRVR:BY2NAM01HT051; H:BY2PR02MB1330.namprd02.prod.outlook.com;
 FPR:; SPF:None; LANG:; 
x-microsoft-antispam-message-info: 6WMdNyQyyNVU/S1cPrUfBVtVGaTfYZfKQNqf7kqwVT/3mrCOr0FbgAI2zBG1eBya8FzLlmn/E0x0Yz5UqHuIh/Q1iCloEHoBOIwHotjHPm/+rxQkpdlgiSon9r6VvGHnoA3R0Za+e3sn/DC1Q4V5jfizDDMN2pZ8Idva5lW8wv4EERhQGvKwAvsdgayNfmc1
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: d1f0cbb0-c33c-41ba-45d2-08d5a1acd707
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 54485d23-c432-40fe-8436-6091d627118c
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f0cbb0-c33c-41ba-45d2-08d5a1acd707
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 54485d23-c432-40fe-8436-6091d627118c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2018 02:10:05.4566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2NAM01HT051
X-Mailman-Approved-At: Thu, 19 Apr 2018 13:29:00 +1000
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
X-List-Received-Date: Sat, 14 Apr 2018 02:10:14 -0000

I do not see anywhere in your documentation information on
how much storage should be allocated to the=20
/Windows 7 64/VirtualBox/Ubuntu 16.04 .vdi.
Also, do you know if it is possible to increase the storage of the Ubuntu .=
vdi
or does the user have to start over again, creating the .vdi ?

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Virtualbox reports  Virtual Size: 10.00 GB    Actual Size: 8.12 GB .
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
meta-palmetto        =3D "master:acff95b917b051a71ca3979793cccfff724a5821"
Initialising tasks: 100% |#################################################=
##################################| Time: 0:00:31
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: The free space of /home/mark/openbmc/build/sstate-cache (/dev/sda1=
) is running low (0.972GB left)
ERROR: No new tasks can be executed since the disk space monitor action is =
"STOPTASKS"!
WARNING: The free space of /home/mark/openbmc/build/tmp (/dev/sda1) is runn=
ing low (0.972GB left)
ERROR: No new tasks can be executed since the disk space monitor action is =
"STOPTASKS"!
WARNING: The free space of /home/mark/openbmc/build/downloads (/dev/sda1) i=
s running low (0.972GB left)
ERROR: No new tasks can be executed since the disk space monitor action is =
"STOPTASKS"!
NOTE: Tasks Summary: Attempted 102 tasks of which 0 didn't need to be rerun=
 and all succeeded.
Summary: There were 3 WARNING messages shown.
Summary: There were 3 ERROR messages shown, returning a non-zero exit code.
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

Mark Brown=
