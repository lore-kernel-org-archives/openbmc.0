Return-Path: <1450335857@qq.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=103.7.28.233; helo=smtpbg65.qq.com; envelope-from=1450335857@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="jlYp6Jwx"; 
 dkim-atps=neutral
Received: from smtpbg65.qq.com (smtpbg65.qq.com [103.7.28.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 430kcD43wNzDqQ3
 for <openbmc@lists.ozlabs.org>; Thu, 22 Nov 2018 13:56:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1542855396; bh=8OUw7njlppavq/ARcJmiGMylgRh+CYANcB1Im1veRgs=;
 h=From:To:Subject:Mime-Version:Content-Type:Content-Transfer-Encoding:Date:Message-ID;
 b=jlYp6JwxAPIsu6pHVebWTS93qy9dXjhf/upHgG02qVxU5cf7eYCv+4GCF5exI0hzx
 eygG7KAqCvURIg7xichmIqtRR3ksG9Icz1Bl2fjFmO8P+fMUvvgdAxL+PVGh1Z9pk+
 RrOV6zIpLMq/6MKJaM0BunUVmnY5tXJIB3rS9QhU=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1542855395t319989
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: Can't find the pam_ipmicheck.so pam_ipmisave.so in
 /etc/pam.d/common-passwd 
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5BF61AE2_097A1D48_37A9C0E6"
Content-Transfer-Encoding: 8Bit
Date: Thu, 22 Nov 2018 10:56:34 +0800
X-Priority: 3
Message-ID: <tencent_230D17CB1EF513F3732136F8@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Thu, 22 Nov 2018 10:56:35 +0800 (CST)
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
X-List-Received-Date: Thu, 22 Nov 2018 02:56:45 -0000

This is a multi-part message in MIME format.

------=_NextPart_5BF61AE2_097A1D48_37A9C0E6
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KVGhlICAvZXRjL3BhbS5kL2NvbW1vbi1wYXNzd2QgdXNlIHRoZSBmb2xsb3dp
bmcgY29uZmlndXJlOg0KIHBhc3N3b3JkICAgICAgICBbc3VjY2Vzcz1vayBkZWZhdWx0PWRp
ZV0gICAgICBwYW1faXBtaWNoZWNrLnNvIHNwZWNfZ3JwX25hbWU9aQ0KI3Bhc3N3b3JkICAg
ICAgIFtzdWNjZXNzPW9rIGRlZmF1bHQ9ZGllXSAgICAgICAgcGFtX2NyYWNrbGliLnNvIGRl
YnVnIGVuZm9yY2VfZm8NCiNwYXNzd29yZCAgICAgICBbc3VjY2Vzcz1vayBpZ25vcmU9aWdu
b3JlIGRlZmF1bHQ9ZGllXSAgcGFtX3B3aGlzdG9yeS5zbyBkZWJ1ZyBlDQpwYXNzd29yZCAg
ICAgICBbc3VjY2Vzcz1vayBkZWZhdWx0PWRpZV0gICAgICAgIHBhbV91bml4LnNvIHNoYTUx
MiB1c2VfYXV0aHRvaw0KI3Bhc3N3b3JkICAgICAgIFtzdWNjZXNzPW9rIGRlZmF1bHQ9ZGll
XSAgICAgICAgIHBhbV9pcG1pc2F2ZS5zbyBzcGVjX2dycF9uYW1lPWlwDQoNCg0KICBJIGNh
bid0IGZpbmQgdGhlIGZpbGUgcGFtX2lwbWljaGVjay5zbyBhbmQgcGFtX2lwbWlzYXZlLnNv
ICwgd2hpY2ggcGFja2FnZSAgcHJvZHVjZSB0aGVzZSBsaWJyYXJ5IGZpbGVzPw0KQmVzdCwN
CnhpdXpoaQ==

------=_NextPart_5BF61AE2_097A1D48_37A9C0E6
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj5IaSBhbGwsPC9kaXY+PGRpdj5UaGUmbmJzcDsmbmJzcDsvZXRjL3BhbS5kL2NvbW1v
bi1wYXNzd2QgdXNlIHRoZSBmb2xsb3dpbmcgY29uZmlndXJlOjwvZGl2PjxkaXY+Jm5ic3A7
cGFzc3dvcmQmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgW3N1Y2Nlc3M9b2sgZGVmYXVs
dD1kaWVdJm5ic3A7ICZuYnNwOyAmbmJzcDsgcGFtX2lwbWljaGVjay5zbyBzcGVjX2dycF9u
YW1lPWk8L2Rpdj48ZGl2PiNwYXNzd29yZCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO1tz
dWNjZXNzPW9rIGRlZmF1bHQ9ZGllXSZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBwYW1f
Y3JhY2tsaWIuc28gZGVidWcgZW5mb3JjZV9mbzwvZGl2PjxkaXY+I3Bhc3N3b3JkJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7W3N1Y2Nlc3M9b2sgaWdub3JlPWlnbm9yZSBkZWZhdWx0
PWRpZV0mbmJzcDsgcGFtX3B3aGlzdG9yeS5zbyBkZWJ1ZyBlPC9kaXY+PGRpdj5wYXNzd29y
ZCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO1tzdWNjZXNzPW9rIGRlZmF1bHQ9ZGllXSZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyBwYW1fdW5peC5zbyBzaGE1MTIgdXNlX2F1dGh0
b2s8L2Rpdj48ZGl2PiNwYXNzd29yZCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO1tzdWNj
ZXNzPW9rIGRlZmF1bHQ9ZGllXSZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtw
YW1faXBtaXNhdmUuc28gc3BlY19ncnBfbmFtZT1pcDwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+Jm5ic3A7IEkgY2FuJ3QgZmluZCB0aGUgZmlsZSZuYnNwO3BhbV9pcG1pY2hlY2suc28g
YW5kIHBhbV9pcG1pc2F2ZS5zbyAsIHdoaWNoIHBhY2thZ2UmbmJzcDsgcHJvZHVjZSB0aGVz
ZSBsaWJyYXJ5IGZpbGVzPzwvZGl2PjxkaXY+QmVzdCw8L2Rpdj48ZGl2PnhpdXpoaTwvZGl2
Pg==

------=_NextPart_5BF61AE2_097A1D48_37A9C0E6--
