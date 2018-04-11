Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.95; helo=esa5.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="GisL5h1M"; 
 dkim-atps=neutral
Received: from esa5.dell-outbound.iphmx.com (esa5.dell-outbound.iphmx.com
 [68.232.153.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Ls6J3nhrzDrqP
 for <openbmc@lists.ozlabs.org>; Thu, 12 Apr 2018 03:51:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1523468680; x=1555004680; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=K+1GPf1opjvk7cBA8Gq/TK1phmMo45zRLxUrWP21lYc=;
 b=GisL5h1MyeuKEt5cCKL6tc5gfl30h5U6eRTr52f1PiyDLKBdK/dvSXRl
 /+CeSDc8UHGKfbEJC22jbTcD0tKrG+QGtClRxAwX/peZ0MOKQ6NAfWG1y
 nMuwg3/0qVhOGM5hIl0kw+EJE+N2rEbX9FNhKpCmN19A7B8/BSp7kbk7p k=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2E+AABmSs5ah8qZ6ERcGgEBAQEBAgEBA?=
 =?us-ascii?q?QEIAQEBAYQVfTKLWY0SgwNfiy+GU4F6C4dWITQYAQIBAQEBAQECAQECEAEBAQo?=
 =?us-ascii?q?LCQgoNoI1IoMNUQE+aAEEARqFBaliiEWCH4dwghOIaYVqAodNkA8ICYErjHuMT?=
 =?us-ascii?q?JAPgSUcggtwgxOCLY4gjlmBFwEB?=
X-IPAS-Result: =?us-ascii?q?A2E+AABmSs5ah8qZ6ERcGgEBAQEBAgEBAQEIAQEBAYQVfTK?=
 =?us-ascii?q?LWY0SgwNfiy+GU4F6C4dWITQYAQIBAQEBAQECAQECEAEBAQoLCQgoNoI1IoMNU?=
 =?us-ascii?q?QE+aAEEARqFBaliiEWCH4dwghOIaYVqAodNkA8ICYErjHuMTJAPgSUcggtwgxO?=
 =?us-ascii?q?CLY4gjlmBFwEB?=
Received: from esa2.dell-outbound2.iphmx.com ([68.232.153.202])
 by esa5.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2018 12:44:37 -0500
From: <Michael.E.Brown@dell.com>
Received: from ausxipps301.us.dell.com ([143.166.148.223])
 by esa2.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2018 23:43:51 +0600
X-LoopCount0: from 10.166.136.211
X-IronPort-AV: E=Sophos;i="5.48,437,1517896800"; d="scan'208";a="164762771"
X-DLP: DLP_GlobalPCIDSS
To: <ed.tanous@intel.com>, <openbmc@lists.ozlabs.org>
Subject: Meeting minutes 4/9 - RE: OpenBMC Redfish working group working call
Thread-Topic: Meeting minutes 4/9 - RE: OpenBMC Redfish working group working
 call
Thread-Index: AdPRvaPz3lT5cua/S7Cr39XBoLyclQ==
Date: Wed, 11 Apr 2018 17:51:15 +0000
Message-ID: <8c5994c2e364440088e73d9084dc5505@ausx13mps334.AMER.DELL.COM>
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
X-List-Received-Date: Wed, 11 Apr 2018 17:51:21 -0000

Meeting minutes 4/9:
- Submission of redfish implementation to the openbmc project as separate, =
distinct recipes
- Add virtual provides to allow selection of which redfish implementation t=
o use in a build
	o Named: virtual/redfish
	o People select the implementation at build time using PREFERRED_PROVIDER_=
virtual/redfish
- Action:
	o Dell to submit gerrit code reviews to add python redfish, go redfish
	o AMI to submit lua-jit implementation (?) - AMI team has indicated that t=
hey intend to submit
- Open question:
	o Mix and match redfish and GUI, how do we do that?
	o Proposal:
		* One front end web server and micro-services as reverse proxy
		* Authentication - outlier: should we standardize
		* Can we come up with a way to mix and match and have standardized
		* Service discovery
		* Basically a subset of the API gateway problem
		* Observation by Paul V: redfish auth is "special" (short-bus) and is not=
 really the same as normal oauth token or other token auth types and might =
be easiest to always have redfish do its own auth.=20
