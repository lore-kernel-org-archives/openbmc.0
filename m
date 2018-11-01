Return-Path: <Justin.Lee1@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.214; helo=esa4.dell-outbound.iphmx.com;
 envelope-from=justin.lee1@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="aDzMVEOi"; 
 dkim-atps=neutral
Received: from esa4.dell-outbound.iphmx.com (esa4.dell-outbound.iphmx.com
 [68.232.149.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42m8pC2MCRzF3GW
 for <openbmc@lists.ozlabs.org>; Fri,  2 Nov 2018 02:51:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1541087507; x=1572623507;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kVmrE+VioMKW8XVo/pAHR9w8QFqiwwbDWLc3uytddkA=;
 b=aDzMVEOi746NrAWCXtIyZYNykLFXjBP/mca+dPhABXoVJiyydJWabK05
 5CwBonz98QQoEV6BHSnXEhpNpzp1Z8TlS4Rp+dGnxE+iGaedXWU45fQh2
 LySwzN/MAhcOWZVvfpEM+HIsPKL0UQnoOTvi+7v0N/XjyUN0XtoD8P+K4 Y=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FbAAAtINtbhyWd50NkHAEBAQQBAQc?=
 =?us-ascii?q?EAQGBUgYBAQsBg1cSMoNsiHeNRIF4gUiTaxSBZgsBAYRsAheDRzUMDQEDAQE?=
 =?us-ascii?q?CAQECAQECEAEBAQoLCQgpL4I2IoJjAQEBAQIBEhEEDTMSBQsCAQgaAiYCAgJ?=
 =?us-ascii?q?FEAIEAQ0NGoJ/gXoInRwCgRCJWAEBAW17M4oegQuMeIEQAYMShGcugm2CVwK?=
 =?us-ascii?q?BKgGNR5AwBgECkQIgkFMslmQCBAIEBQIUgUUDgglwgW6BT4IlDgmOGosXgR8?=
 =?us-ascii?q?BAQ?=
X-IPAS-Result: =?us-ascii?q?A2FbAAAtINtbhyWd50NkHAEBAQQBAQcEAQGBUgYBAQsBg?=
 =?us-ascii?q?1cSMoNsiHeNRIF4gUiTaxSBZgsBAYRsAheDRzUMDQEDAQECAQECAQECEAEBA?=
 =?us-ascii?q?QoLCQgpL4I2IoJjAQEBAQIBEhEEDTMSBQsCAQgaAiYCAgJFEAIEAQ0NGoJ/g?=
 =?us-ascii?q?XoInRwCgRCJWAEBAW17M4oegQuMeIEQAYMShGcugm2CVwKBKgGNR5AwBgECk?=
 =?us-ascii?q?QIgkFMslmQCBAIEBQIUgUUDgglwgW6BT4IlDgmOGosXgR8BAQ?=
Received: from mx0b-00154901.pphosted.com (HELO mx0a-00154901.pphosted.com)
 ([67.231.157.37])
 by esa4.dell-outbound.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Nov 2018 10:51:42 -0500
Received: from pps.filterd (m0089484.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wA1FhYG5048343
 for <openbmc@lists.ozlabs.org>; Thu, 1 Nov 2018 11:51:41 -0400
Received: from esa2.dell-outbound2.iphmx.com (esa2.dell-outbound2.iphmx.com
 [68.232.153.202])
 by mx0b-00154901.pphosted.com with ESMTP id 2ng2ja8rgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Thu, 01 Nov 2018 11:51:41 -0400
From: <Justin.Lee1@Dell.com>
Received: from ausxippc101.us.dell.com ([143.166.85.207])
 by esa2.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 01 Nov 2018 21:51:38 +0600
X-LoopCount0: from 10.166.135.91
X-IronPort-AV: E=Sophos;i="5.54,452,1534827600"; d="scan'208";a="1156321302"
To: <sam@mendozajonas.com>, <netdev@vger.kernel.org>
CC: <davem@davemloft.net>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH net-next v2 5/6] net/ncsi: Reset channel state in
 ncsi_start_dev()
Thread-Topic: [PATCH net-next v2 5/6] net/ncsi: Reset channel state in
 ncsi_start_dev()
Thread-Index: AQHUaxq5zixhV1A3m0GL9JnkLZs93aUxueYwgAWRLwCAANjoYIACkOYAgABnWEA=
Date: Thu, 1 Nov 2018 15:51:33 +0000
Message-ID: <871d00996c574b62a30a3ad4f2218e4a@AUSX13MPS306.AMER.DELL.COM>
References: <20181023215201.27315-1-sam@mendozajonas.com>
 <20181023215201.27315-6-sam@mendozajonas.com>
 <d6172566ffe94dec83c1026108e24c98@AUSX13MPS306.AMER.DELL.COM>
 <b0fd357b1fc4b9aed6300019557dc8a391ecf52d.camel@mendozajonas.com>
 <2be6038ad8cb43559495e6f84e97b8a6@AUSX13MPS306.AMER.DELL.COM>
 <8004d6c236582253a82004ce72425b45f09d7d56.camel@mendozajonas.com>
In-Reply-To: <8004d6c236582253a82004ce72425b45f09d7d56.camel@mendozajonas.com>
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
 definitions=2018-11-01_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1811010134
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
X-List-Received-Date: Thu, 01 Nov 2018 15:51:49 -0000

DQo+IEZvciB5b3VyIHRyYWNlIGJlbG93IGNhbiB5b3Ugc2hhcmUgZXhhY3RseSB3aGljaCBjb21t
YW5kcyB5b3Ugd2VyZQ0KPiBzZW5kaW5nPyBUaG9zZSBtZXNzYWdlcyBhcmVuJ3QgdXBzdHJlYW0g
c28gaXQncyBub3QgMTAwJSBjbGVhciB3aGF0J3MNCj4gYmVpbmcgc2VudC4NCj4gDQo+IFRoYW5r
cyENCj4gU2FtDQo+IA0KDQpJdCBpcyBzZW5kaW5nIHZpYSBuZXRsaW5rIGRpcmVjdGx5LiBJIGhh
dmUgdHdvIHBhY2thZ2VzICgwIGFuZCAxKSBhbmQgZWFjaCBwYWNrYWdlIGhhcw0KdHdvIGNoYW5u
ZWxzICgwIGFuZCAxKSBvbiBteSBzeXN0ZW0uIElmIEkgY29udmVydCBpdCB0byBjb21tYW5kIGxp
bmUsIGl0IHdvdWxkIGJlDQphcyBiZWxvdy4NCg0KL2hvbWUvcm9vdCMgbmNzaV9uZXRsaW5rIC1s
IDIgLW0gLWEgMHgwMQ0KU2V0IGNtZCAtIGlmaW5kZXggMiwgbXVsdGkgMSwgbWFzayAweDAwMDAw
MDAxDQoNCi9ob21lL3Jvb3QjIG5jc2lfbmV0bGluayAtbCAyIC1tIC1iIDB4MDMgLXAgMA0KU2V0
IGNtZCAtIGlmaW5kZXggMiwgcGFja2FnZSAwLCBjaGFubmVsIC0xLCBtdWx0aSAxLCBtYXNrIDB4
MDAwMDAwMDMNCg0KL2hvbWUvcm9vdCMgbmNzaV9uZXRsaW5rIC1sIDIgLW0gLWIgMHgwMCAtcCAx
DQpTZXQgY21kIC0gaWZpbmRleCAyLCBwYWNrYWdlIDEsIGNoYW5uZWwgLTEsIG11bHRpIDEsIG1h
c2sgMHgwMDAwMDAwMA0KDQovaG9tZS9yb290IyBuY3NpX25ldGxpbmsNClVzYWdlOiBuY3NpX25l
dGxpbmsgQ09NTUFORCBbT1BUSU9OXS4uLg0KU2VuZCBtZXNzYWdlcyB0byB0aGUgTkNTSSBkcml2
ZXIgdmlhIE5ldGxpbmsgKDAuNCkNCg0KTWFuZGF0b3J5IGFyZ3VtZW50cyB0byBsb25nIG9wdGlv
bnMgYXJlIG1hbmRhdG9yeSBmb3Igc2hvcnQgb3B0aW9ucyB0b28uDQpDT01NQU5EOg0KICAtaSwg
LS1pbmZvICAgICAgICAgICAgICAgICBEaXNwbGF5IGluZm8gZm9yIHBhY2thZ2VzIGFuZCBjaGFu
bmVscw0KICAtcywgLS1zZXQgICAgICAgICAgICAgICAgICBGb3JjZSB0aGUgdXNhZ2Ugb2YgYSBj
ZXJ0YWluIHBhY2thZ2UvY2hhbm5lbCBjb21iaW5hdGlvbg0KICAteCwgLS1jbGVhciAgICAgICAg
ICAgICAgICBDbGVhciB0aGUgYWJvdmUgc2V0dGluZw0KICAtYSwgLS1wYWNrYWdlLW1hc2sgTUFT
SyAgICBTZXQgcGFja2FnZSBzZWxlY3Rpb24gbWFzaw0KICAtYiwgLS1jaGFubmVsLW1hc2sgTUFT
SyAgICBTZXQgY2hhbm5lbCBzZWxlY3Rpb24gbWFzaw0KICAtbywgLS1jbWQgREFUQTAgW0RBVEEx
XS4uLiBTZW5kIE5DLVNJIGNvbW1hbmQNCiAgLWQsIC0tZGlzY292ZXJ5ICAgICAgICAgICAgUmVx
dWVzdCB0byBkaXNjb3ZlciBwYWNrYWdlcyBhbmQgY2hhbm5lbHMNCiAgLWssIC0tbG9va3VwICAg
ICAgICAgICAgICAgTG9vayB1cCBjaGFubmVsIGlkIG9yIG5hbWUNCiAgLXUsIC0tc3RhdHVzICAg
ICAgICAgICAgICAgRGlzcGxheSBzdGF0dXMNCiAgLWgsIC0taGVscCAgICAgICAgICAgICAgICAg
UHJpbnQgdGhpcyBoZWxwIHRleHQNCg0KT1BUSU9OOg0KICAtbCwgLS1pZmluZGV4IElOREVYICAg
ICAgICBTcGVjaWZ5IHRoZSBpbnRlcmZhY2UgaW5kZXgNCiAgLXAsIC0tcGFja2FnZSBQQUNLQUdF
ICAgICAgUGFja2FnZSBudW1iZXINCiAgLWMsIC0tY2hhbm5lbCBDSEFOTkVMICAgICAgQ2hhbm5l
bCBudW1iZXIgKGFrYS4gcG9ydCBudW1iZXIpDQogIC1uLCAtLWNoYW5uZWwgTkFNRSAgICAgICAg
IENoYW5uZWwgbmFtZSAoYWthLiBuY3NpWCkNCiAgLW0sIC0tbXVsdGktbW9kZSAgICAgICAgICAg
U2V0IG11bHRpLW1vZGUNCg0KRXhhbXBsZTogbmNzaV9uZXRsaW5rIC1sIDIgLS1pbmZvDQoNCg0K
PiA+IA0KPiA+ID4gPiBucGNtN3h4LWVtYyBmMDgyNTAwMC5ldGggZXRoMjogTkNTSTogTXVsdGkt
cGFja2FnZSBlbmFibGVkIG9uIGlmaW5kZXggMiwgbWFzayAweDAwMDAwMDAxDQo+ID4gPiA+IG5w
Y203eHgtZW1jIGYwODI1MDAwLmV0aCBldGgyOiBOQ1NJOiBuY3NpX3N0b3BfY2hhbm5lbF9tb25p
dG9yKCkgLSBwa2cgMCBjaCAwDQo+ID4gPiA+IG5wY203eHgtZW1jIGYwODI1MDAwLmV0aCBldGgy
OiBOQ1NJOiBuY3NpX2Rldl93b3JrKCkNCj4gPiA+ID4gbnBjbTd4eC1lbWMgZjA4MjUwMDAuZXRo
IGV0aDI6IE5DU0k6IG5jc2lfc3VzcGVuZF9jaGFubmVsKCkgLSBwa2cgMCBjaCAwIHN0YXRlIDA0
MDANCj4gPiA+ID4gbnBjbTd4eC1lbWMgZjA4MjUwMDAuZXRoIGV0aDI6IE5DU0k6IHBrZyAwIGNo
IDAgc2V0IGFzIHByZWZlcnJlZCBjaGFubmVsDQo+ID4gPiA+IG5wY203eHgtZW1jIGYwODI1MDAw
LmV0aCBldGgyOiBOQ1NJOiBNdWx0aS1jaGFubmVsIGVuYWJsZWQgb24gaWZpbmRleCAyLCBtYXNr
IDB4MDAwMDAwMDMNCj4gPiA+ID4gbnBjbTd4eC1lbWMgZjA4MjUwMDAuZXRoIGV0aDI6IE5DU0k6
IG5jc2lfc3RvcF9jaGFubmVsX21vbml0b3IoKSAtIHBrZyAwIGNoIDENCj4gPiA+ID4gbnBjbTd4
eC1lbWMgZjA4MjUwMDAuZXRoIGV0aDI6IE5DU0k6IG5jc2lfZGV2X3dvcmsoKQ0KPiA+ID4gPiBu
cGNtN3h4LWVtYyBmMDgyNTAwMC5ldGggZXRoMjogTkNTSTogbmNzaV9zdXNwZW5kX2NoYW5uZWwo
KSAtIHBrZyAwIGNoIDEgc3RhdGUgMDQwMA0KPiA+ID4gPiBucGNtN3h4LWVtYyBmMDgyNTAwMC5l
dGggZXRoMjogTkNTSTogUGFja2FnZSAxIHNldCB0byBhbGwgY2hhbm5lbHMgZGlzYWJsZWQNCj4g
PiA+ID4gbnBjbTd4eC1lbWMgZjA4MjUwMDAuZXRoIGV0aDI6IE5DU0k6IE11bHRpLWNoYW5uZWwg
ZW5hYmxlZCBvbiBpZmluZGV4IDIsIG1hc2sgMHgwMDAwMDAwMA0KPiA+ID4gPiBucGNtN3h4LWVt
YyBmMDgyNTAwMC5ldGggZXRoMjogTkNTSTogbmNzaV9jaG9vc2VfYWN0aXZlX2NoYW5uZWwoKQ0K
PiA+ID4gPiBucGNtN3h4LWVtYyBmMDgyNTAwMC5ldGggZXRoMjogTkNTSTogbmNzaV9jaG9vc2Vf
YWN0aXZlX2NoYW5uZWwoKSAtIHBrZyAwDQo+ID4gPiA+IG5wY203eHgtZW1jIGYwODI1MDAwLmV0
aCBldGgyOiBOQ1NJOiBuY3NpX2Nob29zZV9hY3RpdmVfY2hhbm5lbCgpIC0gcGFzcyBwa2cgd2hp
dGVsaXN0DQo+ID4gPiA+IG5wY203eHgtZW1jIGYwODI1MDAwLmV0aCBldGgyOiBOQ1NJOiBuY3Np
X2Nob29zZV9hY3RpdmVfY2hhbm5lbCgpIC0gY2ggMA0KPiA+ID4gPiBucGNtN3h4LWVtYyBmMDgy
NTAwMC5ldGggZXRoMjogTkNTSTogbmNzaV9jaG9vc2VfYWN0aXZlX2NoYW5uZWwoKSAtIHBhc3Mg
Y2ggd2hpdGVsaXN0DQo+ID4gPiA+IG5wY203eHgtZW1jIGYwODI1MDAwLmV0aCBldGgyOiBOQ1NJ
OiBuY3NpX2Nob29zZV9hY3RpdmVfY2hhbm5lbCgpIC0gc2tpcA0KPiA+ID4gPiBucGNtN3h4LWVt
YyBmMDgyNTAwMC5ldGggZXRoMjogTkNTSTogbmNzaV9jaG9vc2VfYWN0aXZlX2NoYW5uZWwoKSAt
IGNoIDENCj4gPiA+ID4gbnBjbTd4eC1lbWMgZjA4MjUwMDAuZXRoIGV0aDI6IE5DU0k6IG5jc2lf
Y2hvb3NlX2FjdGl2ZV9jaGFubmVsKCkgLSBwYXNzIGNoIHdoaXRlbGlzdA0KPiA+ID4gPiBucGNt
N3h4LWVtYyBmMDgyNTAwMC5ldGggZXRoMjogTkNTSTogbmNzaV9jaG9vc2VfYWN0aXZlX2NoYW5u
ZWwoKSAtIHNraXANCj4gPiA+ID4gbnBjbTd4eC1lbWMgZjA4MjUwMDAuZXRoIGV0aDI6IE5DU0k6
IG5jc2lfY2hvb3NlX2FjdGl2ZV9jaGFubmVsKCkgLSBuZXh0IHBrZw0KPiA+ID4gPiBucGNtN3h4
LWVtYyBmMDgyNTAwMC5ldGggZXRoMjogTkNTSTogbmNzaV9jaG9vc2VfYWN0aXZlX2NoYW5uZWwo
KSAtIHBrZyAxDQo+ID4gPiA+IG5wY203eHgtZW1jIGYwODI1MDAwLmV0aCBldGgyOiBOQ1NJOiBO
byBjaGFubmVsIGZvdW5kIHRvIGNvbmZpZ3VyZSENCj4gPiA+ID4gbnBjbTd4eC1lbWMgZjA4MjUw
MDAuZXRoIGV0aDI6IE5DU0kgaW50ZXJmYWNlIGRvd24NCj4gPiA+ID4gbnBjbTd4eC1lbWMgZjA4
MjUwMDAuZXRoIGV0aDI6IE5DU0k6IG5jc2lfZGV2X3dvcmsoKQ0KPiA+ID4gPiBucGNtN3h4LWVt
YyBmMDgyNTAwMC5ldGggZXRoMjogV3JvbmcgTkNTSSBzdGF0ZSAweDEwMCBpbiB3b3JrcXVldWUN
Cj4gPiA+ID4gDQo+ID4gPiA+IEFsbCBtYXNrcyBhcmUgc2V0IGNvcnJlY3RseSwgYnV0IHlvdSBj
YW4gc2VlIHRoZSBQUyBjb2x1bW4gaXMgbm90IHJpZ2h0IGFuZCBjaGFubmVsIGRvZXNuJ3QNCj4g
PiA+ID4gY29uZmlndXJlIGNvcnJlY3RseS4NCj4gPiA+ID4gDQo+ID4gPiA+IC9zeXMva2VybmVs
L2RlYnVnL25jc2lfcHJvdG9jb2wjIGNhdCBuY3NpX2RldmljZV9zdGF0dXMNCj4gPiA+ID4gSUZJ
RFggSUZOQU1FIE5BTUUgICBQSUQgQ0lEIFJYIFRYIE1QIE1DIFdQIFdDIFBDIFBTIExTIFJVIENS
IE5RIEhBDQo+ID4gPiA+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gPiA+ID4gICAyICAgZXRoMiAgIG5jc2kwICAw
MDAgMDAwIDEgIDEgIDEgIDEgIDEgIDEgIDEgIDAgIDEgIDEgIDEgIDAgIDENCj4gPiA+ID4gICAy
ICAgZXRoMiAgIG5jc2kxICAwMDAgMDAxIDEgIDAgIDEgIDEgIDEgIDEgIDAgIDAgIDEgIDEgIDEg
IDAgIDENCj4gPiA+ID4gICAyICAgZXRoMiAgIG5jc2kyICAwMDEgMDAwIDAgIDAgIDEgIDEgIDAg
IDAgIDAgIDAgIDEgIDEgIDEgIDAgIDENCj4gPiA+ID4gICAyICAgZXRoMiAgIG5jc2kzICAwMDEg
MDAxIDAgIDAgIDEgIDEgIDAgIDAgIDAgIDAgIDEgIDEgIDEgIDAgIDENCj4gPiA+ID4gPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PQ0KPiA+ID4gPiBNUDogTXVsdGktbW9kZSBQYWNrYWdlICAgICBXUDogV2hpdGVsaXN0IFBh
Y2thZ2UNCj4gPiA+ID4gTUM6IE11bHRpLW1vZGUgQ2hhbm5lbCAgICAgV0M6IFdoaXRlbGlzdCBD
aGFubmVsDQo+ID4gPiA+IFBDOiBQcmltYXJ5IENoYW5uZWwNCj4gPiA+ID4gUFM6IFBvbGwgU3Rh
dHVzDQo+ID4gPiA+IExTOiBMaW5rIFN0YXR1cw0KPiA+ID4gPiBSVTogUnVubmluZw0KPiA+ID4g
PiBDUjogQ2FycmllciBPSw0KPiA+ID4gPiBOUTogUXVldWUgU3RvcHBlZA0KPiA+ID4gPiBIQTog
SGFyZHdhcmUgQXJiaXRyYXRpb24NCj4gPiA+ID4gDQo+ID4gPiA+IFBTIGNvbHVtbiBpcyBnZXR0
aW5nIGZyb20gKGludCluYy0+bW9uaXRvci5lbmFibGVkLg0KPiANCj4gDQoNCg0K
