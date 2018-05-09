Return-Path: <Lakesh.Sharma@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.96; helo=esa7.dell-outbound.iphmx.com;
 envelope-from=lakesh.sharma@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="DiVsmAyy"; 
 dkim-atps=neutral
X-Greylist: delayed 713 seconds by postgrey-1.36 at bilbo;
 Thu, 10 May 2018 08:06:30 AEST
Received: from esa7.dell-outbound.iphmx.com (esa7.dell-outbound.iphmx.com
 [68.232.153.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40h9Rp3XKJzF2Rm
 for <openbmc@lists.ozlabs.org>; Thu, 10 May 2018 08:06:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1525903557; x=1557439557; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=VIDtNYPd93qAG60ICA5ZlFeNKhocN82tvwuR/FeqGOM=;
 b=DiVsmAyyIcXHdmAZ3fHqLUnDMMVhrmsTuyVBX+PyUAatkLZZAjGtFfn1
 5uByApp5awBuaUJe26rpBZswDsumb9l2uqEzZuf6r5e2tYKJO7zp67Nw4
 XW+erCiGjJy9Oxt1n0P/6gfoHMvveiQ8uQ1Hu4VOWb6kVHTN3QXB7zC/0 I=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GDAgAxbfNah8qZ6ERcHAEBAQQBAQoBA?=
 =?us-ascii?q?YQWgQgymFeDCF+UQwuHXCE4FAECAQEBAQEBAgEBAhABAQEKCwkIKC+CNSKDFFE?=
 =?us-ascii?q?BPmkEG4MbggGsGohGgkiIJYIThVuDfoUIAoc8kHAIjkeBLwGLO5BPgSUzgXRwg?=
 =?us-ascii?q?xSBbAFAjiCQe4EYAQE?=
X-IPAS-Result: =?us-ascii?q?A2GDAgAxbfNah8qZ6ERcHAEBAQQBAQoBAYQWgQgymFeDCF+?=
 =?us-ascii?q?UQwuHXCE4FAECAQEBAQEBAgEBAhABAQEKCwkIKC+CNSKDFFEBPmkEG4MbggGsG?=
 =?us-ascii?q?ohGgkiIJYIThVuDfoUIAoc8kHAIjkeBLwGLO5BPgSUzgXRwgxSBbAFAjiCQe4E?=
 =?us-ascii?q?YAQE?=
Received: from esa2.dell-outbound2.iphmx.com ([68.232.153.202])
 by esa7.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 May 2018 16:45:06 -0500
From: <Lakesh.Sharma@dell.com>
Received: from ausxippc101.us.dell.com ([143.166.85.207])
 by esa2.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 May 2018 03:53:57 +0600
X-LoopCount0: from 10.166.132.56
X-IronPort-AV: E=Sophos;i="5.49,382,1520917200"; d="scan'208";a="1085501078"
X-DLP: DLP_GlobalPCIDSS
To: <openbmc@lists.ozlabs.org>
Subject: Aspeed AST2520 support in openbmc
Thread-Topic: Aspeed AST2520 support in openbmc
Thread-Index: AQHT5+BPanqUYFMLpkGTItPgQuhwGg==
Date: Wed, 9 May 2018 21:54:32 +0000
Message-ID: <495148e9d2b74b00b2fc6e5eedf13cc3@ausx13mpc109.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 14 May 2018 11:20:38 +1000
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
X-List-Received-Date: Wed, 09 May 2018 22:06:31 -0000


Hello

I Aspeed AST2520 supported by openbmc ?
I don't see it in  folder meta-openbmc-machines/meta-arm

regards
lakesh=
