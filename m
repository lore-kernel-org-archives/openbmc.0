Return-Path: <Eugene.Cho@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.220; helo=esa2.dell-outbound.iphmx.com;
 envelope-from=eugene.cho@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="KU4gPgMP"; 
 dkim-atps=neutral
X-Greylist: delayed 628 seconds by postgrey-1.36 at bilbo;
 Fri, 09 Feb 2018 08:12:59 AEDT
Received: from esa2.dell-outbound.iphmx.com (esa2.dell-outbound.iphmx.com
 [68.232.149.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zcrWb0G10zF1Bd
 for <openbmc@lists.ozlabs.org>; Fri,  9 Feb 2018 08:12:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1518124379; x=1549660379;
 h=from:cc:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=j0oX7d6Ih1RLgyLlsL85DrVAqNAot+iZb6C38Y9mmqU=;
 b=KU4gPgMPuUSf2xUUaNJ82Rgnjig1IvEICB9Ux+B2wzuPJshlcrhSP8Gc
 ai+XBaSss4KZ7h1VLM9XXQ1rYSut8FtpEKhXl1PLUX0twHmsCvD2BxTvc
 A1h2YJf3ka/bOUd7NrFCJMRx8xj44fFVfqzsJJyuvYdrrW9vRKtq/xurk o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HyAADduXxah2Ka6ERdGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYQngQAynCSbbwqFO4IxWBQBAgEBAQEBAQIBAhABAQEKCwkIKC+?=
 =?us-ascii?q?COCKDCz8SAT5oAQQBGoocEbIJiBtggjyEfIIVgz+OTAWkKwmVc4IOAZI4mAyBP?=
 =?us-ascii?q?DaBc3CDGYJkghKNTYEXAQEB?=
X-IPAS-Result: =?us-ascii?q?A2HyAADduXxah2Ka6ERdGQEBAQEBAQEBAQEBAQcBAQEBAYQ?=
 =?us-ascii?q?ngQAynCSbbwqFO4IxWBQBAgEBAQEBAQIBAhABAQEKCwkIKC+COCKDCz8SAT5oA?=
 =?us-ascii?q?QQBGoocEbIJiBtggjyEfIIVgz+OTAWkKwmVc4IOAZI4mAyBPDaBc3CDGYJkghK?=
 =?us-ascii?q?NTYEXAQEB?=
Received: from esa4.dell-outbound2.iphmx.com ([68.232.154.98])
 by esa2.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Feb 2018 15:02:24 -0600
From: <Eugene.Cho@dell.com>
Cc: <openbmc@lists.ozlabs.org>, <Brian.Berry@Dell.com>
Received: from ausxippc106.us.dell.com ([143.166.85.156])
 by esa4.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Feb 2018 03:02:24 +0600
X-LoopCount0: from 10.166.132.130
X-IronPort-AV: E=Sophos;i="5.46,480,1511848800"; d="scan'208";a="211636825"
X-DLP: DLP_GlobalPCIDSS
To: <avifishman70@gmail.com>, <tmaimon77@gmail.com>, <joel@jms.id.au>,
 <jk@ozlabs.org>
Subject: Serial Mux Mode in NPCM
Thread-Topic: Serial Mux Mode in NPCM
Thread-Index: AdOhHqOsX5uTqyQpRLO9iN0a5o3zIw==
Date: Thu, 8 Feb 2018 21:02:22 +0000
Message-ID: <599c29f92c5e4849a7c30820442d8f7e@AUSX13MPC105.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titusconfig: No Restrictions 04051212
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvIiwiaWQiOiI5Y2UzNGEwNy1mNzA1LTQxZDItODEzYi05ZGVhZDNiZGY5ZjEiLCJwcm9wcyI6W3sibiI6IkNsYXNzaWZpY2F0aW9uIiwidmFscyI6W3sidmFsdWUiOiJObyBSZXN0cmljdGlvbnMifV19LHsibiI6IlN1YmxhYmVscyIsInZhbHMiOltdfSx7Im4iOiJFeHRlcm5hbENvcnJlc3BvbmRlbmNlIiwidmFscyI6W119XX0sIlN1YmplY3RMYWJlbHMiOltdLCJUTUNWZXJzaW9uIjoiMTYuMi4xMS4wIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlZsU2ZURTlcL1c3YWJIVEJiWHBSM0QrQUgyVU16WXlHUW85eHVUQzc2cE1ZPSJ9
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 08 Feb 2018 21:13:00 -0000

Any thoughts how we should handle the serial mux mode (SPMOD in SPSWC) in t=
he NPCM? It seems we need to able to switch between modes runtime (as these=
 are customer configurable options that can change at anytime).=20

We use almost all the modes in some fashion... =20

Could this be a handled like the 8250_aspeed_vuart.c? Maybe another simple =
sysfs driver? Thoughts?
