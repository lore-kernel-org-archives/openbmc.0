Return-Path: <1450335857@qq.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=103.7.28.223; helo=smtpbg64.qq.com; envelope-from=1450335857@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="EEcmmou5"; 
 dkim-atps=neutral
Received: from smtpbg64.qq.com (unknown [103.7.28.223])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43DVL51228zDqxc
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 17:25:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1544509497; bh=GXJWePzO1fL5G+Ut2rvGqQWriq/3MedPpg/+kycCGaw=;
 h=In-Reply-To:References:From:To:Cc:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
 b=EEcmmou5VMem87XIENWrrKWlkvjngFmwJdKdaucOkS2fU3eCzlHfoRGe4dm/GUBdH
 EKiQGLWweJlXa05FjBEDKtc2ndFCXw4Ez5ho/ALLFWpcwKUveGIKqPj3BsY48n8y+m
 wvCx4TX8oN6lafC7eSIvaQukIxn6KS5hO+FSyu3U=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
In-Reply-To: <CAARXrt=iJ1NEAWQnrXN=ravGufQ16hyjAErEUstLw4p=9Lw3mA@mail.gmail.com>
References: <tencent_042D1A75541F9448E7395CDBB86B1A011A09@qq.com>
 <CAARXrt=iJ1NEAWQnrXN=ravGufQ16hyjAErEUstLw4p=9Lw3mA@mail.gmail.com>
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1544509496t500270
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?TGVpIFlV?=" <mine260309@gmail.com>
Cc: "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: Re:  Re:Why OEM command can't run by "ipmitool -I lanplus"
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5C0F5838_0B227C78_57FB1F4A"
Content-Transfer-Encoding: 8Bit
Date: Tue, 11 Dec 2018 14:24:56 +0800
X-Priority: 3
Message-ID: <tencent_6B3926BB39B0A6644EF2FCB0@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 2355865400
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Tue, 11 Dec 2018 14:24:56 +0800 (CST)
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
X-List-Received-Date: Tue, 11 Dec 2018 06:25:19 -0000

This is a multi-part message in MIME format.

------=_NextPart_5C0F5838_0B227C78_57FB1F4A
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgTGVpLA0KICAgIFRoYW5rcywgbXkgT0VNIGNvbW1hbmRzIGlzICBzZXJ2aWNlZCBieSBp
cG1pZC4NCkkgd2FudCB0byAgYWNjZXNzIHRoZSBPRU0gY29tbWFuZCBieSAgc2V0dGluZyBw
cml2aWxlZ2U6ICANCmlwbWl0b29sIGNoYW5uZWwgIHNldGFjY2VzcyAkQ0hBTk5FTCAkVVNF
UklEIGNhbGxpbj1vbiBpcG1pPW9uIGxpbms9b24gcHJpdmlsZWdlPTUNCkl0IGlzIGZhaWxl
ZCB0byBzZXQgcHJpdmlsZWdlIDUgdG8gZ2V0IE9FTSBhY2Nlc3MgYXV0aG9yaXR5Lg0KSSB3
aWxsIG1vdmUgbXkgT0VNIGNvbW1hbmRzIHRvICBuZXRpcG1pZA0KQmVzdCwNCnhpdXpoaQ0K
LS0tLS0tLS0tLS0tLS0tLS0tIE9yaWdpbmFsIC0tLS0tLS0tLS0tLS0tLS0tLQ0KRnJvbTog
ICJMZWkgWVUiOzxtaW5lMjYwMzA5QGdtYWlsLmNvbT47DQpTZW5kIHRpbWU6IE1vbmRheSwg
RGVjIDEwLCAyMDE4IDEyOjQ5IFBNDQpUbzogInhpdXpoaSI8MTQ1MDMzNTg1N0BxcS5jb20+
OyANCkNjOiAiT3BlbkJNQyBNYWlsbGlzdCI8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPjsg
DQpTdWJqZWN0OiAgUmU6IFdoeSBPRU0gY29tbWFuZCBjYW4ndCBydW4gYnkgImlwbWl0b29s
IC1JIGxhbnBsdXMiDQoNCg0KDQo+IE9uIHJlbW90ZSBtYWNoaW5lOg0KPiB4aXV6aGlAeGl1
emhpLVRoaW5rUGFkLVQ0NTA6fiRpcG1pdG9vbCAtSSBsYW5wbHVzIC1IIDE5Mi4xNjguMjAw
LjEzMiAgLVAgMHBlbkJtYyByYXcgMHgzYSAweDExDQo+IFVuYWJsZSB0byBzZW5kIFJBVyBj
b21tYW5kIChjaGFubmVsPTB4MCBuZXRmbj0weDNhIGx1bj0weDAgY21kPTB4MTEgcnNwPTB4
YzEpOiBJbnZhbGlkIGNvbW1hbmQNCj4geGl1emhpQHhpdXpoaS1UaGlua1BhZC1UNDUwOn4k
IGlwbWl0b29sIC1JIGxhbnBsdXMgLUggMTkyLjE2OC4yMDAuMTMyICAtUCAwcGVuQm1jIHJh
dyA2IDQNCj4gIDU2IDAwDQo+DQo+IFdobyBjYW4gaGVscCBtZT8NCg0KSXQgbG9va3MgbGlr
ZSB0aGUgcGx1Z2luIChhc3N1bWluZyB5b3UgaW1wbGVtZW50IHRoZSBPRU0gY29tbWFuZCBi
eSBwbHVnaW4pIGlzDQpvbmx5IGxvYWRlZCBpbiBpcG1pZCwgYnV0IG5vdCBpbiBuZXRpcG1p
ZC4=

