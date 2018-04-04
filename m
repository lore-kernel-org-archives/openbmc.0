Return-Path: <gkeishin@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gkeishin@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40GC2X0n54zF1bH
 for <openbmc@lists.ozlabs.org>; Wed,  4 Apr 2018 14:01:55 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w3441GNb127052
 for <openbmc@lists.ozlabs.org>; Wed, 4 Apr 2018 00:01:53 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2h4pvfrvr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 04 Apr 2018 00:01:52 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Wed, 4 Apr 2018 04:01:42 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 4 Apr 2018 04:01:38 -0000
Received: from us1a3-mail113.a3.dal06.isc4sb.com ([10.146.45.236])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2018040404013860-1477232 ;
 Wed, 4 Apr 2018 04:01:38 +0000 
In-Reply-To: <1522814055.2565730.1325779840.7E853FFA@webmail.messagingengine.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Fwd: [PATCH linux dev-4.13 5/5] pmbus (max31785): Wrap all I2C
 accessors in one-shot failure handlers
From: "George Keishing" <gkeishin@in.ibm.com>
Date: Wed, 4 Apr 2018 04:01:36 +0000
References: <1522814055.2565730.1325779840.7E853FFA@webmail.messagingengine.com>
MIME-Version: 1.0
X-KeepSent: BA20549C:6D4D4D6A-00258265:00160188;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP9 SHF55 October 04, 2017
X-LLNOutbound: False
X-Disclaimed: 14091
X-TNEFEvaluated: 1
Content-Type: multipart/related; boundary="=_related 00160B2765258265_="
x-cbid: 18040404-5101-0000-0000-000009EBC2E4
X-IBM-SpamModules-Scores: BY=0.294037; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.373977; ST=0; TS=0; UL=0; ISC=; MB=0.000152
X-IBM-SpamModules-Versions: BY=3.00008798; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000255; SDB=6.01012808; UDB=6.00516211; IPR=6.00792074; 
 BA=6.00005893; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00020405; XFM=3.00000015;
 UTC=2018-04-04 04:01:40
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-04-04 01:57:42 - 6.00008286
x-cbparentid: 18040404-5102-0000-0000-00002A15D8F4
Message-Id: <OFBA20549C.6D4D4D6A-ON00258265.00160188-65258265.00161EEE@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-04-04_01:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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
X-List-Received-Date: Wed, 04 Apr 2018 04:01:57 -0000

--=_related 00160B2765258265_=
Content-Type: multipart/alternative; boundary="=_alternative 00160B2765258265_="



--=_alternative 00160B2765258265_=
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"

