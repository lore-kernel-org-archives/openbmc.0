Return-Path: <1450335857@qq.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=59.36.132.32; helo=qq.com; envelope-from=1450335857@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="rYf9StBF"; 
 dkim-atps=neutral
Received: from qq.com (smtpbg464.qq.com [59.36.132.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43mBfd2xGxzDqFM
 for <openbmc@lists.ozlabs.org>; Fri, 25 Jan 2019 19:15:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1548404101; bh=dZGGEH87Y8ta/PFhC8DzlvY5KS8RgVaIHiXVrxgnsns=;
 h=From:To:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
 b=rYf9StBFrzgn0XeAQNRmdvtoBDoCusNTA5PuLwAK9q4mZLhTnWOR/3Cl5aUYL/uYe
 +lHr3YhWxV9Orpea11vqYzUalyW3gxhqcxluaIsnzEQavCkMEhjK3RVeTtp+/r5qOB
 6+D+nPQgs0wi/V8V9JfkcJZQhFy/v/tUGQHZf4/k=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1548404099t528944
From: "=?gb18030?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>,
 "=?gb18030?B?Sm9zZXBoIFJleW5vbGRz?=" <jrey@us.ibm.com>,
 "=?gb18030?B?RWRkaWUgSmFtZXM=?=" <eajames@linux.vnet.ibm.com>
Subject: KVM Support - host display  dormant or disconnected
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5C4AC583_0B2FC530_58959C99"
Content-Transfer-Encoding: 8Bit
Date: Fri, 25 Jan 2019 16:14:59 +0800
X-Priority: 3
Message-ID: <tencent_5CD729283467BBBF024956C6@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 25 Jan 2019 16:15:00 +0800 (CST)
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
X-List-Received-Date: Fri, 25 Jan 2019 08:15:39 -0000

This is a multi-part message in MIME format.

------=_NextPart_5C4AC583_0B2FC530_58959C99
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGkgRWRkaWUsDQogICAgIEhhdmUgeW91IHVwZGF0ZWQgdGhlIGlrdm0gZHJpdmVyIGNvZGUg
IHJlY2VudGx5o78NCiAgSSBmb3VuZCBhbiBuZXcgaXNzdWU6DQpUaGUgaHR0cHM6Ly94eHh4
LyMva3ZtIHNjcmVlbiBjYW4ndCBzaG93IGFueXRoaW5nIG9mIHRoZSBob3N0IHdoZW4gdGhl
IGhvc3QgZGlzcGxheSBkb3JtYW50IG9yIHRoZSBob3N0IGRpc2Nvbm5lY3QgdG8gb25lIGRp
c3BsYXkgZGV2aWNlLg0KVGhlIGlrdm0gb25seSBzaG93IHRoZSBob3N0IHNjcmVlbiB3aGVu
IHRoZSBob3N0IHNjcmVlbiBpcyBhY3RpdmUuDQoNCg0KQmVzdCwNClhpdXpoaQ==

------=_NextPart_5C4AC583_0B2FC530_58959C99
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PGRpdj5IaSBFZGRpZSw8L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7SGF2ZSB5b3Ug
dXBkYXRlZCB0aGUgaWt2bSBkcml2ZXIgY29kZSZuYnNwOyByZWNlbnRseaO/PC9kaXY+PGRp
dj4mbmJzcDsgSSBmb3VuZCBhbiBuZXcgaXNzdWU6PC9kaXY+PGRpdj5UaGUgaHR0cHM6Ly94
eHh4LyMva3ZtIHNjcmVlbiBjYW4ndCBzaG93IGFueXRoaW5nIG9mIHRoZSBob3N0IHdoZW4g
dGhlIGhvc3QgZGlzcGxheSBkb3JtYW50IG9yIHRoZSBob3N0IGRpc2Nvbm5lY3QgdG8gb25l
IGRpc3BsYXkgZGV2aWNlLjwvZGl2PjxkaXY+VGhlIGlrdm0gb25seSBzaG93IHRoZSBob3N0
IHNjcmVlbiB3aGVuIHRoZSBob3N0IHNjcmVlbiBpcyBhY3RpdmUuPC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj5CZXN0LDwvZGl2PjxkaXY+WGl1emhpPC9kaXY+

------=_NextPart_5C4AC583_0B2FC530_58959C99--