------=_NextPart_5C0F5838_0B227C78_57FB1F4A
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj5IaSBMZWksPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7IFRoYW5rcywgbXkgT0VNIGNv
bW1hbmRzIGlzJm5ic3A7IHNlcnZpY2VkIGJ5IGlwbWlkLjwvZGl2PjxkaXY+SSB3YW50IHRv
Jm5ic3A7IGFjY2VzcyB0aGUgT0VNIGNvbW1hbmQgYnkmbmJzcDsgc2V0dGluZyBwcml2aWxl
Z2U6Jm5ic3A7Jm5ic3A7PC9kaXY+PGRpdj5pcG1pdG9vbCBjaGFubmVsJm5ic3A7IHNldGFj
Y2VzcyAkQ0hBTk5FTCAkVVNFUklEIGNhbGxpbj1vbiBpcG1pPW9uIGxpbms9b24gcHJpdmls
ZWdlPTU8L2Rpdj48ZGl2PjxkaXY+SXQgaXMgZmFpbGVkIHRvIHNldCBwcml2aWxlZ2UgNSB0
byBnZXQgT0VNIGFjY2VzcyBhdXRob3JpdHkuPC9kaXY+PGRpdj5JIHdpbGwgbW92ZSBteSBP
RU0gY29tbWFuZHMgdG8mbmJzcDsgbmV0aXBtaWQ8L2Rpdj48ZGl2PkJlc3QsPC9kaXY+PGRp
dj54aXV6aGk8L2Rpdj48ZGl2IHN0eWxlPSJmb250LXNpemU6IDEycHg7Zm9udC1mYW1pbHk6
IEFyaWFsIE5hcnJvdztwYWRkaW5nOjJweCAwIDJweCAwOyI+LS0tLS0tLS0tLS0tLS0tLS0t
Jm5ic3A7T3JpZ2luYWwmbmJzcDstLS0tLS0tLS0tLS0tLS0tLS08L2Rpdj48ZGl2IHN0eWxl
PSJmb250LXNpemU6IDEycHg7YmFja2dyb3VuZDojZWZlZmVmO3BhZGRpbmc6OHB4OyI+PGRp
dj48Yj5Gcm9tOiA8L2I+Jm5ic3A7IkxlaSBZVSI7Jmx0O21pbmUyNjAzMDlAZ21haWwuY29t
Jmd0Ozs8L2Rpdj48ZGl2PjxiPlNlbmQgdGltZTo8L2I+Jm5ic3A7TW9uZGF5LCBEZWMgMTAs
IDIwMTggMTI6NDkgUE08L2Rpdj48ZGl2PjxiPlRvOjwvYj4mbmJzcDsieGl1emhpIiZsdDsx
NDUwMzM1ODU3QHFxLmNvbSZndDs7IDx3YnI+PC9kaXY+PGRpdj48Yj5DYzo8L2I+Jm5ic3A7
Ik9wZW5CTUMgTWFpbGxpc3QiJmx0O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZndDs7IDx3
YnI+PC9kaXY+PGRpdj48Yj5TdWJqZWN0OiA8L2I+Jm5ic3A7UmU6IFdoeSBPRU0gY29tbWFu
ZCBjYW4ndCBydW4gYnkgImlwbWl0b29sIC1JIGxhbnBsdXMiPC9kaXY+PC9kaXY+PGRpdj48
YnI+PC9kaXY+Jmd0OyBPbiByZW1vdGUgbWFjaGluZTo8YnI+Jmd0OyB4aXV6aGlAeGl1emhp
LVRoaW5rUGFkLVQ0NTA6fiRpcG1pdG9vbCAtSSBsYW5wbHVzIC1IIDE5Mi4xNjguMjAwLjEz
MiZuYnNwOyAtUCAwcGVuQm1jIHJhdyAweDNhIDB4MTE8YnI+Jmd0OyBVbmFibGUgdG8gc2Vu
ZCBSQVcgY29tbWFuZCAoY2hhbm5lbD0weDAgbmV0Zm49MHgzYSBsdW49MHgwIGNtZD0weDEx
IHJzcD0weGMxKTogSW52YWxpZCBjb21tYW5kPGJyPiZndDsgeGl1emhpQHhpdXpoaS1UaGlu
a1BhZC1UNDUwOn4kIGlwbWl0b29sIC1JIGxhbnBsdXMgLUggMTkyLjE2OC4yMDAuMTMyJm5i
c3A7IC1QIDBwZW5CbWMgcmF3IDYgNDxicj4mZ3Q7Jm5ic3A7IDU2IDAwPGJyPiZndDs8YnI+
Jmd0OyBXaG8gY2FuIGhlbHAgbWU/PGJyPjxicj5JdCBsb29rcyBsaWtlIHRoZSBwbHVnaW4g
KGFzc3VtaW5nIHlvdSBpbXBsZW1lbnQgdGhlIE9FTSBjb21tYW5kIGJ5IHBsdWdpbikgaXM8
YnI+b25seSBsb2FkZWQgaW4gaXBtaWQsIGJ1dCBub3QgaW4gbmV0aXBtaWQuPGJyPjwvZGl2
Pg==

------=_NextPart_5C0F5838_0B227C78_57FB1F4A--