VGVzdCBhbmQgdmVyaWZpZWQgd29ya2luZy4NCg0KVGVzdGVkLWJ5OiBHZW9yZ2UgS2Vpc2hpbmcg
PGdrZWlzaGluQGluLmlibS5jb20+DQoNClRoYW5rcyBhbmQgUmVnYXJkcywNCiAgIEdlb3JnZSBL
ZWlzaGluZw0KICAgSUJNIFN5c3RlbXMgJlRlY2hub2xvZ3kgTGFiLCBGaXJtd2FyZSBEZXZlbG9w
bWVudCwNCuKAnCBUaGVyZSBpc24ndCBlbm91Z2ggdGltZSBpbiBhIGRheSB0byBiZSBsYXp5ISEh
IC7igJ0NCg0KDQoNCg0KDQpGcm9tOiAgIEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+
DQpUbzogICAgIGdrZWlzaGluQGluLmlibS5jb20NCkRhdGU6ICAgMDQvMDQvMjAxOCAwOToyNCBB
TQ0KU3ViamVjdDogICAgICAgIEZ3ZDogW1BBVENIIGxpbnV4IGRldi00LjEzIDUvNV0gcG1idXMg
KG1heDMxNzg1KTogV3JhcCBhbGwgDQpJMkMgYWNjZXNzb3JzIGluIG9uZS1zaG90IGZhaWx1cmUg
aGFuZGxlcnMNCg0KDQoNCg0KDQotLS0tLSBPcmlnaW5hbCBtZXNzYWdlIC0tLS0tDQpGcm9tOiBB
bmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1Pg0KVG86IGpvZWxAam1zLmlkLmF1DQpDYzog
QW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4sIG9wZW5ibWNAbGlzdHMub3psYWJzLm9y
Zw0KU3ViamVjdDogW1BBVENIIGxpbnV4IGRldi00LjEzIDUvNV0gcG1idXMgKG1heDMxNzg1KTog
V3JhcCBhbGwgSTJDIA0KYWNjZXNzb3JzIGluIG9uZS1zaG90IGZhaWx1cmUgaGFuZGxlcnMNCkRh
dGU6IFR1ZSwgIDMgQXByIDIwMTggMjM6NTY6NTUgKzA5MzANCg0KVGhlIE1BWDMxNzg1KEEpIGhh
cyBzaG93biBlcnJhdGljIGJlaGF2aW91ciBhY3Jvc3MgbXVsdGlwbGUgc3lzdGVtDQpkZXNpZ25z
LCB1bmV4cGVjdGVkbHkgY2xvY2sgc3RyZXRjaGluZyBhbmQgTkFLaW5nIHRyYW5zYWN0aW9ucy4g
UGVyZm9ybQ0KYSBvbmUtc2hvdCByZXRyeSBpZiBuZWNlc3NhcnkgZm9yIGFsbCBhY2Nlc3MgYXR0
ZW1wdHMuDQoNClNpZ25lZC1vZmYtYnk6IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+
DQotLS0NCiBkcml2ZXJzL2h3bW9uL3BtYnVzL21heDMxNzg1LmMgfCAyMDcgDQorKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxNjUgaW5z
ZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2h3bW9u
L3BtYnVzL21heDMxNzg1LmMgDQpiL2RyaXZlcnMvaHdtb24vcG1idXMvbWF4MzE3ODUuYw0KaW5k
ZXggOWE3ZTc0NWI2YjMxLi4zZmIxMTFjNmQ1MjggMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2h3bW9u
L3BtYnVzL21heDMxNzg1LmMNCisrKyBiL2RyaXZlcnMvaHdtb24vcG1idXMvbWF4MzE3ODUuYw0K
QEAgLTM3LDI5ICszNywxMDUgQEAgZW51bSBtYXgzMTc4NV9yZWdzIHsNCiAjZGVmaW5lIE1BWDMx
Nzg1X05SX1BBR0VTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDIzDQogI2RlZmluZSBN
QVgzMTc4NV9OUl9GQU5fUEFHRVMgICAgICAgICAgICAgICAgICAgICAgICAgICA2DQogDQorLyoN
CisgKiBNQVgzMTc4NSBkcmFnb25zIGFoZWFkDQorICoNCisgKiBXZSBzZWUgd2VpcmQgaXNzdWVz
IHdoZXJlIHNvbWUgdHJhbnNmZXJzIGZhaWwuIFRoZXJlIGRvZXNuJ3QgYXBwZWFyIHRvIA0KYmUN
CisgKiBhbnkgcGF0dGVybiB0byB0aGUgcHJvYmxlbSwgc28gYmVsb3cgd2Ugd3JhcCBhbGwgdGhl
IHJlYWQvd3JpdGUgY2FsbHMgDQp3aXRoIGENCisgKiByZXRyeS4gVGhlIGRldmljZSBwcm92aWRl
cyBubyBpbmRpY2F0aW9uIG9mIHRoaXMgYmVzaWRlcyBOQUNLJ2luZyANCm1hc3Rlcg0KKyAqIFR4
czsgbm8gYml0cyBhcmUgc2V0IGluIFNUQVRVU19CWVRFIHRvIHN1Z2dlc3QgYW55dGhpbmcgaGFz
IGdvbmUgDQp3cm9uZy4NCisgKi8NCisNCisjZGVmaW5lIG1heDMxNzg1X3JldHJ5KF9mdW5jLCAu
Li4pICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQorICAgICAgICAgICAg
ICAgIC8qIEFsbCByZWxldmFudCBmdW5jdGlvbnMgcmV0dXJuIGludCwgc3VlIG1lICovICAgIFwN
CisgICAgICAgICAgICAgICAgaW50IF9yZXQgPSBfZnVuYyhfX1ZBX0FSR1NfXyk7ICAgICAgICAg
IFwNCisgICAgICAgICAgICAgICAgaWYgKF9yZXQgPT0gLUVJTykgICBcDQorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBfcmV0ID0gX2Z1bmMoX19WQV9BUkdTX18pOyAgICAgICAgICAg
ICAgXA0KKyAgICAgICAgICAgICAgICBfcmV0OyAgICAgICAgICAgXA0KK30pDQorDQorc3RhdGlj
IGludCBtYXgzMTc4NV9pMmNfc21idXNfcmVhZF9ieXRlX2RhdGEoc3RydWN0IGkyY19jbGllbnQg
KmNsaWVudCwNCisgICAgICAgIGludCBjb21tYW5kKQ0KK3sNCisgICAgICAgICAgICAgICAgcmV0
dXJuIG1heDMxNzg1X3JldHJ5KGkyY19zbWJ1c19yZWFkX2J5dGVfZGF0YSwgY2xpZW50LCANCmNv
bW1hbmQpOw0KK30NCisNCisNCitzdGF0aWMgaW50IG1heDMxNzg1X2kyY19zbWJ1c193cml0ZV9i
eXRlX2RhdGEoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwNCisgICAgICAgIGludCBjb21tYW5k
LCB1MTYgZGF0YSkNCit7DQorICAgICAgICAgICAgICAgIHJldHVybiBtYXgzMTc4NV9yZXRyeShp
MmNfc21idXNfd3JpdGVfYnl0ZV9kYXRhLCBjbGllbnQsIA0KY29tbWFuZCwgZGF0YSk7DQorfQ0K
Kw0KK3N0YXRpYyBpbnQgbWF4MzE3ODVfaTJjX3NtYnVzX3JlYWRfd29yZF9kYXRhKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQsDQorICAgICAgIGludCBjb21tYW5kKQ0KK3sNCisgICAgICAgICAg
ICAgICAgcmV0dXJuIG1heDMxNzg1X3JldHJ5KGkyY19zbWJ1c19yZWFkX3dvcmRfZGF0YSwgY2xp
ZW50LCANCmNvbW1hbmQpOw0KK30NCisNCitzdGF0aWMgaW50IG1heDMxNzg1X2kyY19zbWJ1c193
cml0ZV93b3JkX2RhdGEoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwNCisgICAgICAgIGludCBj
b21tYW5kLCB1MTYgZGF0YSkNCit7DQorICAgICAgICAgICAgICAgIHJldHVybiBtYXgzMTc4NV9y
ZXRyeShpMmNfc21idXNfd3JpdGVfd29yZF9kYXRhLCBjbGllbnQsIA0KY29tbWFuZCwgZGF0YSk7
DQorfQ0KKw0KK3N0YXRpYyBpbnQgbWF4MzE3ODVfcG1idXNfd3JpdGVfYnl0ZShzdHJ1Y3QgaTJj
X2NsaWVudCAqY2xpZW50LCBpbnQgcGFnZSwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1OCANCnZhbHVlKQ0KK3sN
CisgICAgICAgICAgICAgICAgcmV0dXJuIG1heDMxNzg1X3JldHJ5KHBtYnVzX3dyaXRlX2J5dGUs
IGNsaWVudCwgcGFnZSwgDQp2YWx1ZSk7DQorfQ0KKw0KK3N0YXRpYyBpbnQgbWF4MzE3ODVfcG1i
dXNfcmVhZF9ieXRlX2RhdGEoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwgaW50IA0KcGFnZSwN
CisgICAgaW50IGNvbW1hbmQpDQorew0KKyAgICAgICAgICAgICAgICByZXR1cm4gbWF4MzE3ODVf
cmV0cnkocG1idXNfcmVhZF9ieXRlX2RhdGEsIGNsaWVudCwgcGFnZSwgDQpjb21tYW5kKTsNCit9
DQorDQorc3RhdGljIGludCBtYXgzMTc4NV9wbWJ1c193cml0ZV9ieXRlX2RhdGEoc3RydWN0IGky
Y19jbGllbnQgKmNsaWVudCwgaW50IA0KcGFnZSwNCisgICAgaW50IGNvbW1hbmQsIHUxNiBkYXRh
KQ0KK3sNCisgICAgICAgICAgICAgICAgcmV0dXJuIG1heDMxNzg1X3JldHJ5KHBtYnVzX3dyaXRl
X2J5dGVfZGF0YSwgY2xpZW50LCANCnBhZ2UsIGNvbW1hbmQsDQorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGF0YSk7DQorfQ0KKw0KK3N0YXRp
YyBpbnQgbWF4MzE3ODVfcG1idXNfcmVhZF93b3JkX2RhdGEoc3RydWN0IGkyY19jbGllbnQgKmNs
aWVudCwgaW50IA0KcGFnZSwNCisgICAgaW50IGNvbW1hbmQpDQorew0KKyAgICAgICAgICAgICAg
ICByZXR1cm4gbWF4MzE3ODVfcmV0cnkocG1idXNfcmVhZF93b3JkX2RhdGEsIGNsaWVudCwgcGFn
ZSwgDQpjb21tYW5kKTsNCit9DQorDQorc3RhdGljIGludCBtYXgzMTc4NV9wbWJ1c193cml0ZV93
b3JkX2RhdGEoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwgaW50IA0KcGFnZSwNCisgICAgaW50
IGNvbW1hbmQsIHUxNiBkYXRhKQ0KK3sNCisgICAgICAgICAgICAgICAgcmV0dXJuIG1heDMxNzg1
X3JldHJ5KHBtYnVzX3dyaXRlX3dvcmRfZGF0YSwgY2xpZW50LCANCnBhZ2UsIGNvbW1hbmQsDQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGF0
YSk7DQorfQ0KKw0KIHN0YXRpYyBpbnQgbWF4MzE3ODVfcmVhZF9ieXRlX2RhdGEoc3RydWN0IGky
Y19jbGllbnQgKmNsaWVudCwgaW50IHBhZ2UsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCANCnJlZykNCiB7DQot
ICAgICAgICAgICAgICAgIGlmIChwYWdlIDwgTUFYMzE3ODVfTlJfUEFHRVMpDQotICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RBVEE7DQotDQogICAgICAgICAgICAg
ICAgIHN3aXRjaCAocmVnKSB7DQogICAgICAgICAgICAgICAgIGNhc2UgUE1CVVNfVk9VVF9NT0RF
Og0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9UU1VQUDsNCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChwYWdlID49IE1BWDMxNzg1X05SX1BB
R0VTKQ0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiAtRU5PVFNVUFA7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsN
CiAgICAgICAgICAgICAgICAgY2FzZSBQTUJVU19GQU5fQ09ORklHXzEyOg0KLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHBtYnVzX3JlYWRfYnl0ZV9kYXRhKGNsaWVudCwg
cGFnZSANCi0gTUFYMzE3ODVfTlJfUEFHRVMsDQotICAgICAgcmVnKTsNCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGlmIChwYWdlID49IE1BWDMxNzg1X05SX1BBR0VTKQ0KKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiANCm1heDMx
Nzg1X3BtYnVzX3JlYWRfYnl0ZV9kYXRhKGNsaWVudCwNCisgIHBhZ2UgLSBNQVgzMTc4NV9OUl9Q
QUdFUywNCisgIHJlZyk7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsN
CiAgICAgICAgICAgICAgICAgfQ0KIA0KLSAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RBVEE7
DQorICAgICAgICAgICAgICAgIHJldHVybiBtYXgzMTc4NV9wbWJ1c19yZWFkX2J5dGVfZGF0YShj
bGllbnQsIHBhZ2UsIHJlZyk7DQogfQ0KIA0KIHN0YXRpYyBpbnQgbWF4MzE3ODVfd3JpdGVfYnl0
ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LCBpbnQgcGFnZSwgdTggDQp2YWx1ZSkNCiB7DQot
ICAgICAgICAgICAgICAgIGlmIChwYWdlIDwgTUFYMzE3ODVfTlJfUEFHRVMpDQotICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RBVEE7DQorICAgICAgICAgICAgICAg
IGlmIChwYWdlID49IE1BWDMxNzg1X05SX1BBR0VTKQ0KKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9UU1VQUDsNCiANCi0gICAgICAgICAgICAgICAgcmV0dXJuIC1F
Tk9UU1VQUDsNCisgICAgICAgICAgICAgICAgcmV0dXJuIG1heDMxNzg1X3BtYnVzX3dyaXRlX2J5
dGUoY2xpZW50LCBwYWdlLCB2YWx1ZSk7DQogfQ0KIA0KIHN0YXRpYyBpbnQgbWF4MzE3ODVfcmVh
ZF9sb25nX2RhdGEoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwgaW50IHBhZ2UsDQpAQCAtMTIw
LDExICsxOTYsMTMgQEAgc3RhdGljIGludCBtYXgzMTc4NV9nZXRfcHdtX21vZGUoc3RydWN0IGky
Y19jbGllbnQgDQoqY2xpZW50LCBpbnQgcGFnZSkNCiAgICAgICAgICAgICAgICAgaW50IGNvbmZp
ZzsNCiAgICAgICAgICAgICAgICAgaW50IGNvbW1hbmQ7DQogDQotICAgICAgICAgICAgICAgIGNv
bmZpZyA9IHBtYnVzX3JlYWRfYnl0ZV9kYXRhKGNsaWVudCwgcGFnZSwgDQpQTUJVU19GQU5fQ09O
RklHXzEyKTsNCisgICAgICAgICAgICAgICAgY29uZmlnID0gbWF4MzE3ODVfcG1idXNfcmVhZF9i
eXRlX2RhdGEoY2xpZW50LCBwYWdlLA0KKyAgICAgICAgIFBNQlVTX0ZBTl9DT05GSUdfMTIpOw0K
ICAgICAgICAgICAgICAgICBpZiAoY29uZmlnIDwgMCkNCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiBjb25maWc7DQogDQotICAgICAgICAgICAgICAgIGNvbW1hbmQgPSBw
bWJ1c19yZWFkX3dvcmRfZGF0YShjbGllbnQsIHBhZ2UsIA0KUE1CVVNfRkFOX0NPTU1BTkRfMSk7
DQorICAgICAgICAgICAgICAgIGNvbW1hbmQgPSBtYXgzMTc4NV9wbWJ1c19yZWFkX3dvcmRfZGF0
YShjbGllbnQsIHBhZ2UsDQorICAgICAgICAgICAgICAgIFBNQlVTX0ZBTl9DT01NQU5EXzEpOw0K
ICAgICAgICAgICAgICAgICBpZiAoY29tbWFuZCA8IDApDQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gY29tbWFuZDsNCiANCkBAIC0xNDgsMTUgKzIyNiwxNCBAQCBzdGF0
aWMgaW50IG1heDMxNzg1X3JlYWRfd29yZF9kYXRhKHN0cnVjdCBpMmNfY2xpZW50IA0KKmNsaWVu
dCwgaW50IHBhZ2UsDQogICAgICAgICAgICAgICAgIHN3aXRjaCAocmVnKSB7DQogICAgICAgICAg
ICAgICAgIGNhc2UgUE1CVVNfUkVBRF9GQU5fU1BFRURfMToNCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmIChwYWdlIDwgTUFYMzE3ODVfTlJfUEFHRVMpDQotICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9EQVRBOw0KKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiANCm1h
eDMxNzg1X3BtYnVzX3JlYWRfd29yZF9kYXRhKGNsaWVudCwgcGFnZSwgcmVnKTsNCiANCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJ2ID0gbWF4MzE3ODVfcmVhZF9sb25nX2RhdGEo
Y2xpZW50LCBwYWdlIA0KLSBNQVgzMTc4NV9OUl9QQUdFUywNCiAgICAgICByZWcsICZ2YWwpOw0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJ2IDwgMCkNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcnY7DQogDQotICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBydiA9ICh2YWwgPj4gMTYpICYgMHhmZmZmOw0K
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gKHZhbCA+PiAxNikgJiAweGZmZmY7DQogICAgICAgICAg
ICAgICAgIGNhc2UgUE1CVVNfRkFOX0NPTU1BTkRfMToNCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC8qDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBQTUJVU19G
QU5fQ09NTUFORF94IGlzIHByb2JlZCB0byBqdWRnZSANCndoZXRoZXIgb3Igbm90IHRvDQpAQCAt
MTY0LDIwICsyNDEsMjggQEAgc3RhdGljIGludCBtYXgzMTc4NV9yZWFkX3dvcmRfZGF0YShzdHJ1
Y3QgaTJjX2NsaWVudCANCipjbGllbnQsIGludCBwYWdlLA0KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICoNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIERvbid0
IGV4cG9zZSBmYW5fdGFyZ2V0IGF0dHJpYnV0ZSBmb3IgDQp2aXJ0dWFsIHBhZ2VzLg0KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICovDQotICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBydiA9IChwYWdlID49IE1BWDMxNzg1X05SX1BBR0VTKSA/IA0KLUVOT1RTVVBQIDog
LUVOT0RBVEE7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocGFnZSA+PSBN
QVgzMTc4NV9OUl9QQUdFUykNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVOT1RTVVBQOw0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYnJlYWs7DQorICAgICAgICAgICAgICAgIGNhc2UgUE1CVVNfVklSVF9GQU5fVEFSR0VU
XzE6DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocGFnZSA+PSBNQVgzMTc4
NV9OUl9QQUdFUykNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVOT1RTVVBQOw0KKw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FTk9EQVRBOw0KICAgICAgICAgICAgICAgICBjYXNlIFBNQlVTX1ZJUlRfUFdN
XzE6DQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBydiA9IG1heDMxNzg1X2dldF9w
d20oY2xpZW50LCBwYWdlKTsNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFr
Ow0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIG1heDMxNzg1X2dldF9w
d20oY2xpZW50LCBwYWdlKTsNCiAgICAgICAgICAgICAgICAgY2FzZSBQTUJVU19WSVJUX1BXTV9F
TkFCTEVfMToNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJ2ID0gbWF4MzE3ODVf
Z2V0X3B3bV9tb2RlKGNsaWVudCwgcGFnZSk7DQotICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBicmVhazsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBtYXgz
MTc4NV9nZXRfcHdtX21vZGUoY2xpZW50LCANCnBhZ2UpOw0KICAgICAgICAgICAgICAgICBkZWZh
dWx0Og0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcnYgPSAtRU5PREFUQTsNCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChwYWdlID49IE1BWDMxNzg1X05SX1BB
R0VTKQ0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiAtRU5YSU87DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCiAg
ICAgICAgICAgICAgICAgfQ0KIA0KLSAgICAgICAgICAgICAgICByZXR1cm4gcnY7DQorICAgICAg
ICAgICAgICAgIGlmIChyZWcgPj0gUE1CVVNfVklSVF9CQVNFKQ0KKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIC1FTlhJTzsNCisNCisgICAgICAgICAgICAgICAgcmV0dXJu
IG1heDMxNzg1X3BtYnVzX3JlYWRfd29yZF9kYXRhKGNsaWVudCwgcGFnZSwgcmVnKTsNCiB9DQog
DQogc3RhdGljIGlubGluZSB1MzIgbWF4MzE3ODVfc2NhbGVfcHdtKHUzMiBzZW5zb3JfdmFsKQ0K
QEAgLTIwMSw2ICsyODYsMzEgQEAgc3RhdGljIGlubGluZSB1MzIgbWF4MzE3ODVfc2NhbGVfcHdt
KHUzMiBzZW5zb3JfdmFsKQ0KICAgICAgICAgICAgICAgICByZXR1cm4gKHNlbnNvcl92YWwgKiAx
MDApIC8gMjU1Ow0KIH0NCiANCitzdGF0aWMgaW50IG1heDMxNzg1X3VwZGF0ZV9mYW4oc3RydWN0
IGkyY19jbGllbnQgKmNsaWVudCwgaW50IHBhZ2UsDQorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHU4IGNvbmZpZywgdTggDQptYXNrLCB1MTYg
Y29tbWFuZCkNCit7DQorICAgICAgICAgICAgICAgIGludCBmcm9tLCBydjsNCisgICAgICAgICAg
ICAgICAgdTggdG87DQorDQorICAgICAgICAgICAgICAgIGZyb20gPSBtYXgzMTc4NV9wbWJ1c19y
ZWFkX2J5dGVfZGF0YShjbGllbnQsIHBhZ2UsIA0KUE1CVVNfRkFOX0NPTkZJR18xMik7DQorICAg
ICAgICAgICAgICAgIGlmIChmcm9tIDwgMCkNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiBmcm9tOw0KKw0KKyAgICAgICAgICAgICAgICB0byA9IChmcm9tICYgfm1hc2sp
IHwgKGNvbmZpZyAmIG1hc2spOw0KKw0KKyAgICAgICAgICAgICAgICBpZiAodG8gIT0gZnJvbSkg
ew0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcnYgPSANCm1heDMxNzg1X3BtYnVz
X3dyaXRlX2J5dGVfZGF0YShjbGllbnQsIHBhZ2UsDQorICAgICAgICAgICAgICAgICAgICBQTUJV
U19GQU5fQ09ORklHXzEyLCB0byk7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
ZiAocnYgPCAwKQ0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiBydjsNCisgICAgICAgICAgICAgICAgfQ0KKw0KKyAgICAgICAgICAgICAgICBy
diA9IG1heDMxNzg1X3BtYnVzX3dyaXRlX3dvcmRfZGF0YShjbGllbnQsIHBhZ2UsIA0KUE1CVVNf
RkFOX0NPTU1BTkRfMSwNCisgICAgICBjb21tYW5kKTsNCisNCisgICAgICAgICAgICAgICAgcmV0
dXJuIHJ2Ow0KK30NCisNCiBzdGF0aWMgaW50IG1heDMxNzg1X3B3bV9lbmFibGUoc3RydWN0IGky
Y19jbGllbnQgKmNsaWVudCwgaW50IHBhZ2UsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MTYgDQp3b3JkKQ0KIHsN
CkBAIC0yMzAsMTUgKzM0MCwxOCBAQCBzdGF0aWMgaW50IG1heDMxNzg1X3B3bV9lbmFibGUoc3Ry
dWN0IGkyY19jbGllbnQgDQoqY2xpZW50LCBpbnQgcGFnZSwNCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KICAgICAgICAgICAgICAgICB9DQogDQotICAg
ICAgICAgICAgICAgIHJldHVybiBwbWJ1c191cGRhdGVfZmFuKGNsaWVudCwgcGFnZSwgMCwgY29u
ZmlnLCANClBCX0ZBTl8xX1JQTSwgcmF0ZSk7DQorICAgICAgICAgICAgICAgIHJldHVybiBtYXgz
MTc4NV91cGRhdGVfZmFuKGNsaWVudCwgcGFnZSwgY29uZmlnLCANClBCX0ZBTl8xX1JQTSwgcmF0
ZSk7DQogfQ0KIA0KIHN0YXRpYyBpbnQgbWF4MzE3ODVfd3JpdGVfd29yZF9kYXRhKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQsIGludCBwYWdlLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IA0KcmVnLCB1MTYg
d29yZCkNCiB7DQogICAgICAgICAgICAgICAgIHN3aXRjaCAocmVnKSB7DQorICAgICAgICAgICAg
ICAgIGNhc2UgUE1CVVNfVklSVF9GQU5fVEFSR0VUXzE6DQorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gbWF4MzE3ODVfdXBkYXRlX2ZhbihjbGllbnQsIHBhZ2UsIA0KUEJf
RkFOXzFfUlBNLA0KKyAgICAgUEJfRkFOXzFfUlBNLCB3b3JkKTsNCiAgICAgICAgICAgICAgICAg
Y2FzZSBQTUJVU19WSVJUX1BXTV8xOg0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIHBtYnVzX3VwZGF0ZV9mYW4oY2xpZW50LCBwYWdlLCAwLCANCjAsIFBCX0ZBTl8xX1JQ
TSwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBtYXgzMTc4NV91cGRh
dGVfZmFuKGNsaWVudCwgcGFnZSwgDQowLCBQQl9GQU5fMV9SUE0sDQogIG1heDMxNzg1X3NjYWxl
X3B3bSh3b3JkKSk7DQogICAgICAgICAgICAgICAgIGNhc2UgUE1CVVNfVklSVF9QV01fRU5BQkxF
XzE6DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gbWF4MzE3ODVfcHdt
X2VuYWJsZShjbGllbnQsIHBhZ2UsIA0Kd29yZCk7DQpAQCAtMjQ2LDcgKzM1OSwxMCBAQCBzdGF0
aWMgaW50IG1heDMxNzg1X3dyaXRlX3dvcmRfZGF0YShzdHJ1Y3QgaTJjX2NsaWVudCANCipjbGll
bnQsIGludCBwYWdlLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQog
ICAgICAgICAgICAgICAgIH0NCiANCi0gICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9EQVRBOw0K
KyAgICAgICAgICAgICAgICBpZiAocmVnIDwgUE1CVVNfVklSVF9CQVNFKQ0KKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIA0KbWF4MzE3ODVfcG1idXNfd3JpdGVfd29yZF9k
YXRhKGNsaWVudCwgcGFnZSwgcmVnLCB3b3JkKTsNCisNCisgICAgICAgICAgICAgICAgcmV0dXJu
IC1FTlhJTzsNCiB9DQogDQogLyoNCkBAIC0yNzksMTEgKzM5NSwxMSBAQCBzdGF0aWMgaW50IG1h
eDMxNzg1X29mX2Zhbl9jb25maWcoc3RydWN0IGkyY19jbGllbnQgDQoqY2xpZW50LA0KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTlhJTzsNCiAgICAgICAgICAgICAg
ICAgfQ0KIA0KLSAgICAgICAgICAgICAgICByZXQgPSBpMmNfc21idXNfd3JpdGVfYnl0ZV9kYXRh
KGNsaWVudCwgUE1CVVNfUEFHRSwgDQpwYWdlKTsNCisgICAgICAgICAgICAgICAgcmV0ID0gbWF4
MzE3ODVfaTJjX3NtYnVzX3dyaXRlX2J5dGVfZGF0YShjbGllbnQsIA0KUE1CVVNfUEFHRSwgcGFn
ZSk7DQogICAgICAgICAgICAgICAgIGlmIChyZXQgPCAwKQ0KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsNCiANCi0gICAgICAgICAgICAgICAgcGJfY2ZnID0gaTJj
X3NtYnVzX3JlYWRfYnl0ZV9kYXRhKGNsaWVudCwgDQpQTUJVU19GQU5fQ09ORklHXzEyKTsNCisg
ICAgICAgICAgICAgICAgcGJfY2ZnID0gbWF4MzE3ODVfaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRh
KGNsaWVudCwgDQpQTUJVU19GQU5fQ09ORklHXzEyKTsNCiAgICAgICAgICAgICAgICAgaWYgKHBi
X2NmZyA8IDApDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcGJfY2Zn
Ow0KIA0KQEAgLTMwOSw3ICs0MjUsOSBAQCBzdGF0aWMgaW50IG1heDMxNzg1X29mX2Zhbl9jb25m
aWcoc3RydWN0IGkyY19jbGllbnQgDQoqY2xpZW50LA0KICAgICAgICAgICAgICAgICB9IGVsc2Ug
aWYgKCFzdHJjbXAoImxvY2siLCBzdmFsKSkgew0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbWZyX2NmZyB8PSBNRlJfRkFOX0NPTkZJR19ST1RPUjsNCiANCi0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJldCA9IGkyY19zbWJ1c193cml0ZV93b3JkX2RhdGEoY2xpZW50
LCANCk1GUl9GQU5fRkFVTFRfTElNSVQsIDEpOw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0ID0gDQptYXgzMTc4NV9pMmNfc21idXNfd3JpdGVfd29yZF9kYXRhKGNsaWVudCwN
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNRlJfRkFOX0ZBVUxUX0xJTUlULA0K
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDEpOw0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKHJldCA8IDApDQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCiANCkBAIC00MjMsMjEgKzU0MSwyMyBA
QCBzdGF0aWMgaW50IG1heDMxNzg1X29mX2Zhbl9jb25maWcoc3RydWN0IGkyY19jbGllbnQgDQoq
Y2xpZW50LA0KICAgICAgICAgICAgICAgICBpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKGNoaWxk
LCANCiJtYXhpbSxmYW4tZmF1bHQtcGluLW1vbiIpKQ0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbWZyX2ZhdWx0X3Jlc3AgfD0gDQpNRlJfRkFVTFRfUkVTUE9OU0VfTU9OSVRPUjsN
CiANCi0gICAgICAgICAgICAgICAgcmV0ID0gaTJjX3NtYnVzX3dyaXRlX2J5dGVfZGF0YShjbGll
bnQsIA0KUE1CVVNfRkFOX0NPTkZJR18xMiwNCisgICAgICAgICAgICAgICAgcmV0ID0gbWF4MzE3
ODVfaTJjX3NtYnVzX3dyaXRlX2J5dGVfZGF0YShjbGllbnQsIA0KUE1CVVNfRkFOX0NPTkZJR18x
MiwNCiAgcGJfY2ZnICYgflBCX0ZBTl8xX0lOU1RBTExFRCk7DQogICAgICAgICAgICAgICAgIGlm
IChyZXQgPCAwKQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsN
CiANCi0gICAgICAgICAgICAgICAgcmV0ID0gaTJjX3NtYnVzX3dyaXRlX3dvcmRfZGF0YShjbGll
bnQsIE1GUl9GQU5fQ09ORklHLCANCm1mcl9jZmcpOw0KKyAgICAgICAgICAgICAgICByZXQgPSBt
YXgzMTc4NV9pMmNfc21idXNfd3JpdGVfd29yZF9kYXRhKGNsaWVudCwgDQpNRlJfRkFOX0NPTkZJ
RywNCisgICAgICAgICAgICAgICAgIG1mcl9jZmcpOw0KICAgICAgICAgICAgICAgICBpZiAocmV0
IDwgMCkNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQogDQot
ICAgICAgICAgICAgICAgIHJldCA9IGkyY19zbWJ1c193cml0ZV9ieXRlX2RhdGEoY2xpZW50LCAN
Ck1GUl9GQVVMVF9SRVNQT05TRSwNCi0gIG1mcl9mYXVsdF9yZXNwKTsNCisgICAgICAgICAgICAg
ICAgcmV0ID0gbWF4MzE3ODVfaTJjX3NtYnVzX3dyaXRlX2J5dGVfZGF0YShjbGllbnQsIA0KTUZS
X0ZBVUxUX1JFU1BPTlNFLA0KKyAgICAgICAgICAgICAgICAgbWZyX2ZhdWx0X3Jlc3ApOw0KICAg
ICAgICAgICAgICAgICBpZiAocmV0IDwgMCkNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiByZXQ7DQogDQotICAgICAgICAgICAgICAgIHJldCA9IGkyY19zbWJ1c193cml0
ZV9ieXRlX2RhdGEoY2xpZW50LCANClBNQlVTX0ZBTl9DT05GSUdfMTIsIHBiX2NmZyk7DQorICAg
ICAgICAgICAgICAgIHJldCA9IG1heDMxNzg1X2kyY19zbWJ1c193cml0ZV9ieXRlX2RhdGEoY2xp
ZW50LCANClBNQlVTX0ZBTl9DT05GSUdfMTIsDQorICAgICAgICAgICAgICAgICBwYl9jZmcpOw0K
ICAgICAgICAgICAgICAgICBpZiAocmV0IDwgMCkNCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiByZXQ7DQogDQpAQCAtNDgyLDcgKzYwMiw3IEBAIHN0YXRpYyBpbnQgbWF4
MzE3ODVfb2ZfdG1wX2NvbmZpZyhzdHJ1Y3QgaTJjX2NsaWVudCANCipjbGllbnQsDQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOWElPOw0KICAgICAgICAgICAgICAg
ICB9DQogDQotICAgICAgICAgICAgICAgIHJldCA9IGkyY19zbWJ1c193cml0ZV9ieXRlX2RhdGEo
Y2xpZW50LCBQTUJVU19QQUdFLCANCnBhZ2UpOw0KKyAgICAgICAgICAgICAgICByZXQgPSBtYXgz
MTc4NV9pMmNfc21idXNfd3JpdGVfYnl0ZV9kYXRhKGNsaWVudCwgDQpQTUJVU19QQUdFLCBwYWdl
KTsNCiAgICAgICAgICAgICAgICAgaWYgKHJldCA8IDApDQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gcmV0Ow0KIA0KQEAgLTUwNiw3ICs2MjYsNyBAQCBzdGF0aWMgaW50
IG1heDMxNzg1X29mX3RtcF9jb25maWcoc3RydWN0IGkyY19jbGllbnQgDQoqY2xpZW50LA0KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaSsrOw0KICAgICAgICAgICAgICAgICB9DQog
DQotICAgICAgICAgICAgICAgIHJldCA9IGkyY19zbWJ1c193cml0ZV93b3JkX2RhdGEoY2xpZW50
LCANCk1GUl9URU1QX1NFTlNPUl9DT05GSUcsDQorICAgICAgICAgICAgICAgIHJldCA9IG1heDMx
Nzg1X2kyY19zbWJ1c193cml0ZV93b3JkX2RhdGEoY2xpZW50LCANCk1GUl9URU1QX1NFTlNPUl9D
T05GSUcsDQogIG1mcl90bXBfY2ZnKTsNCiAgICAgICAgICAgICAgICAgaWYgKHJldCA8IDApDQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KQEAgLTU4NSwxMSAr
NzA1LDExIEBAIHN0YXRpYyBpbnQgbWF4MzE3ODVfY29uZmlndXJlX2R1YWxfdGFjaChzdHJ1Y3Qg
DQppMmNfY2xpZW50ICpjbGllbnQsDQogICAgICAgICAgICAgICAgIGludCBpOw0KIA0KICAgICAg
ICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgTUFYMzE3ODVfTlJfRkFOX1BBR0VTOyBpKyspIHsN
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGkyY19zbWJ1c193cml0ZV9i
eXRlX2RhdGEoY2xpZW50LCANClBNQlVTX1BBR0UsIGkpOw0KKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0ID0gDQptYXgzMTc4NV9pMmNfc21idXNfd3JpdGVfYnl0ZV9kYXRhKGNs
aWVudCwgUE1CVVNfUEFHRSwgaSk7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
ZiAocmV0IDwgMCkNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gcmV0Ow0KIA0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0
ID0gaTJjX3NtYnVzX3JlYWRfd29yZF9kYXRhKGNsaWVudCwgDQpNRlJfRkFOX0NPTkZJRyk7DQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSANCm1heDMxNzg1X2kyY19zbWJ1
c19yZWFkX3dvcmRfZGF0YShjbGllbnQsIE1GUl9GQU5fQ09ORklHKTsNCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGlmIChyZXQgPCAwKQ0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQogDQpAQCAtNjI3LDcgKzc0Nyw3
IEBAIHN0YXRpYyBpbnQgbWF4MzE3ODVfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwN
CiANCiAgICAgICAgICAgICAgICAgKmluZm8gPSBtYXgzMTc4NV9pbmZvOw0KIA0KLSAgICAgICAg
ICAgICAgICByZXQgPSBpMmNfc21idXNfd3JpdGVfYnl0ZV9kYXRhKGNsaWVudCwgUE1CVVNfUEFH
RSwgMjU1KTsNCisgICAgICAgICAgICAgICAgcmV0ID0gbWF4MzE3ODVfaTJjX3NtYnVzX3dyaXRl
X2J5dGVfZGF0YShjbGllbnQsIA0KUE1CVVNfUEFHRSwgMjU1KTsNCiAgICAgICAgICAgICAgICAg
aWYgKHJldCA8IDApDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0
Ow0KIA0KQEAgLTY2OSwxNyArNzg5LDIwIEBAIHN0YXRpYyBpbnQgbWF4MzE3ODVfcHJvYmUoc3Ry
dWN0IGkyY19jbGllbnQgKmNsaWVudCwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGlmICghaGF2ZV9mYW4gfHwgZmFuX2NvbmZpZ3VyZWQpDQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQogDQotICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZXQgPSBpMmNfc21idXNfd3JpdGVfYnl0ZV9kYXRhKGNsaWVudCwg
DQpQTUJVU19QQUdFLCBpKTsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9
IA0KbWF4MzE3ODVfaTJjX3NtYnVzX3dyaXRlX2J5dGVfZGF0YShjbGllbnQsIFBNQlVTX1BBR0Us
DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaSk7DQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBpZiAocmV0IDwgMCkNCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KIA0KLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmV0ID0gaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRhKGNsaWVudCwgDQpQ
TUJVU19GQU5fQ09ORklHXzEyKTsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
dCA9IA0KbWF4MzE3ODVfaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRhKGNsaWVudCwNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFBNQlVTX0ZBTl9DT05GSUdfMTIpOw0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCA8IDApDQogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCiANCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJldCAmPSB+UEJfRkFOXzFfSU5TVEFMTEVEOw0KLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gaTJjX3NtYnVzX3dyaXRlX3dvcmRfZGF0
YShjbGllbnQsIA0KUE1CVVNfRkFOX0NPTkZJR18xMiwNCi0gICAgICAgICAgICAgICAgcmV0KTsN
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IA0KbWF4MzE3ODVfaTJjX3Nt
YnVzX3dyaXRlX3dvcmRfZGF0YShjbGllbnQsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgUE1CVVNfRkFOX0NPTkZJR18xMiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZXQpOw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCA8IDAp
DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IHJldDsNCiAgICAgICAgICAgICAgICAgfQ0KLS0gDQoyLjE0LjENCg0KDQoNCg0KDQo=

