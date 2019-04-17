Return-Path: <1450335857@qq.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=103.7.29.155; helo=smtpbg64.qq.com; envelope-from=1450335857@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="BRcAp+h4"; 
 dkim-atps=neutral
Received: from smtpbg64.qq.com (unknown [103.7.29.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44kSDV0DdTzDqMN
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 13:20:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1555471223; bh=3SytZLH1saXao8PAjbvNr5FGWsJ2EcPWtOEFPCGkORw=;
 h=From:To:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
 b=BRcAp+h4YUBEWFOdwWwRTv2EB5irOvD2VlRYwS+uf0abplWQnBCefzCuSMQeKU/B1
 jiarbnngfjYBIqlSlb6sJLcMP25XWclN8WKytG9mxvcecLi8IgJlGDVQIZ9a6DU9+R
 OMjPMdV5FJTSTXkZ1xfBk3O40iBuWe+ANL/ojjWI=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1555471221t875417
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>,
 "=?ISO-8859-1?B?Z21pbGxz?=" <gmills@linux.vnet.ibm.com>,
 "=?ISO-8859-1?B?RGVyaWNr?=" <derick.montague@gmail.com>
Subject: Can't login openbmc webui with IPV6 IP
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5CB69B75_0C96B3C8_4FD4A64B"
Content-Transfer-Encoding: 8Bit
Date: Wed, 17 Apr 2019 11:20:21 +0800
X-Priority: 3
Message-ID: <tencent_32CE53DB1CC7BB226A3EE7F5@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Wed, 17 Apr 2019 11:20:22 +0800 (CST)
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
X-List-Received-Date: Wed, 17 Apr 2019 03:20:43 -0000

This is a multi-part message in MIME format.

------=_NextPart_5CB69B75_0C96B3C8_4FD4A64B
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgR3VubmFyLCBEZXJpY2ssDQoNCiAgICBJIGNhbid0IGxvZ2luIHRoZSBvcGVuYm1jIHdl
YnVpIHdoZW4gSSBjb25maWd1cmVkIHRoZSBJUCAgIHdpdGggSVBWNi4NCk15IHRlc3Rpbmcg
ZW52aXJvbm1lbnQgaXMgYXMgZm9sbG93aW5nIDoNCjEpIC9ldGMvc3lzdGVtZC9uZXR3b3Jr
LzAwLWJtYy1ldGgwLm5ldHdvcms6DQpbTWF0Y2hdDQpOYW1lPWV0aDANCltOZXR3b3JrXQ0K
QWRkcmVzcz0yMDAyOjEwMDE6MTAwMToxMDAxOjEwMDE6MTAwMToxMDAxOjEwMDEvNjQNCltE
SENQXSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQpDbGll
bnRJZGVudGlmaWVyPW1hYw0KDQoyKSBzeXN0ZW1jdGwgcmVzdGFydCBzeXN0ZW1kLW5ldHdv
cmtkDQozKW15IGJtYyB3ZWJ1aSBJUFY2IElQOg0KMjAwMjoxMDAxOjEwMDE6MTAwMToxMDAx
OjEwMDE6MTAwMToxMDAyLzY0DQo0KSBwaW5nNiAyMDAyOjEwMDE6MTAwMToxMDAxOjEwMDE6
MTAwMToxMDAxOjEwMDEgIG9uIGJtYyB3ZWJ1aSBQQyA6ICBjb25uZWN0IGdvb2QuDQoNCjUp
IGxvZ2luIGJtYyB3ZWJ1aSA6ZmFpbGVkDQoNCg0KSXMgdGhlcmUgYW55dGhpbmcgd3Jvbmcg
d2l0aCBteSBjb25maWd1cmF0aW9uPw0KDQpJIHNhdyB0aGUgaXNzdWUgaHR0cHM6Ly9naXRo
dWIuY29tL29wZW5ibWMvcGhvc3Bob3Itd2VidWkvaXNzdWVzLzE0IA0KSXMgdGhlcmUgYSBz
aGVkdWxlIHRvIHN1cHBvcnQgSVBWNiA/DQoNCkJlc3QsDQp4aXV6aGk=

------=_NextPart_5CB69B75_0C96B3C8_4FD4A64B
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgR3VubmFyLCBEZXJpY2ssPGJyPjxicj4mbmJzcDsgJm5ic3A7IEkgY2FuJ3QgbG9naW4g
dGhlIG9wZW5ibWMgd2VidWkgd2hlbiBJIGNvbmZpZ3VyZWQgdGhlIElQICZuYnNwOyB3aXRo
IElQVjYuPGJyPjxkaXY+PGRpdj5NeSB0ZXN0aW5nIGVudmlyb25tZW50IGlzIGFzIGZvbGxv
d2luZyA6PGJyPjEpIC9ldGMvc3lzdGVtZC9uZXR3b3JrLzAwLWJtYy1ldGgwLm5ldHdvcms6
PGJyPltNYXRjaF08L2Rpdj48ZGl2Pk5hbWU9ZXRoMDwvZGl2PjxkaXY+W05ldHdvcmtdPC9k
aXY+PGRpdj5BZGRyZXNzPTIwMDI6MTAwMToxMDAxOjEwMDE6MTAwMToxMDAxOjEwMDE6MTAw
MS82NDwvZGl2PjxkaXY+W0RIQ1BdJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7IDwvZGl2PjxkaXY+Q2xpZW50SWRlbnRpZmllcj1tYWM8L2Rpdj48L2Rp
dj48ZGl2PjIpIHN5c3RlbWN0bCByZXN0YXJ0IHN5c3RlbWQtbmV0d29ya2Q8L2Rpdj48ZGl2
PjMpbXkgYm1jIHdlYnVpIElQVjYgSVA6PC9kaXY+PGRpdj4yMDAyOjEwMDE6MTAwMToxMDAx
OjEwMDE6MTAwMToxMDAxOjEwMDIvNjQ8L2Rpdj48ZGl2PjQpIHBpbmc2IDIwMDI6MTAwMTox
MDAxOjEwMDE6MTAwMToxMDAxOjEwMDE6MTAwMSZuYnNwOyBvbiBibWMgd2VidWkgUEMgOiZu
YnNwOyBjb25uZWN0IGdvb2QuPGJyPjwvZGl2PjxkaXY+NSkgbG9naW4gYm1jIHdlYnVpIDpm
YWlsZWQ8YnI+PC9kaXY+PGJyPklzIHRoZXJlIGFueXRoaW5nIHdyb25nIHdpdGggbXkgY29u
ZmlndXJhdGlvbj88YnI+PGJyPkkgc2F3IHRoZSBpc3N1ZSBodHRwczovL2dpdGh1Yi5jb20v
b3BlbmJtYy9waG9zcGhvci13ZWJ1aS9pc3N1ZXMvMTQgPGJyPklzIHRoZXJlIGEgc2hlZHVs
ZSB0byBzdXBwb3J0IElQVjYgPzxicj48YnI+QmVzdCw8YnI+eGl1emhpPGJyPg==

------=_NextPart_5CB69B75_0C96B3C8_4FD4A64B--
