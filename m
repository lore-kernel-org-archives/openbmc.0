Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.95; helo=esa5.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="UEL6hCOk"; 
 dkim-atps=neutral
Received: from esa5.dell-outbound.iphmx.com (esa5.dell-outbound.iphmx.com
 [68.232.153.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zqyQM0mr3zF0p6
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 10:16:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1519686607; x=1551222607; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=i0SHZTBpKy2blanIPOw9DE+fJC+UWOzvdzucxi6za94=;
 b=UEL6hCOkU414uXBHIlg/qDsLoZh0EfQD8kfJZOKhRP+Vb6YjOWyMUuIA
 GOtpqU796GBkTd6Wg+wFG5tkrBq4c/+m1Fap672IWDYsz/7j08Vx4n1+I
 7FKJ/Jbp8T0JnNCb5XdH9r5lxEg9Fi7jGBEU+FFATB/cNvgJTRnrF+faa Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FlAQAHlJRah8qZ6EReGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYQlgQAym2qDGGqNNYl8Cod6WBQBAgEBAQEBAQIBAhABAQEKCwk?=
 =?us-ascii?q?IKC+COCKDC1EBPmgBBBuFCK5piHKCRodCjFeFJgWhYQkKlA2Be5BulXWBLzWBc?=
 =?us-ascii?q?3CDE4F9AQEBUoIHjDaBFwEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2FlAQAHlJRah8qZ6EReGQEBAQEBAQEBAQEBAQcBAQEBAYQ?=
 =?us-ascii?q?lgQAym2qDGGqNNYl8Cod6WBQBAgEBAQEBAQIBAhABAQEKCwkIKC+COCKDC1EBP?=
 =?us-ascii?q?mgBBBuFCK5piHKCRodCjFeFJgWhYQkKlA2Be5BulXWBLzWBc3CDE4F9AQEBUoI?=
 =?us-ascii?q?HjDaBFwEBAQ?=
Received: from esa2.dell-outbound2.iphmx.com ([68.232.153.202])
 by esa5.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2018 17:10:04 -0600
From: <Michael.E.Brown@dell.com>
Received: from ausxippc101.us.dell.com ([143.166.85.207])
 by esa2.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2018 05:09:22 +0600
X-LoopCount0: from 10.166.136.212
X-IronPort-AV: E=Sophos;i="5.47,398,1515477600"; 
 d="scan'208,223";a="1057016014"
X-DLP: DLP_GlobalPCIDSS
To: <openbmc@lists.ozlabs.org>
Subject: OpenBMC Redfish Working Group - meeting times open discussion
Thread-Topic: OpenBMC Redfish Working Group - meeting times open discussion
Thread-Index: AdOvV+OBJ9z2ISIITSyVrtwYEMVvIg==
Date: Mon, 26 Feb 2018 23:16:55 +0000
Message-ID: <5213c491520645a3931dda63b4cac71c@ausx13mps334.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
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
X-List-Received-Date: Mon, 26 Feb 2018 23:17:00 -0000

From the first working group meeting, one discussion item was the meeting t=
ime. We had decided last week to host the inaugural meeting at 4pm CST on F=
eb 26. We are intending to continue holding meetings on Monday at 4pm CST g=
oing forward.

We had representation from Microsoft, Intel, Dell, and some IBM folks on th=
e call today. It seems to work reasonably well at this time. Is there anybo=
dy that really must be part of this working group who cannot make this time=
 work and needs us to change the meeting time? This is the chance for open =
discussion on this topic.
--
Michael