--=_alternative 00160B2765258265_=
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span style=3D" font-size:10pt;font-family:sans-serif">Test and verified
working.</span><br><br><span style=3D" font-size:10pt;font-family:sans-seri=
f">Tested-by: George
Keishing &lt;gkeishin@in.ibm.com&gt;</span><br><br><span style=3D" font-siz=
e:10pt;color:blue;font-family:sans-serif"><b>Thanks
and Regards,</b></span><br><span style=3D" font-size:10pt;color:blue;font-f=
amily:sans-serif">&nbsp;
&nbsp;George Keishing</span><br><span style=3D" font-size:10pt;color:blue;f=
ont-family:sans-serif">&nbsp;
&nbsp;IBM Systems &amp;Technology Lab, Firmware Development,</span><br><spa=
n style=3D" font-size:10pt;font-family:sans-serif"><i>=E2=80=9C</i></span><=
span style=3D" font-size:12pt">There isn't enough time in a day to be lazy!=
!! </span><span style=3D" font-size:9pt;font-family:sans-serif">.=E2=80=9D<=
/span><br><img src=3Dcid:=5F2=5F0AFFF6780AFFF40C001609F465258265 style=3D"b=
order:0px solid;"><br><br><br><br><br><span style=3D" font-size:9pt;color:#=
5f5f5f;font-family:sans-serif">From:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">Andrew
Jeffery &lt;andrew@aj.id.au&gt;</span><br><span style=3D" font-size:9pt;col=
or:#5f5f5f;font-family:sans-serif">To:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">gkeishin@in.ibm.com</span><br><span style=3D" font-size:9pt;co=
lor:#5f5f5f;font-family:sans-serif">Date:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">04/04/2018
09:24 AM</span><br><span style=3D" font-size:9pt;color:#5f5f5f;font-family:=
sans-serif">Subject:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">Fwd:
[PATCH linux dev-4.13 5/5] pmbus (max31785): Wrap all I2C accessors in
one-shot failure handlers</span><br><hr noshade><br><br><br><tt><span style=
=3D" font-size:10pt"><br><br>----- Original message -----<br>From: Andrew J=
effery &lt;andrew@aj.id.au&gt;<br>To: joel@jms.id.au<br>Cc: Andrew Jeffery =
&lt;andrew@aj.id.au&gt;, openbmc@lists.ozlabs.org<br>Subject: [PATCH linux =
dev-4.13 5/5] pmbus (max31785): Wrap all I2C accessors
in one-shot failure handlers<br>Date: Tue, &nbsp;3 Apr 2018 23:56:55 +0930<=
br><br>The MAX31785(A) has shown erratic behaviour across multiple system<b=
r>designs, unexpectedly clock stretching and NAKing transactions. Perform<b=
r>a one-shot retry if necessary for all access attempts.<br><br>Signed-off-=
by: Andrew Jeffery &lt;andrew@aj.id.au&gt;<br>---<br> drivers/hwmon/pmbus/m=
ax31785.c | 207 ++++++++++++++++++++++++++++++++---------<br> 1 file change=
d, 165 insertions(+), 42 deletions(-)<br><br>diff --git a/drivers/hwmon/pmb=
us/max31785.c b/drivers/hwmon/pmbus/max31785.c<br>index 9a7e745b6b31..3fb11=
1c6d528 100644<br>--- a/drivers/hwmon/pmbus/max31785.c<br>+++ b/drivers/hwm=
on/pmbus/max31785.c<br>@@ -37,29 +37,105 @@ enum max31785=5Fregs {<br> #def=
ine MAX31785=5FNR=5FPAGES &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;23<br> #define MAX31785=5FNR=5FFAN=5FPAGES &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;6<br> <br>+/*<br>+ * MAX31785 dragons ahead<br>+=
 *<br>+ * We see weird issues where some transfers fail. There doesn't appe=
ar
to be<br>+ * any pattern to the problem, so below we wrap all the read/writ=
e calls
with a<br>+ * retry. The device provides no indication of this besides NACK=
'ing master<br>+ * Txs; no bits are set in STATUS=5FBYTE to suggest anythin=
g has gone wrong.<br>+ */<br>+<br>+#define max31785=5Fretry(=5Ffunc, ...) (=
{ &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; \<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;
/* All relevant functions return int, sue me */ &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; \<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;
int =5Fret =3D =5Ffunc(=5F=5FVA=5FARGS=5F=5F); &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; \<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;
if (=5Fret =3D=3D -EIO) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;\<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=5Fret
=3D =5Ffunc(=5F=5FVA=5FARGS=5F=5F); &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;\<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;
=5Fret; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\<br>+})<br>+=
<br>+static int max31785=5Fi2c=5Fsmbus=5Fread=5Fbyte=5Fdata(struct i2c=5Fcl=
ient *client,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; int command)<br>+{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;
return max31785=5Fretry(i2c=5Fsmbus=5Fread=5Fbyte=5Fdata, client, command);=
<br>+}<br>+<br>+<br>+static int max31785=5Fi2c=5Fsmbus=5Fwrite=5Fbyte=5Fdat=
a(struct i2c=5Fclient *client,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; int command, u16 data)<br>+{<br>+ &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return max31785=5Fretry(i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata, client, command,=
 data);<br>+}<br>+<br>+static int max31785=5Fi2c=5Fsmbus=5Fread=5Fword=5Fda=
