Return-Path: <1450335857@qq.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=59.36.132.35; helo=qq.com; envelope-from=1450335857@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="IDxXDhOD"; 
 dkim-atps=neutral
Received: from qq.com (smtpbg465.qq.com [59.36.132.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 443YjX4fyszDqDT
 for <openbmc@lists.ozlabs.org>; Tue, 19 Feb 2019 19:26:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1550564768; bh=GVqokTU2HDcJPIzaBpEVLYjCQ1pBrXDO8F9MtZVZJZA=;
 h=From:To:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
 b=IDxXDhODooels8e3GPY23aw6GNooyudv9l7yDxR/FwDkUq0iBFEEmAqH3Iq2P8/Cr
 vYIsJ4pzQB9WKWVGiz2UVOu1/EYivbPFjBWkNYnJ8oAgOfKFM5TPMIVRQif9BSLl9x
 pm8DZkmUinVNrn1nqpmbP24FE9z5H0s2L6zj76HM=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1550564767t964564
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>,
 "=?ISO-8859-1?B?amFlLmh5dW4ueW9v?=" <jae.hyun.yoo@linux.intel.com>
Subject: obmc-ikvm host OS console mode issue
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5C6BBD9F_0A6E0FB0_5E47B969"
Content-Transfer-Encoding: 8Bit
Date: Tue, 19 Feb 2019 16:26:07 +0800
X-Priority: 3
Message-ID: <tencent_381DA9DC452799622EA1E4E4@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Tue, 19 Feb 2019 16:26:08 +0800 (CST)
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
X-List-Received-Date: Tue, 19 Feb 2019 08:26:26 -0000

This is a multi-part message in MIME format.

------=_NextPart_5C6BBD9F_0A6E0FB0_5E47B969
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgSmFlLCAgIEkgdXBkYXRlZCB0aGUgb2JtYy1pa3ZtIGNvbW1pdCA3ZGZhYzlmZjJkMTU2
OWFlZGY4MzE3NWZiMDQyNzU2MmMyMTg4ZTYzIA0KIEl0IGNhdXNlZCBvbmUgaXNzdWU6DQpU
aGUgaWt2bSBvbmx5IHdvcmtzIG9uIGxpbnV4IE9TIEdVSSBtb2RlLA0KV2hlbiBJIHN3aXRj
aCB0byBvcyBjb25zb2xlIG1vZGUsIHRoZSBpa3ZtIGNhbid0IGdldCB0aGUgaG9zdCBzY3Jl
ZW4uDQpQbGVhc2UgY2hlY2sgeW91IGNvbW1pdC4NCg0KDQpCZXN0LA0KeGl1emhp

------=_NextPart_5C6BBD9F_0A6E0FB0_5E47B969
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgSmFlLDxkaXY+Jm5ic3A7ICZuYnNwO0kgdXBkYXRlZCB0aGUgb2JtYy1pa3ZtIGNvbW1p
dCA8c3BhbiBzdHlsZT0iIGNvbG9yOiByZ2IoNjgsIDc3LCA4Nik7IDsgOyA7IDsgOyAiPjdk
ZmFjOWZmMmQxNTY5YWVkZjgzMTc1ZmIwNDI3NTYyYzIxODhlNjMgPC9zcGFuPjwvZGl2Pjxk
aXY+PHNwYW4gc3R5bGU9IiBjb2xvcjogcmdiKDY4LCA3NywgODYpOyA7IDsgOyA7IDsgIj4m
bmJzcDtJdCBjYXVzZWQgb25lIGlzc3VlOjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxl
PSIgY29sb3I6IHJnYig2OCwgNzcsIDg2KTsgOyA7IDsgOyA7ICI+VGhlIGlrdm0gb25seSB3
b3JrcyBvbiBsaW51eCBPUyBHVUkgbW9kZSw8L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHls
ZT0iIGNvbG9yOiByZ2IoNjgsIDc3LCA4Nik7IDsgOyA7IDsgOyAiPldoZW4gSSBzd2l0Y2gg
dG8gb3MgY29uc29sZSBtb2RlLCB0aGUgaWt2bSBjYW4ndCBnZXQgdGhlIGhvc3Qgc2NyZWVu
Ljwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSIgY29sb3I6IHJnYig2OCwgNzcsIDg2
KTsgOyA7IDsgOyA7ICI+UGxlYXNlIGNoZWNrIHlvdSBjb21taXQuPC9zcGFuPjwvZGl2Pjxk
aXY+PHNwYW4gc3R5bGU9IiBjb2xvcjogcmdiKDY4LCA3NywgODYpOyA7IDsgOyA7IDsgIj48
YnI+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9IiBjb2xvcjogcmdiKDY4LCA3Nywg
ODYpOyA7IDsgOyA7IDsgIj5CZXN0LDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSIg
Y29sb3I6IHJnYig2OCwgNzcsIDg2KTsgOyA7IDsgOyA7ICI+eGl1emhpPC9zcGFuPjwvZGl2
Pg==

------=_NextPart_5C6BBD9F_0A6E0FB0_5E47B969--
