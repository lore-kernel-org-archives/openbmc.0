Return-Path: <1450335857@qq.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=113.96.223.53; helo=qq.com; envelope-from=1450335857@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="BEfdotNm"; 
 dkim-atps=neutral
Received: from qq.com (smtpbg405.qq.com [113.96.223.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43B4PB5mVQzDrgl
 for <openbmc@lists.ozlabs.org>; Fri,  7 Dec 2018 18:49:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1544168943; bh=nItTn2tllfBGS30pi1sS2/AuBYQ2QDioDfvT6eAzA40=;
 h=From:To:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
 b=BEfdotNmf9gVCHrg7phvJIbGVWwabHHIOWA7Q4kz7XSX4RXRoclOLHTlEvBuuxIBp
 B7Brl3Iq0iCjJUwGs2Zqesm1kgEb/DxT/BCQnB358rcQleSdsUR/ZPbtBUzxlUnZXd
 +mCWCElDPAjlH5RwHp+ikUoPgNYbKSEkwGZGrWAE=
X-QQ-FEAT: 0ZH8o+qZJ13VX2mETtsLNOmynS2LV5XnqOP4dM3/0datkcuTGWsg8arH4ihMz
 BY8qcxfqw4hm1LAKn5c0sf+HBkMgdz2qwQMh2lDqIDmQqGdysO+zzj1OlP49NyZ2IzAMuOc
 tTWmofFKIrPzVGT4t5vCDS8sIKhiifuSEcaNLsZ3IBhv52DOsG16SiSacgY28YniMqfkFx+
 nuZGa6g1So8dmwFiYno4WwkxSXM7D6JXgytXRtML8+sBnt/BE727rDekjHEsWYpxkA1Bx/N
 XFdDp+Kwi3qaLZAlRwQejBk7g=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
X-QQ-STYLE: 
X-QQ-mid: webmail500t1544168942t8137835
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: Why OEM command can't  run by "ipmitool -I lanplus"
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5C0A25EE_0A33D5C0_523048ED"
Content-Transfer-Encoding: 8Bit
Date: Fri, 7 Dec 2018 15:49:02 +0800
X-Priority: 3
Message-ID: <tencent_042D1A75541F9448E7395CDBB86B1A011A09@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 613196349
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 07 Dec 2018 15:49:03 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign2
X-QQ-Bgrelay: 1
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
X-List-Received-Date: Fri, 07 Dec 2018 07:49:37 -0000

This is a multi-part message in MIME format.

------=_NextPart_5C0A25EE_0A33D5C0_523048ED
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgYWxsLCAgIEkgYW0gdGVzdGluZyB0aGUgT0VNIGNvbW1hbmRzLiBJdCB3b3JrZWQgdmVy
eSB3ZWxsIG9uIGxvY2FsIGJtYyAgZW52LiAgYnV0IGZhaWxlZCBvbiByZW1vdGUgbWFjaGlu
ZSBieSBsYW5wbHVzIG1vZGUuDQogIGZvciBleGFtcGxlICwgSSB0ZXN0IG9wZW5wb3dlciBP
RU0gY29tbWFuZDogMHgzYSAweDExIG9uIGJtYyBvcy4NCk9uIGJtYzoNCnJvb3RAaGFpZ3Vh
bmcxOi9saWIvc3lzdGVtZC9zeXN0ZW0jIGlwbWlkDQpSZWdpc3RlcmluZyBOZXRGbjpbMHgy
RV0sIENtZDpbMHhGRl0NClJlZ2lzdGVyaW5nIE9FTTpbMFgwMDJCNzldLCBDbWQ6WzBYMzJd
IGZvciBTeXMgQ29tbWFuZHMNClJlZ2lzdGVyaW5nIE5ldEZuOlsweEFdLCBDbWQ6WzB4MTJd
DQpSZWdpc3RlcmluZyBOZXRGbjpbMHgzQV0sIENtZDpbMHhGMF0NClJlZ2lzdGVyaW5nIE5l
dEZuOlsweDMyXSwgQ21kOlsweDEwXQ0KUmVnaXN0ZXJpbmcgT0VNOlswWDAwMkI3OV0sIENt
ZDpbMFgwMl0gZm9yIEkyQw0KUmVnaXN0ZXJpbmcgT0VNOlswWDAwQzJDRl0sIENtZDpbMFgw
Ml0gZm9yIEkyQw0KDQpyb290QGhhaWd1YW5nMTp+IyAgaXBtaXRvb2wgcmF3IDB4M2EgMHgx
MQ0KDQoNCnJvb3RAaGFpZ3VhbmcxOn4jIGlwbWl0b29sIHJhdyA2IDQNCiA1NiAwMA0KDQoN
Cg0KT24gcmVtb3RlIG1hY2hpbmU6IA0KeGl1emhpQHhpdXpoaS1UaGlua1BhZC1UNDUwOn4k
aXBtaXRvb2wgLUkgbGFucGx1cyAtSCAxOTIuMTY4LjIwMC4xMzIgIC1QIDBwZW5CbWMgcmF3
IDB4M2EgMHgxMQ0KVW5hYmxlIHRvIHNlbmQgUkFXIGNvbW1hbmQgKGNoYW5uZWw9MHgwIG5l
dGZuPTB4M2EgbHVuPTB4MCBjbWQ9MHgxMSByc3A9MHhjMSk6IEludmFsaWQgY29tbWFuZA0K
eGl1emhpQHhpdXpoaS1UaGlua1BhZC1UNDUwOn4kIGlwbWl0b29sIC1JIGxhbnBsdXMgLUgg
MTkyLjE2OC4yMDAuMTMyICAtUCAwcGVuQm1jIHJhdyA2IDQNCiA1NiAwMA0KDQoNCg0KV2hv
IGNhbiBoZWxwIG1lPw0KQmVzdCwNClhpdXpoaQ==

------=_NextPart_5C0A25EE_0A33D5C0_523048ED
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgYWxsLDxkaXY+Jm5ic3A7ICZuYnNwO0kgYW0gdGVzdGluZyB0aGUgT0VNIGNvbW1hbmRz
LiBJdCB3b3JrZWQgdmVyeSB3ZWxsIG9uIGxvY2FsIGJtYyZuYnNwOyBlbnYuJm5ic3A7IGJ1
dCBmYWlsZWQgb24gcmVtb3RlIG1hY2hpbmUgYnkgbGFucGx1cyBtb2RlLjwvZGl2PjxkaXY+
Jm5ic3A7IGZvciBleGFtcGxlICwgSSB0ZXN0IG9wZW5wb3dlciBPRU0gY29tbWFuZDogMHgz
YSAweDExIG9uIGJtYyBvcy48L2Rpdj48ZGl2Pk9uIGJtYzo8L2Rpdj48ZGl2PjxkaXY+cm9v
dEBoYWlndWFuZzE6L2xpYi9zeXN0ZW1kL3N5c3RlbSMgaXBtaWQ8L2Rpdj48ZGl2PlJlZ2lz
dGVyaW5nIE5ldEZuOlsweDJFXSwgQ21kOlsweEZGXTwvZGl2PjxkaXY+UmVnaXN0ZXJpbmcg
T0VNOlswWDAwMkI3OV0sIENtZDpbMFgzMl0gZm9yIFN5cyBDb21tYW5kczwvZGl2PjxkaXY+
UmVnaXN0ZXJpbmcgTmV0Rm46WzB4QV0sIENtZDpbMHgxMl08L2Rpdj48ZGl2PlJlZ2lzdGVy
aW5nIE5ldEZuOlsweDNBXSwgQ21kOlsweEYwXTwvZGl2PjxkaXY+UmVnaXN0ZXJpbmcgTmV0
Rm46WzB4MzJdLCBDbWQ6WzB4MTBdPC9kaXY+PGRpdj5SZWdpc3RlcmluZyBPRU06WzBYMDAy
Qjc5XSwgQ21kOlswWDAyXSBmb3IgSTJDPC9kaXY+PGRpdj5SZWdpc3RlcmluZyBPRU06WzBY
MDBDMkNGXSwgQ21kOlswWDAyXSBmb3IgSTJDPC9kaXY+PC9kaXY+PGRpdj5yb290QGhhaWd1
YW5nMTp+IyZuYnNwOyBpcG1pdG9vbCByYXcgMHgzYSAweDExPC9kaXY+PGRpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PnJvb3RAaGFpZ3VhbmcxOn4jIGlwbWl0b29sIHJhdyA2IDQ8L2Rpdj48
ZGl2PiZuYnNwOzU2IDAwPC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5PbiByZW1v
dGUgbWFjaGluZTombmJzcDs8L2Rpdj48ZGl2PnhpdXpoaUB4aXV6aGktVGhpbmtQYWQtVDQ1
MDp+JGlwbWl0b29sIC1JIGxhbnBsdXMgLUggMTkyLjE2OC4yMDAuMTMyJm5ic3A7IC1QIDBw
ZW5CbWMgcmF3IDB4M2EgMHgxMTwvZGl2PjxkaXY+VW5hYmxlIHRvIHNlbmQgUkFXIGNvbW1h
bmQgKGNoYW5uZWw9MHgwIG5ldGZuPTB4M2EgbHVuPTB4MCBjbWQ9MHgxMSByc3A9MHhjMSk6
IEludmFsaWQgY29tbWFuZDwvZGl2PjxkaXY+PGRpdj54aXV6aGlAeGl1emhpLVRoaW5rUGFk
LVQ0NTA6fiQgaXBtaXRvb2wgLUkgbGFucGx1cyAtSCAxOTIuMTY4LjIwMC4xMzImbmJzcDsg
LVAgMHBlbkJtYyByYXcgNiA0PC9kaXY+PGRpdj4mbmJzcDs1NiAwMDwvZGl2PjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+V2hvIGNhbiBoZWxwIG1lPzwvZGl2PjxkaXY+QmVzdCw8L2Rp
dj48ZGl2PlhpdXpoaTwvZGl2PjxkaXY+PGJyPjwvZGl2Pg==

------=_NextPart_5C0A25EE_0A33D5C0_523048ED--