ta(struct i2c=5Fclient *client,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;int command)<br>+{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;
return max31785=5Fretry(i2c=5Fsmbus=5Fread=5Fword=5Fdata, client, command);=
<br>+}<br>+<br>+static int max31785=5Fi2c=5Fsmbus=5Fwrite=5Fword=5Fdata(str=
uct i2c=5Fclient *client,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; int command, u16 data)<br>+{<br>+ &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return max31785=5Fretry(i2c=5Fsmbus=5Fwrite=5Fword=5Fdata, client, command,=
 data);<br>+}<br>+<br>+static int max31785=5Fpmbus=5Fwrite=5Fbyte(struct i2=
c=5Fclient *client, int page,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; u8 value)<br>+{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;
return max31785=5Fretry(pmbus=5Fwrite=5Fbyte, client, page, value);<br>+}<b=
r>+<br>+static int max31785=5Fpmbus=5Fread=5Fbyte=5Fdata(struct i2c=5Fclien=
t *client, int
page,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; int command)<br>+{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;
return max31785=5Fretry(pmbus=5Fread=5Fbyte=5Fdata, client, page, command);=
<br>+}<br>+<br>+static int max31785=5Fpmbus=5Fwrite=5Fbyte=5Fdata(struct i2=
c=5Fclient *client, int
page,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; int command, u16 data)<br>+{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;
return max31785=5Fretry(pmbus=5Fwrite=5Fbyte=5Fdata, client, page, command,=
<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; data);<br>+}<br>+<br>+static int max31785=5Fpmbus=5Fre=
ad=5Fword=5Fdata(struct i2c=5Fclient *client, int
page,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; int command)<br>+{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;
return max31785=5Fretry(pmbus=5Fread=5Fword=5Fdata, client, page, command);=
<br>+}<br>+<br>+static int max31785=5Fpmbus=5Fwrite=5Fword=5Fdata(struct i2=
c=5Fclient *client, int
page,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; int command, u16 data)<br>+{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;
return max31785=5Fretry(pmbus=5Fwrite=5Fword=5Fdata, client, page, command,=
<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; data);<br>+}<br>+<br> static int max31785=5Fread=5Fbyt=
e=5Fdata(struct i2c=5Fclient *client, int page,<br> &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;int reg)<br> {<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;
if (page &lt; MAX31785=5FNR=5FPAGES)<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
-ENODATA;<br>-<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;switch
(reg) {<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ase
PMBUS=5FVOUT=5FMODE:<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
-ENOTSUPP;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(page &gt;=3D MAX31785=5FNR=5FPAGES)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return -ENOTSUPP;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br> &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case
PMBUS=5FFAN=5FCONFIG=5F12:<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
pmbus=5Fread=5Fbyte=5Fdata(client, page - MAX31785=5FNR=5FPAGES,<br>- &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; reg);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(page &gt;=3D MAX31785=5FNR=5FPAGES)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return max31785=5Fpmbus=5Fread=5Fbyte=5Fdata(client,<br>+ &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
page - MAX31785=5FNR=5FPAGES,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
reg);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br> &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br> <br>- &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return -ENODATA;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;
return max31785=5Fpmbus=5Fread=5Fbyte=5Fdata(client, page, reg);<br> }<br> =
<br> static int max31785=5Fwrite=5Fbyte(struct i2c=5Fclient *client, int pa=
ge, u8
value)<br> {<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (page &lt; MAX31785=5FNR=5FPAGES)<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
-ENODATA;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (page &gt;=3D MAX31785=5FNR=5FPAGES)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
-ENOTSUPP;<br> <br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return -ENOTSUPP;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;
return max31785=5Fpmbus=5Fwrite=5Fbyte(client, page, value);<br> }<br> <br>=
 static int max31785=5Fread=5Flong=5Fdata(struct i2c=5Fclient *client, int =
page,<br>@@ -120,11 +196,13 @@ static int max31785=5Fget=5Fpwm=5Fmode(struc=
t i2c=5Fclient
*client, int page)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;int
config;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i=
nt
command;<br> <br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
config =3D pmbus=5Fread=5Fbyte=5Fdata(client, page, PMBUS=5FFAN=5FCONFIG=5F=
12);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
config =3D max31785=5Fpmbus=5Fread=5Fbyte=5Fdata(client, page,<br>+ &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;PMBUS=5FFAN=5FCONFIG=5F12);<br> &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(config &lt; 0)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return config;<br> <br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;
command =3D pmbus=5Fread=5Fword=5Fdata(client, page, PMBUS=5FFAN=5FCOMMAND=
=5F1);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
command =3D max31785=5Fpmbus=5Fread=5Fword=5Fdata(client, page,<br>+ &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PMBUS=5FFAN=
=5FCOMMAND=5F1);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;if
(command &lt; 0)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return command;<br> <br>@@ -148,15 +226,14 @@ static int max31785=5Fread=5F=
word=5Fdata(struct i2c=5Fclient
*client, int page,<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;switch
(reg) {<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ase
PMBUS=5FREAD=5FFAN=5FSPEED=5F1:<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (page &lt; MAX31785=5FNR=5FPAGES)<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return -ENODATA;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return max31785=5Fpmbus=5Fread=5Fword=5Fdata(client, page, reg);<br> <br> &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
rv =3D max31785=5Fread=5Flong=5Fdata(client, page - MAX31785=5FNR=5FPAGES,<=
br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; reg, &amp;val);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (rv &lt; 0)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
rv;<br> <br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rv
=3D (val &gt;&gt; 16) &amp; 0xffff;<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>+ &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
(val &gt;&gt; 16) &amp; 0xffff;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;case
PMBUS=5FFAN=5FCOMMAND=5F1:<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
/*<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;* PMBUS=5FFAN=5FCOMMAND=5Fx is probed to judge whether or not to<br>@=
@ -164,20 +241,28 @@ static int max31785=5Fread=5Fword=5Fdata(struct i2c=5F=
client
*client, int page,<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;*<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;* Don't expose fan=5Ftarget attribute for virtual pages.<br> &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;*/<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rv
=3D (page &gt;=3D MAX31785=5FNR=5FPAGES) ? -ENOTSUPP : -ENODATA;<br>+ &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(page &gt;=3D MAX31785=5FNR=5FPAGES)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return -ENOTSUPP;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
break;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
case PMBUS=5FVIRT=5FFAN=5FTARGET=5F1:<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(page &gt;=3D MAX31785=5FNR=5FPAGES)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return -ENOTSUPP;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
-ENODATA;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;case
PMBUS=5FVIRT=5FPWM=5F1:<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rv
=3D max31785=5Fget=5Fpwm(client, page);<br>- &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>+ &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
max31785=5Fget=5Fpwm(client, page);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;case
PMBUS=5FVIRT=5FPWM=5FENABLE=5F1:<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rv
=3D max31785=5Fget=5Fpwm=5Fmode(client, page);<br>- &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>+ &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
max31785=5Fget=5Fpwm=5Fmode(client, page);<br> &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:<br>- &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rv
=3D -ENODATA;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(page &gt;=3D MAX31785=5FNR=5FPAGES)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return -ENXIO;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
break;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<=
br> <br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return rv;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (reg &gt;=3D PMBUS=5FVIRT=5FBASE)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
-ENXIO;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return max31785=5Fpmbus=5Fread=5Fword=5Fdata(client, page, reg);<br> }<br> =
<br> static inline u32 max31785=5Fscale=5Fpwm(u32 sensor=5Fval)<br>@@ -201,=
6 +286,31 @@ static inline u32 max31785=5Fscale=5Fpwm(u32 sensor=5Fval)<br>=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
(sensor=5Fval * 100) / 255;<br> }<br> <br>+static int max31785=5Fupdate=5Ff=
an(struct i2c=5Fclient *client, int page,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;u8 config, u8 mask, u16 command)<br>+{<br>+ &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
int from, rv;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
u8 to;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
from =3D max31785=5Fpmbus=5Fread=5Fbyte=5Fdata(client, page, PMBUS=5FFAN=5F=
CONFIG=5F12);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (from &lt; 0)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
from;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
to =3D (from &amp; ~mask) | (config &amp; mask);<br>+<br>+ &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (to !=3D from) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rv
=3D max31785=5Fpmbus=5Fwrite=5Fbyte=5Fdata(client, page,<br>+ &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;PMBUS=5FFAN=5FCONFIG=5F12, to);<br>+ &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(rv &lt; 0)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return rv;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
rv =3D max31785=5Fpmbus=5Fwrite=5Fword=5Fdata(client, page, PMBUS=5FFAN=5FC=
OMMAND=5F1,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; command);<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;
return rv;<br>+}<br>+<br> static int max31785=5Fpwm=5Fenable(struct i2c=5Fc=
lient *client, int page,<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; u16 word)<br> {<br>@@ -230,15 +340,18 @@ static int max31785=
=5Fpwm=5Fenable(struct i2c=5Fclient
*client, int page,<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return -EINVAL;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;}<br> <br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return pmbus=5Fupdate=5Ffan(client, page, 0, config, PB=5FFAN=5F1=5FRPM, ra=
te);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return max31785=5Fupdate=5Ffan(client, page, config, PB=5FFAN=5F1=5FRPM, ra=
te);<br> }<br> <br> static int max31785=5Fwrite=5Fword=5Fdata(struct i2c=5F=
client *client, int page,<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; int reg, u16 word)<br> {<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;switch
(reg) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
case PMBUS=5FVIRT=5FFAN=5FTARGET=5F1:<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
max31785=5Fupdate=5Ffan(client, page, PB=5FFAN=5F1=5FRPM,<br>+ &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;PB=5FFAN=5F1=5FRPM, word);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;case
PMBUS=5FVIRT=5FPWM=5F1:<br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
pmbus=5Fupdate=5Ffan(client, page, 0, 0, PB=5FFAN=5F1=5FRPM,<br>+ &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
max31785=5Fupdate=5Ffan(client, page, 0, PB=5FFAN=5F1=5FRPM,<br> &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;max31785=5Fsc=
ale=5Fpwm(word));<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;case
PMBUS=5FVIRT=5FPWM=5FENABLE=5F1:<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return max31785=5Fpwm=5Fenable(client, page, word);<br>@@ -246,7 +359,10 @@=
 static int max31785=5Fwrite=5Fword=5Fdata(struct i2c=5Fclient
*client, int page,<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
break;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<=
br> <br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return -ENODATA;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;
if (reg &lt; PMBUS=5FVIRT=5FBASE)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
max31785=5Fpmbus=5Fwrite=5Fword=5Fdata(client, page, reg, word);<br>+<br>+ =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return -ENXIO;<br> }<br> <br> /*<br>@@ -279,11 +395,11 @@ static int max317=
85=5Fof=5Ffan=5Fconfig(struct i2c=5Fclient
*client,<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return -ENXIO;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;}<br> <br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, PMBUS=5FPAGE, page);<br>+=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D max31785=5Fi2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, PMBUS=5FPAGE, =
page);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(ret &lt; 0)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return ret;<br> <br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;
pb=5Fcfg =3D i2c=5Fsmbus=5Fread=5Fbyte=5Fdata(client, PMBUS=5FFAN=5FCONFIG=
=5F12);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
pb=5Fcfg =3D max31785=5Fi2c=5Fsmbus=5Fread=5Fbyte=5Fdata(client, PMBUS=5FFA=
N=5FCONFIG=5F12);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;if
(pb=5Fcfg &lt; 0)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return pb=5Fcfg;<br> <br>@@ -309,7 +425,9 @@ static int max31785=5Fof=5Ffan=
=5Fconfig(struct i2c=5Fclient
*client,<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
else if (!strcmp(&quot;lock&quot;, sval)) {<br> &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
mfr=5Fcfg |=3D MFR=5FFAN=5FCONFIG=5FROTOR;<br> <br>- &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
=3D i2c=5Fsmbus=5Fwrite=5Fword=5Fdata(client, MFR=5FFAN=5FFAULT=5FLIMIT, 1)=
;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
=3D max31785=5Fi2c=5Fsmbus=5Fwrite=5Fword=5Fdata(client,<br>+ &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;MFR=5FFAN=5FFAULT=5FLIMIT,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;1);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (ret &lt; 0)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
ret;<br> <br>@@ -423,21 +541,23 @@ static int max31785=5Fof=5Ffan=5Fconfig(=
struct i2c=5Fclient
*client,<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
if
(of=5Fproperty=5Fread=5Fbool(child, &quot;maxim,fan-fault-pin-mon&quot;))<b=
r> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
mfr=5Ffault=5Fresp |=3D MFR=5FFAULT=5FRESPONSE=5FMONITOR;<br> <br>- &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, PMBUS=5FFAN=5FCONFIG=5F12=
,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D max31785=5Fi2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, PMBUS=5FFAN=5F=
CONFIG=5F12,<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pb=5Fcfg
&amp; ~PB=5FFAN=5F1=5FINSTALLED);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;if
(ret &lt; 0)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return ret;<br> <br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;
ret =3D i2c=5Fsmbus=5Fwrite=5Fword=5Fdata(client, MFR=5FFAN=5FCONFIG, mfr=
=5Fcfg);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D max31785=5Fi2c=5Fsmbus=5Fwrite=5Fword=5Fdata(client, MFR=5FFAN=5FCO=
NFIG,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
mfr=5Fcfg);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;if
(ret &lt; 0)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return ret;<br> <br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;
ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, MFR=5FFAULT=5FRESPONSE,<b=
r>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
mfr=5Ffault=5Fresp);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
ret =3D max31785=5Fi2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, MFR=5FFAULT=5F=
RESPONSE,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
mfr=5Ffault=5Fresp);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;if
(ret &lt; 0)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return ret;<br> <br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;
ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, PMBUS=5FFAN=5FCONFIG=5F12=
, pb=5Fcfg);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D max31785=5Fi2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, PMBUS=5FFAN=5F=
CONFIG=5F12,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
pb=5Fcfg);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;if
(ret &lt; 0)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return ret;<br> <br>@@ -482,7 +602,7 @@ static int max31785=5Fof=5Ftmp=5Fco=
nfig(struct i2c=5Fclient
*client,<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return -ENXIO;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;}<br> <br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, PMBUS=5FPAGE, page);<br>+=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D max31785=5Fi2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, PMBUS=5FPAGE, =
page);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(ret &lt; 0)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return ret;<br> <br>@@ -506,7 +626,7 @@ static int max31785=5Fof=5Ftmp=5Fco=
nfig(struct i2c=5Fclient
*client,<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
i++;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br=
> <br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D i2c=5Fsmbus=5Fwrite=5Fword=5Fdata(client, MFR=5FTEMP=5FSENSOR=5FCON=
FIG,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D max31785=5Fi2c=5Fsmbus=5Fwrite=5Fword=5Fdata(client, MFR=5FTEMP=5FS=
ENSOR=5FCONFIG,<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mfr=5Ftmp=5Fc=
fg);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(ret &lt; 0)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return ret;<br>@@ -585,11 +705,11 @@ static int max31785=5Fconfigure=5Fdual=
=5Ftach(struct i2c=5Fclient
*client,<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
int
i;<br> <br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;f=
or
(i =3D 0; i &lt; MAX31785=5FNR=5FFAN=5FPAGES; i++) {<br>- &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
=3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, PMBUS=5FPAGE, i);<br>+ &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
=3D max31785=5Fi2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, PMBUS=5FPAGE, i);<=
br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (ret &lt; 0)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
ret;<br> <br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
=3D i2c=5Fsmbus=5Fread=5Fword=5Fdata(client, MFR=5FFAN=5FCONFIG);<br>+ &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
=3D max31785=5Fi2c=5Fsmbus=5Fread=5Fword=5Fdata(client, MFR=5FFAN=5FCONFIG)=
;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (ret &lt; 0)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
ret;<br> <br>@@ -627,7 +747,7 @@ static int max31785=5Fprobe(struct i2c=5Fc=
lient *client,<br> <br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;*info
=3D max31785=5Finfo;<br> <br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;
ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, PMBUS=5FPAGE, 255);<br>+ =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D max31785=5Fi2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, PMBUS=5FPAGE, =
255);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(ret &lt; 0)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return ret;<br> <br>@@ -669,17 +789,20 @@ static int max31785=5Fprobe(struc=
t i2c=5Fclient *client,<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (!have=5Ffan || fan=5Fconfigured)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;continue;<br>=
 <br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
=3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, PMBUS=5FPAGE, i);<br>+ &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
=3D max31785=5Fi2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, PMBUS=5FPAGE,<br>+=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;i);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (ret &lt; 0)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
ret;<br> <br>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
=3D i2c=5Fsmbus=5Fread=5Fbyte=5Fdata(client, PMBUS=5FFAN=5FCONFIG=5F12);<br=
>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
=3D max31785=5Fi2c=5Fsmbus=5Fread=5Fbyte=5Fdata(client,<br>+ &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
PMBUS=5FFAN=5FCONFIG=5F12);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (ret &lt; 0)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
ret;<br> <br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret &amp;=3D ~PB=5FFAN=5F1=5FINSTALLED;<br>- &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
=3D i2c=5Fsmbus=5Fwrite=5Fword=5Fdata(client, PMBUS=5FFAN=5FCONFIG=5F12,<br=
>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret);<br>+ &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
=3D max31785=5Fi2c=5Fsmbus=5Fwrite=5Fword=5Fdata(client,<br>+ &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;PMBUS=5FFAN=5FCONFIG=5F12,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;ret);<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (ret &lt; 0)<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
ret;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br=
>-- <br>2.14.1<br><br></span></tt><br><br><BR>

--=_alternative 00160B2765258265_=--

--=_related 00160B2765258265_=
Content-Transfer-Encoding: base64
Content-Type: image/jpeg
Content-ID: <_2_0AFFF6780AFFF40C001609F465258265>

/9j/4AAQSkZJRgABAQEASABIAAD/4gxYSUNDX1BST0ZJTEUAAQEAAAxITGlubwIQAABtbnRyUkdC
IFhZWiAHzgACAAkABgAxAABhY3NwTVNGVAAAAABJRUMgc1JHQgAAAAAAAAAAAAAAAAAA9tYAAQAA
AADTLUhQICAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABFj
cHJ0AAABUAAAADNkZXNjAAABhAAAAGx3dHB0AAAB8AAAABRia3B0AAACBAAAABRyWFlaAAACGAAA
ABRnWFlaAAACLAAAABRiWFlaAAACQAAAABRkbW5kAAACVAAAAHBkbWRkAAACxAAAAIh2dWVkAAAD
TAAAAIZ2aWV3AAAD1AAAACRsdW1pAAAD+AAAABRtZWFzAAAEDAAAACR0ZWNoAAAEMAAAAAxyVFJD
AAAEPAAACAxnVFJDAAAEPAAACAxiVFJDAAAEPAAACAx0ZXh0AAAAAENvcHlyaWdodCAoYykgMTk5
OCBIZXdsZXR0LVBhY2thcmQgQ29tcGFueQAAZGVzYwAAAAAAAAASc1JHQiBJRUM2MTk2Ni0yLjEA
AAAAAAAAAAAAABJzUkdCIElFQzYxOTY2LTIuMQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAWFlaIAAAAAAAAPNRAAEAAAABFsxYWVogAAAAAAAAAAAAAAAA
AAAAAFhZWiAAAAAAAABvogAAOPUAAAOQWFlaIAAAAAAAAGKZAAC3hQAAGNpYWVogAAAAAAAAJKAA
AA+EAAC2z2Rlc2MAAAAAAAAAFklFQyBodHRwOi8vd3d3LmllYy5jaAAAAAAAAAAAAAAAFklFQyBo
dHRwOi8vd3d3LmllYy5jaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAABkZXNjAAAAAAAAAC5JRUMgNjE5NjYtMi4xIERlZmF1bHQgUkdCIGNvbG91ciBzcGFjZSAt
IHNSR0IAAAAAAAAAAAAAAC5JRUMgNjE5NjYtMi4xIERlZmF1bHQgUkdCIGNvbG91ciBzcGFjZSAt
IHNSR0IAAAAAAAAAAAAAAAAAAAAAAAAAAAAAZGVzYwAAAAAAAAAsUmVmZXJlbmNlIFZpZXdpbmcg
Q29uZGl0aW9uIGluIElFQzYxOTY2LTIuMQAAAAAAAAAAAAAALFJlZmVyZW5jZSBWaWV3aW5nIENv
bmRpdGlvbiBpbiBJRUM2MTk2Ni0yLjEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHZpZXcAAAAA
ABOk/gAUXy4AEM8UAAPtzAAEEwsAA1yeAAAAAVhZWiAAAAAAAEwJVgBQAAAAVx/nbWVhcwAAAAAA
AAABAAAAAAAAAAAAAAAAAAAAAAAAAo8AAAACc2lnIAAAAABDUlQgY3VydgAAAAAAAAQAAAAABQAK
AA8AFAAZAB4AIwAoAC0AMgA3ADsAQABFAEoATwBUAFkAXgBjAGgAbQByAHcAfACBAIYAiwCQAJUA
mgCfAKQAqQCuALIAtwC8AMEAxgDLANAA1QDbAOAA5QDrAPAA9gD7AQEBBwENARMBGQEfASUBKwEy
ATgBPgFFAUwBUgFZAWABZwFuAXUBfAGDAYsBkgGaAaEBqQGxAbkBwQHJAdEB2QHhAekB8gH6AgMC
DAIUAh0CJgIvAjgCQQJLAlQCXQJnAnECegKEAo4CmAKiAqwCtgLBAssC1QLgAusC9QMAAwsDFgMh
Ay0DOANDA08DWgNmA3IDfgOKA5YDogOuA7oDxwPTA+AD7AP5BAYEEwQgBC0EOwRIBFUEYwRxBH4E
jASaBKgEtgTEBNME4QTwBP4FDQUcBSsFOgVJBVgFZwV3BYYFlgWmBbUFxQXVBeUF9gYGBhYGJwY3
BkgGWQZqBnsGjAadBq8GwAbRBuMG9QcHBxkHKwc9B08HYQd0B4YHmQesB78H0gflB/gICwgfCDII
RghaCG4IggiWCKoIvgjSCOcI+wkQCSUJOglPCWQJeQmPCaQJugnPCeUJ+woRCicKPQpUCmoKgQqY
Cq4KxQrcCvMLCwsiCzkLUQtpC4ALmAuwC8gL4Qv5DBIMKgxDDFwMdQyODKcMwAzZDPMNDQ0mDUAN
Wg10DY4NqQ3DDd4N+A4TDi4OSQ5kDn8Omw62DtIO7g8JDyUPQQ9eD3oPlg+zD88P7BAJECYQQxBh
EH4QmxC5ENcQ9RETETERTxFtEYwRqhHJEegSBxImEkUSZBKEEqMSwxLjEwMTIxNDE2MTgxOkE8UT
5RQGFCcUSRRqFIsUrRTOFPAVEhU0FVYVeBWbFb0V4BYDFiYWSRZsFo8WshbWFvoXHRdBF2UXiReu
F9IX9xgbGEAYZRiKGK8Y1Rj6GSAZRRlrGZEZtxndGgQaKhpRGncanhrFGuwbFBs7G2MbihuyG9oc
AhwqHFIcexyjHMwc9R0eHUcdcB2ZHcMd7B4WHkAeah6UHr4e6R8THz4faR+UH78f6iAVIEEgbCCY
IMQg8CEcIUghdSGhIc4h+yInIlUigiKvIt0jCiM4I2YjlCPCI/AkHyRNJHwkqyTaJQklOCVoJZcl
xyX3JicmVyaHJrcm6CcYJ0kneierJ9woDSg/KHEooijUKQYpOClrKZ0p0CoCKjUqaCqbKs8rAis2
K2krnSvRLAUsOSxuLKIs1y0MLUEtdi2rLeEuFi5MLoIuty7uLyQvWi+RL8cv/jA1MGwwpDDbMRIx
SjGCMbox8jIqMmMymzLUMw0zRjN/M7gz8TQrNGU0njTYNRM1TTWHNcI1/TY3NnI2rjbpNyQ3YDec
N9c4FDhQOIw4yDkFOUI5fzm8Ofk6Njp0OrI67zstO2s7qjvoPCc8ZTykPOM9Ij1hPaE94D4gPmA+
oD7gPyE/YT+iP+JAI0BkQKZA50EpQWpBrEHuQjBCckK1QvdDOkN9Q8BEA0RHRIpEzkUSRVVFmkXe
RiJGZ0arRvBHNUd7R8BIBUhLSJFI10kdSWNJqUnwSjdKfUrESwxLU0uaS+JMKkxyTLpNAk1KTZNN
3E4lTm5Ot08AT0lPk0/dUCdQcVC7UQZRUFGbUeZSMVJ8UsdTE1NfU6pT9lRCVI9U21UoVXVVwlYP
VlxWqVb3V0RXklfgWC9YfVjLWRpZaVm4WgdaVlqmWvVbRVuVW+VcNVyGXNZdJ114XcleGl5sXr1f
D19hX7NgBWBXYKpg/GFPYaJh9WJJYpxi8GNDY5dj62RAZJRk6WU9ZZJl52Y9ZpJm6Gc9Z5Nn6Wg/
aJZo7GlDaZpp8WpIap9q92tPa6dr/2xXbK9tCG1gbbluEm5rbsRvHm94b9FwK3CGcOBxOnGVcfBy
S3KmcwFzXXO4dBR0cHTMdSh1hXXhdj52m3b4d1Z3s3gReG54zHkqeYl553pGeqV7BHtje8J8IXyB
fOF9QX2hfgF+Yn7CfyN/hH/lgEeAqIEKgWuBzYIwgpKC9INXg7qEHYSAhOOFR4Wrhg6GcobXhzuH
n4gEiGmIzokziZmJ/opkisqLMIuWi/yMY4zKjTGNmI3/jmaOzo82j56QBpBukNaRP5GokhGSepLj
k02TtpQglIqU9JVflcmWNJaflwqXdZfgmEyYuJkkmZCZ/JpomtWbQpuvnByciZz3nWSd0p5Anq6f
HZ+Ln/qgaaDYoUehtqImopajBqN2o+akVqTHpTilqaYapoum/adup+CoUqjEqTepqaocqo+rAqt1
q+msXKzQrUStuK4trqGvFq+LsACwdbDqsWCx1rJLssKzOLOutCW0nLUTtYq2AbZ5tvC3aLfguFm4
0blKucK6O7q1uy67p7whvJu9Fb2Pvgq+hL7/v3q/9cBwwOzBZ8Hjwl/C28NYw9TEUcTOxUvFyMZG
xsPHQce/yD3IvMk6ybnKOMq3yzbLtsw1zLXNNc21zjbOts83z7jQOdC60TzRvtI/0sHTRNPG1EnU
y9VO1dHWVdbY11zX4Nhk2OjZbNnx2nba+9uA3AXcit0Q3ZbeHN6i3ynfr+A24L3hROHM4lPi2+Nj
4+vkc+T85YTmDeaW5x/nqegy6LzpRunQ6lvq5etw6/vshu0R7ZzuKO6070DvzPBY8OXxcvH/8ozz
GfOn9DT0wvVQ9d72bfb794r4Gfio+Tj5x/pX+uf7d/wH/Jj9Kf26/kv+3P9t////4QCMRXhpZgAA
TU0AKgAAAAgABQESAAMAAAABAAEAAAEaAAUAAAABAAAASgEbAAUAAAABAAAAUgEoAAMAAAABAAIA
AIdpAAQAAAABAAAAWgAAAAAAAABIAAAAAQAAAEgAAAABAAOgAQADAAAAAQABAACgAgAEAAAAAQAA
ADygAwAEAAAAAQAAAFoAAAAA/9sAQwACAQECAQECAgECAgICAgMFAwMDAwMGBAQDBQcGBwcHBgYG
BwgLCQcICggGBgkNCQoLCwwMDAcJDQ4NDA4LDAwL/9sAQwECAgIDAgMFAwMFCwgGCAsLCwsLCwsL
CwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsL/8AAEQgAWgA8AwEiAAIR
AQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAAB
fQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5
OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeo
qaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMB
AQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYS
QVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNU
VVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5
usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A/CqfxBfW
evXQW4uMiZiP3hz1NevfCH4vXF8I9N1a8nDNxC5kP/fNeZ6vYTWXjC50jxwr2uoWkjQwySthVG4k
B+PmU54OfTFdl8Kf2e/EnxZ+IOneHvhPF/amrahIgijjbaIMsF3SOfljXJHzE4r6zKcdWyytzx6a
NP8AJnj4/DU8fS5Jddn+qPZTfXfT7Tce/wC8NL9tu93/AB8z/wDfw19H/tXf8E19Y/Y/+Gvhi/m8
UW3je6axX/hJnsrUxxaNdMflUHJMkeCB5hAO4cgBhXz19lHTFfr2VZlhc4o+2wslJJ2fk1un2aPz
rMMuxOVVVSxMWm1deaezXkyodQu/4Lm4/wC/hqKbULvp9puP+/hq+1nu7Go5LPjpXpOmmcHMZkl9
d5P+k3H/AH8NdD4Nubp9LkJubj/Wn/lqfQe9ZM1jz0rovBlof7Kf/rqe3sKynSNIzZyXxo+DFj8U
UnjvAttqEEjeRdBclfm5V/Vfbt2r0L9mHxjf/sw6bFb+FxFeTW0Ur2140YiuYLhlI83eoy6j+6T0
AGaTUrUf2pccf8tW/mai+yj0/Gs8XwzgcfN1a1K8na71W3p+e9h4fiDE4SKpwqaLpufQv/BNn49e
IPHninXvAvxrabxNYXEpQ+dILqW4mlUyuAhJldJI97FcEKwIB5FerfHb/gmBoupeCNWl+BMFtb6x
Yk3NjbtPN512APns3EjFdxGSjAId2FOQcj4H1DWvEXwj8Wnxb8N9X1HThJHFbanBZzGF54Ax6OCO
7856AZHSvqbxd/wUF1jxhLpGkfD2+a1iFvHbz6rLbRQRnEEr+VbohPyDy8CViZC2STg1/LXEOEzf
w+z+dTL5OFKT5lG75ZRT6rrpddz+puHMTlPiDkMYY1KVWMeRuy5oyf8AK910fRHzI1qV4YMpXqGG
CPrTGteK+vP2nP2F59U+EFx8dPhHruian4U1OW0n1XTxmK60aS6wquTyskclxvGQQQXAI718yt4N
vmZ1jg3unVQw3flnNf0hlHF2VZrhqVeFeMeZJ2bSafVa22eh/OOacLZjleJqUHRk+VtXSbT89L7r
U5aS1GeldD4Ntc6XJ8v/AC1P8hVa+0WazP8ApkEsX++hFbng+xJ0yTg/60/yFfQKrTrR5oPmXc8C
VOpTlyzjZkepWLf2lcf9dW/nUa2LdxW9qFvvv5yoBDSMQR35qJbX2/OvsVhtFofnjzBdzA1Xw7Dr
Om3FnqsKzW13GYpY26OpGCK5f/hScFpNbHRdT1Wyhsyvkwh1kSIBShALgnBUkc9M5r0f7N7UfZuO
leRmnDGAzm312ip22utV89z18p4ux+StvA15QvvZ6P5bHWa3+3PYfs8f8E6fi38P/H13caxrXxQ/
s3R9Bt7S0WGPSLCx+fE7gAFy7thuWwoz0rwrTv2sNOvNKt7i9aLUrDaEllVWMsEgHIcYyPXI4Nd5
rHhy08QWD2uuWkF5ayYZoZow6NjpkGuK1r9lbwNrTl30CO3kP8VrM8X6A4/SvyfOPCOpKo/7PnGM
LtqLurX3Ssnp2P1PJ/F+EY3x8XKo0k5LW9tE3d/eWp/2ibKXw3JqvhKWfVbKEEywwlbnYO+UyHH5
U/wT+0D4M8UaQ96LmOAyyncmSm04HZXA/SvN9e/YrudD1A3vwe8Q3elzc4huSSPp5idvqprl7T9l
Dx5JNcvqNnpskzzFmkjuYkWTgfMBvXGfoK+KxPA2d5dL2fsp27xbaf3X/JH2dDj/ACfMIqp7WCfa
Wj/G34H2Q3h9smvXfil+y14W+ChbQPiN411SP4jJpkN62i2Xh77TYQzTwpPDZvffaVfzykiZKW7o
GfbuPJGKngXUZ/D0+rW+m3smk2sy2s16sDG3imcMyRvJjaGYKxCk5IU46V0nir9p7X/Ft3aHWPBH
g/X/ABn9ig0mz8TzWl3JrOIwqW7hI7gW8txGqoizPA0uFT5iQMf0pnGMxNNwlhpaK/Na176WvdPT
e9tdrH8x5XgMNU5o11q7Wve1tb2s1rta+m9yA/8ABOf4uDXIdNXwtFJey/aUaKPWLB/sklvAtxNB
clZyLeZIWWQwTFZMfw113ib/AIJia74P+FWieItX1m0vrnU/Dusa/d2mlXWl3kWmCxuo7dfMuRqI
SSFjLEXmi3mIkr5bkNiv8Zf+Co3xn17xzfHxno9pb6vHbahpWoWt5ea00UctxayWcz/YZ79oLWZF
lkIEMUQVsjbjK1w7/tZ/FT4YfCu1+HmqeHNIsbbT/CmqeE9t/YXMV8tlq11DqEszgygeZlI/Kbbt
2PyrZDV8lLPc/rKGkIvdpK91rfVt6L3fPztofSwyDJaTneUmujbtZ3VtktbX/wAup6H8ef8Agl9r
nwk1l9H8EX2qeNdajvNI0rbp9pY/Yzf39u9wLfemovMu2NQRI8ChhudvLj2NL53/AMME/Ev+0Jol
0XTvs8Gmf2w+pDXtOOk/ZfO8jzBqAuPsx/fAx7RIW3DbjPFasv8AwU9+MS+MbnxBo9h4V0zUrrxB
pPiZpLayn/dz6fp/9nxxASTMPJkgJ3g5YliVZBxVnxn/AMFCPixq19qLfFLwjp+p+HfG+jJbTaNr
99r9/YX8CXImjuLeW71F7iMrNCSDDOqZDAqe04fPs/oJQqwjJvrbW9lfRNLvb8Wiq+QZLWblSnKK
10vpbW2rTfa/6nFftX/s5f8ADL/7QfiDwGdV/tt9C+z5vDa/ZjP5tvHP/qvMbZjzdv3jnGeM4rgP
7Dkrp/ix8ZPEn7UHx41jxz8RbDTNO1HWxB5ttpsMkVpF5MEUCiNJGZgNsQ6sec9BxWgmkAqK+5yr
E1sVhYe3/iJK/m7av7z5LMsBh8PiZeyleDbt5K+iPp79nn9p74d/DT4D3Phf46i2udNv/G+mandW
LaUbmSS0jhnWSYyCPJRJfsxMQcMymVVBEjh+G+KH7Qfw41P4t/DG58N3Wgahf6KYJPFet+H9Dl0r
SbyRb1nVrezMELgpb+WrkQR7mBIB+8fYta/Zn+D11+ybD4k8Xvq+l3h+Huna9e6nHZy3D2d3Nrv2
NpYrb7YqTFxvg2MY1ChZeGYhfL/it/wT18I/s5eDvE2pfGT4q6Zo+s2es6rpPh3TU8PXlyniFrBl
V99xFuS0di4AVw45BLY5H5Z/a2W18dUrQqTi3Jpq27sk2rJ6d/k3sj9IjleOpYWFOVOLSSad9le6
Tu1r6eiO9+Ln7YfwI1PXtfFrD4W1A6+/ji8uL248KtJeSXE0ryaGwuJLfzULMwxggKCRLtHAsfE7
9vn4MeMdV8c6l4fs/hPq/iHUDp0MF34x8JajJa3dhHo9vHJDY/YYPMtrqO8S5TdKsalWj2ybY1Fc
t+yF+y58OPi58NvhtrPxI0C2v7nXfiBqujX8s15dRRzWVvo8dzHE6wSAhVlYsXQByOMkYFehx/8A
BOP4YfEnwTqC+CNEs7XX/iNp+hReAb60vr0aU+oNp95qF4bMXUnnfZpvsTwqLxfNU88blJ8TEVsB
h6ns+ep7ul9P5tX+H/gK7o9ehh8XiIc3JHXW2u/Lp+f3s5fwR+2H+zrefECx0X4l+HPCo8DWXhbS
L5NTsvC3l30mtWsdrJdWkrCDzZEnaK4gYsChMm7OCWqLwt+2T8AdtrqdnoPwqt/GFx4QsVK+I/CN
5N4etNRN/ePfQy29lAZDMYJLTy5kjkQCPy9y9uF/aq+FHwb+Cn7YPw1TwTpEd78KfEFlY39ykt5c
41G2W+ntLqbzfN3xl/skkmFYBdw4HSvcvFH/AATW+EPwntdUg8Z6T9v1P4RQ6n4i8bq1/cRpqOmz
x6q2lRptlG3mwsgTHtY/axknjFYjE4SNKEuepaSXXto7+bdk+7a8yaOExE5yjywvF9u+3ySu12Vz
nPhB+1n+ytrPgnQF+O2jeHNE1vUphZa2dJ8N3DW2m29hdXN1BPbEwmQm8V7a2Yks+2P97gZNfInj
H472nxB8Y6vrWlaTZaVbanezXMVlbIkENmjuWWKONNqqqqQoAAHFe9eHP+CXfhbWvKsPE3xHuNL1
OBfDiX5PhzzNPhm1yFpLRYrv7WPOQN5aPJsUAsSAwU14x+0p+z/a/sp/ESHwbqOpf2jrlpptpda1
Ctr5a6VezRCV7MMpcSmNXjBf5MsWG0YyfcyjNcNgq05Uq8pOWtney66XW23yseTmmW1cRSgq1KKU
dLq1362fqUfiFqHjHXtAbR4fFPif+x3tV05rH7fP9mNsk32hIDFnb5azfvRHjAf5gM81lt41+K0e
l67ZSfEHx49l4qnNzrVudaujFrMrgBnul8zFwxAAJfJOBXqEsS7m+VevpVS0QMj7gDwOor52pRhO
fM0fS05ShGyZxfh7WPG3gjw/p9v4G8U+KNFGlXjajYrYajPbCyuXjETXEXlkeXIYwIzIuGKgDOKx
Nd8V/FnX9dj1DV/iF4/u76HUf7WjuZ9cupJY7wRCEXIcyZE3lgR+YPm2gDOBivVljXn5V6+lQ+Wv
90flWkqUJyu0KE5QVkzxyy8HeJNRttJs/FGsavqGn6FC1tpttc3Lyw6fEzs7JAjkiJTI7sQuASxP
U1s+OtU+IPizU9YudR8Y+LrmXxHaRWOrvLqtw76nbx7fLhuSW/fRrtj2q2QNowOBXpnlr/dHT0pv
lr/dH5UKolDl5UJ0ff5uZnDeFfip8UPCdr4cstT8UeI/EXhvwtdWt3Z+GtX1a7n0Vvs0geKN7QSg
eWCv3V24BOCK474nzeLPjH8SNe8V+O7mafWfEd/NqN7IpZFaWVy7BRnhQWwB2AA7V7M0S7W+Vfyq
vBAnlD5F6nt71N4x96MUmChzK0nc/9k=
--=_related 00160B2765258265_=--
