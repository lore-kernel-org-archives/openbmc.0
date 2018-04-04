Return-Path: <gkeishin@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gkeishin@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40GCgD4fRnzF1l6
 for <openbmc@lists.ozlabs.org>; Wed,  4 Apr 2018 14:30:16 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w343xwQK009030
 for <openbmc@lists.ozlabs.org>; Wed, 4 Apr 2018 00:01:43 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2h4funrkya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 04 Apr 2018 00:01:42 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Wed, 4 Apr 2018 04:01:39 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 4 Apr 2018 04:01:36 -0000
Received: from us1a3-mail113.a3.dal06.isc4sb.com ([10.146.45.236])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2018040404013660-1477160 ;
 Wed, 4 Apr 2018 04:01:36 +0000 
In-Reply-To: <1522814024.2560387.1325779592.6E3B6C1B@webmail.messagingengine.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Fwd: [PATCH linux dev-4.13 2/5] pmbus (max31785): Add support for
 devicetree configuration
From: "George Keishing" <gkeishin@in.ibm.com>
Date: Wed, 4 Apr 2018 04:01:34 +0000
References: <1522814024.2560387.1325779592.6E3B6C1B@webmail.messagingengine.com>
MIME-Version: 1.0
X-KeepSent: 77C73CC4:822D0995-00258265:0015EC36;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP9 SHF55 October 04, 2017
X-LLNOutbound: False
X-Disclaimed: 59783
X-TNEFEvaluated: 1
Content-Type: multipart/related; boundary="=_related 0015FBEE65258265_="
x-cbid: 18040404-5101-0000-0000-000009EBC2DF
X-IBM-SpamModules-Scores: BY=0.292159; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.38988; ST=0; TS=0; UL=0; ISC=; MB=0.185312
X-IBM-SpamModules-Versions: BY=3.00008798; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000255; SDB=6.01012808; UDB=6.00516211; IPR=6.00792074; 
 BA=6.00005893; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00020405; XFM=3.00000015;
 UTC=2018-04-04 04:01:38
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-04-04 01:57:42 - 6.00008286
x-cbparentid: 18040404-5102-0000-0000-00002A15D8ED
Message-Id: <OF77C73CC4.822D0995-ON00258265.0015EC36-65258265.00161E28@notes.na.collabserv.com>
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
X-List-Received-Date: Wed, 04 Apr 2018 04:30:17 -0000

--=_related 0015FBEE65258265_=
Content-Type: multipart/alternative; boundary="=_alternative 0015FBEE65258265_="



--=_alternative 0015FBEE65258265_=
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"

