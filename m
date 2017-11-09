Return-Path: <Chen.KenYY@inventec.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inventec.com
 (client-ip=61.220.76.161; helo=mail.inventec.com;
 envelope-from=chen.kenyy@inventec.com; receiver=<UNKNOWN>)
X-Greylist: delayed 327 seconds by postgrey-1.36 at bilbo;
 Thu, 09 Nov 2017 16:59:31 AEDT
Received: from mail.inventec.com (hub01.inventec.com [61.220.76.161])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yXXYb6FDgzDr62
 for <openbmc@lists.ozlabs.org>; Thu,  9 Nov 2017 16:59:31 +1100 (AEDT)
Received: from IEC1-MSE-FE2.inventec.com (10.1.254.204) by
 IEC1-EX2010-03.iec.inventec (10.1.254.155) with Microsoft SMTP Server id
 14.3.174.1; Thu, 9 Nov 2017 13:53:55 +0800
Received: from IET-EX2010-02.iec.inventec (iet-ex2010-02.iec.inventec
 [10.15.2.45])	by IEC1-MSE-FE2.inventec.com with ESMTP id vA95rkQX048123	for
 <openbmc@lists.ozlabs.org>; Thu, 9 Nov 2017 13:53:46 +0800 (GMT-8)
 (envelope-from Chen.KenYY@inventec.com)
Received: from IEC1-EX2010-MX3.iec.inventec (10.1.254.158) by
 IET-EX2010-02.iec.inventec (10.15.2.45) with Microsoft SMTP Server (TLS) id
 14.3.174.1; Thu, 9 Nov 2017 13:53:47 +0800
Received: from IEC1-EX2010-MX4.iec.inventec ([fe80::211a:19c0:4e64:4c4f]) by
 IEC1-EX2010-MX3.iec.inventec ([::1]) with mapi id 14.03.0301.000; Thu, 9 Nov
 2017 13:53:46 +0800
From: =?big5?B?Q2hlbi5LZW5ZWSCzr6XDwOcgVEFP?= <Chen.KenYY@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Create new platform for arm system
Thread-Topic: Create new platform for arm system
Thread-Index: AdNZHVxgngV+imIATjOoHCiNJyBVkg==
Date: Thu, 9 Nov 2017 05:53:49 +0000
Message-ID: <39E6480C5A587146BAA4D885C7BCF7EEC6AA69BA@IEC1-EX2010-MX4.iec.inventec>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.6.45.42]
Content-Type: multipart/alternative;
 boundary="_000_39E6480C5A587146BAA4D885C7BCF7EEC6AA69BAIEC1EX2010MX4ie_"
MIME-Version: 1.0
X-MAIL: IEC1-MSE-FE2.inventec.com vA95rkQX048123
X-Mailman-Approved-At: Thu, 09 Nov 2017 22:17:33 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Nov 2017 05:59:35 -0000

