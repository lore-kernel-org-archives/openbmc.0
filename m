Return-Path: <Eugene.Cho@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.214; helo=esa4.dell-outbound.iphmx.com;
 envelope-from=eugene.cho@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="CDKuD1E4"; 
 dkim-atps=neutral
Received: from esa4.dell-outbound.iphmx.com (esa4.dell-outbound.iphmx.com
 [68.232.149.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40hYP23BTtzF2C4
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 23:05:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1525957526; x=1557493526;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=nrJQu3my8tuFUwdMOFGJehRZCq66ddfmDqeqcyiSYYo=;
 b=CDKuD1E4oAV9taQxgeHF97KljUtM3CIoAHcPFItha2+1D0ff4Bmtjjds
 TGJX63qO0qzE5j/T6y3a0im3kX0hup21pRyh32I9DjD+BYlQQNpDtp38L
 o3CUPOeCA0bAGOaC8GI5GKS8eONDoSnQMOspiB8ceDYNCAa+AL8MS13Te s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GqAgDJQvRahz+a6ERcHQEBBQELAYQWg?=
 =?us-ascii?q?QkymFaDCJNEgWQLhGyDAiE3FQECAQEBAQEBAgEBAhABAQEKCwkIKC+CNSKDARM?=
 =?us-ascii?q?/EgE+YQcBBA4NgxuBcBGsWDOHaF+CSIglghOIURpuhQgCmC0IjkeBL4s9kFKBJ?=
 =?us-ascii?q?TKBdXCDFIItjiCPCIEfgRgBAQ?=
X-IPAS-Result: =?us-ascii?q?A2GqAgDJQvRahz+a6ERcHQEBBQELAYQWgQkymFaDCJNEgWQ?=
 =?us-ascii?q?LhGyDAiE3FQECAQEBAQEBAgEBAhABAQEKCwkIKC+CNSKDARM/EgE+YQcBBA4Ng?=
 =?us-ascii?q?xuBcBGsWDOHaF+CSIglghOIURpuhQgCmC0IjkeBL4s9kFKBJTKBdXCDFIItjiC?=
 =?us-ascii?q?PCIEfgRgBAQ?=
Received: from esa3.dell-outbound2.iphmx.com ([68.232.154.63])
 by esa4.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 May 2018 08:05:21 -0500
From: <Eugene.Cho@dell.com>
Received: from ausc60ps301.us.dell.com ([143.166.148.206])
 by esa3.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 May 2018 19:02:30 +0600
X-LoopCount0: from 10.166.132.134
X-IronPort-AV: E=Sophos;i="5.49,385,1520917200"; d="scan'208";a="1149309809"
X-DLP: DLP_GlobalPCIDSS
To: <cyrilbur@gmail.com>
CC: <openbmc@lists.ozlabs.org>
Subject: common bmc mailbox driver
Thread-Topic: common bmc mailbox driver
Thread-Index: AdPoXuWSWf7y8INVQQa+TJMSn0fZ2w==
Date: Thu, 10 May 2018 13:04:59 +0000
Message-ID: <28825ffd2af2405eacbb48f1388992f8@AUSX13MPC105.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titusconfig: No Restrictions 04051212
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvIiwiaWQiOiJiYWQ3MjQxYS0xOGIzLTQyNGUtOTIxZS1iZmM1ZWQwOTJjN2MiLCJwcm9wcyI6W3sibiI6IkNsYXNzaWZpY2F0aW9uIiwidmFscyI6W3sidmFsdWUiOiJObyBSZXN0cmljdGlvbnMifV19LHsibiI6IlN1YmxhYmVscyIsInZhbHMiOltdfSx7Im4iOiJFeHRlcm5hbENvcnJlc3BvbmRlbmNlIiwidmFscyI6W119XX0sIlN1YmplY3RMYWJlbHMiOltdLCJUTUNWZXJzaW9uIjoiMTYuMi4xMS4wIiwiVHJ1c3RlZExhYmVsSGFzaCI6InA4RFRZRmVWQ3d2aWRCdnZIUGRGXC81QUFSN01ySFphMzlWR1g4Rk8rVDlnPSJ9
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 10 May 2018 13:05:28 -0000

Hey Cyril,
   I was recently following your upstream submission attempt for the aspeed=
 mbox/mailbox, was wondering if there was been any progress since?

Reason I ask - is Nuvoton also has a "mailbox" for bmc<->host communication=
, which does the same thing (shared memory + interrupts both ways), and was=
 wondering if we could just have 1 driver for both, instead 2 separate driv=
ers.

Glancing at the aspeed driver, only key difference I see is the setting and=
 handling the interrupt. Thoughts on this?