VGVzdCBhbmQgdmVyaWZpZWQgd29ya2luZy4NCg0KVGVzdGVkLWJ5OiBHZW9yZ2UgS2Vpc2hpbmcg
PGdrZWlzaGluQGluLmlibS5jb20+DQoNCg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KICAgR2Vvcmdl
IEtlaXNoaW5nDQogICBJQk0gU3lzdGVtcyAmVGVjaG5vbG9neSBMYWIsIEZpcm13YXJlIERldmVs
b3BtZW50LA0K4oCcIFRoZXJlIGlzbid0IGVub3VnaCB0aW1lIGluIGEgZGF5IHRvIGJlIGxhenkh
ISEgLuKAnQ0KDQoNCg0KDQoNCkZyb206ICAgQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5h
dT4NClRvOiAgICAgZ2tlaXNoaW5AaW4uaWJtLmNvbQ0KRGF0ZTogICAwNC8wNC8yMDE4IDA5OjIz
IEFNDQpTdWJqZWN0OiAgICAgICAgRndkOiBbUEFUQ0ggbGludXggZGV2LTQuMTMgMi81XSBwbWJ1
cyAobWF4MzE3ODUpOiBBZGQgDQpzdXBwb3J0IGZvciBkZXZpY2V0cmVlIGNvbmZpZ3VyYXRpb24N
Cg0KDQoNCg0KDQotLS0tLSBPcmlnaW5hbCBtZXNzYWdlIC0tLS0tDQpGcm9tOiBBbmRyZXcgSmVm
ZmVyeSA8YW5kcmV3QGFqLmlkLmF1Pg0KVG86IGpvZWxAam1zLmlkLmF1DQpDYzogQW5kcmV3IEpl
ZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4sIG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVj
dDogW1BBVENIIGxpbnV4IGRldi00LjEzIDIvNV0gcG1idXMgKG1heDMxNzg1KTogQWRkIHN1cHBv
cnQgZm9yIA0KZGV2aWNldHJlZSBjb25maWd1cmF0aW9uDQpEYXRlOiBUdWUsICAzIEFwciAyMDE4
IDIzOjU2OjUyICswOTMwDQoNClNpZ25lZC1vZmYtYnk6IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdA
YWouaWQuYXU+DQotLS0NCiBkcml2ZXJzL2h3bW9uL3BtYnVzL21heDMxNzg1LmMgfCAzMTggDQor
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2Vk
LCAzMTggaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9wbWJ1cy9t
YXgzMTc4NS5jIA0KYi9kcml2ZXJzL2h3bW9uL3BtYnVzL21heDMxNzg1LmMNCmluZGV4IGJmZmFi
NDQ5YmUzOS4uOWE3ZTc0NWI2YjMxIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9od21vbi9wbWJ1cy9t
YXgzMTc4NS5jDQorKysgYi9kcml2ZXJzL2h3bW9uL3BtYnVzL21heDMxNzg1LmMNCkBAIC0xNiwx
MyArMTYsMjMgQEANCiANCiBlbnVtIG1heDMxNzg1X3JlZ3Mgew0KICAgICAgICAgICAgICAgICBN
RlJfUkVWSVNJT04gICAgICAgICAgICAgICAgICAgICAgICAgICAgPSAweDliLA0KKyAgICAgICAg
ICAgICAgICBNRlJfRkFVTFRfUkVTUE9OU0UgICAgICAgICAgICAgID0gMHhkOSwNCisgICAgICAg
ICAgICAgICAgTUZSX1RFTVBfU0VOU09SX0NPTkZJRyAgICAgICAgICA9IDB4ZjAsDQogICAgICAg
ICAgICAgICAgIE1GUl9GQU5fQ09ORklHICAgICAgICAgICAgICAgICAgICAgICAgICA9IDB4ZjEs
DQorICAgICAgICAgICAgICAgIE1GUl9GQU5fRkFVTFRfTElNSVQgICAgICAgICAgICAgPSAweGY1
LA0KIH07DQogDQogI2RlZmluZSBNQVgzMTc4NSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDB4MzAzMA0KICNkZWZpbmUgTUFYMzE3ODVBICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDMwNDANCiANCiAjZGVmaW5lIE1G
Ul9GQU5fQ09ORklHX0RVQUxfVEFDSCAgICAgICAgICAgICAgICBCSVQoMTIpDQorI2RlZmluZSBN
RlJfRkFOX0NPTkZJR19UU0ZPICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoOSkNCisj
ZGVmaW5lIE1GUl9GQU5fQ09ORklHX1RBQ0hPICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJ
VCg4KQ0KKyNkZWZpbmUgTUZSX0ZBTl9DT05GSUdfSEVBTFRIICAgICAgICAgICAgICAgICAgICAg
ICAgICAgQklUKDQpDQorI2RlZmluZSBNRlJfRkFOX0NPTkZJR19ST1RPUl9ISV9MTyAgICAgICAg
ICAgICAgQklUKDMpDQorI2RlZmluZSBNRlJfRkFOX0NPTkZJR19ST1RPUiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBCSVQoMikNCisNCisjZGVmaW5lIE1GUl9GQVVMVF9SRVNQT05TRV9NT05J
VE9SICAgICAgICAgICAgICBCSVQoMCkNCiANCiAjZGVmaW5lIE1BWDMxNzg1X05SX1BBR0VTICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDIzDQogI2RlZmluZSBNQVgzMTc4NV9OUl9GQU5f
UEFHRVMgICAgICAgICAgICAgICAgICAgICAgICAgICA2DQpAQCAtMjM5LDYgKzI0OSwyNzEgQEAg
c3RhdGljIGludCBtYXgzMTc4NV93cml0ZV93b3JkX2RhdGEoc3RydWN0IA0KaTJjX2NsaWVudCAq
Y2xpZW50LCBpbnQgcGFnZSwNCiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9EQVRBOw0KIH0N
CiANCisvKg0KKyAqIFJldHVybnMgbmVnYXRpdmUgZXJyb3IgY29kZXMgaWYgYW4gdW5yZWNvdmVy
YWJsZSBwcm9ibGVtIGlzIGRldGVjdGVkLCANCjAgaWYgYQ0KKyAqIHJlY292ZXJhYmxlIHByb2Js
ZW0gaXMgZGV0ZWN0ZWQsIG9yIGEgcG9zaXRpdmUgdmFsdWUgb24gc3VjY2Vzcy4NCisgKi8NCitz
dGF0aWMgaW50IG1heDMxNzg1X29mX2Zhbl9jb25maWcoc3RydWN0IGkyY19jbGllbnQgKmNsaWVu
dCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgDQpwbWJ1c19kcml2ZXJfaW5mbyAqaW5mbywNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgDQpkZXZpY2Vfbm9kZSAqY2hpbGQpDQorew0KKyAgICAgICAgICAgICAgICBpbnQg
bWZyX2NmZyA9IDAsIG1mcl9mYXVsdF9yZXNwID0gMCwgcGJfY2ZnOw0KKyAgICAgICAgICAgICAg
ICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmY2xpZW50LT5kZXY7DQorICAgICAgICAgICAgICAgIGNo
YXIgKmxvY2tfcG9sYXJpdHkgPSBOVUxMOw0KKyAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpz
dmFsOw0KKyAgICAgICAgICAgICAgICB1MzIgcGFnZTsNCisgICAgICAgICAgICAgICAgdTMyIHV2
YWw7DQorICAgICAgICAgICAgICAgIGludCByZXQ7DQorDQorICAgICAgICAgICAgICAgIGlmICgh
b2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUoY2hpbGQsICJwbWJ1cy1mYW4iKSkNCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAwOw0KKw0KKyAgICAgICAgICAgICAgICByZXQg
PSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihjaGlsZCwgInJlZyIsICZwYWdlKTsNCisgICAgICAgICAg
ICAgICAgaWYgKHJldCA8IDApIHsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRl
dl9lcnIoJmNsaWVudC0+ZGV2LCAiTWlzc2luZyB2YWxpZCByZWcgDQpwcm9wZXJ0eVxuIik7DQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KKyAgICAgICAgICAg
ICAgICB9DQorDQorICAgICAgICAgICAgICAgIGlmICghKGluZm8tPmZ1bmNbcGFnZV0gJiBQTUJV
U19IQVZFX0ZBTjEyKSkgew0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2Vy
cihkZXYsICJQYWdlICVkIGRvZXMgbm90IGhhdmUgZmFuIA0KY2FwYWJpbGl0aWVzXG4iLCBwYWdl
KTsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5YSU87DQorICAg
ICAgICAgICAgICAgIH0NCisNCisgICAgICAgICAgICAgICAgcmV0ID0gaTJjX3NtYnVzX3dyaXRl
X2J5dGVfZGF0YShjbGllbnQsIFBNQlVTX1BBR0UsIA0KcGFnZSk7DQorICAgICAgICAgICAgICAg
IGlmIChyZXQgPCAwKQ0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJl
dDsNCisNCisgICAgICAgICAgICAgICAgcGJfY2ZnID0gaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRh
KGNsaWVudCwgDQpQTUJVU19GQU5fQ09ORklHXzEyKTsNCisgICAgICAgICAgICAgICAgaWYgKHBi
X2NmZyA8IDApDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcGJfY2Zn
Ow0KKw0KKyAgICAgICAgICAgICAgICBpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKGNoaWxkLT5w
YXJlbnQsIA0KInVzZS1zdG9yZWQtcHJlc2VuY2UiKSkgew0KKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKCEocGJfY2ZnICYgUEJfRkFOXzFfSU5TVEFMTEVEKSkNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZfaW5mbyhkZXYsICJG
YW4gJWQgaXMgDQpjb25maWd1cmVkIGJ1dCBub3QgaW5zdGFsbGVkXG4iLA0KKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFn
ZSk7DQorICAgICAgICAgICAgICAgIH0gZWxzZSB7DQorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYl9jZmcgfD0gUEJfRkFOXzFfSU5TVEFMTEVEOw0KKyAgICAgICAgICAgICAgICB9
DQorDQorICAgICAgICAgICAgICAgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfc3RyaW5nKGNoaWxk
LCANCiJtYXhpbSxmYW4tcm90b3ItaW5wdXQiLCAmc3ZhbCk7DQorICAgICAgICAgICAgICAgIGlm
IChyZXQgPCAwKSB7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRl
diwgIk1pc3NpbmcgdmFsaWQgDQptYXhpbSxmYW4tcm90b3ItaW5wdXQgcHJvcGVydHkgZm9yIGZh
biAlZFxuIiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGFnZSk7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gcmV0Ow0KKyAgICAgICAgICAgICAgICB9DQorDQorICAgICAgICAgICAgICAgIGlm
IChzdHJjbXAoInRhY2giLCBzdmFsKSAmJiBzdHJjbXAoImxvY2siLCBzdmFsKSkgew0KKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJtYXhpbSxmYW4tcm90b3It
aW5wdXQgaGFzIA0KaW52YWxpZCB2YWx1ZSBmb3IgZmFuICVkOiAlc1xuIiwNCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFn
ZSwgDQpzdmFsKTsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KKyAgICAgICAgICAgICAgICB9IGVsc2UgaWYgKCFzdHJjbXAoImxvY2siLCBzdmFsKSkg
ew0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWZyX2NmZyB8PSBNRlJfRkFOX0NP
TkZJR19ST1RPUjsNCisNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGky
Y19zbWJ1c193cml0ZV93b3JkX2RhdGEoY2xpZW50LCANCk1GUl9GQU5fRkFVTFRfTElNSVQsIDEp
Ow0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCA8IDApDQorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCisN
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRf
c3RyaW5nKGNoaWxkLCANCiJtYXhpbSxmYW4tbG9jay1wb2xhcml0eSIsDQorICAgICAgICAmc3Zh
bCk7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocmV0IDwgMCkgew0KKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2
LCAiTWlzc2luZyANCnZhbGlkIG1heGltLGZhbi1sb2NrLXBvbGFyaXR5IHByb3BlcnR5IGZvciBm
YW4gJWRcbiIsDQorICBwYWdlKTsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfQ0KKw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHN0cmNtcCgibG93
Iiwgc3ZhbCkgJiYgc3RyY21wKCJoaWdoIiwgDQpzdmFsKSkgew0KKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCANCiJtYXhpbSxmYW4t
bG9jay1wb2xhcml0eSBoYXMgaW52YWxpZCB2YWx1ZSBmb3IgZmFuICVkOiAlc1xuIiwNCisgIHBh
Z2UsIGxvY2tfcG9sYXJpdHkpOw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfSBlbHNlIGlmICghc3RyY21wKCJoaWdoIiwgc3ZhbCkpDQorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWZyX2NmZyB8PSANCk1GUl9GQU5fQ09O
RklHX1JPVE9SX0hJX0xPOw0KKyAgICAgICAgICAgICAgICB9DQorDQorICAgICAgICAgICAgICAg
IGlmICghb2ZfcHJvcGVydHlfcmVhZF9zdHJpbmcoY2hpbGQsICJmYW4tbW9kZSIsICZzdmFsKSkg
ew0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFzdHJjbXAoInJwbSIsIHN2
YWwpKQ0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBi
X2NmZyB8PSBQQl9GQU5fMV9SUE07DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBl
bHNlIGlmICghc3RyY21wKCJwd20iLCBzdmFsKSkNCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYl9jZmcgJj0gflBCX0ZBTl8xX1JQTTsNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGVsc2Ugew0KKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiZmFuLW1vZGUgDQpoYXMgaW52
YWxpZCB2YWx1ZSBmb3IgZmFuICVkOiAlc1xuIiwNCisgIHBhZ2UsIHN2YWwpOw0KKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0K
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfQ0KKyAgICAgICAgICAgICAgICB9DQor
DQorICAgICAgICAgICAgICAgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKGNoaWxkLCAidGFj
aC1wdWxzZXMiLCAmdXZhbCk7DQorICAgICAgICAgICAgICAgIGlmIChyZXQgPCAwKSB7DQorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYl9jZmcgJj0gflBCX0ZBTl8xX1BVTFNFX01B
U0s7DQorICAgICAgICAgICAgICAgIH0gZWxzZSBpZiAodXZhbCAmJiAodXZhbCAtIDEpIDwgNCkg
ew0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGJfY2ZnID0gKChwYl9jZmcgJiB+
UEJfRkFOXzFfUFVMU0VfTUFTSykgDQp8ICgodXZhbCAtIDEpIDw8IDQpKTsNCisgICAgICAgICAg
ICAgICAgfSBlbHNlIHsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIo
ZGV2LCAidGFjaC1wdWxzZXMgaGFzIGludmFsaWQgDQp2YWx1ZSBmb3IgZmFuICVkOiAldVxuIiwN
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFnZSwgDQp1dmFsKTsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOw0KKyAgICAgICAgICAgICAgICB9DQorDQorICAgICAgICAgICAgICAg
IGlmIChvZl9wcm9wZXJ0eV9yZWFkX2Jvb2woY2hpbGQsICJtYXhpbSxmYW4taGVhbHRoIikpDQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtZnJfY2ZnIHw9IE1GUl9GQU5fQ09ORklH
X0hFQUxUSDsNCisNCisgICAgICAgICAgICAgICAgaWYgKG9mX3Byb3BlcnR5X3JlYWRfYm9vbChj
aGlsZCwgIm1heGltLGZhbi1uby13YXRjaGRvZyIpIA0KfHwNCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG9mX3Byb3BlcnR5X3JlYWRfYm9vbChjaGlsZCwgDQoibWF4aW0sdG1wLW5v
LWZhdWx0LXJhbXAiKSkNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1mcl9jZmcg
fD0gTUZSX0ZBTl9DT05GSUdfVFNGTzsNCisNCisgICAgICAgICAgICAgICAgaWYgKG9mX3Byb3Bl
cnR5X3JlYWRfYm9vbChjaGlsZCwgIm1heGltLGZhbi1kdWFsLXRhY2giKSkNCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG1mcl9jZmcgfD0gTUZSX0ZBTl9DT05GSUdfRFVBTF9UQUNI
Ow0KKw0KKyAgICAgICAgICAgICAgICBpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKGNoaWxkLCAN
CiJtYXhpbSxmYW4tbm8tZmF1bHQtcmFtcCIpKQ0KKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbWZyX2NmZyB8PSBNRlJfRkFOX0NPTkZJR19UQUNITzsNCisNCisgICAgICAgICAgICAg
ICAgaWYgKCFvZl9wcm9wZXJ0eV9yZWFkX3UzMihjaGlsZCwgIm1heGltLGZhbi1zdGFydHVwIiwg
DQomdXZhbCkpIHsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHV2YWwgLz0gMjsN
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmICh1dmFsIDwgNSkgew0KKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1mcl9jZmcgfD0gdXZh
bDsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0gZWxzZSB7DQorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsIA0KIm1h
eGltLGZhbi1zdGFydHVwIGhhcyBpbnZhbGlkIHZhbHVlIGZvciBmYW4gJWQ6ICV1XG4iLA0KKyAg
cGFnZSwgdXZhbCk7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9
DQorICAgICAgICAgICAgICAgIH0NCisNCisgICAgICAgICAgICAgICAgaWYgKCFvZl9wcm9wZXJ0
eV9yZWFkX3UzMihjaGlsZCwgIm1heGltLGZhbi1yYW1wIiwgDQomdXZhbCkpIHsNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICh1dmFsIDwgOCkgew0KKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1mcl9jZmcgfD0gdXZhbCA8PCA1Ow0K
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfSBlbHNlIHsNCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgDQoibWF4aW0s
ZmFuLXJhbXAgaGFzIGludmFsaWQgdmFsdWUgZm9yIGZhbiAlZDogJXVcbiIsDQorICBwYWdlLCB1
dmFsKTsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0NCisgICAg
ICAgICAgICAgICAgfQ0KKw0KKyAgICAgICAgICAgICAgICBpZiAoIW9mX3Byb3BlcnR5X3JlYWRf
dTMyKGNoaWxkLCAibWF4aW0sdG1wLWh5c3RlcmVzaXMiLCANCiZ1dmFsKSkgew0KKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdXZhbCAvPSAyOw0KKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdXZhbCAtPSAxOw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aWYgKHV2YWwgPCA0KSB7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbWZyX2NmZyB8PSB1dmFsIDw8IDEwOw0KKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfSBlbHNlIHsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBkZXZfZXJyKGRldiwgDQoibWF4aW0sdG1wLWh5c3RlcmVzaXMgaGFzIGludmFs
aWQgdmFsdWUgZm9yIGZhbiAlZCwgJXVcbiIsDQorICBwYWdlLCB1dmFsKTsNCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0NCisgICAgICAgICAgICAgICAgfQ0KKw0K
KyAgICAgICAgICAgICAgICBpZiAoIW9mX3Byb3BlcnR5X3JlYWRfdTMyKGNoaWxkLCAibWF4aW0s
ZmFuLXB3bS1mcmVxIiwgDQomdXZhbCkpIHsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHUxNiB2YWw7DQorDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAodXZh
bCA9PSAzMCkgew0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHZhbCA9IDA7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9IGVsc2UgaWYg
KHV2YWwgPT0gNTApIHsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB2YWwgPSAxOw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfSBlbHNl
IGlmICh1dmFsID09IDEwMCkgew0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHZhbCA9IDI7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9
IGVsc2UgaWYgKHV2YWwgPT0gMTUwKSB7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdmFsID0gMzsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIH0gZWxzZSBpZiAodXZhbCA9PSAyNTAwMCkgew0KKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHZhbCA9IDc7DQorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB9IGVsc2Ugew0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGRldl9lcnIoZGV2LCANCiJtYXhpbSxmYW4tcHdtLWZyZXEgaGFzIGludmFs
aWQgdmFsdWUgZm9yIGZhbiAlZDogJXVcbiIsDQorICBwYWdlLCB1dmFsKTsNCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0NCisNCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG1mcl9jZmcgfD0gdmFsIDw8IDEzOw0KKyAgICAgICAgICAgICAgICB9DQor
DQorICAgICAgICAgICAgICAgIGlmIChvZl9wcm9wZXJ0eV9yZWFkX2Jvb2woY2hpbGQsIA0KIm1h
eGltLGZhbi1mYXVsdC1waW4tbW9uIikpDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBtZnJfZmF1bHRfcmVzcCB8PSANCk1GUl9GQVVMVF9SRVNQT05TRV9NT05JVE9SOw0KKw0KKyAg
ICAgICAgICAgICAgICByZXQgPSBpMmNfc21idXNfd3JpdGVfYnl0ZV9kYXRhKGNsaWVudCwgDQpQ
TUJVU19GQU5fQ09ORklHXzEyLA0KKyAgcGJfY2ZnICYgflBCX0ZBTl8xX0lOU1RBTExFRCk7DQor
ICAgICAgICAgICAgICAgIGlmIChyZXQgPCAwKQ0KKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIHJldDsNCisNCisgICAgICAgICAgICAgICAgcmV0ID0gaTJjX3NtYnVzX3dy
aXRlX3dvcmRfZGF0YShjbGllbnQsIE1GUl9GQU5fQ09ORklHLCANCm1mcl9jZmcpOw0KKyAgICAg
ICAgICAgICAgICBpZiAocmV0IDwgMCkNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiByZXQ7DQorDQorICAgICAgICAgICAgICAgIHJldCA9IGkyY19zbWJ1c193cml0ZV9i
eXRlX2RhdGEoY2xpZW50LCANCk1GUl9GQVVMVF9SRVNQT05TRSwNCisgIG1mcl9mYXVsdF9yZXNw
KTsNCisgICAgICAgICAgICAgICAgaWYgKHJldCA8IDApDQorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gcmV0Ow0KKw0KKyAgICAgICAgICAgICAgICByZXQgPSBpMmNfc21i
dXNfd3JpdGVfYnl0ZV9kYXRhKGNsaWVudCwgDQpQTUJVU19GQU5fQ09ORklHXzEyLCBwYl9jZmcp
Ow0KKyAgICAgICAgICAgICAgICBpZiAocmV0IDwgMCkNCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiByZXQ7DQorDQorICAgICAgICAgICAgICAgIC8qDQorICAgICAgICAg
ICAgICAgICAqIEZhbnMgYXJlIG9uIHBhZ2VzIDAgLSA1LiBJZiB0aGUgcGFnZSBwcm9wZXJ0eSBv
ZiBhIGZhbiANCm5vZGUgaXMNCisgICAgICAgICAgICAgICAgICogZ3JlYXRlciB0aGFuIDUgd2Ug
d2lsbCBoYXZlIGVycm9yZWQgaW4gY2hlY2tzIGFib3ZlIA0Kb3V0IGFib3ZlLg0KKyAgICAgICAg
ICAgICAgICAgKiBUaGVyZWZvcmUgd2UgZG9uJ3QgbmVlZCB0byBjb3BlIHdpdGggdmFsdWVzIHVw
IHRvIDMxLCANCmFuZCB0aGUgaW50DQorICAgICAgICAgICAgICAgICAqIHJldHVybiB0eXBlIGlz
IGVub3VnaC4NCisgICAgICAgICAgICAgICAgICoNCisgICAgICAgICAgICAgICAgICogVGhlIGJp
dCBtYXNrIHJldHVybiB2YWx1ZSBpcyB1c2VkIHRvIHBvcHVsYXRlIGEgDQpiaXRmaWVsZCBvZiBm
YW5zDQorICAgICAgICAgICAgICAgICAqIHdobyBhcmUgYm90aCBjb25maWd1cmVkIGluIHRoZSBk
ZXZpY2V0cmVlIF9hbmRfIA0KcmVwb3J0ZWQgYXMNCisgICAgICAgICAgICAgICAgICogaW5zdGFs
bGVkIGJ5IHRoZSBoYXJkd2FyZS4gQW55IGZhbnMgdGhhdCBhcmUgbm90IA0KY29uZmlndXJlZCBp
biB0aGUNCisgICAgICAgICAgICAgICAgICogZGV2aWNldHJlZSBidXQgYXJlIHJlcG9ydGVkIGFz
IGluc3RhbGxlZCBieSB0aGUgDQpoYXJkd2FyZSB3aWxsIGhhdmUNCisgICAgICAgICAgICAgICAg
ICogdGhlaXIgaGFyZHdhcmUgY29uZmlndXJhdGlvbiB1cGRhdGVkIHRvIHVuc2V0IHRoZSANCmlu
c3RhbGxlZCBiaXQuDQorICAgICAgICAgICAgICAgICAqLw0KKyAgICAgICAgICAgICAgICByZXR1
cm4gQklUKHBhZ2UpOw0KK30NCisNCitzdGF0aWMgaW50IG1heDMxNzg1X29mX3RtcF9jb25maWco
c3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgDQpwbWJ1c19kcml2
ZXJfaW5mbyAqaW5mbywNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgDQpkZXZpY2Vfbm9kZSAqY2hpbGQpDQor
ew0KKyAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmY2xpZW50LT5kZXY7DQor
ICAgICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7DQorICAgICAgICAgICAgICAg
IHUxNiBtZnJfdG1wX2NmZyA9IDA7DQorICAgICAgICAgICAgICAgIHUzMiBwYWdlOw0KKyAgICAg
ICAgICAgICAgICB1MzIgdXZhbDsNCisgICAgICAgICAgICAgICAgaW50IHJldDsNCisgICAgICAg
ICAgICAgICAgaW50IGk7DQorDQorICAgICAgICAgICAgICAgIGlmICghb2ZfZGV2aWNlX2lzX2Nv
bXBhdGlibGUoY2hpbGQsICJwbWJ1cy10ZW1wZXJhdHVyZSIpKQ0KKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIDA7DQorDQorICAgICAgICAgICAgICAgIHJldCA9IG9mX3By
b3BlcnR5X3JlYWRfdTMyKGNoaWxkLCAicmVnIiwgJnBhZ2UpOw0KKyAgICAgICAgICAgICAgICBp
ZiAocmV0IDwgMCkgew0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2Vycigm
Y2xpZW50LT5kZXYsICJNaXNzaW5nIHZhbGlkIHJlZyANCnByb3BlcnR5XG4iKTsNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQorICAgICAgICAgICAgICAgIH0N
CisNCisgICAgICAgICAgICAgICAgaWYgKCEoaW5mby0+ZnVuY1twYWdlXSAmIFBNQlVTX0hBVkVf
VEVNUCkpIHsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAi
UGFnZSAlZCBkb2VzIG5vdCBoYXZlIHRlbXAgDQpjYXBhYmlsaXRpZXNcbiIsIHBhZ2UpOw0KKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTlhJTzsNCisgICAgICAgICAg
ICAgICAgfQ0KKw0KKyAgICAgICAgICAgICAgICByZXQgPSBpMmNfc21idXNfd3JpdGVfYnl0ZV9k
YXRhKGNsaWVudCwgUE1CVVNfUEFHRSwgDQpwYWdlKTsNCisgICAgICAgICAgICAgICAgaWYgKHJl
dCA8IDApDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KKw0K
KyAgICAgICAgICAgICAgICBpZiAoIW9mX3Byb3BlcnR5X3JlYWRfdTMyKGNoaWxkLCAibWF4aW0s
dG1wLW9mZnNldCIsIA0KJnV2YWwpKSB7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpZiAodXZhbCA8IDMyKQ0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIG1mcl90bXBfY2ZnIHw9IHV2YWwgPDwgDQoxMDsNCisgICAgICAgICAgICAgICAg
fQ0KKw0KKyAgICAgICAgICAgICAgICBpID0gMDsNCisgICAgICAgICAgICAgICAgd2hpbGUgKChu
cCA9IG9mX3BhcnNlX3BoYW5kbGUoY2hpbGQsICJtYXhpbSx0bXAtZmFucyIsIA0KaSkpKSB7DQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAob2ZfcHJvcGVydHlfcmVhZF91MzIo
bnAsICJyZWciLCANCiZ1dmFsKSkgew0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGRldl9lcnIoJmNsaWVudC0+ZGV2LCANCiJGYWlsZWQgdG8gcmVhZCBm
YW4gcmVnIHByb3BlcnR5IGZvciBwaGFuZGxlIGluZGV4ICVkXG4iLA0KKyAgaSk7DQorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB9IGVsc2Ugew0KKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmICh1dmFsIDwgNikNCisgbWZyX3RtcF9jZmcg
fD0gQklUKHV2YWwpOw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGVsc2UNCisgZGV2X3dhcm4oJmNsaWVudC0+ZGV2LCAiSW52YWxpZCBmYW4gcGFnZTog
JWRcbiIsDQorICAgICAgICAgICAgICAgIHV2YWwpOw0KKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfQ0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaSsrOw0KKyAgICAg
ICAgICAgICAgICB9DQorDQorICAgICAgICAgICAgICAgIHJldCA9IGkyY19zbWJ1c193cml0ZV93
b3JkX2RhdGEoY2xpZW50LCANCk1GUl9URU1QX1NFTlNPUl9DT05GSUcsDQorICBtZnJfdG1wX2Nm
Zyk7DQorICAgICAgICAgICAgICAgIGlmIChyZXQgPCAwKQ0KKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsNCisNCisgICAgICAgICAgICAgICAgcmV0dXJuIDA7DQor
fQ0KKw0KICNkZWZpbmUgTUFYMzE3ODVfRkFOX0ZVTkNTIFwNCiAgICAgICAgICAgICAgICAgKFBN
QlVTX0hBVkVfRkFOMTIgfCBQTUJVU19IQVZFX1NUQVRVU19GQU4xMiB8IA0KUE1CVVNfSEFWRV9Q
V00xMikNCiANCkBAIC0zMzQsOSArNjA5LDEyIEBAIHN0YXRpYyBpbnQgbWF4MzE3ODVfcHJvYmUo
c3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCANCmkyY19kZXZpY2VfaWQgKmlkKQ0K
IHsNCiAgICAgICAgICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJmNsaWVudC0+ZGV2Ow0K
KyAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKmNoaWxkOw0KICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgcG1idXNfZHJpdmVyX2luZm8gKmluZm87DQogICAgICAgICAgICAgICAgIGJv
b2wgZHVhbF90YWNoID0gZmFsc2U7DQorICAgICAgICAgICAgICAgIHUzMiBmYW5zOw0KICAgICAg
ICAgICAgICAgICBzNjQgcmV0Ow0KKyAgICAgICAgICAgICAgICBpbnQgaTsNCiANCiAgICAgICAg
ICAgICAgICAgaWYgKCFpMmNfY2hlY2tfZnVuY3Rpb25hbGl0eShjbGllbnQtPmFkYXB0ZXIsDQog
STJDX0ZVTkNfU01CVVNfQllURV9EQVRBIHwNCkBAIC0zNjYsNiArNjQ0LDQ2IEBAIHN0YXRpYyBp
bnQgbWF4MzE3ODVfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOw0KICAgICAgICAgICAgICAgICB9
DQogDQorICAgICAgICAgICAgICAgIGZhbnMgPSAwOw0KKyAgICAgICAgICAgICAgICBmb3JfZWFj
aF9jaGlsZF9vZl9ub2RlKGRldi0+b2Zfbm9kZSwgY2hpbGQpIHsNCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHJldCA9IG1heDMxNzg1X29mX2Zhbl9jb25maWcoY2xpZW50LCANCmlu
Zm8sIGNoaWxkKTsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQgPCAw
KSB7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2Zf
bm9kZV9wdXQoY2hpbGQpOw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiByZXQ7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9
DQorDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocmV0KQ0KKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhbnMgfD0gcmV0Ow0KKw0K
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gbWF4MzE3ODVfb2ZfdG1wX2Nv
bmZpZyhjbGllbnQsIA0KaW5mbywgY2hpbGQpOw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKHJldCA8IDApIHsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBvZl9ub2RlX3B1dChjaGlsZCk7DQorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIH0NCisgICAgICAgICAgICAgICAgfQ0KKw0KKyAgICAgICAgICAgICAg
ICBmb3IgKGkgPSAwOyBpIDwgTUFYMzE3ODVfTlJfUEFHRVM7IGkrKykgew0KKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYm9vbCBoYXZlX2ZhbiA9ICEhKGluZm8tPmZ1bmNbaV0gJiAN
ClBNQlVTX0hBVkVfRkFOMTIpOw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9v
bCBmYW5fY29uZmlndXJlZCA9ICEhKGZhbnMgJiBCSVQoaSkpOw0KKw0KKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKCFoYXZlX2ZhbiB8fCBmYW5fY29uZmlndXJlZCkNCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCisN
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGkyY19zbWJ1c193cml0ZV9i
eXRlX2RhdGEoY2xpZW50LCANClBNQlVTX1BBR0UsIGkpOw0KKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKHJldCA8IDApDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCisNCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJldCA9IGkyY19zbWJ1c19yZWFkX2J5dGVfZGF0YShjbGllbnQsIA0KUE1CVVNf
RkFOX0NPTkZJR18xMik7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocmV0
IDwgMCkNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gcmV0Ow0KKw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ICY9IH5Q
Ql9GQU5fMV9JTlNUQUxMRUQ7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXQg
PSBpMmNfc21idXNfd3JpdGVfd29yZF9kYXRhKGNsaWVudCwgDQpQTUJVU19GQU5fQ09ORklHXzEy
LA0KKyAgICAgICAgICAgICAgICByZXQpOw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaWYgKHJldCA8IDApDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIHJldDsNCisgICAgICAgICAgICAgICAgfQ0KKw0KICAgICAgICAgICAg
ICAgICBpZiAoZHVhbF90YWNoKSB7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXQgPSANCm1heDMxNzg1X2NvbmZpZ3VyZV9kdWFsX3RhY2goY2xpZW50LCBpbmZvKTsNCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQgPCAwKQ0KLS0gDQoyLjE0LjENCg0K
DQoNCg0KDQo=

