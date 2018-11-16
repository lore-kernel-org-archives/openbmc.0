Return-Path: <1450335857@qq.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=103.7.29.139; helo=smtpbg64.qq.com; envelope-from=1450335857@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="ZrXAmYPn"; 
 dkim-atps=neutral
Received: from smtpbg64.qq.com (smtpbg62.qq.com [103.7.29.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42x0bb27jCzF3fW
 for <openbmc@lists.ozlabs.org>; Fri, 16 Nov 2018 12:13:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1542330790; bh=s/C16g+MB3QqTZzs5l9GpgHipJ03G00Vfxd2anev6W4=;
 h=In-Reply-To:References:From:To:Cc:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
 b=ZrXAmYPnrj82+Iy3nOV7ZgS69seU7b5zqhRE0WrlRcp4M8bpOJyD/edT2jiFLbVZj
 XXBmSCMyfJt4ll3yqlVJ9TGe0YAvDLLb0KMEFgmpz93abG8xHrA1nYgyOzYnBe1EVp
 P979s7heYvJ1vgKUF+ktsDDoJZFba04CnIbA1M7g=
X-QQ-SSF: 000000000000002000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
In-Reply-To: <c92792d1-a03e-d0d9-62d6-98663904b7d0@linux.vnet.ibm.com>
References: <mailman.9.1542243603.11481.openbmc@lists.ozlabs.org>
 <tencent_3A3ECA558D9BA0F1B9F1A0715AF542A96D05@qq.com>
 <c92792d1-a03e-d0d9-62d6-98663904b7d0@linux.vnet.ibm.com>
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1542330788t800371
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?VG9tIEpvc2VwaA==?=" <tomjose@linux.vnet.ibm.com>,
 "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Cc: "=?ISO-8859-1?B?cmF0YWd1cHQ=?=" <ratagupt@linux.vnet.ibm.com>
Subject: Re: Pamela.py can't run on BMC python env
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5BEE19A4_092598D0_3CC97053"
Content-Transfer-Encoding: 8Bit
Date: Fri, 16 Nov 2018 09:13:08 +0800
X-Priority: 3
Message-ID: <tencent_7A0BAE6D7AF8061173C4F1D5@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 1273584534
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 16 Nov 2018 09:13:10 +0800 (CST)
Feedback-ID: webenglish:qq.com:bgweb:bgweb115
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
X-List-Received-Date: Fri, 16 Nov 2018 01:13:16 -0000

This is a multi-part message in MIME format.

------=_NextPart_5BEE19A4_092598D0_3CC97053
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgVG9tLA0KICAgIFBhbWVsYS5weSB3b3JrcyBub3csdGhhbmtzIHZlcnkgbXVjaC4NCkJl
c3QsDQpYaXV6aGkNCg0KDQoNCg0KLS0tLS0tLS0tLS0tLS0tLS0tIE9yaWdpbmFsIC0tLS0t
LS0tLS0tLS0tLS0tLQ0KRnJvbTogICJUb20gSm9zZXBoIjs8dG9tam9zZUBsaW51eC52bmV0
LmlibS5jb20+Ow0KRGF0ZTogIE5vdiAxNSwgMjAxOA0KVG86ICAieGl1emhpIjwxNDUwMzM1
ODU3QHFxLmNvbT47ICJvcGVuYm1jIjxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+OyANCkNj
OiAgInJhdGFndXB0IjxyYXRhZ3VwdEBsaW51eC52bmV0LmlibS5jb20+OyANClN1YmplY3Q6
ICBSZTogUGFtZWxhLnB5IGNhbid0IHJ1biBvbiBCTUMgcHl0aG9uIGVudg0KDQoNCg0KSGVs
bG8gWGl1emhpLA0KDQpwYW1lbGEucHkgZGVwZW5kcyBvbiB0aGUgbGlicGFtIGxpYnJhcnkg
YW5kIGZpbmRfbGlicmFyeSBpcyBmYWlsaW5nLiBBIA0Kd29ya2Fyb3VuZCBpcyB1cCBmb3Ig
cmV2aWV3Lg0KDQpodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6LyMvYy9vcGVu
Ym1jL21ldGEtcGhvc3Bob3IvKy8xMzA5Mi8NCg0KUmVnYXJkcywNClRvbQ0KDQoNCk9uIFRo
dXJzZGF5IDE1IE5vdmVtYmVyIDIwMTggMTE6NTYgQU0sIHhpdXpoaSB3cm90ZToNCj4gSGkg
QWxsLA0KPiAgICBJIHdhbnQgdG8gdXNlIFBBTSBweXRob24gbW9kdWxlIHBhbWVsYS5weSAg
aW4gdGhlIA0KPiAvdXNyL2xpYi9weXRob24yLjcvc2l0ZS1wYWNrYWdlcyAuDQo+ICBUaGUg
ZXJyb3IgaXMgYXMgZm9sbG93cyA6DQo+IDEpcm9vdEBoYWlndWFuZzE6L3Vzci9saWIvcHl0
aG9uMi43L3NpdGUtcGFja2FnZXMjIHB5dGhvbiAtbSBwYW1lbGEgLWEgDQo+IGB3aG9hbWlg
DQo+IENvdWxkIG5vdCBpbXBvcnQgcnVucHkgbW9kdWxlDQo+DQo+IDIpcm9vdEBoYWlndWFu
ZzE6L3Vzci9saWIvcHl0aG9uMi43L3NpdGUtcGFja2FnZXMjIHB5dGhvbiAuL3BhbWVsYS5w
eQ0KPiBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6DQo+ICAgRmlsZSAiLi9w
YW1lbGEucHkiLCBsaW5lIDE0MywgaW4gPG1vZHVsZT4NCj4gICAgIFBBTV9TVEFSVCA9IExJ
QlBBTS5wYW1fc3RhcnQNCj4gICBGaWxlICIvdXNyL2xpYi9weXRob24yLjcvY3R5cGVzL19f
aW5pdF9fLnB5IiwgbGluZSAzNzksIGluIF9fZ2V0YXR0cl9fDQo+ICAgICBmdW5jID0gc2Vs
Zi5fX2dldGl0ZW1fXyhuYW1lKQ0KPiAgIEZpbGUgIi91c3IvbGliL3B5dGhvbjIuNy9jdHlw
ZXMvX19pbml0X18ucHkiLCBsaW5lIDM4NCwgaW4gX19nZXRpdGVtX18NCj4gICAgIGZ1bmMg
PSBzZWxmLl9GdW5jUHRyKChuYW1lX29yX29yZGluYWwsIHNlbGYpKQ0KPiBBdHRyaWJ1dGVF
cnJvcjogcHl0aG9uOiB1bmRlZmluZWQgc3ltYm9sOiBwYW1fc3RhcnQNCj4NCj4gSSBydW4g
dGhlIHBhbWVsYS5weSBvbiB1YnVudHUxNi4wNCAsaXQgd29yayB2ZXJ5IHdlbGwuDQo+IFdo
byBjYW4gZ2l2ZSBtZSBzb21lIHN1Z2dlc3Rpb25zPw0KPg0KPiBCZXN0LA0KPiBYaXV6aGk=

------=_NextPart_5BEE19A4_092598D0_3CC97053
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj5IaSBUb20sPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7IFBhbWVsYS5weSB3b3JrcyBu
b3csdGhhbmtzIHZlcnkgbXVjaC48L2Rpdj48ZGl2PkJlc3QsPC9kaXY+PGRpdj5YaXV6aGk8
L2Rpdj48ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZv
bnQtc2l6ZTogMTJweDtmb250LWZhbWlseTogQXJpYWwgTmFycm93O3BhZGRpbmc6MnB4IDAg
MnB4IDA7Ij4tLS0tLS0tLS0tLS0tLS0tLS0mbmJzcDtPcmlnaW5hbCZuYnNwOy0tLS0tLS0t
LS0tLS0tLS0tLTwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtc2l6ZTogMTJweDtiYWNrZ3JvdW5k
OiNlZmVmZWY7cGFkZGluZzo4cHg7Ij48ZGl2PjxiPkZyb206IDwvYj4mbmJzcDsiVG9tIEpv
c2VwaCI7Jmx0O3RvbWpvc2VAbGludXgudm5ldC5pYm0uY29tJmd0Ozs8L2Rpdj48ZGl2Pjxi
PkRhdGU6IDwvYj4mbmJzcDtOb3YgMTUsIDIwMTg8L2Rpdj48ZGl2PjxiPlRvOiA8L2I+Jm5i
c3A7InhpdXpoaSImbHQ7MTQ1MDMzNTg1N0BxcS5jb20mZ3Q7OyAib3BlbmJtYyImbHQ7b3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnJmd0OzsgPHdicj48L2Rpdj48ZGl2PjxiPkNjOiA8L2I+
Jm5ic3A7InJhdGFndXB0IiZsdDtyYXRhZ3VwdEBsaW51eC52bmV0LmlibS5jb20mZ3Q7OyA8
d2JyPjwvZGl2PjxkaXY+PGI+U3ViamVjdDogPC9iPiZuYnNwO1JlOiBQYW1lbGEucHkgY2Fu
J3QgcnVuIG9uIEJNQyBweXRob24gZW52PC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+SGVs
bG8gWGl1emhpLDxicj48YnI+cGFtZWxhLnB5IGRlcGVuZHMgb24gdGhlIGxpYnBhbSBsaWJy
YXJ5IGFuZCBmaW5kX2xpYnJhcnkgaXMgZmFpbGluZy4gQSA8YnI+d29ya2Fyb3VuZCBpcyB1
cCBmb3IgcmV2aWV3Ljxicj48YnI+aHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5
ei8jL2Mvb3BlbmJtYy9tZXRhLXBob3NwaG9yLysvMTMwOTIvPGJyPjxicj5SZWdhcmRzLDxi
cj5Ub208YnI+PGJyPjxicj5PbiBUaHVyc2RheSAxNSBOb3ZlbWJlciAyMDE4IDExOjU2IEFN
LCB4aXV6aGkgd3JvdGU6PGJyPiZndDsgSGkgQWxsLDxicj4mZ3Q7ICZuYnNwOyAmbmJzcDtJ
IHdhbnQgdG8gdXNlIFBBTSBweXRob24gbW9kdWxlIHBhbWVsYS5weSZuYnNwOyBpbiB0aGUg
PGJyPiZndDsgL3Vzci9saWIvcHl0aG9uMi43L3NpdGUtcGFja2FnZXMmbmJzcDsuPGJyPiZn
dDsgJm5ic3A7VGhlIGVycm9yIGlzIGFzIGZvbGxvd3MgOjxicj4mZ3Q7IDEpcm9vdEBoYWln
dWFuZzE6L3Vzci9saWIvcHl0aG9uMi43L3NpdGUtcGFja2FnZXMjIHB5dGhvbiAtbSBwYW1l
bGEgLWEgPGJyPiZndDsgYHdob2FtaWA8YnI+Jmd0OyBDb3VsZCBub3QgaW1wb3J0IHJ1bnB5
IG1vZHVsZTxicj4mZ3Q7PGJyPiZndDsgMilyb290QGhhaWd1YW5nMTovdXNyL2xpYi9weXRo
b24yLjcvc2l0ZS1wYWNrYWdlcyMgcHl0aG9uIC4vcGFtZWxhLnB5PGJyPiZndDsgVHJhY2Vi
YWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOjxicj4mZ3Q7ICZuYnNwOyBGaWxlICIuL3Bh
bWVsYS5weSIsIGxpbmUgMTQzLCBpbiAmbHQ7bW9kdWxlJmd0Ozxicj4mZ3Q7ICZuYnNwOyAm
bmJzcDsgUEFNX1NUQVJUID0gTElCUEFNLnBhbV9zdGFydDxicj4mZ3Q7ICZuYnNwOyBGaWxl
ICIvdXNyL2xpYi9weXRob24yLjcvY3R5cGVzL19faW5pdF9fLnB5IiwgbGluZSAzNzksIGlu
IF9fZ2V0YXR0cl9fPGJyPiZndDsgJm5ic3A7ICZuYnNwOyBmdW5jID0gc2VsZi5fX2dldGl0
ZW1fXyhuYW1lKTxicj4mZ3Q7ICZuYnNwOyBGaWxlICIvdXNyL2xpYi9weXRob24yLjcvY3R5
cGVzL19faW5pdF9fLnB5IiwgbGluZSAzODQsIGluIF9fZ2V0aXRlbV9fPGJyPiZndDsgJm5i
c3A7ICZuYnNwOyBmdW5jID0gc2VsZi5fRnVuY1B0cigobmFtZV9vcl9vcmRpbmFsLCBzZWxm
KSk8YnI+Jmd0OyBBdHRyaWJ1dGVFcnJvcjogcHl0aG9uOiB1bmRlZmluZWQgc3ltYm9sOiBw
YW1fc3RhcnQ8YnI+Jmd0Ozxicj4mZ3Q7IEkgcnVuIHRoZSBwYW1lbGEucHkgb24gdWJ1bnR1
MTYuMDQgLGl0IHdvcmsgdmVyeSB3ZWxsLjxicj4mZ3Q7IFdobyBjYW4gZ2l2ZSBtZSBzb21l
IHN1Z2dlc3Rpb25zPzxicj4mZ3Q7PGJyPiZndDsgQmVzdCw8YnI+Jmd0OyBYaXV6aGk8YnI+
PC9kaXY+

------=_NextPart_5BEE19A4_092598D0_3CC97053--