--_000_39E6480C5A587146BAA4D885C7BCF7EEC6AA69BAIEC1EX2010MX4ie_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpJIGhhdmUgYSBwbGF0Zm9ybSB3aGljaCBpcyBhcm0gc3lzdGVtLg0KTXkgY3Vz
dG9tZXIgd2FudCB0byB1cGRhdGUgdGhlIHBsYXRmb3JtIGNvZGUgdG8gb3BlbkJNQy4NCkZvciBu
b3csIHRoZSBjb2RlIHN0cnVjdHVyZSBhcyBiZWxvdy4NCm1ldGEtYXJtLw0KonWid6J3IGNvbW1v
bg0KonggICCifKJ3oncgcmVjaXBlcy1waG9zcGhvcg0KonggICAgICAgonWid6J3IGRidXMNCqJ4
ICAgICAgIKJ4ICAgonWid6J3IG9wZW5wb3dlci1kYnVzLWludGVyZmFjZXMuYmINCqJ4ICAgICAg
IKJ4ICAgonWid6J3IG9wZW5wb3dlci1kYnVzLWludGVyZmFjZXMtbWFwcGVyLWNvbmZpZy1uYXRp
dmUuYmINCqJ4ICAgICAgIKJ4ICAgonyid6J3IHBob3NwaG9yLW1hcHBlci1jb25maWctbmF0aXZl
JS5iYmFwcGVuZA0KonggICAgICAgonWid6J3IGRlYnVnDQqieCAgICAgICCieCAgIKJ1oneidyBv
cGVucG93ZXItZGVidWctY29sbGVjdG9yDQqieCAgICAgICCieCAgIKJ4ICAgonWid6J3IG9wZW5w
b3dlci1kZWJ1Zy1jb2xsZWN0b3ItY2hlY2tzdG9wQC5zZXJ2aWNlDQqieCAgICAgICCieCAgIKJ4
ICAgonyid6J3IG9wZW5wb3dlci1kZWJ1Zy1jb2xsZWN0b3Itd2F0Y2hkb2dALnNlcnZpY2UNCqJ4
ICAgICAgIKJ4ICAgonWid6J3IG9wZW5wb3dlci1kZWJ1Zy1jb2xsZWN0b3IuYmINCqJ4ICAgICAg
IKJ4ICAgonWid6J3IG9wZW5wb3dlci1kZWJ1Zy1jb2xsZWN0b3ItZXJyb3ItbmF0aXZlLmJiDQqi
eCAgICAgICCieCAgIKJ1oneidyBvcGVucG93ZXItZGVidWctY29sbGVjdG9yLmluYw0KonggICAg
ICAgonggICCifKJ3oncgcGhvc3Bob3ItbG9nZ2luZy1lcnJvci1sb2dzLW5hdGl2ZS5iYmFwcGVu
ZA0KonggICAgICAgonWid6J3IGlwbWkNCqJ4ICAgICAgIKJ4ICAgonWid6J3IGhvc3Rib290LWlu
dmVudG9yeS1jb25maWcNCqJ4ICAgICAgIKJ4ICAgonggICCifKJ3oncgY29uZmlnLnlhbWwNCqJ4
ICAgICAgIKJ4ICAgonWid6J3IGhvc3Rib290LWludmVudG9yeS1jb25maWctbmF0aXZlLmJiDQqi
eCAgICAgICCieCAgIKJ1oneidyBvcGVucG93ZXItaXBtaS1vZW0uYmINCqJ4ICAgICAgIKJ4ICAg
onWid6J3IG9wZW5wb3dlci1pcG1pLW9lbS13aGl0ZWxpc3QNCqJ4ICAgICAgIKJ4ICAgonggICCi
fKJ3oncgb3BlbnBvd2VyLWlwbWktb2VtLXdoaXRlbGlzdC1uYXRpdmUuY29uZg0KonggICAgICAg
onggICCifKJ3oncgb3BlbnBvd2VyLWlwbWktb2VtLXdoaXRlbGlzdC1uYXRpdmUuYmINCqJ4ICAg
ICAgIKJ8oneidyBwYWNrYWdlZ3JvdXBzDQqieCAgICAgICAgICAgonWid6J3IHBhY2thZ2Vncm91
cC1vYm1jLWFwcHMuYmJhcHBlbmQNCqJ4ICAgICAgICAgICCidaJ3oncgcGFja2FnZWdyb3VwLW9i
bWMtaXBtaWQtcHJvdmlkZXJzLmJiYXBwZW5kDQqieCAgICAgICAgICAgonWid6J3IHBhY2thZ2Vn
cm91cC1vYm1jLXBob3NwaG9yLWRlYnVndG9vbHMuYmJhcHBlbmQNCqJ4ICAgICAgICAgICCifKJ3
oncgcGFja2FnZWdyb3VwLW9wLWFwcHMuYmINCqJ1oneidyBjb25mDQqieCAgIKJ1oneidyBsYXll
ci5jb25mDQqieCAgIKJ8oneidyBtYWNoaW5lDQqieCAgICAgICCifKJ3oncgaW5jbHVkZQ0Kongg
ICAgICAgICAgIKJ8oneidyBhcm0uaW5jDQqidaJ3oncgQ09QWUlORy5hcGFjaGUtMi4wDQqidaJ3
oncgQ09QWUlORy5NSVQNCqJ1oneidyBMSUNFTlNFDQqifKJ3oncgbWV0YS1xdWFsY29tbQ0KICAg
IKJ1oneidyBjb25mDQogICAgonggICCidaJ3oncgbGF5ZXIuY29uZg0KICAgIKJ4ICAgonyid6J3
IG1hY2hpbmUNCiAgICCieCAgICAgICCifKJ3oncgaW5jbHVkZQ0KICAgIKJ4ICAgICAgICAgICCi
fKJ3oncgcXVhbGNvbW0uaW5jDQogICAgonWid6J3IG1ldGEtMjQwMC1yZXANCiAgICCieCAgIKJ1
oneidyBjb25mDQogICAgonggICCieCAgIKJ1oneidyBiYmxheWVycy5jb25mLnNhbXBsZQ0KICAg
IKJ4ICAgonggICCidaJ3oncgY29uZi1ub3Rlcy50eHQNCiAgICCieCAgIKJ4ICAgonWid6J3IGxh
eWVyLmNvbmYNCiAgICCieCAgIKJ4ICAgonWid6J3IGxvY2FsLmNvbmYuc2FtcGxlDQogICAgongg
ICCieCAgIKJ8oneidyBtYWNoaW5lDQogICAgonggICCieCAgICAgICCifKJ3oncgMjQwMC1yZXAu
Y29uZg0KICAgIKJ4ICAgonWid6J3IHJlY2lwZXMtYnNwDQogICAgonggICCieCAgIKJ8oneidyB1
LWJvb3QNCiAgICCieCAgIKJ4ICAgICAgIKJ1oneidyB1LWJvb3QNCiAgICCieCAgIKJ4ICAgICAg
IKJ4ICAgonyid6J3IDAwMDEtQ2VudHJpcTI0MDAtUkVQLXBsYXRmb3JtLWJvYXJkLWluaXRpYWwt
RXRoZXJuZXQtUGh5LXJlc2V0LnBhdGNoDQogICAgonggICCieCAgICAgICCifKJ3oncgdS1ib290
XyUuYmJhcHBlbmQNCiAgICCieCAgIKJ1oneidyByZWNpcGVzLWtlcm5lbA0KICAgIKJ4ICAgongg
ICCifKJ3oncgbGludXgNCiAgICCieCAgIKJ4ICAgICAgIKJ1oneidyBsaW51eC1vYm1jDQogICAg
onggICCieCAgICAgICCieCAgIKJ1oneidyAwMDAxLTI0MDBSRVAtQWRkLUdQSU9DNy1jb25maWct
Zm9yLWhvc3Qtc3BpLXJvbS1pbml0LnBhdGNoDQogICAgonggICCieCAgICAgICCieCAgIKJ1onei
dyAwMDAxLUFkZC1kcml2ZXItZm9yLVBDQTk2NDEtQXJiaXRyYXRpb24ucGF0Y2gNCiAgICCieCAg
IKJ4ICAgICAgIKJ4ICAgonWid6J3IDAwMDEtRHJpdmVyLUFkZC1EUzExMDAtZHJpdmVyLWZvci1Q
TUJVUy5wYXRjaA0KICAgonggICCieCAgICAgICCieCAgIKJ1oneidyAwMDAxLWRyaXZlci1hZGQt
SVIzODYxMy1kcml2ZXIucGF0Y2gNCiAgICCieCAgIKJ4ICAgICAgIKJ4ICAgonWid6J3IDAwMDEt
RHJpdmVyLU1vZGlmeS1mYW4tZHJpdmVyLnBhdGNoDQogICAgonggICCieCAgICAgICCieCAgIKJ1
oneidyAwMDAxLUVuYWJsaW5nLXRlbXAtbW9uaXRvcmluZy1ieS1kZWZhdWx0LW9uLWFkbTEyNzgu
cGF0Y2gNCiAgICCieCAgIKJ4ICAgICAgIKJ4ICAgonWid6J3IDAwMDEtTWlncmF0ZS10aGUtSlRB
Ry1kcml2ZXItZnJvbS10aGUtQlNQLWZyb20tQXNwZWVkLnBhdGNoDQogICAgonggICCieCAgICAg
ICCieCAgIKJ1oneidyAwMDAxLVBNQlVTLW1vZGlmeS1wbWJ1cy5wYXRjaA0KICAgIKJ4ICAgongg
ICAgICAgonggICCidaJ3oncgMDAwMS1zcGktYWRkLWFzcGVlZC1zcGktZ2VuZXJpYy1kcml2ZXIu
cGF0Y2gNCiAgICCieCAgIKJ4ICAgICAgIKJ4ICAgonWid6J3IDAwMDEtc3BpLUFkZC1jZW50cmlx
LTI0MDAtc3BpLWh3bW9uLWRyaXZlci5wYXRjaA0KICAgIKJ4ICAgonggICAgICAgonggICCidaJ3
oncgMDAwMi1kcml2ZXItYWRkLVBYTTEzMTAtZHJpdmVyLnBhdGNoDQogICAgonggICCieCAgICAg
ICCieCAgIKJ1oneidyAwMDAyLVBNQlVTLW1vZGlmeS1wbWJ1cy5wYXRjaA0KICAgIKJ4ICAgongg
ICAgICAgonggICCidaJ3oncgMDAwMy10aGVybWFsLXNlbnNvci1OVlQyMTAucGF0Y2gNCiAgICCi
eCAgIKJ4ICAgICAgIKJ4ICAgonWid6J3IDI0MDByZXAuY2ZnDQogICAgonggICCieCAgICAgICCi
eCAgIKJ1oneidyBhc3BlZWQtYm1jLWFybS0yNDAwLXJlcC5kdHMNCiAgICCieCAgIKJ4ICAgICAg
IKJ4ICAgonyid6J3IHYzLTAwMDEtQWRkLVNTSUYtZHJpdmVyLWZvci1JMkMtc2xhdmUtZGV2aWNl
LnBhdGNoDQogICAgonggICCieCAgICAgICCifKJ3oncgbGludXgtb2JtY18lLmJiYXBwZW5kDQog
ICAgonggICCidaJ3oncgcmVjaXBlcy1waG9zcGhvcg0KICAgIKJ4ICAgonggICCidaJ3oncgYm9v
dG1vZGV1dGlsDQogICAgonggICCieCAgIKJ4ICAgonWid6J3IGJvb3Rtb2RldXRpbC5iYg0KICAg
IKJ4ICAgonggICCieCAgIKJ8oneidyBmaWxlcw0KICAgIKJ4ICAgonggICCieCAgICAgICCidaJ3
oncgQk9PVE1PREVGSUxFDQogICAgonggICCieCAgIKJ4ICAgICAgIKJ8oneidyBib290bW9kZXV0
aWwuYw0KICAgIKJ4ICAgonggICCidaJ3oncgY2hhc3Npcw0KICAgIKJ4ICAgonggICCieCAgIKJ1
oneidyBpcjM4MTYzLXdvcmthcm91bmQNCiAgICCieCAgIKJ4ICAgonggICCieCAgIKJ1oneidyBp
cjM4MTYzX3dvcmthcm91bmQuc2gNCiAgICCieCAgIKJ4ICAgonggICCieCAgIKJ1oneidyBpci1h
ZGRALnNlcnZpY2UNCiAgICCieCAgIKJ4ICAgonggICCieCAgIKJ8oneidyBpci1yZW1vdmVALnNl
cnZpY2UNCiAgICCieCAgIKJ4ICAgonggICCifKJ3oncgaXIzODE2My13b3JrYXJvdW5kLmJiDQog
ICAgonggICCieCAgIKJ1oneidyBjb25zb2xlDQogICAgonggICCieCAgIKJ4ICAgonWid6J3IG9i
bWMtY29uc29sZQ0KICAgIKJ4ICAgonggICCieCAgIKJ4ICAgonyid6J3IG9ibWMtY29uc29sZS5j
b25mDQogICAgonggICCieCAgIKJ4ICAgonyid6J3IG9ibWMtY29uc29sZS5iYmFwcGVuZA0KICAg
IKJ4ICAgonggICCidaJ3oncgY3BsZA0KICAgIKJ4ICAgonggICCieCAgIKJ1oneidyBjcGxkLWZ3
dXBkYXRlDQogICAgonggICCieCAgIKJ4ICAgonggICCidaJ3oncgYXN0LWp0YWcuYw0KICAgIKJ4
ICAgonggICCieCAgIKJ4ICAgonWid6J3IGFzdC1qdGFnLmgNCiAgICCieCAgIKJ4ICAgonggICCi
eCAgIKJ1oneidyBsYXR0aWNlLmMNCiAgICCieCAgIKJ4ICAgonggICCieCAgIKJ1oneidyBsYXR0
aWNlLmgNCiAgICCieCAgIKJ4ICAgonggICCieCAgIKJ8oneidyBtYWluLmMNCiAgICCieCAgIKJ4
ICAgonggICCidaJ3oncgY3BsZC1md3VwZGF0ZS5iYg0KICAgIKJ4ICAgonggICCieCAgIKJ1onei
dyBjcGxkLXZlcnNpb24NCiAgICCieCAgIKJ4ICAgonggICCieCAgIKJ1oneidyBjcGxkLXZlcnNp
b24uc2VydmljZQ0KICAgIKJ4ICAgonggICCieCAgIKJ4ICAgonyid6J3IGNwbGRfdmVyc2lvbi5z
aA0KICAgIKJ4ICAgonggICCieCAgIKJ8oneidyBjcGxkLXZlcnNpb24uYmINCiAgICCieCAgIKJ4
ICAgonWid6J3IGdwaW9pbml0DQogICAgonggICCieCAgIKJ4ICAgonWid6J3IGZpbGVzDQogICAg
onggICCieCAgIKJ4ICAgonggICCidaJ3oncgZ3Bpb2luaXQuYw0KICAgIKJ4ICAgonggICCieCAg
IKJ4ICAgonyid6J3IGdwaW9pbml0LnNlcnZpY2UNCiAgICCieCAgIKJ4ICAgonggICCifKJ3oncg
Z3Bpb2luaXQuYmINCiAgICCieCAgIKJ4ICAgonWid6J3IGlwbWkNCiAgICCieCAgIKJ4ICAgongg
ICCidaJ3oncgMjQwMC1yZXAtaXBtaS1pbnZlbnRvcnktbWFwDQogICAgonggICCieCAgIKJ4ICAg
onggICCifKJ3oncgY29uZmlnLnlhbWwNCiAgICCieCAgIKJ4ICAgonggICCidaJ3oncgMjQwMC1y
ZXAtaXBtaS1pbnZlbnRvcnktbWFwLW5hdGl2ZS5iYg0KICAgIKJ4ICAgonggICCieCAgIKJ1onei
dyBvcGVucG93ZXItaXBtaS1vZW0NCiAgICCieCAgIKJ4ICAgonggICCieCAgIKJ1oneidyAwMDAx
LUFkZC1kZXRlY3Rpb24tb2YtYnJvYWQtYW5kLW5vZGUtY29tbWFuZC5wYXRjaA0KICAgIKJ4ICAg
onggICCieCAgIKJ4ICAgonWid6J3IDAwMDEtQWRkLUdldC1CTUMtVmVuZG9yLUlELWNvbW1hbmQu
cGF0Y2gNCiAgICCieCAgIKJ4ICAgonggICCieCAgIKJ1oneidyAwMDAxLUFkZC1HZXQtcGNpZS1z
bG90LXN0YXR1cy1jb21tYW5kLnBhdGNoDQogICAgonggICCieCAgIKJ4ICAgonggICCifKJ3oncg
MDAwMS1BZGQtU2VuZC1Tb2MtTUFDLWZyb20taG9zdC5wYXRjaA0KICAgIKJ4ICAgonggICCieCAg
IKJ1oneidyBvcGVucG93ZXItaXBtaS1vZW0uYmJhcHBlbmQNCiAgICCieCAgIKJ4ICAgonggICCi
daJ3oncgcGhvc3Bob3ItaXBtaS1idA0KICAgIKJ4ICAgonggICCieCAgIKJ4ICAgonWid6J3IDAw
MDEtYnRicmlnZGUtdG8tc3NpZi1zbGF2ZS5wYXRjaA0KICAgIKJ4ICAgonggICCieCAgIKJ4ICAg
onyid6J3IDAwMDEtTW9kaWZ5LWJ0YnJpZGdlZC1kZXZpY2UtbGluay5wYXRjaA0KICAgIKJ4ICAg
onggICCieCAgIKJ1oneidyBwaG9zcGhvci1pcG1pLWJ0LmJiYXBwZW5kDQogICAgonggICCieCAg
IKJ4ICAgonWid6J3IHBob3NwaG9yLWlwbWktZnJ1LXByb3BlcnRpZXMlDQogICAgonggICCieCAg
IKJ4ICAgonggICCifKJ3oncgZXh0cmEtcHJvcGVydGllcy55YW1sDQogICAgonggICCieCAgIKJ4
ICAgonWid6J3IHBob3NwaG9yLWlwbWktZnJ1LXByb3BlcnRpZXMlLmJiYXBwZW5kDQogICAgongg
ICCieCAgIKJ4ICAgonWid6J3IHBob3NwaG9yLWlwbWktc2Vuc29yLWludmVudG9yeSUNCiAgICCi
eCAgIKJ4ICAgonggICCieCAgIKJ8oneidyBjb25maWcueWFtbA0KICAgIKJ4ICAgonggICCieCAg
IKJ8oneidyBwaG9zcGhvci1pcG1pLXNlbnNvci1pbnZlbnRvcnklLmJiYXBwZW5kDQogICAgongg
ICCieCAgIKJ1oneidyBsZWRzDQogICAgonggICCieCAgIKJ4ICAgonWid6J3IDI0MDAtcmVwLWxl
ZC1tYW5hZ2VyLWNvbmZpZw0KICAgIKJ4ICAgonggICCieCAgIKJ4ICAgonyid6J3IGxlZC55YW1s
DQogICAgonggICCieCAgIKJ4ICAgonyid6J3IDI0MDAtcmVwLWxlZC1tYW5hZ2VyLWNvbmZpZy1u
YXRpdmUuYmINCiAgICCieCAgIKJ4ICAgonWid6J3IG1hY3NldHVwDQogICAgonggICCieCAgIKJ4
ICAgonWid6J3IGZpbGVzDQogICAgonggICCieCAgIKJ4ICAgonggICCidaJ3oncgbWFjc2V0dXAu
Yw0KICAgIKJ4ICAgonggICCieCAgIKJ4ICAgonyid6J3IG1hY3NldHVwLnNlcnZpY2UNCiAgICCi
eCAgIKJ4ICAgonggICCifKJ3oncgbWFjc2V0dXAuYmINCiAgICCieCAgIKJ4ICAgonWid6J3IHFz
cGl0ZXN0DQogICAgonggICCieCAgIKJ4ICAgonWid6J3IGZpbGVzDQogICAgonggICCieCAgIKJ4
ICAgonggICCidaJ3oncgcXNwaV90ZXN0LmMNCiAgICCieCAgIKJ4ICAgonggICCieCAgIKJ8onei
dyBxc3BpX3Rlc3QuaA0KICAgIKJ4ICAgonggICCieCAgIKJ8oneidyBxc3BpdGVzdC5iYg0KICAg
IKJ4ICAgonggICCidaJ3oncgc2Vuc29ycw0KICAgIKJ4ICAgonggICCieCAgIKJ1oneidyBwaG9z
cGhvci1od21vbiUNCiAgICCieCAgIKJ4ICAgonggICCieCAgIKJ1oneidyAwMDAxLXBob3NwaG9y
LWh3bW9uLWZpeGVkLW9wZW4tc3lzdGVtLWZpbGUtdGltZW91dC5wYXRjaA0KICAgIKJ4ICAgongg
ICCieCAgIKJ4ICAgonyid6J3IG9ibWMNCiAgICCieCAgIKJ4ICAgonggICCieCAgICAgICCifKJ3
oncgaHdtb24NCiAgICCieCAgIKJ4ICAgonggICCieCAgICAgICAgICAgonyid6J3IGFoYg0KICAg
IKJ4ICAgonggICCieCAgIKJ4ICAgICAgICAgICAgICAgonWid6J3IDFlNjMxMDAwLmZsYXNoLWNv
bnRyb2xsZXINCiAgICCieCAgIKJ4ICAgonggICCieCAgICAgICAgICAgICAgIKJ4ICAgonyid6J3
IHNwaTJAMA0KICAgIKJ4ICAgonggICCieCAgIKJ4ICAgICAgICAgICAgICAgonggICAgICAgonyi
d6J3IGNlbnRyaXEyNDAwLXNwaS1od21vbkAwLmNvbmYNCiAgICCieCAgIKJ4ICAgonggICCieCAg
ICAgICAgICAgICAgIKJ8oneidyBhcGINCiAgICCieCAgIKJ4ICAgonggICCieCAgICAgICAgICAg
ICAgICAgICCifKJ3oncgaTJjQDFlNzhhMDAwDQogICAgonggICCieCAgIKJ4ICAgonggICAgICAg
ICAgICAgICAgICAgICAgIKJ1oneidyBpMmMtYnVzQDE4MA0KICAgIKJ4ICAgonggICCieCAgIKJ4
ICAgICAgICAgICAgICAgICAgICAgICCieCAgIKJ1oneidyBpcjM4MTYzQDEyLmNvbmYNCiAgICCi
eCAgIKJ4ICAgonggICCieCAgICAgICAgICAgICAgICAgICAgICAgonggICCidaJ3oncgaXIzODE2
M0A0Mi5jb25mDQogICAgonggICCieCAgIKJ4ICAgonggICAgICAgICAgICAgICAgICAgICAgIKJ4
ICAgonWid6J3IGlyMzgxNjNANDQuY29uZg0KICAgIKJ4ICAgonggICCieCAgIKJ4ICAgICAgICAg
ICAgICAgICAgICAgICCieCAgIKJ1oneidyBpcjM4MTYzQDQ2LmNvbmYNCiAgICCieCAgIKJ4ICAg
onggICCieCAgICAgICAgICAgICAgICAgICAgICAgonggICCidaJ3oncgaXIzODE2M0A0OC5jb25m
DQogICAgonggICCieCAgIKJ4ICAgonggICAgICAgICAgICAgICAgICAgICAgIKJ4ICAgonWid6J3
IHB4bTEzMTBAMDIuY29uZg0KICAgIKJ4ICAgonggICCieCAgIKJ4ICAgICAgICAgICAgICAgICAg
ICAgICCieCAgIKJ8oneidyBweG0xMzEwQDA0LmNvbmYNCiAgICCieCAgIKJ4ICAgonggICCieCAg
ICAgICAgICAgICAgICAgICAgICAgonWid6J3IGkyYy1idXNAMWMwDQogICAgonggICCieCAgIKJ4
ICAgonggICAgICAgICAgICAgICAgICAgICAgIKJ4ICAgonWid6J3IG52dDIxMEA0Yy5jb25mDQog
ICAgonggICCieCAgIKJ4ICAgonggICAgICAgICAgICAgICAgICAgICAgIKJ4ICAgonWid6J3IHRt
cDQyMUAxZC5jb25mDQogICAgonggICCieCAgIKJ4ICAgonggICAgICAgICAgICAgICAgICAgICAg
IKJ4ICAgonWid6J3IHRtcDQyMUAxZi5jb25mDQogICAgonggICCieCAgIKJ4ICAgonggICAgICAg
ICAgICAgICAgICAgICAgIKJ4ICAgonWid6J3IHRtcDQyMUA0ZC5jb25mDQogICAgonggICCieCAg
IKJ4ICAgonggICAgICAgICAgICAgICAgICAgICAgIKJ4ICAgonyid6J3IHRtcDQyMUA0Zi5jb25m
DQogICAgonggICCieCAgIKJ4ICAgonggICAgICAgICAgICAgICAgICAgICAgIKJ1oneidyBpMmMt
YnVzQDMwMA0KICAgIKJ4ICAgonggICCieCAgIKJ4ICAgICAgICAgICAgICAgICAgICAgICCieCAg
IKJ1oneidyBhZG0xMjc4QDEwLmNvbmYNCiAgICCieCAgIKJ4ICAgonggICCieCAgICAgICAgICAg
ICAgICAgICAgICAgonggICCifKJ3oncgYWRtMTI3OEAxMS5jb25mDQogICAgonggICCieCAgIKJ4
ICAgonggICAgICAgICAgICAgICAgICAgICAgIKJ1oneidyBpMmMtYnVzQDM0MA0KICAgIKJ4ICAg
onggICCieCAgIKJ4ICAgICAgICAgICAgICAgICAgICAgICCieCAgIKJ8oneidyBwY2E5NjQxQDcw
DQogICAgonggICCieCAgIKJ4ICAgonggICAgICAgICAgICAgICAgICAgICAgIKJ4ICAgICAgIKJ8
oneidyBpMmMtYXJiDQogICAgonggICCieCAgIKJ4ICAgonggICAgICAgICAgICAgICAgICAgICAg
IKJ4ICAgICAgICAgICCidaJ3oncgYWRtMTI3OEAxMi5jb25mDQogICAgonggICCieCAgIKJ4ICAg
onggICAgICAgICAgICAgICAgICAgICAgIKJ4ICAgICAgICAgICCidaJ3oncgZHMxMTAwQDU4LmNv
bmYNCiAgICCieCAgIKJ4ICAgonggICCieCAgICAgICAgICAgICAgICAgICAgICAgonggICAgICAg
ICAgIKJ1oneidyBtYXgzMTc5MEAyMC5jb25mDQogICAgonggICCieCAgIKJ4ICAgonggICAgICAg
ICAgICAgICAgICAgICAgIKJ4ICAgICAgICAgICCidaJ3oncgbWF4MzE3OTBAMjMuY29uZg0KICAg
IKJ4ICAgonggICCieCAgIKJ4ICAgICAgICAgICAgICAgICAgICAgICCieCAgICAgICAgICAgonyi
d6J3IHRtcDQyMUAxZC5jb25mDQogICAgonggICCieCAgIKJ4ICAgonggICAgICAgICAgICAgICAg
ICAgICAgIKJ8oneidyBpMmMtYnVzQDgwDQogICAgonggICCieCAgIKJ4ICAgonggICAgICAgICAg
ICAgICAgICAgICAgICAgICCidaJ3oncgdG1wNDIxQDFjLmNvbmYNCiAgICCieCAgIKJ4ICAgongg
ICCieCAgICAgICAgICAgICAgICAgICAgICAgICAgIKJ1oneidyB0bXA0MjFAMWUuY29uZg0KICAg
IKJ4ICAgonggICCieCAgIKJ4ICAgICAgICAgICAgICAgICAgICAgICAgICAgonWid6J3IHRtcDQy
MUAyYS5jb25mDQogICAgonggICCieCAgIKJ4ICAgonggICAgICAgICAgICAgICAgICAgICAgICAg
ICCifKJ3oncgdG1wNDIxQDRlLmNvbmYNCiAgICCieCAgIKJ4ICAgonggICCifKJ3oncgcGhvc3Bo
b3ItaHdtb24lLmJiYXBwZW5kDQogICAgonggICCieCAgIKJ1oneidyBzZXR0aW5ncw0KICAgIKJ4
ICAgonggICCieCAgIKJ1oneidyBwaG9zcGhvci1zZXR0aW5ncw0KICAgIKJ4ICAgonggICCieCAg
IKJ4ICAgonWid6J3IHBvd2VycG9saWN5LWRlZmF1bHQtQUxXQVlTX1BPV0VSX09OLm92ZXJyaWRl
LnltbA0KICAgIKJ4ICAgonggICCieCAgIKJ4ICAgonyid6J3IHRpbWVvd25lci1kZWZhdWx0LUJP
VEgub3ZlcnJpZGUueW1sDQogICAgonggICCieCAgIKJ4ICAgonyid6J3IHBob3NwaG9yLXNldHRp
bmdzLmJiYXBwZW5kDQogICAgonggICCieCAgIKJ1oneidyBzcGl0ZXN0DQogICAgonggICCieCAg
IKJ4ICAgonWid6J3IGZpbGVzDQogICAgonggICCieCAgIKJ4ICAgonggICCifKJ3oncgc3BpdGVz
dC5jDQogICAgonggICCieCAgIKJ4ICAgonyid6J3IHNwaXRlc3QuYmINCiAgICCieCAgIKJ4ICAg
onWid6J3IHRoZXJtYWx1dGlsDQogICAgonggICCieCAgIKJ4ICAgonWid6J3IGZpbGVzDQogICAg
onggICCieCAgIKJ4ICAgonggICCidaJ3oncgdGhlcm1hbF9jb250cm9sLnNoDQogICAgonggICCi
eCAgIKJ4ICAgonggICCidaJ3oncgdGhlcm1hbC1zdGFydEAuc2VydmljZQ0KICAgIKJ4ICAgongg
ICCieCAgIKJ4ICAgonWid6J3IHRoZXJtYWwtc3RvcEAuc2VydmljZQ0KICAgIKJ4ICAgonggICCi
eCAgIKJ4ICAgonyid6J3IHRoZXJtYWx1dGlsLmMNCiAgICCieCAgIKJ4ICAgonggICCifKJ3oncg
dGhlcm1hbHV0aWwuYmINCiAgICCieCAgIKJ4ICAgonyid6J3IHdvcmtib29rDQogICAgonggICCi
eCAgICAgICCidaJ3oncgMjQwMC1yZXAtY29uZmlnDQogICAgonggICCieCAgICAgICCieCAgIKJ8
oneidyAyNDAwLXJlcC5weQ0KICAgIKJ4ICAgonggICAgICAgonyid6J3IDI0MDAtcmVwLWNvbmZp
Zy5iYg0KICAgIKJ4ICAgonyid6J3IHJlY2lwZXMudHh0DQogICAgonyid6J3IHNrZWxldG9uDQog
ICAgICAgIKJ8oneidyBza2VsZXRvbi50YXIuZ3oNCg0KQ291bGQgYW55b25lIGhlbHAgdG8gcmV2
aWV3IHRoaXMgc3RydWN0dXJlIGFuZCB0ZWxsIG1lIGhvdyB0byBzZXBhcmF0ZSB0aGlzIGNvZGUg
d2lsbCBiZSBnb29kIHRvIHJldmlld2VyPw0KQXMgSSBrbm93LCB0aGUga2VybmVsIHBhdGNoIHNo
b3VsZCBub3QgaW4gbWFjaGluZSBmaWxlLg0KDQpJZiBhbnkgb3RoZXIgcXVlc3Rpb24sIHBsZWFz
ZSBmZWVsIGZyZWUgdG8gbWUuIFRoYW5rcy4NCg0KQmVzdCBSZWdhcmRzLA0KS2VuDQoNCg0K

