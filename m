Return-Path: <kuiying.wang@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42804V4Hd1zF3By
 for <openbmc@lists.ozlabs.org>; Mon, 10 Sep 2018 17:27:34 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2018 00:27:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,355,1531810800"; d="scan'208";a="255880058"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga005.jf.intel.com with ESMTP; 10 Sep 2018 00:27:31 -0700
Received: from fmsmsx124.amr.corp.intel.com (10.18.125.39) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Mon, 10 Sep 2018 00:27:30 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 fmsmsx124.amr.corp.intel.com (10.18.125.39) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Mon, 10 Sep 2018 00:27:30 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.226]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.16]) with mapi id 14.03.0319.002;
 Mon, 10 Sep 2018 15:27:11 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: Andrew Jeffery <andrew@aj.id.au>, Andrew Geissler <geissonator@gmail.com>, 
 Joel Stanley <joel@jms.id.au>
CC: Brad Bishop <bradleyb@fuzziesquirrel.com>, Andrew Geissler
 <geissonator@yahoo.com>, "chunhui.jia@linux.intel.com"
 <chunhui.jia@linux.intel.com>, "kunyi731@gmail.com" <kunyi731@gmail.com>,
 "Mihm, James" <james.mihm@intel.com>, "Tanous, Ed" <ed.tanous@intel.com>,
 "Feist, James" <james.feist@intel.com>, "Jia, Chunhui"
 <chunhui.jia@intel.com>, Patrick Venture <venture@google.com>, "OpenBMC
 Maillist" <openbmc@lists.ozlabs.org>, "Li, Yong B" <yong.b.li@intel.com>,
 "Yang, Cheng C" <cheng.c.yang@intel.com>, "Xu, Qiang" <qiang.xu@intel.com>,
 "Nguyen, Hai V" <hai.v.nguyen@intel.com>
Subject: [PATCH linux dev-4.18] ASPEED: dts: Define the gpio-line-names
 property for aspeed-g5
Thread-Topic: [PATCH linux dev-4.18] ASPEED: dts: Define the gpio-line-names
 property for aspeed-g5
Thread-Index: AdRI1vjLQVksreU2Q5y8MRtOngoCcg==
Date: Mon, 10 Sep 2018 07:27:10 +0000
Message-ID: <959CAFA1E282D14FB901BE9A7BF4E77249E0F1FA@shsmsx102.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2018 07:27:39 -0000

