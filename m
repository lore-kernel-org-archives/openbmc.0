Return-Path: <1450335857@qq.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=113.96.223.72; helo=qq.com; envelope-from=1450335857@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="Z+q/l/WC"; 
 dkim-atps=neutral
Received: from qq.com (smtpbg410.qq.com [113.96.223.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44kRFR01cYzDqL8
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 12:36:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1555468579; bh=YWTQ3yLfytd+BGJjLYRenmDJDEWQ9tjjuc9J/CbwE2Q=;
 h=From:To:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
 b=Z+q/l/WCMgMmaDb+h8S+kfkAlZZqHKlJounDTY44tgSD96q1OLm0TDDuPdX364aRo
 64NUOQz2FQv1ypzcJgU5PYYFX+xyPoNYpy4eJwp2Ec7wsoj/kImvGhXpiTS2KFzo4Z
 oTFl/9Ethc3Z+QewKeoaj8JvEHUYa3rvVNxkSn1s=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1555467551t912647
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>,
 "=?ISO-8859-1?B?Z21pbGxz?=" <gmills@linux.vnet.ibm.com>,
 "=?ISO-8859-1?B?ZGVmaWNrLm1vbnRhZ3Vl?=" <defick.montague@gmail.com>
Subject: Can't login openbmc webui with IPV6 IP
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5CB68D1F_0BEE5208_2027A22B"
Content-Transfer-Encoding: 8Bit
Date: Wed, 17 Apr 2019 10:19:11 +0800
X-Priority: 3
Message-ID: <tencent_696B780E4D908BCC363845B9@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Wed, 17 Apr 2019 10:19:11 +0800 (CST)
Feedback-ID: webenglish:qq.com:bgweb:bgweb117
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
X-List-Received-Date: Wed, 17 Apr 2019 02:36:30 -0000

This is a multi-part message in MIME format.

------=_NextPart_5CB68D1F_0BEE5208_2027A22B
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgR3VubmFyLCBEZWZpY2ssDQoNCiAgICBJIGNhbid0IGxvZ2luIHRoZSBvcGVuYm1jIHdl
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

------=_NextPart_5CB68D1F_0BEE5208_2027A22B
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgR3VubmFyLCBEZWZpY2ssPGJyPjxicj4mbmJzcDsgJm5ic3A7IEkgY2FuJ3QgbG9naW4g
dGhlIG9wZW5ibWMgd2VidWkgd2hlbiBJIGNvbmZpZ3VyZWQgdGhlIElQICZuYnNwOyB3aXRo
IElQVjYuPGJyPjxkaXY+PGRpdj5NeSB0ZXN0aW5nIGVudmlyb25tZW50IGlzIGFzIGZvbGxv
d2luZyA6PGJyPjEpIC9ldGMvc3lzdGVtZC9uZXR3b3JrLzAwLWJtYy1ldGgwLm5ldHdvcms6
PGJyPltNYXRjaF08L2Rpdj48ZGl2Pk5hbWU9ZXRoMDwvZGl2PjxkaXY+W05ldHdvcmtdPC9k
aXY+PGRpdj5BZGRyZXNzPTIwMDI6MTAwMToxMDAxOjEwMDE6MTAwMToxMDAxOjEwMDE6MTAw
MS82NDwvZGl2PjxkaXY+W0RIQ1BdJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7Jm5ic3A7PC9kaXY+PGRpdj5DbGllbnRJZGVudGlmaWVyPW1hYzwvZGl2
PjwvZGl2PjxkaXY+Mikgc3lzdGVtY3RsIHJlc3RhcnQgc3lzdGVtZC1uZXR3b3JrZDwvZGl2
PjxkaXY+MylteSBibWMgd2VidWkgSVBWNiBJUDo8L2Rpdj48ZGl2PjIwMDI6MTAwMToxMDAx
OjEwMDE6MTAwMToxMDAxOjEwMDE6MTAwMi82NDwvZGl2PjxkaXY+NCkgcGluZzYmbmJzcDsy
MDAyOjEwMDE6MTAwMToxMDAxOjEwMDE6MTAwMToxMDAxOjEwMDEmbmJzcDsgb24gYm1jIHdl
YnVpIFBDIDombmJzcDsgY29ubmVjdCBnb29kLjxicj48L2Rpdj48ZGl2PjUpIGxvZ2luIGJt
YyB3ZWJ1aSA6ZmFpbGVkPGJyPjwvZGl2Pjxicj5JcyB0aGVyZSBhbnl0aGluZyB3cm9uZyB3
aXRoIG15IGNvbmZpZ3VyYXRpb24/PGJyPjxicj5JIHNhdyB0aGUgaXNzdWUgaHR0cHM6Ly9n
aXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3Itd2VidWkvaXNzdWVzLzE0IDxicj5JcyB0aGVy
ZSBhIHNoZWR1bGUgdG8gc3VwcG9ydCBJUFY2ID88YnI+PGJyPkJlc3QsPGJyPnhpdXpoaTxi
cj4=

------=_NextPart_5CB68D1F_0BEE5208_2027A22B--
