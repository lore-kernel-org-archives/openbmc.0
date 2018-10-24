Return-Path: <1450335857@qq.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=183.3.255.121; helo=qq.com; envelope-from=1450335857@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Received: from qq.com (smtpbg423.qq.com [183.3.255.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42g0j30FSTzDrCQ
 for <openbmc@lists.ozlabs.org>; Wed, 24 Oct 2018 17:29:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1540362540; bh=0fPg1IJ7bhjITHUngZ0H8Bk6wv4EK52m4wZkIzWB4hM=;
 h=From:To:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
 b=ONbWBTcKqW3U6f9fduRpt4H0LP9E1EJ3PRtO2Wdv7pthGj0MfT9RpWxw1DenZ9X0T
 SqLL3yipAPMrOZIsmnlL1K5t2jSo3Qzt+srnUs/aKgUnT1scR7aM+Wct+5SeeeNaSt
 TDnzHvVLQDfe4wN3vkKWvtzt3LlYFFHd/bPi/6ms=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1540362539t505782
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?QWxleGFuZGVyIEEuIEZpbGlwcG92?=" <a.filippov@yadro.com>,
 "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: VHUB didn't work on AST2500
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5BD0112B_0AB8C9E8_767F495D"
Content-Transfer-Encoding: 8Bit
Date: Wed, 24 Oct 2018 14:28:59 +0800
X-Priority: 3
Message-ID: <tencent_51B7EBE8401F35B41849FB95@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Wed, 24 Oct 2018 14:29:00 +0800 (CST)
Feedback-ID: webenglish:qq.com:bgforeign:bgforeign2
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
X-List-Received-Date: Wed, 24 Oct 2018 06:29:33 -0000

This is a multi-part message in MIME format.

------=_NextPart_5BD0112B_0AB8C9E8_767F495D
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KIEkgYW0gcG9ydGluZyBvYm1jLWlrdm0gdG8gbXkgaGFyZHdhcmUgcGxhdGZv
cm0uIFRoZSBob3N0IHNjcmVlbiBjYW4gYmUgc2VlbiBieSB2bmN2aWV3ZXIgLCBidXQgdGhl
IG1vdXNlIGFuZCBrZXlib2FyZCBkaWRuJ3Qgd29yayBvbiBBU1QyNTAwDQouIE9ubHkgdGhl
IGtleXMgJzsnICwgJ0VudGVyJywgICcxJywnMicsJzMnLCc0JyB3b3JrLiBvdGhlcnMga2V5
aW5wdXQgd2lsbCBkZWFkbG9jayB0aGUgaG9zdCBzY3JlZW4gLg0KVGhlIGtlcm5lbCBlcnJv
ciBsb2c6IA0KWyAgIDk5LjMyNjU4Nl0gY29uZmlnZnMtZ2FkZ2V0IGdhZGdldDogaGlnaC1z
cGVlZCBjb25maWcgIzE6IGMgDQpbICAgOTkuNDAzNzA0XSBhc3BlZWRfdmh1YiAxZTZhMDAw
MC51c2Itdmh1Yjogc3RhdHVzIGRpcmVjdGlvbiBtaXNtYXRjaCAgICAgICAgIA0KWyAgIDk5
LjQ5MjgzMV0gYXNwZWVkX3ZodWIgMWU2YTAwMDAudXNiLXZodWI6IHN0YXR1cyBkaXJlY3Rp
b24gbWlzbWF0Y2ggDQpUaGUga2VybmVsIHZlcnNpb24gaXMgOiB2aWRlby1kZXY1LA0KY29t
bWl0IDJhY2JjMzVhZGNmZTE1OTcxYjcwMTc3MGUxMTA1Mjc2YTE4ZGE5ZjcNCg0KDQpXaG8g
Y2FuIGdpdmUgbWUgc29tZSBzdWdnZXN0aW9ucyB0byAgZGVidWcgaXQ/DQp4aXV6aGk=

------=_NextPart_5BD0112B_0AB8C9E8_767F495D
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj5IaSBhbGwsPC9kaXY+PGRpdj4mbmJzcDtJIGFtIHBvcnRpbmcgb2JtYy1pa3ZtIHRv
IG15IGhhcmR3YXJlIHBsYXRmb3JtLiBUaGUgaG9zdCBzY3JlZW4gY2FuIGJlIHNlZW4gYnkg
dm5jdmlld2VyICwgYnV0IHRoZSBtb3VzZSBhbmQga2V5Ym9hcmQgZGlkbid0IHdvcmsgb24g
QVNUMjUwMDwvZGl2PjxkaXY+LiBPbmx5IHRoZSBrZXlzICc7JyAsICdFbnRlcicsJm5ic3A7
ICcxJywnMicsJzMnLCc0JyB3b3JrLiBvdGhlcnMga2V5aW5wdXQgd2lsbCBkZWFkbG9jayB0
aGUgaG9zdCBzY3JlZW4gLjwvZGl2PjxkaXY+VGhlIGtlcm5lbCBlcnJvciBsb2c6IDwvZGl2
PjxkaXY+WyZuYnNwOyAmbmJzcDs5OS4zMjY1ODZdIGNvbmZpZ2ZzLWdhZGdldCBnYWRnZXQ6
IGhpZ2gtc3BlZWQgY29uZmlnICMxOiBjIDwvZGl2PjxkaXY+WyZuYnNwOyAmbmJzcDs5OS40
MDM3MDRdIGFzcGVlZF92aHViIDFlNmEwMDAwLnVzYi12aHViOiBzdGF0dXMgZGlyZWN0aW9u
IG1pc21hdGNoJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOzwvZGl2PjxkaXY+
WyZuYnNwOyAmbmJzcDs5OS40OTI4MzFdIGFzcGVlZF92aHViIDFlNmEwMDAwLnVzYi12aHVi
OiBzdGF0dXMgZGlyZWN0aW9uIG1pc21hdGNoIDwvZGl2PjxkaXY+VGhlIGtlcm5lbCB2ZXJz
aW9uIGlzIDogdmlkZW8tZGV2NSw8L2Rpdj48ZGl2PmNvbW1pdCAyYWNiYzM1YWRjZmUxNTk3
MWI3MDE3NzBlMTEwNTI3NmExOGRhOWY3PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5XaG8g
Y2FuIGdpdmUgbWUgc29tZSBzdWdnZXN0aW9ucyB0byZuYnNwOyBkZWJ1ZyBpdD88L2Rpdj48
ZGl2PnhpdXpoaTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Jm5ic3A7PC9kaXY+

------=_NextPart_5BD0112B_0AB8C9E8_767F495D--
