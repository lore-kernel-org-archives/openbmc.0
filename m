Return-Path: <1450335857@qq.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=14.17.44.32; helo=smtpbg337.qq.com; envelope-from=1450335857@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="MbvxgNLt"; 
 dkim-atps=neutral
X-Greylist: delayed 434 seconds by postgrey-1.36 at bilbo;
 Wed, 25 Jul 2018 17:56:37 AEST
Received: from smtpbg337.qq.com (smtpbg337.qq.com [14.17.44.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41b6xd2LJtzDrHF
 for <openbmc@lists.ozlabs.org>; Wed, 25 Jul 2018 17:56:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1532504886; bh=+k80aSXS4qBYgorHnSsY2/MjEcoQQAPbl+rQcwQcQgI=;
 h=From:To:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
 b=MbvxgNLt6q4PEEHCR0moUCBKM4brxhCdtfBNP2//qiyxXyRLKFTXsPolVOgm+b6B1
 Dgb/WsfUgpH8SAG2KG5Ihd4LAXkZWEcNlRVpLPOymlAqt864yYGUarJ6SO42n4e5zR
 rTnZsC0Psc7rYGh33VKslPLAlz3fDrQ2t/WfqKAI=
X-QQ-FEAT: 0+vGDqNMe+Rmy0ol06Dd3PR8SftPGpXHa15mDWZ/YUzlTcAI7PJCK3fwLbEMB
 lO2klOwDMu/ZD+R/O3D6kqSU+0mJoxo9nzpHE5sZScnIl+gJyDFGVKeJmFEGVXS3Aez3Lg1
 X1se9r9Fdpo7tf4uOnGyMVbLaBbZW4sJLEoqra4D6WJYwnQ1EeVvQKZaajnR4dfrEMoKd+i
 +NvgHuzoJNsRKW7Eg8DeGGSfa8G/+2VAqGB2vTNODHDxNa+rAW/2ft6EHZsqH+AOQkF1UqP
 hv5LFsO3FtzXcSOXREljpUWGk=
X-QQ-SSF: 000000000000004000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
X-QQ-STYLE: 
X-QQ-mid: webmail500t1532504884t5259815
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: Re: KVM Support?
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5B582B34_0B5211C0_37D5677C"
Content-Transfer-Encoding: 8Bit
Date: Wed, 25 Jul 2018 15:48:04 +0800
X-Priority: 3
Message-ID: <tencent_7C15837BAB91A131A31142D54EE9723ED405@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Wed, 25 Jul 2018 15:48:06 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign3
X-QQ-Bgrelay: 1
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
X-List-Received-Date: Wed, 25 Jul 2018 07:56:39 -0000

This is a multi-part message in MIME format.

------=_NextPart_5B582B34_0B5211C0_37D5677C
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgRWRkaWUsDQoNCg0KICBJIHJlYWQgeW91ciBLVk0gU3VwcG9ydCBlbWFpbCBvbiBtYWls
aW5nbGlzdC4NCg0KDQpJIGFtIGdvaW5nIHRvIHBvcnQgdGhlIEJNQyBrdm0gdG8gYXN0MjQw
MCAuIFRoZSB1LWJvb3QgY2FuIG5vdCBsb2FkIGtlcm5lbCAsdGhlIGVycm9yIG1lc3NhZ2Ug
cmVhZDoNCg0KDQoiIlUtQm9vdCAyMDE2LjA3IChKdWwgMjMgMjAxOCAtIDExOjExOjUwICsw
MDAwKQ0KDQoNCkRSQU06ICAyNDAgTWlCDQpXQVJOSU5HOiBDYWNoZXMgbm90IGVuYWJsZWQN
CkZsYXNoOiAzMiBNaUINCioqKiBXYXJuaW5nIC0gYmFkIENSQywgdXNpbmcgZGVmYXVsdCBl
bnZpcm9ubWVudA0KDQoNCkluOiAgICBzZXJpYWwNCk91dDogICBzZXJpYWwNCkVycjogICBz
ZXJpYWwNCk5ldDogICBhc3BlZWRuaWMjMA0KRXJyb3I6IGFzcGVlZG5pYyMwIGFkZHJlc3Mg
bm90IHNldC4NCg0KDQpIaXQgYW55IGtleSB0byBzdG9wIGF1dG9ib290OiAgMA0KIyMgTG9h
ZGluZyBrZXJuZWwgZnJvbSBGSVQgSW1hZ2UgYXQgMjAwODAwMDAgLi4uDQpCYWQgRklUIGtl
cm5lbCBpbWFnZSBmb3JtYXQhDQpFUlJPUjogY2FuJ3QgZ2V0IGtlcm5lbCBpbWFnZSENCmFz
dCMNCg0KDQpJIGFkZGVkICBjb25maWcgb3B0aW9ucyB0byBkZWZjb25maWcgb2YgYXN0MjQw
MCBhcyBmb2xsb3dzOg0KDQoNCkNPTkZJR19NRURJQV9TVVBQT1JUPXkNCkNPTkZJR19NRURJ
QV9DQU1FUkFfU1VQUE9SVD15DQpDT05GSUdfTUVESUFfU1VQUE9SVD15DQpDT05GSUdfTUVE
SUFfQ0FNRVJBX1NVUFBPUlQ9eQ0KIyBDT05GSUdfTUVESUFfQU5BTE9HX1RWX1NVUFBPUlQg
aXMgbm90IHNldA0KIyBDT05GSUdfTUVESUFfRElHSVRBTF9UVl9TVVBQT1JUIGlzIG5vdCBz
ZXQNCiMgQ09ORklHX01FRElBX1JBRElPX1NVUFBPUlQgaXMgbm90IHNldA0KIyBDT05GSUdf
TUVESUFfU0RSX1NVUFBPUlQgaXMgbm90IHNldA0KIyBDT05GSUdfTUVESUFfQ0VDX1NVUFBP
UlQgaXMgbm90IHNldA0KIyBDT05GSUdfTUVESUFfQ09OVFJPTExFUiBpcyBub3Qgc2V0DQpD
T05GSUdfUkFUSU9OQUw9eQ0KQ09ORklHX1ZJREVPX0RFVj15DQpDT05GSUdfVklERU9fVjRM
Mj15DQpDT05GSUdfVjRMX1BMQVRGT1JNX0RSSVZFUlM9eQ0KQ09ORklHX1ZJREVPX0FTUEVF
RD15DQpDT05GSUdfTUVESUFfU1VCRFJWX0FVVE9TRUxFQ1Q9eQ0KDQoNCk5lZWQgSSBtb2Rp
ZnkgdGhlIGFzcGVlZC1ibWMtb3BwLXBhbG1ldHRvLmR0cyBhbmQgYXNwZWVkLWc0LmR0c2k/
DQoNCg0KQ2FuIHlvdSBnaXZlIG1lIHRoZSBmaWxlIGxpc3QgbmVlZCB0byBtb2RpZnk/DQoN
Cg0KVGhhbmtzLA0KDQoNCnhpdXpoaQ==

------=_NextPart_5B582B34_0B5211C0_37D5677C
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj48ZGl2PkhpIEVkZGllLDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Jm5ic3A7IEkg
cmVhZCB5b3VyIEtWTSBTdXBwb3J0IGVtYWlsIG9uIG1haWxpbmdsaXN0LjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+SSBhbSBnb2luZyB0byBwb3J0IHRoZSBCTUMga3ZtIHRvIGFzdDI0
MDAgLiBUaGUgdS1ib290IGNhbiBub3QgbG9hZCBrZXJuZWwgLHRoZSBlcnJvciBtZXNzYWdl
IHJlYWQ6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4iIlUtQm9vdCAyMDE2LjA3IChKdWwg
MjMgMjAxOCAtIDExOjExOjUwICswMDAwKTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+RFJB
TTombmJzcDsgMjQwIE1pQjwvZGl2PjxkaXY+V0FSTklORzogQ2FjaGVzIG5vdCBlbmFibGVk
PC9kaXY+PGRpdj5GbGFzaDogMzIgTWlCPC9kaXY+PGRpdj4qKiogV2FybmluZyAtIGJhZCBD
UkMsIHVzaW5nIGRlZmF1bHQgZW52aXJvbm1lbnQ8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PkluOiZuYnNwOyAmbmJzcDsgc2VyaWFsPC9kaXY+PGRpdj5PdXQ6Jm5ic3A7ICZuYnNwO3Nl
cmlhbDwvZGl2PjxkaXY+RXJyOiZuYnNwOyAmbmJzcDtzZXJpYWw8L2Rpdj48ZGl2Pk5ldDom
bmJzcDsgJm5ic3A7YXNwZWVkbmljIzA8L2Rpdj48ZGl2PkVycm9yOiBhc3BlZWRuaWMjMCBh
ZGRyZXNzIG5vdCBzZXQuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5IaXQgYW55IGtleSB0
byBzdG9wIGF1dG9ib290OiZuYnNwOyAwPC9kaXY+PGRpdj4jIyBMb2FkaW5nIGtlcm5lbCBm
cm9tIEZJVCBJbWFnZSBhdCAyMDA4MDAwMCAuLi48L2Rpdj48ZGl2PkJhZCBGSVQga2VybmVs
IGltYWdlIGZvcm1hdCE8L2Rpdj48ZGl2PkVSUk9SOiBjYW4ndCBnZXQga2VybmVsIGltYWdl
ITwvZGl2PjxkaXY+YXN0IzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBhZGRlZCZuYnNw
OyBjb25maWcgb3B0aW9ucyB0byBkZWZjb25maWcgb2YgYXN0MjQwMCBhcyBmb2xsb3dzOjwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Q09ORklHX01FRElBX1NVUFBPUlQ9eTwvZGl2Pjxk
aXY+Q09ORklHX01FRElBX0NBTUVSQV9TVVBQT1JUPXk8L2Rpdj48ZGl2PkNPTkZJR19NRURJ
QV9TVVBQT1JUPXk8L2Rpdj48ZGl2PkNPTkZJR19NRURJQV9DQU1FUkFfU1VQUE9SVD15PC9k
aXY+PGRpdj4jIENPTkZJR19NRURJQV9BTkFMT0dfVFZfU1VQUE9SVCBpcyBub3Qgc2V0PC9k
aXY+PGRpdj4jIENPTkZJR19NRURJQV9ESUdJVEFMX1RWX1NVUFBPUlQgaXMgbm90IHNldDwv
ZGl2PjxkaXY+IyBDT05GSUdfTUVESUFfUkFESU9fU1VQUE9SVCBpcyBub3Qgc2V0PC9kaXY+
PGRpdj4jIENPTkZJR19NRURJQV9TRFJfU1VQUE9SVCBpcyBub3Qgc2V0PC9kaXY+PGRpdj4j
IENPTkZJR19NRURJQV9DRUNfU1VQUE9SVCBpcyBub3Qgc2V0PC9kaXY+PGRpdj4jIENPTkZJ
R19NRURJQV9DT05UUk9MTEVSIGlzIG5vdCBzZXQ8L2Rpdj48ZGl2PkNPTkZJR19SQVRJT05B
TD15PC9kaXY+PGRpdj5DT05GSUdfVklERU9fREVWPXk8L2Rpdj48ZGl2PkNPTkZJR19WSURF
T19WNEwyPXk8L2Rpdj48ZGl2PkNPTkZJR19WNExfUExBVEZPUk1fRFJJVkVSUz15PC9kaXY+
PGRpdj5DT05GSUdfVklERU9fQVNQRUVEPXk8L2Rpdj48ZGl2PkNPTkZJR19NRURJQV9TVUJE
UlZfQVVUT1NFTEVDVD15PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5OZWVkIEkgbW9kaWZ5
IHRoZSBhc3BlZWQtYm1jLW9wcC1wYWxtZXR0by5kdHMgYW5kIGFzcGVlZC1nNC5kdHNpPzwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Q2FuIHlvdSBnaXZlIG1lIHRoZSBmaWxlIGxpc3Qg
bmVlZCB0byBtb2RpZnk/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj54aXV6aGk8L2Rpdj48L2Rpdj4=

------=_NextPart_5B582B34_0B5211C0_37D5677C--
