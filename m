Return-Path: <1450335857@qq.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=183.3.226.243; helo=qq.com; envelope-from=1450335857@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="Db1LNhTZ"; 
 dkim-atps=neutral
Received: from qq.com (smtpbg419.qq.com [183.3.226.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 431P3g6XSFzDqSr
 for <openbmc@lists.ozlabs.org>; Fri, 23 Nov 2018 15:49:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1542948539; bh=u5gMF1PqclJgF5vfqSESU3uzMicq5bqFzruy31ifRzk=;
 h=In-Reply-To:References:From:To:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
 b=Db1LNhTZPhVxN1L0pSO1Qk+mAJve9L7H39AsDXBuPgB8ooWOCqGmYTtrG4mD/jtCc
 nMS7M0aKdw9cbQMC7eN9o0kijCOsm6plC09Xe9t0oKq7KGYFYb11Tz0YaLANkzSiNl
 9mh8rloxwAxRIzbi41aw1CtaDehjFEHm3prZxRaQ=
X-QQ-SSF: 000000000000002000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
In-Reply-To: <mailman.13.1542934803.27188.openbmc@lists.ozlabs.org>
References: <mailman.13.1542934803.27188.openbmc@lists.ozlabs.org>
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1542948535t955964
From: "=?gb18030?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>,
 "=?gb18030?B?ams=?=" <jk@ozlabs.org>
Subject: SOL,obmc-console-client can't connect to the host OS
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5BF786B6_092349B8_508C1B0E"
Content-Transfer-Encoding: 8Bit
Date: Fri, 23 Nov 2018 12:48:54 +0800
X-Priority: 3
Message-ID: <tencent_3E424D8E19D15B754896EDBB@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 2135567039
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 23 Nov 2018 12:48:59 +0800 (CST)
Feedback-ID: webenglish:qq.com:bgweb:bgweb16
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
X-List-Received-Date: Fri, 23 Nov 2018 04:49:21 -0000

This is a multi-part message in MIME format.

------=_NextPart_5BF786B6_092349B8_508C1B0E
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KICBJIGFtIGRlYnVnZ2luZyB0aGUgU09MLCB0aGUgb2JtYy1jb25zb2xlLWNs
aWVudCBkaWRuJ3Qgd29yay4NCk15IEJNQyBhbmQgaG9zdCBPUyBydW50aW1lIGVudmlyb25t
ZW50cyBhcmU6ICANCjEsIEJNQzogDQoxKSBvYm1jLWNvbnNvbGUtc2VydmVyIGlzIGdvb2QN
CiMgc3lzdGVtY3RsIHN0YXR1cyBvYm1jLWNvbnNvbGVcQHR0eVZVQVJUMA0KW1swOzE7MzJt
ofFbWzBtIG9ibWMtY29uc29sZUB0dHlWVUFSVDAuc2VydmljZSAtIFBob3NwaG9yIENvbnNv
bGUgTXV4ZXIgbGlzdGVuaW5nIG9uIGRldmljZSAvZGV2L3R0eVZVQVJUMA0KICAgTG9hZGVk
OiBsb2FkZWQgKC9saWIvc3lzdGVtZC9zeXN0ZW0vb2JtYy1jb25zb2xlQC5zZXJ2aWNlOyBp
bmRpcmVjdDsgdmVuZG9yIHByZXNldDogZW5hYmxlZCkNCiAgIEFjdGl2ZTogW1swOzE7MzJt
YWN0aXZlIChydW5uaW5nKVtbMG0gc2luY2UgRnJpIDE5OTgtMDEtMDIgMTk6NDI6NTYgVVRD
OyAzOG1pbiBhZ28NCiBNYWluIFBJRDogMTYxNiAob2JtYy1jb25zb2xlLXNlKQ0KICAgQ0dy
b3VwOiAvc3lzdGVtLnNsaWNlL3N5c3RlbS1vYm1jXHgyZGNvbnNvbGUuc2xpY2Uvb2JtYy1j
b25zb2xlQHR0eVZVQVJUMC5zZXJ2aWNlDQogICAgICAgICAgIKm4qaQxNjE2IG9ibWMtY29u
c29sZS1zZXJ2ZXIgLS1jb25maWcgL2V0Yy9vYm1jLWNvbnNvbGUuY29uZiB0dHlWVUFSVDAN
Cg0KDQpKYW4gMDIgMTk6NDI6NTYgaGFpZ3VhbmcxIHN5c3RlbWRbMV06IFN0YXJ0ZWQgUGhv
c3Bob3IgQ29uc29sZSBNdXhlciBsaXN0ZW5pbmcgb24gZGV2aWNlIC9kZXYvdHR5VlVBUlQw
Lg0KDQoyKSAvZXRjLyBvYm1jLWNvbnNvbGUuY29uZg0KbHBjLWFkZHJlc3MgPSAweDNmOA0K
c2lycSA9IDQNCmxvY2FsLXR0eSA9IHR0eVMwDQpsb2NhbC10dHktYmF1ZCA9IDExNTIwMA0K
DQoNCjIsIEhvc3QgT1M6IHJlZGhhdCA3DQojIGNhdCAvcHJvYy90dHkvZHJpdmVyL3Nlcmlh
bCANCnNlcmluZm86MS4wIGRyaXZlciByZXZpc2lvbjoNCjA6IHVhcnQ6MTY0NTAgcG9ydDow
MDAwMDNGOCBpcnE6NCB0eDowIHJ4OjANCjE6IHVhcnQ6dW5rbm93biBwb3J0OjAwMDAwMkY4
IGlycTozDQoyOiB1YXJ0OnVua25vd24gcG9ydDowMDAwMDNFOCBpcnE6NA0KMzogdWFydDp1
bmtub3duIHBvcnQ6MDAwMDAyRTggaXJxOjMNCg0KDQoNCkl0IHNlZW1lZCB0byBsb2NrIGFu
ZCBvdXRwdXQgbm90aGluZyB3aGVuIEkgcnVuICJvYm1jLWNvbnNvbGUtY2xpZW50IiBvbiBC
TUMuIEFuZCB0aGVyZSBpcyBub3RoaW5nIGluIHRoZSBsb2cgL3Zhci9sb2cvb2JtYy1jb25z
b2xlLmxvZw0KDQoNCiAgV2hvIGNhbiB0ZWxsIG1lIGhvdyB0byBkZWJ1ZyBpdD8NClRoYW5r
cywNClhpdXpoaQ==

------=_NextPart_5BF786B6_092349B8_508C1B0E
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PGRpdj5IaSBBbGwsPC9kaXY+PGRpdj4mbmJzcDsgSSBhbSBkZWJ1Z2dpbmcgdGhlIFNPTCwg
dGhlIG9ibWMtY29uc29sZS1jbGllbnQgZGlkbid0IHdvcmsuPC9kaXY+PGRpdj5NeSBCTUMg
YW5kIGhvc3QgT1MgcnVudGltZSBlbnZpcm9ubWVudHMgYXJlOiZuYnNwOyZuYnNwOzwvZGl2
PjxkaXY+MSwgQk1DOiZuYnNwOzwvZGl2PjxkaXY+MSkgb2JtYy1jb25zb2xlLXNlcnZlciBp
cyBnb29kPC9kaXY+PGRpdj4jIHN5c3RlbWN0bCBzdGF0dXMgb2JtYy1jb25zb2xlXEB0dHlW
VUFSVDA8L2Rpdj48ZGl2PltbMDsxOzMybaHxW1swbSBvYm1jLWNvbnNvbGVAdHR5VlVBUlQw
LnNlcnZpY2UgLSBQaG9zcGhvciBDb25zb2xlIE11eGVyIGxpc3RlbmluZyBvbiBkZXZpY2Ug
L2Rldi90dHlWVUFSVDA8L2Rpdj48ZGl2PjxkaXY+Jm5ic3A7ICZuYnNwO0xvYWRlZDogbG9h
ZGVkICgvbGliL3N5c3RlbWQvc3lzdGVtL29ibWMtY29uc29sZUAuc2VydmljZTsgaW5kaXJl
Y3Q7IHZlbmRvciBwcmVzZXQ6IGVuYWJsZWQpPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7QWN0
aXZlOiBbWzA7MTszMm1hY3RpdmUgKHJ1bm5pbmcpW1swbSBzaW5jZSBGcmkgMTk5OC0wMS0w
MiAxOTo0Mjo1NiBVVEM7IDM4bWluIGFnbzwvZGl2PjxkaXY+Jm5ic3A7TWFpbiBQSUQ6IDE2
MTYgKG9ibWMtY29uc29sZS1zZSk8L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDtDR3JvdXA6IC9z
eXN0ZW0uc2xpY2Uvc3lzdGVtLW9ibWNceDJkY29uc29sZS5zbGljZS9vYm1jLWNvbnNvbGVA
dHR5VlVBUlQwLnNlcnZpY2U8L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7qbippDE2MTYgb2JtYy1jb25zb2xlLXNlcnZlciAtLWNvbmZpZyAv
ZXRjL29ibWMtY29uc29sZS5jb25mIHR0eVZVQVJUMDwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+SmFuIDAyIDE5OjQyOjU2IGhhaWd1YW5nMSBzeXN0ZW1kWzFdOiBTdGFydGVkIFBob3Nw
aG9yIENvbnNvbGUgTXV4ZXIgbGlzdGVuaW5nIG9uIGRldmljZSAvZGV2L3R0eVZVQVJUMC48
L2Rpdj48L2Rpdj48ZGl2PjIpIC9ldGMvJm5ic3A7b2JtYy1jb25zb2xlLmNvbmY8L2Rpdj48
ZGl2PmxwYy1hZGRyZXNzID0gMHgzZjg8L2Rpdj48ZGl2PnNpcnEgPSA0PC9kaXY+PGRpdj5s
b2NhbC10dHkgPSB0dHlTMDwvZGl2PjxkaXY+bG9jYWwtdHR5LWJhdWQgPSAxMTUyMDA8L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PjIsIEhvc3QgT1M6IHJlZGhhdCA3PC9kaXY+PGRpdj48
ZGl2PiMgY2F0IC9wcm9jL3R0eS9kcml2ZXIvc2VyaWFsJm5ic3A7PC9kaXY+PGRpdj5zZXJp
bmZvOjEuMCBkcml2ZXIgcmV2aXNpb246PC9kaXY+PGRpdj4wOiB1YXJ0OjE2NDUwIHBvcnQ6
MDAwMDAzRjggaXJxOjQgdHg6MCByeDowPC9kaXY+PGRpdj4xOiB1YXJ0OnVua25vd24gcG9y
dDowMDAwMDJGOCBpcnE6MzwvZGl2PjxkaXY+MjogdWFydDp1bmtub3duIHBvcnQ6MDAwMDAz
RTggaXJxOjQ8L2Rpdj48ZGl2PjM6IHVhcnQ6dW5rbm93biBwb3J0OjAwMDAwMkU4IGlycToz
PC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JdCBzZWVtZWQgdG8gbG9jayBhbmQg
b3V0cHV0IG5vdGhpbmcgd2hlbiBJIHJ1biAib2JtYy1jb25zb2xlLWNsaWVudCIgb24gQk1D
LiBBbmQgdGhlcmUgaXMgbm90aGluZyBpbiB0aGUgbG9nJm5ic3A7L3Zhci9sb2cvb2JtYy1j
b25zb2xlLmxvZzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Jm5ic3A7IFdobyBjYW4gdGVs
bCBtZSBob3cgdG8gZGVidWcgaXQ/PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+PGRpdj5YaXV6
aGkmbmJzcDsmbmJzcDs8L2Rpdj4=

------=_NextPart_5BF786B6_092349B8_508C1B0E--