--=_alternative 0015FBEE65258265_=
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span style=3D" font-size:10pt;font-family:sans-serif">Test and verified
working.</span><br><br><span style=3D" font-size:10pt;font-family:sans-seri=
f">Tested-by: George
Keishing &lt;gkeishin@in.ibm.com&gt;</span><br><br><br><span style=3D" font=
-size:10pt;color:blue;font-family:sans-serif"><b>Thanks
and Regards,</b></span><br><span style=3D" font-size:10pt;color:blue;font-f=
amily:sans-serif">&nbsp;
&nbsp;George Keishing</span><br><span style=3D" font-size:10pt;color:blue;f=
ont-family:sans-serif">&nbsp;
&nbsp;IBM Systems &amp;Technology Lab, Firmware Development,</span><br><spa=
n style=3D" font-size:10pt;font-family:sans-serif"><i>=E2=80=9C</i></span><=
span style=3D" font-size:12pt">There isn't enough time in a day to be lazy!=
!! </span><span style=3D" font-size:9pt;font-family:sans-serif">.=E2=80=9D<=
/span><br><img src=3Dcid:=5F2=5F0B0C07D40B0C05680015FAEB65258265 style=3D"b=
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
09:23 AM</span><br><span style=3D" font-size:9pt;color:#5f5f5f;font-family:=
sans-serif">Subject:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">Fwd:
[PATCH linux dev-4.13 2/5] pmbus (max31785): Add support for devicetree
configuration</span><br><hr noshade><br><br><br><tt><span style=3D" font-si=
ze:10pt"><br><br>----- Original message -----<br>From: Andrew Jeffery &lt;a=
ndrew@aj.id.au&gt;<br>To: joel@jms.id.au<br>Cc: Andrew Jeffery &lt;andrew@a=
j.id.au&gt;, openbmc@lists.ozlabs.org<br>Subject: [PATCH linux dev-4.13 2/5=
] pmbus (max31785): Add support for devicetree
configuration<br>Date: Tue, &nbsp;3 Apr 2018 23:56:52 +0930<br><br>Signed-o=
ff-by: Andrew Jeffery &lt;andrew@aj.id.au&gt;<br>---<br> drivers/hwmon/pmbu=
s/max31785.c | 318 +++++++++++++++++++++++++++++++++++++++++<br> 1 file cha=
nged, 318 insertions(+)<br><br>diff --git a/drivers/hwmon/pmbus/max31785.c =
b/drivers/hwmon/pmbus/max31785.c<br>index bffab449be39..9a7e745b6b31 100644=
<br>--- a/drivers/hwmon/pmbus/max31785.c<br>+++ b/drivers/hwmon/pmbus/max31=
785.c<br>@@ -16,13 +16,23 @@<br> <br> enum max31785=5Fregs {<br> &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;MFR=5FREVISION
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D
0x9b,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
MFR=5FFAULT=5FRESPONSE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; =3D 0xd9,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;
MFR=5FTEMP=5FSENSOR=5FCONFIG &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; =3D 0xf0,<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;MFR=5FFAN=5FCONFIG
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D
0xf1,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
MFR=5FFAN=5FFAULT=5FLIMIT &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; =3D 0xf5,<br> };<br> <br> #define MAX31785 &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; 0x3030<br> #define MAX31785A &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; 0x3040<br> <br> #define MFR=5FFAN=5FCONFIG=5FDUAL=5FTACH &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; BIT(12)<br>+#define MFR=5FFAN=5FCONFIG=5FTSFO &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;BIT(9)<br>+#define MFR=5FFAN=5FCONFIG=5FTACHO &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;BIT(8)<br>+#define MFR=5FFAN=5FCONFIG=5FHEALTH &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;BIT(4)<br>+#define MFR=5FFAN=5FCONFIG=5FROTOR=5F=
HI=5FLO &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; BIT(3)<br>+#define MFR=5FFAN=5FCONFIG=5FROTOR &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;BIT(2)<br>+<br>+#define MFR=5FFAULT=5FRESPONSE=
=5FMONITOR &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; BIT(0)<br> <br> #define MAX31785=5FNR=5FPAGES &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;23<br> #define MAX31785=5FNR=5FFAN=5FPAGES &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;6<br>@@ -239,6 +249,271 @@ static int max31785=
=5Fwrite=5Fword=5Fdata(struct i2c=5Fclient
*client, int page,<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;return
-ENODATA;<br> }<br> <br>+/*<br>+ * Returns negative error codes if an unrec=
overable problem is detected,
0 if a<br>+ * recoverable problem is detected, or a positive value on succe=
ss.<br>+ */<br>+static int max31785=5Fof=5Ffan=5Fconfig(struct i2c=5Fclient=
 *client,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;struct pmbus=5Fdriver=5Finfo *info,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;struct device=5Fnode *child)<br>+{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;
int mfr=5Fcfg =3D 0, mfr=5Ffault=5Fresp =3D 0, pb=5Fcfg;<br>+ &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
struct device *dev =3D &amp;client-&gt;dev;<br>+ &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;
char *lock=5Fpolarity =3D NULL;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;
const char *sval;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;
u32 page;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
u32 uval;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
int ret;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (!of=5Fdevice=5Fis=5Fcompatible(child, &quot;pmbus-fan&quot;))<br>+ &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
0;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D of=5Fproperty=5Fread=5Fu32(child, &quot;reg&quot;, &amp;page);<br>+=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (ret &lt; 0) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dev=5Ferr(&am=
p;client-&gt;dev,
&quot;Missing valid reg property\n&quot;);<br>+ &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
ret;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (!(info-&gt;func[page] &amp; PMBUS=5FHAVE=5FFAN12)) {<br>+ &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dev=5Ferr(dev,
&quot;Page %d does not have fan capabilities\n&quot;, page);<br>+ &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
-ENXIO;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, PMBUS=5FPAGE, page);<br>+=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (ret &lt; 0)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
ret;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
pb=5Fcfg =3D i2c=5Fsmbus=5Fread=5Fbyte=5Fdata(client, PMBUS=5FFAN=5FCONFIG=
=5F12);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (pb=5Fcfg &lt; 0)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
pb=5Fcfg;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (of=5Fproperty=5Fread=5Fbool(child-&gt;parent, &quot;use-stored-presence=
&quot;))
{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(!(pb=5Fcfg &amp; PB=5FFAN=5F1=5FINSTALLED))<br>+ &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
dev=5Finfo(dev, &quot;Fan %d is configured but not installed\n&quot;,<br>+ =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
page);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
} else {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pb=5Fcfg
|=3D PB=5FFAN=5F1=5FINSTALLED;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;
}<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D of=5Fproperty=5Fread=5Fstring(child, &quot;maxim,fan-rotor-input&qu=
ot;,
&amp;sval);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (ret &lt; 0) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dev=5Ferr(dev,
&quot;Missing valid maxim,fan-rotor-input property for fan %d\n&quot;,<br>+=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;page);<br>+ &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
ret;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (strcmp(&quot;tach&quot;, sval) &amp;&amp; strcmp(&quot;lock&quot;,
sval)) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dev=5Ferr(dev,
&quot;maxim,fan-rotor-input has invalid value for fan %d: %s\n&quot;,<br>+ =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;page,
sval);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
-EINVAL;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
} else if (!strcmp(&quot;lock&quot;, sval)) {<br>+ &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mfr=5Fcfg
|=3D MFR=5FFAN=5FCONFIG=5FROTOR;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
=3D i2c=5Fsmbus=5Fwrite=5Fword=5Fdata(client, MFR=5FFAN=5FFAULT=5FLIMIT, 1)=
;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(ret &lt; 0)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return ret;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
=3D of=5Fproperty=5Fread=5Fstring(child, &quot;maxim,fan-lock-polarity&quot=
;,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &amp;sval);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(ret &lt; 0) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
dev=5Ferr(dev, &quot;Missing valid maxim,fan-lock-polarity property for fan
%d\n&quot;,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
page);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return ret;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>+<br>+ &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(strcmp(&quot;low&quot;, sval) &amp;&amp; strcmp(&quot;high&quot;, sval))
{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
dev=5Ferr(dev, &quot;maxim,fan-lock-polarity has invalid value for fan %d:
%s\n&quot;,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
page, lock=5Fpolarity);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return -EINVAL;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
else if (!strcmp(&quot;high&quot;, sval))<br>+ &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
mfr=5Fcfg |=3D MFR=5FFAN=5FCONFIG=5FROTOR=5FHI=5FLO;<br>+ &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (!of=5Fproperty=5Fread=5Fstring(child, &quot;fan-mode&quot;, &amp;sval))=
 {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(!strcmp(&quot;rpm&quot;, sval))<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
pb=5Fcfg |=3D PB=5FFAN=5F1=5FRPM;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;else
if (!strcmp(&quot;pwm&quot;, sval))<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
pb=5Fcfg &amp;=3D ~PB=5FFAN=5F1=5FRPM;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;else
{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
dev=5Ferr(dev, &quot;fan-mode has invalid value for fan %d: %s\n&quot;,<br>=
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
page, sval);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return -EINVAL;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>+ &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D of=5Fproperty=5Fread=5Fu32(child, &quot;tach-pulses&quot;, &amp;uva=
l);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (ret &lt; 0) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pb=5Fcfg
&amp;=3D ~PB=5FFAN=5F1=5FPULSE=5FMASK;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;
} else if (uval &amp;&amp; (uval - 1) &lt; 4) {<br>+ &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pb=5Fcfg
=3D ((pb=5Fcfg &amp; ~PB=5FFAN=5F1=5FPULSE=5FMASK) | ((uval - 1) &lt;&lt; 4=
));<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
} else {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dev=5Ferr(dev,
&quot;tach-pulses has invalid value for fan %d: %u\n&quot;,<br>+ &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;page,
uval);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
-EINVAL;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (of=5Fproperty=5Fread=5Fbool(child, &quot;maxim,fan-health&quot;))<br>+ =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mfr=5Fcfg
|=3D MFR=5FFAN=5FCONFIG=5FHEALTH;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;
if (of=5Fproperty=5Fread=5Fbool(child, &quot;maxim,fan-no-watchdog&quot;) |=
|<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;of=5Fproperty=
=5Fread=5Fbool(child,
&quot;maxim,tmp-no-fault-ramp&quot;))<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mfr=5Fcfg
|=3D MFR=5FFAN=5FCONFIG=5FTSFO;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;
if (of=5Fproperty=5Fread=5Fbool(child, &quot;maxim,fan-dual-tach&quot;))<br=
>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mfr=5Fcfg
|=3D MFR=5FFAN=5FCONFIG=5FDUAL=5FTACH;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;
if (of=5Fproperty=5Fread=5Fbool(child, &quot;maxim,fan-no-fault-ramp&quot;)=
)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mfr=5Fcfg
|=3D MFR=5FFAN=5FCONFIG=5FTACHO;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;
if (!of=5Fproperty=5Fread=5Fu32(child, &quot;maxim,fan-startup&quot;, &amp;=
uval))
{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uval
/=3D 2;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(uval &lt; 5) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
mfr=5Fcfg |=3D uval;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
else {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
dev=5Ferr(dev, &quot;maxim,fan-startup has invalid value for fan %d: %u\n&q=
uot;,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
page, uval);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return -EINVAL;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>+ &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (!of=5Fproperty=5Fread=5Fu32(child, &quot;maxim,fan-ramp&quot;, &amp;uva=
l))
{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(uval &lt; 8) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
mfr=5Fcfg |=3D uval &lt;&lt; 5;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
else {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
dev=5Ferr(dev, &quot;maxim,fan-ramp has invalid value for fan %d: %u\n&quot=
;,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
page, uval);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return -EINVAL;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>+ &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (!of=5Fproperty=5Fread=5Fu32(child, &quot;maxim,tmp-hysteresis&quot;, &a=
mp;uval))
{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uval
/=3D 2;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uval
-=3D 1;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(uval &lt; 4) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
mfr=5Fcfg |=3D uval &lt;&lt; 10;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
else {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
dev=5Ferr(dev, &quot;maxim,tmp-hysteresis has invalid value for fan %d, %u\=
n&quot;,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
page, uval);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return -EINVAL;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>+ &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (!of=5Fproperty=5Fread=5Fu32(child, &quot;maxim,fan-pwm-freq&quot;, &amp=
;uval))
{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u16
val;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(uval =3D=3D 30) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
val =3D 0;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
else if (uval =3D=3D 50) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
val =3D 1;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
else if (uval =3D=3D 100) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
val =3D 2;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
else if (uval =3D=3D 150) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
val =3D 3;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
else if (uval =3D=3D 25000) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
val =3D 7;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
else {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
dev=5Ferr(dev, &quot;maxim,fan-pwm-freq has invalid value for fan %d: %u\n&=
quot;,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
page, uval);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return -EINVAL;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>+<br>+ &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mfr=5Fcfg
|=3D val &lt;&lt; 13;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
}<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (of=5Fproperty=5Fread=5Fbool(child, &quot;maxim,fan-fault-pin-mon&quot;)=
)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mfr=5Ffault=
=5Fresp
|=3D MFR=5FFAULT=5FRESPONSE=5FMONITOR;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, PMBUS=5FFAN=5FCONFIG=5F12=
,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
pb=5Fcfg &amp; ~PB=5FFAN=5F1=5FINSTALLED);<br>+ &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;
if (ret &lt; 0)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
ret;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D i2c=5Fsmbus=5Fwrite=5Fword=5Fdata(client, MFR=5FFAN=5FCONFIG, mfr=
=5Fcfg);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (ret &lt; 0)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
ret;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, MFR=5FFAULT=5FRESPONSE,<b=
r>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
mfr=5Ffault=5Fresp);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
if (ret &lt; 0)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
ret;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, PMBUS=5FFAN=5FCONFIG=5F12=
, pb=5Fcfg);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (ret &lt; 0)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
ret;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
/*<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;* Fans are on pages 0 - 5. If the page property of a fan node is<br>+=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;* greater than 5 we will have errored in checks above out above.<br>+=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;* Therefore we don't need to cope with values up to 31, and the int<b=
r>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;* return type is enough.<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;
&nbsp;*<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;* The bit mask return value is used to populate a bitfield of fans<br=
>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;* who are both configured in the devicetree =5Fand=5F reported as<br>=
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;* installed by the hardware. Any fans that are not configured in
the<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;* devicetree but are reported as installed by the hardware will have<=
br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;* their hardware configuration updated to unset the installed bit.<br=
>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;*/<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return BIT(page);<br>+}<br>+<br>+static int max31785=5Fof=5Ftmp=5Fconfig(st=
ruct i2c=5Fclient *client,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;struct pmbus=5Fdriver=5Finfo *info,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;struct device=5Fnode *child)<br>+{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;
struct device *dev =3D &amp;client-&gt;dev;<br>+ &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;
struct device=5Fnode *np;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;
u16 mfr=5Ftmp=5Fcfg =3D 0;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;
u32 page;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
u32 uval;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
int ret;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
int i;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (!of=5Fdevice=5Fis=5Fcompatible(child, &quot;pmbus-temperature&quot;))<b=
r>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
0;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D of=5Fproperty=5Fread=5Fu32(child, &quot;reg&quot;, &amp;page);<br>+=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (ret &lt; 0) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dev=5Ferr(&am=
p;client-&gt;dev,
&quot;Missing valid reg property\n&quot;);<br>+ &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
ret;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (!(info-&gt;func[page] &amp; PMBUS=5FHAVE=5FTEMP)) {<br>+ &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dev=5Ferr(dev,
&quot;Page %d does not have temp capabilities\n&quot;, page);<br>+ &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
-ENXIO;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, PMBUS=5FPAGE, page);<br>+=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (ret &lt; 0)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
ret;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (!of=5Fproperty=5Fread=5Fu32(child, &quot;maxim,tmp-offset&quot;, &amp;u=
val))
{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(uval &lt; 32)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
mfr=5Ftmp=5Fcfg |=3D uval &lt;&lt; 10;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;
}<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
i =3D 0;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
while ((np =3D of=5Fparse=5Fphandle(child, &quot;maxim,tmp-fans&quot;, i)))=
 {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(of=5Fproperty=5Fread=5Fu32(np, &quot;reg&quot;, &amp;uval)) {<br>+ &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
dev=5Ferr(&amp;client-&gt;dev, &quot;Failed to read fan reg property for
phandle index %d\n&quot;,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
i);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}
else {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (uval &lt; 6)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mfr=5Ftmp=5Fc=
fg
|=3D BIT(uval);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
else<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dev=5Fwarn(&a=
mp;client-&gt;dev,
&quot;Invalid fan page: %d\n&quot;,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uval);<br>+ &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>+ &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i++;<br>+ &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D i2c=5Fsmbus=5Fwrite=5Fword=5Fdata(client, MFR=5FTEMP=5FSENSOR=5FCON=
FIG,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
mfr=5Ftmp=5Fcfg);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;
if (ret &lt; 0)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return
ret;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return 0;<br>+}<br>+<br> #define MAX31785=5FFAN=5FFUNCS \<br> &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(PMBUS=5FHAVE=5FFAN12
| PMBUS=5FHAVE=5FSTATUS=5FFAN12 | PMBUS=5FHAVE=5FPWM12)<br> <br>@@ -334,9 +=
609,12 @@ static int max31785=5Fprobe(struct i2c=5Fclient *client,<br> &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;const struct i2c=5Fdevice=5Fid *id)<br> {<br> &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct
device *dev =3D &amp;client-&gt;dev;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;
struct device=5Fnode *child;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;struct
pmbus=5Fdriver=5Finfo *info;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;bool
dual=5Ftach =3D false;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;
u32 fans;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;s64
ret;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
int i;<br> <br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;if
(!i2c=5Fcheck=5Ffunctionality(client-&gt;adapter,<br> &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;I2C=5FFUNC=5FSMBUS=5FBYTE=5FDATA |<br>@@ -366,6 +644,46=
 @@ static int max31785=5Fprobe(struct i2c=5Fclient *client,<br> &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return -ENODEV;<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;}<br> <br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
fans =3D 0;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
for=5Feach=5Fchild=5Fof=5Fnode(dev-&gt;of=5Fnode, child) {<br>+ &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
=3D max31785=5Fof=5Ffan=5Fconfig(client, info, child);<br>+ &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(ret &lt; 0) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
of=5Fnode=5Fput(child);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return ret;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>+<br>+ &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(ret)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
fans |=3D ret;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
=3D max31785=5Fof=5Ftmp=5Fconfig(client, info, child);<br>+ &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(ret &lt; 0) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
of=5Fnode=5Fput(child);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return ret;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>+ &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
for (i =3D 0; i &lt; MAX31785=5FNR=5FPAGES; i++) {<br>+ &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bool
have=5Ffan =3D !!(info-&gt;func[i] &amp; PMBUS=5FHAVE=5FFAN12);<br>+ &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bool
fan=5Fconfigured =3D !!(fans &amp; BIT(i));<br>+<br>+ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(!have=5Ffan || fan=5Fconfigured)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
continue;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
=3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, PMBUS=5FPAGE, i);<br>+ &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(ret &lt; 0)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return ret;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
=3D i2c=5Fsmbus=5Fread=5Fbyte=5Fdata(client, PMBUS=5FFAN=5FCONFIG=5F12);<br=
>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(ret &lt; 0)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return ret;<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
&amp;=3D ~PB=5FFAN=5F1=5FINSTALLED;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret
=3D i2c=5Fsmbus=5Fwrite=5Fword=5Fdata(client, PMBUS=5FFAN=5FCONFIG=5F12,<br=
>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret);<br>+ &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(ret &lt; 0)<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
return ret;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}<br>+<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if
(dual=5Ftach) {<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
ret =3D max31785=5Fconfigure=5Fdual=5Ftach(client, info);<br> &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (ret &lt; 0)<br>-- <br>2.14.1<br><br></span></tt><br><br><BR>

--=_alternative 0015FBEE65258265_=--

--=_related 0015FBEE65258265_=
Content-Transfer-Encoding: base64
Content-Type: image/jpeg
Content-ID: <_2_0B0C07D40B0C05680015FAEB65258265>

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
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
vBAnlD5F6nt71N4x96MUmChzK0nc/9k=
--=_related 0015FBEE65258265_=--
