Return-Path: <B.B.Singh@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.220; helo=esa2.dell-outbound.iphmx.com;
 envelope-from=b.b.singh@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="Km3yooc5"; 
 dkim-atps=neutral
Received: from esa2.dell-outbound.iphmx.com (esa2.dell-outbound.iphmx.com
 [68.232.149.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41BJpq5xxJzF0x4
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jun 2018 21:08:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1529579316; x=1561115316;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Wj0uIvy4i03VsXUei405cl+DCj72NiNkhvE32cwpuHg=;
 b=Km3yooc5rSO1gmEW/eV5O+Fm3h+dO8IvYwSTJYQyP9Uc7T+sBQyfNrXn
 2rE86zmw6YtoKwc3SycWlzzBs8Az04Zqq+vy7QQ17KVkW0RzbOcF94snF
 riGhncgDKlcQJdoDMJixSuFeUYVMT1sZDTY8jbYE59cQCh4V9ECyfg9g2 o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EfBADehitbh2Oa6ERbGgEBAQEBAgEBA?=
 =?us-ascii?q?QEIAQEBAYVSCoNvlEImgV+BcpUHCxgUhEACF4JlITgUAQIBAQEBAQECAQECEAE?=
 =?us-ascii?q?BAQoLCQgpL4I1IoJTAQEBAwEBIhFVAgEIEQQBAQMCIwMCAgImHgEICAIEARIIg?=
 =?us-ascii?q?x2BeAcBqiqCHIhGbQkBgQGHSYITg3AugxgEhF+CVQKHfJEqBwKLJYNjgUeEAYg?=
 =?us-ascii?q?BkWCBWIF0cIM3gi+OIG8BgRSNfQGBGQEB?=
X-IPAS-Result: =?us-ascii?q?A2EfBADehitbh2Oa6ERbGgEBAQEBAgEBAQEIAQEBAYVSCoN?=
 =?us-ascii?q?vlEImgV+BcpUHCxgUhEACF4JlITgUAQIBAQEBAQECAQECEAEBAQoLCQgpL4I1I?=
 =?us-ascii?q?oJTAQEBAwEBIhFVAgEIEQQBAQMCIwMCAgImHgEICAIEARIIgx2BeAcBqiqCHIh?=
 =?us-ascii?q?GbQkBgQGHSYITg3AugxgEhF+CVQKHfJEqBwKLJYNjgUeEAYgBkWCBWIF0cIM3g?=
 =?us-ascii?q?i+OIG8BgRSNfQGBGQEB?=
Received: from esa6.dell-outbound2.iphmx.com ([68.232.154.99])
 by esa2.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jun 2018 06:08:10 -0500
From: <B.B.Singh@dell.com>
Received: from ausxippc101.us.dell.com ([143.166.85.207])
 by esa6.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jun 2018 17:08:10 +0600
X-LoopCount0: from 10.166.134.87
X-IronPort-AV: E=Sophos;i="5.51,251,1526360400"; d="scan'208";a="1100676235"
X-DLP: DLP_GlobalPCIDSS
To: <akashgj91@gmail.com>, <openbmc@lists.ozlabs.org>
Subject: RE: Unable to use ipmitool in OpenBMC Linux
Thread-Topic: Unable to use ipmitool in OpenBMC Linux
Thread-Index: AQHUCUmoNHTWIoeM80iWySqcM+NhF6RqibDA
Date: Thu, 21 Jun 2018 11:08:06 +0000
Message-ID: <d7dd04fed035470097a5f47483e5a9d4@BLRX13MDC413.AMER.DELL.COM>
References: <CAE33tLHe9TnUaphWhBv6THyExHZJrr_aS+wQJnHowE7gKxdfCw@mail.gmail.com>
In-Reply-To: <CAE33tLHe9TnUaphWhBv6THyExHZJrr_aS+wQJnHowE7gKxdfCw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titusconfig: No Restrictions 04051212
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvIiwiaWQiOiIwOWFmOTI5NC0zNDVjLTQ4Y2ItYjliNi0wYTllYzg3YzYxYjIiLCJwcm9wcyI6W3sibiI6IkNsYXNzaWZpY2F0aW9uIiwidmFscyI6W3sidmFsdWUiOiJObyBSZXN0cmljdGlvbnMifV19LHsibiI6IlN1YmxhYmVscyIsInZhbHMiOltdfSx7Im4iOiJFeHRlcm5hbENvcnJlc3BvbmRlbmNlIiwidmFscyI6W119XX0sIlN1YmplY3RMYWJlbHMiOltdLCJUTUNWZXJzaW9uIjoiMTYuMi4xMS4wIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImN1OStrZVNMNVZlR1wvS090dWd0Snh5N2dXUExLdnhjU0w4ais5dUVKMkxzPSJ9
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [163.244.186.30]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 Jun 2018 09:18:43 +1000
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
X-List-Received-Date: Thu, 21 Jun 2018 11:08:37 -0000

DQpIZWxsbyBBa2FzaCwNCg0KUGxlYXNlIHVzZSBkYnVzIGludGVyZmFjZSB3aGlsZSB1c2luZyB0
aGUgaXBtaXRvb2wgaW4gT3BlbkJNQy4NCg0KaXBtaXRvb2wgLUkgZGJ1cyBzZHIgZWxpc3QgZnVs
bA0KDQpSZWdhcmRzDQpCYWxhamkgU2luZ2gNCg0KDQo+PkZyb206IG9wZW5ibWMgW21haWx0bzpv
cGVuYm1jLWJvdW5jZXMrYl9iX3NpbmdoPWRlbGwuY29tQGxpc3RzLm96bGFicy5vcmddIE9uIEJl
aGFsZiBPZiBBS0FTSCBHIEoNCj4+U2VudDogVGh1cnNkYXksIEp1bmUgMjEsIDIwMTggMzo1MSBQ
TQ0KPj5Ubzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+PlN1YmplY3Q6IFVuYWJsZSB0byB1
c2UgaXBtaXRvb2wgaW4gT3BlbkJNQyBMaW51eA0KDQo+PiAgSGkgVGVhbSwNCj4+IEkgYWRkZWQg
aXBtaXRvb2wgaW50byB0aGUgcm9vdCBmaWxlIHN5c3RlbSBvZiBPcGVuQk1DIExpbnV4IGFuZCBi
b290ZWQgaXQuIFdoZW4gSSB0cmllZCB0byBleGVjdXRlIGlwbWkgdG9vbChpbnNpZGUgT3BlbkJN
QyBMaW51eCksIGl0IGlzIHNob3dpbmcgdGhlIGZvbGxvd2luZyBlcnJvci4NCj4+IHJvb3RAemFp
dXM6IyBpcG1pdG9vbCBzZHIgZWxpc3QgZnVsbA0KPj4gQ291bGQgbm90IG9wZW4gZGV2aWNlIGF0
IC9kZXYvaXBtaTAgb3IgL2Rldi9pcG1pLzAgb3IgL2Rldi9pcG1pZGV2LzAuIE5vIHN1Y2ggZmls
ZSBvciBkaXJlY3RvcnkuDQo+PiBQbGVhc2Ugc29tZW9uZSBoZWxwIHRvIHJlc29sdmUgdGhpcy4N
Cg0KDQo=