R3Bpby1saW5lLW5hbWVzIHByb3BlcnR5IG9mIGFzcGVlZC1nNSBpcyBub3QgZGVmaW5lZCBpbiB0
aGUgdXBzdHJlYW0gc3VibWlzc2lvbi4NCkl0IGlzIHJlcXVpcmVkIGJ5IG5ldyBncGlvIEFQSSAi
bGludXgvZ3Bpby5oIg0KDQpjb21taXQgOWRmZDcyZmY1ZjYyOGQ3YWFhMTA3Mjg3NTZjZTQyYmQ1
Zjc2OGQ0ZiAoSEVBRCAtPiBkZXYtNC4xOCkNCkF1dGhvcjogS3VpeWluZyBXYW5nIDxrdWl5aW5n
LndhbmdAaW50ZWwuY29tPg0KRGF0ZTogICBGcmkgU2VwIDcgMTg6MDE6NDEgMjAxOCArMDgwMA0K
DQogICAgRGVmaW5lIHRoZSBncGlvLWxpbmUtbmFtZXMgcHJvcGVydHkgZm9yIGFzcGVlZC1nNQ0K
DQogICAgQmFzZWQgb24gYXNwZWVkIEFTVC0yNTAwIERhdGFzaGVldCBzcGVjLCB0aGVyZSBhcmUg
MjMyIGdwaW9zLg0KICAgIFNvIGRlZmluZXMgdGhlIGdwaW8gbGluZSBuYW1lIGZyb20gIkEwIiB0
byAiQUM3Ii4NCg0KICAgIFNpZ25lZC1vZmYtYnk6IEt1aXlpbmcgV2FuZyA8a3VpeWluZy53YW5n
QGludGVsLmNvbT4NCg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNS5k
dHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1LmR0c2kNCmluZGV4IGQ5MmYwNDc5MDdk
ZS4uNmQ2NjRmNGYxNjIxIDEwMDY0NA0KLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1
LmR0c2kNCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNS5kdHNpDQpAQCAtMjY1LDYg
KzI2NSwzNiBAQA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBncGlvLXJhbmdlcyA9
IDwmcGluY3RybCAwIDAgMjIwPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xv
Y2tzID0gPCZzeXNjb24gQVNQRUVEX0NMS19BUEI+Ow0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjsNCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGdwaW8tbGluZS1uYW1lcyA9ICJBMCIsIkExIiwiQTIiLCJBMyIsIkE0IiwiQTUiLCJBNiIs
IkE3IiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJCMCIsIkIxIiwiQjIi
LCJCMyIsIkI0IiwiQjUiLCJCNiIsIkI3IiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJDMCIsIkMxIiwiQzIiLCJDMyIsIkM0IiwiQzUiLCJDNiIsIkM3IiwNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJEMCIsIkQxIiwiRDIiLCJEMyIsIkQ0IiwiRDUi
LCJENiIsIkQ3IiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJFMCIsIkUx
IiwiRTIiLCJFMyIsIkU0IiwiRTUiLCJFNiIsIkU3IiwNCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJGMCIsIkYxIiwiRjIiLCJGMyIsIkY0IiwiRjUiLCJGNiIsIkY3IiwNCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJHMCIsIkcxIiwiRzIiLCJHMyIsIkc0
IiwiRzUiLCJHNiIsIkc3IiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJI
MCIsIkgxIiwiSDIiLCJIMyIsIkg0IiwiSDUiLCJINiIsIkg3IiwNCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJJMCIsIkkxIiwiSTIiLCJJMyIsIkk0IiwiSTUiLCJJNiIsIkk3
IiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJKMCIsIkoxIiwiSjIiLCJK
MyIsIko0IiwiSjUiLCJKNiIsIko3IiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJLMCIsIkUxIiwiRTIiLCJFMyIsIkU0IiwiRTUiLCJFNiIsIkU3IiwNCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICJMMCIsIkwxIiwiTDIiLCJMMyIsIkw0IiwiTDUiLCJM
NiIsIkw3IiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJNMCIsIk0xIiwi
TTIiLCJNMyIsIk00IiwiTTUiLCJNNiIsIk03IiwNCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJOMCIsIk4xIiwiTjIiLCJOMyIsIk40IiwiTjUiLCJONiIsIk43IiwNCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJPMCIsIk8xIiwiTzIiLCJPMyIsIk80Iiwi
TzUiLCJPNiIsIk83IiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJQMCIs
IlAxIiwiUDIiLCJQMyIsIlA0IiwiUDUiLCJQNiIsIlA3IiwNCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJRMCIsIlExIiwiUTIiLCJRMyIsIlE0IiwiUTUiLCJRNiIsIlE3IiwN
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJSMCIsIlIxIiwiUjIiLCJSMyIs
IlI0IiwiUjUiLCJSNiIsIlI3IiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICJTMCIsIlMxIiwiUzIiLCJTMyIsIlM0IiwiUzUiLCJTNiIsIlM3IiwNCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJUMCIsIlQxIiwiVDIiLCJUMyIsIlQ0IiwiVDUiLCJUNiIs
IlQ3IiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJVMCIsIlUxIiwiVTIi
LCJVMyIsIlU0IiwiVTUiLCJVNiIsIlU3IiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJWMCIsIlYxIiwiVjIiLCJWMyIsIlY0IiwiVjUiLCJWNiIsIlY3IiwNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJXMCIsIlcxIiwiVzIiLCJXMyIsIlc0IiwiVzUi
LCJXNiIsIlc3IiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJYMCIsIlgx
IiwiWDIiLCJYMyIsIlg0IiwiWDUiLCJYNiIsIlg3IiwNCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJZMCIsIlkxIiwiWTIiLCJZMyIsIlk0IiwiWTUiLCJZNiIsIlk3IiwNCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJaMCIsIloxIiwiWjIiLCJaMyIsIlo0
IiwiWjUiLCJaNiIsIlo3IiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJB
QTAiLCJBQTEiLCJBQTIiLCJBQTMiLCJBQTQiLCJBQTUiLCJBQTYiLCJBQTciLA0KKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIkFCMCIsIkFCMSIsIkFCMiIsIkFCMyIsIkFCNCIs
IkFCNSIsIkFCNiIsIkFCNyIsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
QUMwIiwiQUMxIiwiQUMyIiwiQUMzIiwiQUM0IiwiQUM1IiwiQUM2IiwiQUM3Ig0KKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgOw0KICAgICAgICAgICAgICAgICAgICAgICAgfTsNCg0KVGhh
bmtzLA0KS3VpeWluZy4NCg==