--_000_39E6480C5A587146BAA4D885C7BCF7EEC6AA69BAIEC1EX2010MX4ie_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=B7s=B2=D3=A9=FA=C5=E9;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:=B7s=B2=D3=A9=FA=C5=E9;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=B7s=B2=D3=A9=FA=C5=E9";
	panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple" style=3D"text-justify-t=
rim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have a platform which is arm =
system.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">My customer want to update the =
platform code to openBMC.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">For now, the code structure as =
below.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">meta-arm/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> commo=
n<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> recipes-phosphor<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> dbus<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> openpower-dbus-interfaces.bb=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> openpower-dbus-interfaces-ma=
pper-config-native.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> phosphor-mapper-config-nativ=
e%.bbappend<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> debug<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> openpower-debug-collector<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> openpower-debug-collector-checkstop@.service<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2|=A2w=A2=
w</span><span lang=3D"EN-US"> openpower-debug-collector-watchdog@.service<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> openpower-debug-collector.bb=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> openpower-debug-collector-er=
ror-native.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> openpower-debug-collector.in=
c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> phosphor-logging-error-logs-=
native.bbappend<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> ipmi<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> hostboot-inventory-config<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2|=A2w=A2=
w</span><span lang=3D"EN-US"> config.yaml<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> hostboot-inventory-config-na=
tive.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> openpower-ipmi-oem.bb<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> openpower-ipmi-oem-whitelist=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2|=A2w=A2=
w</span><span lang=3D"EN-US"> openpower-ipmi-oem-whitelist-native.conf<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> openpower-ipmi-oem-whitelist=
-native.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> packagegroups<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> packagegroup-obmc-app=
s.bbappend<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> packagegroup-obmc-ipm=
id-providers.bbappend<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> packagegroup-obmc-pho=
sphor-debugtools.bbappend<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> packagegroup-op-apps.=
bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> conf<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> layer.conf<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> machine<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> include<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> arm.inc<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> COPYI=
NG.apache-2.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> COPYI=
NG.MIT<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> LICEN=
SE<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=
=E9&quot;,&quot;serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> meta-=
qualcomm<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2u=A2w=A2w</span><span lang=3D"EN-US"> conf<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> layer.conf<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> machine<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> include<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> qualcomm.inc<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2u=A2w=A2w</span><span lang=3D"EN-US"> meta-2400-rep<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> conf<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> bblayers.conf.sample<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> conf-notes.txt<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> layer.conf<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> local.conf.sample<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> machine<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> 2400-rep.conf<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> recipes-bsp<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> u-boot<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> u-boot<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> 0001-Centriq2400-REP-platfor=
m-board-initial-Ethernet-Phy-reset.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> u-boot_%.bbappend<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> recipes-kernel<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> linux<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> linux-obmc<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 0001-2400REP-Add-GPIOC7-conf=
ig-for-host-spi-rom-init.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 0001-Add-driver-for-PCA9641-=
Arbitration.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 0001-Driver-Add-DS1100-drive=
r-for-PMBUS.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;</span><span =
style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=
=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 0001-driver-add-IR38613-driv=
er.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 0001-Driver-Modify-fan-drive=
r.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 0001-Enabling-temp-monitorin=
g-by-default-on-adm1278.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 0001-Migrate-the-JTAG-driver=
-from-the-BSP-from-Aspeed.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 0001-PMBUS-modify-pmbus.patc=
h<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 0001-spi-add-aspeed-spi-gene=
ric-driver.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 0001-spi-Add-centriq-2400-sp=
i-hwmon-driver.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 0002-driver-add-PXM1310-driv=
er.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 0002-PMBUS-modify-pmbus.patc=
h<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 0003-thermal-sensor-NVT210.p=
atch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 2400rep.cfg<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span> <span lang=3D"EN-US">aspeed-bmc-arm-2400-rep.dts<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> v3-0001-Add-SSIF-driver-for-=
I2C-slave-device.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> linux-obmc_%.bbappend=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> recipes-phosphor<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> bootmodeutil<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> bootmodeutil.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2|=A2w=A2=
w</span><span lang=3D"EN-US"> files<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> BOOTMODEFILE<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> bootmodeutil.c<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> chassis<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> ir38163-workaround<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> ir38163_workaround.sh=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> ir-add@.service<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> ir-remove@.service<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2|=A2w=A2=
w</span><span lang=3D"EN-US"> ir38163-workaround.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> console<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> obmc-console<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> obmc-console.conf<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2|=A2w=A2=
w</span><span lang=3D"EN-US"> obmc-console.bbappend<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> cpld<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> cpld-fwupdate<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> ast-jtag.c<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> ast-jtag.h<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> lattice.c<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> lattice.h<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> main.c<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> cpld-fwupdate.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> cpld-version<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> cpld-version.service<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> cpld_version.sh<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2|=A2w=A2=
w</span><span lang=3D"EN-US"> cpld-version.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> gpioinit<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> files<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> gpioinit.c<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> gpioinit.service<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2|=A2w=A2=
w</span><span lang=3D"EN-US"> gpioinit.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> ipmi<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> 2400-rep-ipmi-inventory-map<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> config.yaml<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> 2400-rep-ipmi-inventory-map-native.bb<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> openpower-ipmi-oem<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 0001-Add-detection-of=
-broad-and-node-command.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 0001-Add-Get-BMC-Vend=
or-ID-command.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 0001-Add-Get-pcie-slo=
t-status-command.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> 0001-Add-Send-Soc-MAC=
-from-host.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> openpower-ipmi-oem.bbappend<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> phosphor-ipmi-bt<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 0001-btbrigde-to-ssif=
-slave.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> 0001-Modify-btbridged=
-device-link.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> phosphor-ipmi-bt.bbappend<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> phosphor-ipmi-fru-properties%<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> extra-properties.yaml=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> phosphor-ipmi-fru-properties%.bbappend<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> phosphor-ipmi-sensor-inventory%<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> config.yaml<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2|=A2w=A2=
w</span><span lang=3D"EN-US"> phosphor-ipmi-sensor-inventory%.bbappend<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> leds<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> 2400-rep-led-manager-config<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> led.yaml<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2|=A2w=A2=
w</span><span lang=3D"EN-US"> 2400-rep-led-manager-config-native.bb<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> macsetup<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> files<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> macsetup.c<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> macsetup.service<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2|=A2w=A2=
w</span><span lang=3D"EN-US"> macsetup.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> qspitest<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> files<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> qspi_test.c<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> qspi_test.h<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2|=A2w=A2=
w</span><span lang=3D"EN-US"> qspitest.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> sensors<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> phosphor-hwmon%<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 0001-phosphor-hwmon-f=
ixed-open-system-file-timeout.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> obmc<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> hwmon<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> ahb<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 1e631000.flash-contro=
ller<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> spi2@0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> centriq2400-spi-hwmon=
@0.conf<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> apb<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> i2c@1e78a000<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> i2c-bus@180<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> ir38163@12.conf<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> ir38163@42.conf<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> ir38163@44.conf<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> ir38163@46.conf<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> ir38163@48.conf<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> pxm1310@02.conf<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> pxm1310@04.conf<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> i2c-bus@1c0<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> nvt210@4c.conf<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> tmp421@1d.conf<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&q=
uot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> tmp421@1f.conf<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> tmp421@4d.conf<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> tmp421@4f.conf<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> i2c-bus@300<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> adm1278@10.conf<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> adm1278@11.conf<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> i2c-bus@340<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> pca9641@70<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> i2c-arb<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> adm1278@12.conf<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> ds1100@58.conf<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> max31790@20.conf<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&q=
uot;serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> max31790@23.conf<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> tmp421@1d.conf<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> i2c-bus@80<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> tmp421@1c.conf<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> tmp421@1e.conf<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> tmp421@2a.conf<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> tmp421@4e.conf<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2|=A2w=A2=
w</span><span lang=3D"EN-US"> phosphor-hwmon%.bbappend<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> settings<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> phosphor-settings<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> powerpolicy-default-A=
LWAYS_POWER_ON.override.yml<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> timeowner-default-BOT=
H.override.yml<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2|=A2w=A2=
w</span><span lang=3D"EN-US"> phosphor-settings.bbappend<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> spitest<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> files<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> spitest.c<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2|=A2w=A2=
w</span><span lang=3D"EN-US"> spitest.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> thermalutil<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2u=A2w=A2=
w</span><span lang=3D"EN-US"> files<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> thermal_control.sh<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> thermal-start@.servic=
e<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> thermal-stop@.service=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2x</span>=
<span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> thermalutil.c<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span><span style=3D"fo=
nt-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;">=A2|=A2w=A2=
w</span><span lang=3D"EN-US"> thermalutil.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> workbook<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2u=A2w=A2w</span><span lang=3D"EN-US"> 2400-rep-config<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp; </span>
<span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&q=
uot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> 2400-rep.py<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> 2400-rep-config.bb<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2x</span><span lang=3D"EN-US">&nbsp;&nbsp;
</span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;=
serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> recipes.txt<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; </span><span=
 style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&quot;,&quot;serif&quot;"=
>=A2|=A2w=A2w</span><span lang=3D"EN-US"> skeleton<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; </span><span style=3D"font-family:&quot;=B7s=B2=D3=A9=FA=C5=E9&=
quot;,&quot;serif&quot;">=A2|=A2w=A2w</span><span lang=3D"EN-US"> skeleton.=
tar.gz<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Could anyone help to review thi=
s structure and tell me how to separate this code will be good to reviewer?=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">As I know, the kernel patch sho=
uld not in machine file.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">If any other question, please f=
eel free to me. Thanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Ken<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_39E6480C5A587146BAA4D885C7BCF7EEC6AA69BAIEC1EX2010MX4ie_--
