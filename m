Return-Path: <1450335857@qq.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=184.105.206.26; helo=smtpbg303.qq.com;
 envelope-from=1450335857@qq.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="PIS7yhcz"; 
 dkim-atps=neutral
Received: from smtpbg303.qq.com (smtpbg303.qq.com [184.105.206.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lrCm1nR8zDqTG
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 19:24:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1555665881; bh=KVI10h61bQrZfAvGroh25dBOzPQpq9fhmjV9lNgjrRg=;
 h=In-Reply-To:References:From:To:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
 b=PIS7yhczDcbmp0VBlhbNDBOf9sxfgorKBcVSuMOA1IXZo5KYt7jTbJQ25eX7hDqJ3
 DGSOMEkcmDHP2IAWlh1xCZj5c2aKHpDsrBBProyvsRxqGg8tS3/4mDa88zQ9Sil7Hx
 gyJDj3+uEt3cm6WUd6W6GvX4COuGRL0wQft5ky3c=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
In-Reply-To: <tencent_32CE53DB1CC7BB226A3EE7F5@qq.com>
References: <tencent_32CE53DB1CC7BB226A3EE7F5@qq.com>
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1555665876t704044
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: How to config  IPV6 to  login openbmc webui 
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5CB993D4_0D44CC60_6986CC7C"
Content-Transfer-Encoding: 8Bit
Date: Fri, 19 Apr 2019 17:24:36 +0800
X-Priority: 3
Message-ID: <tencent_093AB03F7125ADE027CD1776@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 402737053
X-QQ-SENDSIZE: 520
X-QQ-FName: BA790CD82045494DA1CEDED57C88AAAB
X-QQ-LocalIP: 10.198.131.167
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
X-List-Received-Date: Fri, 19 Apr 2019 09:24:56 -0000

This is a multi-part message in MIME format.

------=_NextPart_5CB993D4_0D44CC60_6986CC7C
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KICAgV2hvIGtub3cgaG93IHRvIGNvbmZpZyBJUFY2IHRvIGxvbmdpbiB0aGUg
b3BlbmJtYyB3ZWJ1aT8NCiAgICBJIGNhbid0IGxvZ2luIHRoZSBvcGVuYm1jIHdlYnVpIHdo
ZW4gSSBjb25maWd1cmVkIHRoZSBJUCAgIHdpdGggSVBWNi4NCk15IHRlc3RpbmcgZW52aXJv
bm1lbnQgaXMgYXMgZm9sbG93aW5nIDoNCjEpIC9ldGMvc3lzdGVtZC9uZXR3b3JrLzAwLWJt
Yy1ldGgwLm5ldHdvcms6DQpbTWF0Y2hdDQpOYW1lPWV0aDANCltOZXR3b3JrXQ0KQWRkcmVz
cz0yMDAyOjEwMDE6MTAwMToxMDAxOjEwMDE6MTAwMToxMDAxOjEwMDEvNjQNCltESENQXSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQpDbGllbnRJZGVu
dGlmaWVyPW1hYw0KDQoyKSBzeXN0ZW1jdGwgcmVzdGFydCBzeXN0ZW1kLW5ldHdvcmtkDQoz
KW15IGJtYyB3ZWJ1aSBJUFY2IElQOg0KMjAwMjoxMDAxOjEwMDE6MTAwMToxMDAxOjEwMDE6
MTAwMToxMDAyLzY0DQo0KSBwaW5nNiAyMDAyOjEwMDE6MTAwMToxMDAxOjEwMDE6MTAwMTox
MDAxOjEwMDEgIG9uIGJtYyB3ZWJ1aSBQQyA6ICBjb25uZWN0IGdvb2QuDQoNCjUpIGxvZ2lu
IGJtYyB3ZWJ1aSA6ZmFpbGVkDQoNCg0KSXMgdGhlcmUgYW55dGhpbmcgd3Jvbmcgd2l0aCBt
eSBjb25maWd1cmF0aW9uPw0KDQpJIHNhdyB0aGUgaXNzdWUgaHR0cHM6Ly9naXRodWIuY29t
L29wZW5ibWMvcGhvc3Bob3Itd2VidWkvaXNzdWVzLzE0IA0KSXMgdGhlcmUgYSBzaGVkdWxl
IHRvIHN1cHBvcnQgSVBWNiA/DQoNCkJlc3QsDQp4aXV6aGk=

------=_NextPart_5CB993D4_0D44CC60_6986CC7C
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj5IaSBhbGwsPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7V2hvIGtub3cgaG93IHRvIGNv
bmZpZyBJUFY2IHRvIGxvbmdpbiB0aGUgb3BlbmJtYyB3ZWJ1aT88L2Rpdj48ZGl2PjxkaXY+
Jm5ic3A7ICZuYnNwOyBJIGNhbid0IGxvZ2luIHRoZSBvcGVuYm1jIHdlYnVpIHdoZW4gSSBj
b25maWd1cmVkIHRoZSBJUCAmbmJzcDsgd2l0aCBJUFY2LjwvZGl2PjxkaXY+PGRpdj5NeSB0
ZXN0aW5nIGVudmlyb25tZW50IGlzIGFzIGZvbGxvd2luZyA6PGJyPjEpIC9ldGMvc3lzdGVt
ZC9uZXR3b3JrLzAwLWJtYy1ldGgwLm5ldHdvcms6PGJyPltNYXRjaF08L2Rpdj48ZGl2Pk5h
bWU9ZXRoMDwvZGl2PjxkaXY+W05ldHdvcmtdPC9kaXY+PGRpdj5BZGRyZXNzPTIwMDI6MTAw
MToxMDAxOjEwMDE6MTAwMToxMDAxOjEwMDE6MTAwMS82NDwvZGl2PjxkaXY+W0RIQ1BdJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IDwvZGl2PjxkaXY+
Q2xpZW50SWRlbnRpZmllcj1tYWM8L2Rpdj48L2Rpdj48ZGl2PjIpIHN5c3RlbWN0bCByZXN0
YXJ0IHN5c3RlbWQtbmV0d29ya2Q8L2Rpdj48ZGl2PjMpbXkgYm1jIHdlYnVpIElQVjYgSVA6
PC9kaXY+PGRpdj4yMDAyOjEwMDE6MTAwMToxMDAxOjEwMDE6MTAwMToxMDAxOjEwMDIvNjQ8
L2Rpdj48ZGl2PjQpIHBpbmc2IDIwMDI6MTAwMToxMDAxOjEwMDE6MTAwMToxMDAxOjEwMDE6
MTAwMSZuYnNwOyBvbiBibWMgd2VidWkgUEMgOiZuYnNwOyBjb25uZWN0IGdvb2QuPGJyPjwv
ZGl2PjxkaXY+NSkgbG9naW4gYm1jIHdlYnVpIDpmYWlsZWQ8YnI+PC9kaXY+PGJyPklzIHRo
ZXJlIGFueXRoaW5nIHdyb25nIHdpdGggbXkgY29uZmlndXJhdGlvbj88YnI+PGJyPkkgc2F3
IHRoZSBpc3N1ZSBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci13ZWJ1aS9p
c3N1ZXMvMTQgPGJyPklzIHRoZXJlIGEgc2hlZHVsZSB0byBzdXBwb3J0IElQVjYgPzxicj48
YnI+QmVzdCw8YnI+eGl1emhpPGJyPjwvZGl2Pg==

------=_NextPart_5CB993D4_0D44CC60_6986CC7C--
