Return-Path: <Justin.Lee1@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.95; helo=esa5.dell-outbound.iphmx.com;
 envelope-from=justin.lee1@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="V+6k4qKV"; 
 dkim-atps=neutral
Received: from esa5.dell-outbound.iphmx.com (esa5.dell-outbound.iphmx.com
 [68.232.153.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42sDZ34864zF3hR
 for <openbmc@lists.ozlabs.org>; Sat, 10 Nov 2018 08:58:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1541800707; x=1573336707;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GEQgaOO978I6jOnFcReRFsCI0kFW1ZcuudVOrvtL+EY=;
 b=V+6k4qKV7QFuRuaLk38zisFn7LvIDRzGIe7LHrbJzhcrjO0kBOJCi1AZ
 IM2BEHR+Bh9yo62O0cM2I8Q+gtMUxSX9bvM5EbK1KoHbap76gNiJIX+99
 FKeMyVs7+WJpRRxX0m9t+FnI9oz2BNWwgLDc65/tKIxQ2jCtxOdWpxHjf c=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FMAADEAeZbhiWd50NjHAEBAQQBAQc?=
 =?us-ascii?q?EAQGBUQcBAQsBgVWCFicKg26IGF+LHIINg0KTcBSBZgsBAYRsAheDDiI0DQ0?=
 =?us-ascii?q?BAwEBAgEBAgEBAhABAQEKCQsIKS+CNiKCYwEBAQECARIRBA0zEgULAgEIEQM?=
 =?us-ascii?q?BAgMCJgICAkUICAIEAQ0FCBqCfwGBeQicJQKBEIlYAQEBbnsziiSBC4pxghe?=
 =?us-ascii?q?BEYMShGcugm2CVwKBKgGNV5BKBgECihoFgxaDXCCBeY51l0oCBAIEBQIUgUO?=
 =?us-ascii?q?CDnCBboFOgicOCRKOCkABMYtwgR8BAQ?=
X-IPAS-Result: =?us-ascii?q?A2FMAADEAeZbhiWd50NjHAEBAQQBAQcEAQGBUQcBAQsBg?=
 =?us-ascii?q?VWCFicKg26IGF+LHIINg0KTcBSBZgsBAYRsAheDDiI0DQ0BAwEBAgEBAgEBA?=
 =?us-ascii?q?hABAQEKCQsIKS+CNiKCYwEBAQECARIRBA0zEgULAgEIEQMBAgMCJgICAkUIC?=
 =?us-ascii?q?AIEAQ0FCBqCfwGBeQicJQKBEIlYAQEBbnsziiSBC4pxgheBEYMShGcugm2CV?=
 =?us-ascii?q?wKBKgGNV5BKBgECihoFgxaDXCCBeY51l0oCBAIEBQIUgUOCDnCBboFOgicOC?=
 =?us-ascii?q?RKOCkABMYtwgR8BAQ?=
Received: from mx0b-00154901.pphosted.com ([67.231.157.37])
 by esa5.dell-outbound.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Nov 2018 15:58:24 -0600
Received: from pps.filterd (m0134318.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wA9Lr6XZ172457
 for <openbmc@lists.ozlabs.org>; Fri, 9 Nov 2018 16:58:47 -0500
Received: from esa6.dell-outbound2.iphmx.com (esa6.dell-outbound2.iphmx.com
 [68.232.154.99])
 by mx0a-00154901.pphosted.com with ESMTP id 2nh6acmus7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Nov 2018 16:58:47 -0500
From: <Justin.Lee1@Dell.com>
Received: from ausxipps306.us.dell.com ([143.166.148.156])
 by esa6.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 10 Nov 2018 03:58:45 +0600
X-LoopCount0: from 10.166.135.92
X-IronPort-AV: E=Sophos;i="5.54,484,1534827600"; d="scan'208";a="236777460"
To: <sam@mendozajonas.com>, <netdev@vger.kernel.org>
CC: <davem@davemloft.net>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH net-next v3 6/6] net/ncsi: Configure multi-package,
 multi-channel modes with failover
Thread-Topic: [PATCH net-next v3 6/6] net/ncsi: Configure multi-package,
 multi-channel modes with failover
Thread-Index: AQHUdw3T7sTeKH7RI0a85rjfghKYaaVGRmNggADUx4CAANRBEA==
Date: Fri, 9 Nov 2018 21:58:44 +0000
Message-ID: <b2c6aea94f1648648dd349d23ce61bf6@AUSX13MPS302.AMER.DELL.COM>
References: <20181108024909.9897-1-sam@mendozajonas.com>
 <20181108024909.9897-7-sam@mendozajonas.com>
 <f9d0309dafe248a6aac8198f96f9bc4b@AUSX13MPS306.AMER.DELL.COM>
 <ce6a678b1a0673050bc8070cb99dd68d1929c227.camel@mendozajonas.com>
In-Reply-To: <ce6a678b1a0673050bc8070cb99dd68d1929c227.camel@mendozajonas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-09_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1811090195
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Nov 2018 21:58:53 -0000

SGkgU2FtdWVsLA0KDQpBZnRlciBydW5uaW5nIG1vcmUgdGVzdGluZywgSSBub3RpY2UgdGhhdCB0
aGUgZXh0cmEgcGF0Y2ggY2F1c2luZyBmYWlsb3ZlciBmdW5jdGlvbg0KdG8gZmFpbC4gQWxzbywg
b2NjYXNpb25hbGx5LCBJIHdpbGwgc2VlIHR3byBjaGFubmVscyBoYXZpbmcgVFggZW5hYmxlZCBp
ZiBJDQpzZW5kIG5ldGxpbmsgY29tbWFuZCBiYWNrLXRvLWJhY2suDQoNCmNhdCAvc3lzL2tlcm5l
bC9kZWJ1Zy9uY3NpX3Byb3RvY29sL25jc2lfZGV2aWNlXw0KSUZJRFggSUZOQU1FIE5BTUUgICBQ
SUQgQ0lEIFJYIFRYIE1QIE1DIFdQIFdDIFBDIENTIFBTIExTIFJVIENSIE5RIEhBDQo9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0NCiAgMiAgIGV0aDIgICBuY3NpMCAgMDAwIDAwMCAxICAxICAxICAxICAxICAxICAxICAy
ICAxICAxICAxICAxICAwICAxDQogIDIgICBldGgyICAgbmNzaTEgIDAwMCAwMDEgMSAgMSAgMSAg
MSAgMSAgMSAgMCAgMiAgMSAgMSAgMSAgMSAgMCAgMQ0KICAyICAgZXRoMiAgIG5jc2kyICAwMDEg
MDAwIDAgIDAgIDEgIDEgIDAgIDAgIDAgIDEgIDAgIDEgIDEgIDEgIDAgIDENCiAgMiAgIGV0aDIg
ICBuY3NpMyAgMDAxIDAwMSAwICAwICAxICAxICAwICAwICAwICAxICAwICAxICAxICAxICAwICAx
DQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0NCk1QOiBNdWx0aS1tb2RlIFBhY2thZ2UgIFdQOiBXaGl0ZWxpc3QgUGFj
a2FnZQ0KTUM6IE11bHRpLW1vZGUgQ2hhbm5lbCAgV0M6IFdoaXRlbGlzdCBDaGFubmVsDQpQQzog
UHJpbWFyeSBDaGFubmVsICAgICBDUzogQ2hhbm5lbCBTdGF0ZSBJQS9BL0lWIDEvMi8zDQpQUzog
UG9sbCBTdGF0dXMgICAgICAgICBMUzogTGluayBTdGF0dXMNClJVOiBSdW5uaW5nICAgICAgICAg
ICAgIENSOiBDYXJyaWVyIE9LDQpOUTogUXVldWUgU3RvcHBlZCAgICAgICBIQTogSGFyZHdhcmUg
QXJiaXRyYXRpb24NCg0KVGhhbmtzLA0KSnVzdGluDQoNCg0KPiBGcm9tIDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQo+IEZy
b206IFNhbXVlbCBNZW5kb3phLUpvbmFzIDxzYW1AbWVuZG96YWpvbmFzLmNvbT4NCj4gRGF0ZTog
RnJpLCA5IE5vdiAyMDE4IDEzOjExOjAzICsxMTAwDQo+IFN1YmplY3Q6IFtQQVRDSF0gbmV0L25j
c2k6IFJlc2V0IHN0YXRlIGZpeGVzLCBzaW5nbGUtY2hhbm5lbCBMU0MNCj4gDQo+IC0tLQ0KPiAg
bmV0L25jc2kvbmNzaS1hZW4uYyAgICB8ICA4ICsrKysrLS0tDQo+ICBuZXQvbmNzaS9uY3NpLW1h
bmFnZS5jIHwgMTkgKysrKysrKysrKysrKysrLS0tLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMCBp
bnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL25ldC9uY3Np
L25jc2ktYWVuLmMgYi9uZXQvbmNzaS9uY3NpLWFlbi5jDQo+IGluZGV4IDM5YzJlOWVlYTJiYS4u
MDM0Y2IxZGM1NTY2IDEwMDY0NA0KPiAtLS0gYS9uZXQvbmNzaS9uY3NpLWFlbi5jDQo+ICsrKyBi
L25ldC9uY3NpL25jc2ktYWVuLmMNCj4gQEAgLTkzLDE0ICs5MywxNiBAQCBzdGF0aWMgaW50IG5j
c2lfYWVuX2hhbmRsZXJfbHNjKHN0cnVjdCBuY3NpX2Rldl9wcml2ICpuZHAsDQo+ICAJaWYgKCho
YWRfbGluayA9PSBoYXNfbGluaykgfHwgY2hhaW5lZCkNCj4gIAkJcmV0dXJuIDA7DQo+ICANCj4g
LQlpZiAoIW5kcC0+bXVsdGlfcGFja2FnZSAmJiAhbmMtPnBhY2thZ2UtPm11bHRpX2NoYW5uZWwp
IHsNCj4gLQkJaWYgKGhhZF9saW5rKQ0KPiAtCQkJbmRwLT5mbGFncyB8PSBOQ1NJX0RFVl9SRVNI
VUZGTEU7DQo+ICsJaWYgKCFuZHAtPm11bHRpX3BhY2thZ2UgJiYgIW5jLT5wYWNrYWdlLT5tdWx0
aV9jaGFubmVsICYmIGhhZF9saW5rKSB7DQo+ICsJCW5kcC0+ZmxhZ3MgfD0gTkNTSV9ERVZfUkVT
SFVGRkxFOw0KPiAgCQluY3NpX3N0b3BfY2hhbm5lbF9tb25pdG9yKG5jKTsNCj4gIAkJc3Bpbl9s
b2NrX2lycXNhdmUoJm5kcC0+bG9jaywgZmxhZ3MpOw0KPiAgCQlsaXN0X2FkZF90YWlsX3JjdSgm
bmMtPmxpbmssICZuZHAtPmNoYW5uZWxfcXVldWUpOw0KPiAgCQlzcGluX3VubG9ja19pcnFyZXN0
b3JlKCZuZHAtPmxvY2ssIGZsYWdzKTsNCj4gIAkJcmV0dXJuIG5jc2lfcHJvY2Vzc19uZXh0X2No
YW5uZWwobmRwKTsNCj4gKwl9IGVsc2Ugew0KPiArCQkvKiBDb25maWd1cmVkIGNoYW5uZWwgY2Ft
ZSB1cCAqLw0KPiArCQlyZXR1cm4gMDsNCg0KSXQgaXMgYWx3YXlzIGdvaW5nIHRvIGVsc2Ugc3Rh
dGVtZW50IGlmIG11bHRpX3BhY2thZ2UgYW5kL29yIG11dGxpdF9jaGFubmVsIGlzIGVuYWJsZWQu
DQogDQpucGNtN3h4LWVtYyBmMDgyNTAwMC5ldGggZXRoMjogTkNTSTogbmNzaV9hZW5faGFuZGxl
cl9sc2MoKSAtIHBrZyAwIGNoIDAgc3RhdGUgZG93bg0KbnBjbTd4eC1lbWMgZjA4MjUwMDAuZXRo
IGV0aDI6IE5DU0k6IG5jc2lfYWVuX2hhbmRsZXJfbHNjKCkgLSBoYWRfbGluayAxLCBoYXNfbGlu
ayAwLCBjaGFpbmVkIDANCg0KVGhlc2UgY29kZXMgaGF2ZSBubyBjaGFuY2UgdG8gcnVuLg0KCWlm
IChoYWRfbGluaykgew0KCQluY20gPSAmbmMtPm1vZGVzW05DU0lfTU9ERV9UWF9FTkFCTEVdOw0K
CQlpZiAobmNzaV9jaGFubmVsX2lzX2xhc3QobmRwLCBuYykpIHsNCgkJCS8qIE5vIGNoYW5uZWxz
IGxlZnQsIHJlY29uZmlndXJlICovDQoJCQlyZXR1cm4gbmNzaV9yZXNldF9kZXYoJm5kcC0+bmRl
dik7DQoJCX0gZWxzZSBpZiAobmNtLT5lbmFibGUpIHsNCgkJCS8qIE5lZWQgdG8gZmFpbG92ZXIg
VHggY2hhbm5lbCAqLw0KCQkJbmNzaV91cGRhdGVfdHhfY2hhbm5lbChuZHAsIG5jLT5wYWNrYWdl
LCBuYywgTlVMTCk7DQoJCX0NCg0KPiAgCX0NCj4NCg==
