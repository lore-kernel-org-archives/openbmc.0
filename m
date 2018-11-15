Return-Path: <1450335857@qq.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=59.36.132.72; helo=qq.com; envelope-from=1450335857@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="YXJ9a3TB"; 
 dkim-atps=neutral
Received: from qq.com (smtpbg473.qq.com [59.36.132.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42wWbP4T8zzF3cS
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 17:26:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1542263162; bh=gkcP4BWozaRh9ofCC0V3cz5NAaS5S3RnIkB+8Ju5Ii4=;
 h=In-Reply-To:References:From:To:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
 b=YXJ9a3TBOqeftH78jAQUt1f/aA19bfLvDRQ/B0tdJXIhTZSClaBpiatvu8NK8nd0x
 ZlXVd9OK7toRrhmbhqjS84k6qGYSWC+UFHky/wkdHfCBjVpuJjBjEYx9tNFf+ros2V
 4VzrFeZ+vqXDp72Ed+HKElBEqxsQRYWSPQvYcvVQ=
X-QQ-FEAT: 3GtnPQ8BMmbSjnhiIN/e0hB9zA6U9213hQh2CtZcIXlTe2W9TgnXMhZadD/5i
 jtgrDX7tE7t4rFl6MxKnSY38hyss6za2I+F8zPYhIYyP3bNsMC1XEEkVDcBEXsZOSMqQS6a
 4C1+7qYhcMvSk9GDsvHQYPXbbv7l7TeZM8tasd0cXs8VumQV/DLsCQlFtTmMjXglj6ys2CD
 okjB9iW0EUmMSgdjm4NFTC45jdmHEEmxuiimSQAcAcEns4kB8HTPoTqK3Xc+bYhZWRAyIx8
 /4hZJFXczdJeE2xVLVrx/Q3Ec=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
In-Reply-To: <mailman.9.1542243603.11481.openbmc@lists.ozlabs.org>
References: <mailman.9.1542243603.11481.openbmc@lists.ozlabs.org>
X-QQ-STYLE: 
X-QQ-mid: webmail500t1542263160t4636201
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>,
 "=?ISO-8859-1?B?cmF0YWd1cHQ=?=" <ratagupt@linux.vnet.ibm.com>
Subject: Pamela.py can't run on BMC python env
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5BED1178_0A352158_2BA17ECE"
Content-Transfer-Encoding: 8Bit
Date: Thu, 15 Nov 2018 14:26:00 +0800
X-Priority: 3
Message-ID: <tencent_3A3ECA558D9BA0F1B9F1A0715AF542A96D05@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 2921769020
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Thu, 15 Nov 2018 14:26:01 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign4
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
X-List-Received-Date: Thu, 15 Nov 2018 06:26:28 -0000

This is a multi-part message in MIME format.

------=_NextPart_5BED1178_0A352158_2BA17ECE
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KICAgSSB3YW50IHRvIHVzZSBQQU0gcHl0aG9uIG1vZHVsZSBwYW1lbGEucHkg
IGluIHRoZSAvdXNyL2xpYi9weXRob24yLjcvc2l0ZS1wYWNrYWdlcyAuDQogVGhlIGVycm9y
IGlzIGFzIGZvbGxvd3MgOiANCjEpcm9vdEBoYWlndWFuZzE6L3Vzci9saWIvcHl0aG9uMi43
L3NpdGUtcGFja2FnZXMjIHB5dGhvbiAtbSBwYW1lbGEgLWEgYHdob2FtaWANCkNvdWxkIG5v
dCBpbXBvcnQgcnVucHkgbW9kdWxlDQoNCg0KDQoyKXJvb3RAaGFpZ3VhbmcxOi91c3IvbGli
L3B5dGhvbjIuNy9zaXRlLXBhY2thZ2VzIyBweXRob24gLi9wYW1lbGEucHkNClRyYWNlYmFj
ayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToNCiAgRmlsZSAiLi9wYW1lbGEucHkiLCBsaW5l
IDE0MywgaW4gPG1vZHVsZT4NCiAgICBQQU1fU1RBUlQgPSBMSUJQQU0ucGFtX3N0YXJ0DQog
IEZpbGUgIi91c3IvbGliL3B5dGhvbjIuNy9jdHlwZXMvX19pbml0X18ucHkiLCBsaW5lIDM3
OSwgaW4gX19nZXRhdHRyX18NCiAgICBmdW5jID0gc2VsZi5fX2dldGl0ZW1fXyhuYW1lKQ0K
ICBGaWxlICIvdXNyL2xpYi9weXRob24yLjcvY3R5cGVzL19faW5pdF9fLnB5IiwgbGluZSAz
ODQsIGluIF9fZ2V0aXRlbV9fDQogICAgZnVuYyA9IHNlbGYuX0Z1bmNQdHIoKG5hbWVfb3Jf
b3JkaW5hbCwgc2VsZikpDQpBdHRyaWJ1dGVFcnJvcjogcHl0aG9uOiB1bmRlZmluZWQgc3lt
Ym9sOiBwYW1fc3RhcnQNCg0KDQpJIHJ1biB0aGUgcGFtZWxhLnB5IG9uIHVidW50dTE2LjA0
ICxpdCB3b3JrIHZlcnkgd2VsbC4NCldobyBjYW4gZ2l2ZSBtZSBzb21lIHN1Z2dlc3Rpb25z
Pw0KDQoNCkJlc3QsDQpYaXV6aGk=

------=_NextPart_5BED1178_0A352158_2BA17ECE
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj5IaSBBbGwsPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7SSB3YW50IHRvIHVzZSBQQU0g
cHl0aG9uIG1vZHVsZSBwYW1lbGEucHkmbmJzcDsgaW4gdGhlIC91c3IvbGliL3B5dGhvbjIu
Ny9zaXRlLXBhY2thZ2VzJm5ic3A7LjwvZGl2PjxkaXY+Jm5ic3A7VGhlIGVycm9yIGlzIGFz
IGZvbGxvd3MgOiZuYnNwOzwvZGl2PjxkaXY+MSlyb290QGhhaWd1YW5nMTovdXNyL2xpYi9w
eXRob24yLjcvc2l0ZS1wYWNrYWdlcyMgcHl0aG9uIC1tIHBhbWVsYSAtYSBgd2hvYW1pYDwv
ZGl2PjxkaXY+PGRpdj5Db3VsZCBub3QgaW1wb3J0IHJ1bnB5IG1vZHVsZTwvZGl2PjwvZGl2
PjxkaXY+PGJyPjwvZGl2PjxkaXY+Milyb290QGhhaWd1YW5nMTovdXNyL2xpYi9weXRob24y
Ljcvc2l0ZS1wYWNrYWdlcyMgcHl0aG9uIC4vcGFtZWxhLnB5PC9kaXY+PGRpdj5UcmFjZWJh
Y2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6PC9kaXY+PGRpdj4mbmJzcDsgRmlsZSAiLi9w
YW1lbGEucHkiLCBsaW5lIDE0MywgaW4gJmx0O21vZHVsZSZndDs8L2Rpdj48ZGl2PiZuYnNw
OyAmbmJzcDsgUEFNX1NUQVJUID0gTElCUEFNLnBhbV9zdGFydDwvZGl2PjxkaXY+Jm5ic3A7
IEZpbGUgIi91c3IvbGliL3B5dGhvbjIuNy9jdHlwZXMvX19pbml0X18ucHkiLCBsaW5lIDM3
OSwgaW4gX19nZXRhdHRyX188L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgZnVuYyA9IHNlbGYu
X19nZXRpdGVtX18obmFtZSk8L2Rpdj48ZGl2PiZuYnNwOyBGaWxlICIvdXNyL2xpYi9weXRo
b24yLjcvY3R5cGVzL19faW5pdF9fLnB5IiwgbGluZSAzODQsIGluIF9fZ2V0aXRlbV9fPC9k
aXY+PGRpdj4mbmJzcDsgJm5ic3A7IGZ1bmMgPSBzZWxmLl9GdW5jUHRyKChuYW1lX29yX29y
ZGluYWwsIHNlbGYpKTwvZGl2PjxkaXY+QXR0cmlidXRlRXJyb3I6IHB5dGhvbjogdW5kZWZp
bmVkIHN5bWJvbDogcGFtX3N0YXJ0PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIHJ1biB0
aGUgcGFtZWxhLnB5IG9uIHVidW50dTE2LjA0ICxpdCB3b3JrIHZlcnkgd2VsbC48L2Rpdj48
ZGl2PldobyBjYW4gZ2l2ZSBtZSBzb21lIHN1Z2dlc3Rpb25zPzwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxkaXY+QmVzdCw8L2Rpdj48ZGl2PlhpdXpoaSZuYnNwOzwvZGl2Pg==

------=_NextPart_5BED1178_0A352158_2BA17ECE--
