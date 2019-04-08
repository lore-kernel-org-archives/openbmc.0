Return-Path: <1450335857@qq.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=59.36.132.88; helo=qq.com; envelope-from=1450335857@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="aGYUDDuk"; 
 dkim-atps=neutral
X-Greylist: delayed 438 seconds by postgrey-1.36 at bilbo;
 Mon, 08 Apr 2019 11:22:38 AEST
Received: from qq.com (smtpbg477.qq.com [59.36.132.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ct2Q185WzDqGX
 for <openbmc@lists.ozlabs.org>; Mon,  8 Apr 2019 11:22:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1554686098; bh=uEyrZpFNcuadfE5efMAj5Nq/BJ0pipHmsoBFbT+dCkg=;
 h=In-Reply-To:References:From:To:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
 b=aGYUDDukw9vfEKgbYeYnxyDR1XeVPM8889FB8D9YIlty0Ah13okuT22z7GDkeIEVW
 HFDtnNq9sBQMx1FNA8oPWmjaDdLkpzrk9NBEqKe9f8/ZPJ44R6yUVEBFegdMWghdKx
 d2abDy1JSyJ+IA0jZZpdH5C8utkmjykolfT/Sjfg=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
In-Reply-To: <aeb75f12-b36e-73bf-29c9-2e64692ea3fc@linux.intel.com>
References: <tencent_2EF1C4452C43ADF74A37DF04@qq.com>
 <fa618273-b2e8-3d53-9c28-91f01fd83c05@linux.intel.com>
 <tencent_77BC148C0E378EFD5F488CE6@qq.com>
 <tencent_5AE0AA7B303EB67F5ABF0001@qq.com>
 <aeb75f12-b36e-73bf-29c9-2e64692ea3fc@linux.intel.com>
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1554686097t716671
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?amFlLmh5dW4ueW9v?=" <jae.hyun.yoo@linux.intel.com>,
 "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>,
 "=?ISO-8859-1?B?ZWQ=?=" <ed@tanous.net>,
 "=?ISO-8859-1?B?RWRkaWUgSmFtZXM=?=" <eajames@linux.vnet.ibm.com>
Subject: Re: ikvm refresh failed on host screen 1680x1050 resolution
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5CAAA091_0B5AFC38_05702F7E"
Content-Transfer-Encoding: 8Bit
Date: Mon, 8 Apr 2019 09:14:57 +0800
X-Priority: 3
Message-ID: <tencent_6A1487B12DD85E265185856C@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 2082129066
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Mon, 08 Apr 2019 09:14:57 +0800 (CST)
Feedback-ID: webenglish:qq.com:bgforeign:bgforeign4
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
X-List-Received-Date: Mon, 08 Apr 2019 01:22:42 -0000

This is a multi-part message in MIME format.

------=_NextPart_5CAAA091_0B5AFC38_05702F7E
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgSmFlLA0KICAgTXkgaG9zdCBPUyBpcyBSZWRIYXQ3LiANCkJvdGggIlJlZnJlc2giIGJ1
dHRvbiBvbiBpa3ZtIHdlYiBQYWdlIGFuZCAiVmlldy0tUmVsb2FkIFRoaXMgUGFnZSIgb3Ig
cmVsb2FkIGJ1dHRvbiBvbiBjaHJvbWUgYnJvd3NlciBtZW51IHdvcmtzLg0KWGl1emhpDQoN
Cg0KLS0tLS0tLS0tLS0tLS0tLS0tIE9yaWdpbmFsIC0tLS0tLS0tLS0tLS0tLS0tLQ0KRnJv
bTogICJqYWUuaHl1bi55b28iOzxqYWUuaHl1bi55b29AbGludXguaW50ZWwuY29tPjsNCkRh
dGU6ICBBcHIgNSwgMjAxOQ0KVG86ICAieGl1emhpIjwxNDUwMzM1ODU3QHFxLmNvbT47ICJv
cGVuYm1jIjxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+OyAiZWQiPGVkQHRhbm91cy5uZXQ+
OyAiRWRkaWUgSmFtZXMiPGVhamFtZXNAbGludXgudm5ldC5pYm0uY29tPjsgDQoNClN1Ympl
Y3Q6ICBSZTogaWt2bSByZWZyZXNoIGZhaWxlZCBvbiBob3N0IHNjcmVlbiAxNjgweDEwNTAg
cmVzb2x1dGlvbg0KDQoNCg0KT24gNC8zLzIwMTkgMTA6MjEgUE0sIHhpdXpoaSB3cm90ZToN
Cj4gSGkgSmFlLCBFZCwNCj4gICAgICBUaGUgaWt2bSBzY3JlZW4gY2Fubid0IHJlZnJlc2gg
b24gaWt2bSB3ZWJ1aSBzY3JlZW4gd2hlbiBzZXR0aW5nIA0KPiB0aGUgaG9zdCBzY3JlZW4g
cmVzb2x1dGlvbiB0byAxNjgwKjEwNTAgLiBJIG11c3QgY2xpY2sgdGhlICJSZWZyZXNoIiAN
Cj4gYnV0dG9uIHRvIGdldCB0aGUgbmV3IGhvc3Qgc2NyZWVuLiAgT3RoZXIgcmVzb2x1dGlv
bnMgd29ya3MgdmVyeSB3ZWxsLg0KPiAgICBQbGVhc2UgY2hlY2sgaXQuDQoNCkhpIFhpdXpo
aSwNCg0KSSBjYW4ndCBzZWUgdGhlIHJlc29sdXRpb24gb3B0aW9uIGluIFVidW50dSAxOC4w
My4gV2hhdCBob3N0IE9TIGRpZCB5b3UNCnVzZSBmb3IgdGhlIHRlc3Q/IExldCBtZSBjbGFy
aWZ5IG9uZSBtb3JlLiBEbyB5b3UgbWVhbiB0aGUgIlJlZnJlc2giDQpidXR0b24gaW4gS1ZN
IHdlYiBwYWdlLCBvciByZWxvYWQgYnV0dG9uIG9mIHRoZSB3ZWIgYnJvd3Nlcj8NCg0KVGhh
bmtzLA0KSmFlDQoNCj4gQmVzdCwNCj4geGl1emhp

------=_NextPart_5CAAA091_0B5AFC38_05702F7E
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj5IaSBKYWUsPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7TXkgaG9zdCBPUyBpcyBSZWRI
YXQ3LiZuYnNwOzwvZGl2PjxkaXY+Qm90aCAiUmVmcmVzaCIgYnV0dG9uIG9uIGlrdm0gd2Vi
IFBhZ2UgYW5kICJWaWV3LS1SZWxvYWQgVGhpcyBQYWdlIiBvciByZWxvYWQgYnV0dG9uIG9u
IGNocm9tZSBicm93c2VyIG1lbnUgd29ya3MuPC9kaXY+PGRpdj48ZGl2PlhpdXpoaTwvZGl2
PjxkaXY+PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtc2l6ZTogMTJweDtmb250LWZhbWls
eTogQXJpYWwgTmFycm93O3BhZGRpbmc6MnB4IDAgMnB4IDA7Ij4tLS0tLS0tLS0tLS0tLS0t
LS0mbmJzcDtPcmlnaW5hbCZuYnNwOy0tLS0tLS0tLS0tLS0tLS0tLTwvZGl2PjxkaXYgc3R5
bGU9ImZvbnQtc2l6ZTogMTJweDtiYWNrZ3JvdW5kOiNlZmVmZWY7cGFkZGluZzo4cHg7Ij48
ZGl2PjxiPkZyb206IDwvYj4mbmJzcDsiamFlLmh5dW4ueW9vIjsmbHQ7amFlLmh5dW4ueW9v
QGxpbnV4LmludGVsLmNvbSZndDs7PC9kaXY+PGRpdj48Yj5EYXRlOiA8L2I+Jm5ic3A7QXBy
IDUsIDIwMTk8L2Rpdj48ZGl2PjxiPlRvOiA8L2I+Jm5ic3A7InhpdXpoaSImbHQ7MTQ1MDMz
NTg1N0BxcS5jb20mZ3Q7OyAib3BlbmJtYyImbHQ7b3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn
Jmd0OzsgImVkIiZsdDtlZEB0YW5vdXMubmV0Jmd0OzsgIkVkZGllIEphbWVzIiZsdDtlYWph
bWVzQGxpbnV4LnZuZXQuaWJtLmNvbSZndDs7IDx3YnI+PC9kaXY+PGRpdj48L2Rpdj48ZGl2
PjxiPlN1YmplY3Q6IDwvYj4mbmJzcDtSZTogaWt2bSByZWZyZXNoIGZhaWxlZCBvbiBob3N0
IHNjcmVlbiAxNjgweDEwNTAgcmVzb2x1dGlvbjwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2
Pk9uIDQvMy8yMDE5IDEwOjIxIFBNLCB4aXV6aGkgd3JvdGU6PGJyPiZndDsgSGkgSmFlLCBF
ZCw8YnI+Jmd0OyZuYnNwOyAmbmJzcDsgJm5ic3A7IFRoZSBpa3ZtIHNjcmVlbiBjYW5uJ3Qg
cmVmcmVzaCBvbiBpa3ZtIHdlYnVpIHNjcmVlbiB3aGVuIHNldHRpbmcgPGJyPiZndDsgdGhl
IGhvc3Qgc2NyZWVuIHJlc29sdXRpb24gdG8gMTY4MCoxMDUwIC4gSSBtdXN0IGNsaWNrIHRo
ZSAiUmVmcmVzaCIgPGJyPiZndDsgYnV0dG9uIHRvIGdldCB0aGUgbmV3IGhvc3Qgc2NyZWVu
LiZuYnNwOyBPdGhlciByZXNvbHV0aW9ucyB3b3JrcyB2ZXJ5IHdlbGwuPGJyPiZndDsmbmJz
cDsgJm5ic3A7IFBsZWFzZSBjaGVjayBpdC48YnI+PGJyPkhpIFhpdXpoaSw8YnI+PGJyPkkg
Y2FuJ3Qgc2VlIHRoZSByZXNvbHV0aW9uIG9wdGlvbiBpbiBVYnVudHUgMTguMDMuIFdoYXQg
aG9zdCBPUyBkaWQgeW91PGJyPnVzZSBmb3IgdGhlIHRlc3Q/IExldCBtZSBjbGFyaWZ5IG9u
ZSBtb3JlLiBEbyB5b3UgbWVhbiB0aGUgIlJlZnJlc2giPGJyPmJ1dHRvbiBpbiBLVk0gd2Vi
IHBhZ2UsIG9yIHJlbG9hZCBidXR0b24gb2YgdGhlIHdlYiBicm93c2VyPzxicj48YnI+VGhh
bmtzLDxicj5KYWU8YnI+PGJyPiZndDsgQmVzdCw8YnI+Jmd0OyB4aXV6aGk8YnI+PC9kaXY+


------=_NextPart_5CAAA091_0B5AFC38_05702F7E--
