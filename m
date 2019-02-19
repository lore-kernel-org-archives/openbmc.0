Return-Path: <fyczy@126.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=126.com
 (client-ip=220.181.15.14; helo=m15-14.126.com; envelope-from=fyczy@126.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=126.com header.i=@126.com header.b="fwGHfzeL"; 
 dkim-atps=neutral
Received: from m15-14.126.com (m15-14.126.com [220.181.15.14])
 by lists.ozlabs.org (Postfix) with ESMTP id 443cjn5pPvzDqHX
 for <openbmc@lists.ozlabs.org>; Tue, 19 Feb 2019 21:41:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=WEISg
 b8YxgbGvt6n5YSoAj9ZkbdJJKO68sfuBpaRPv4=; b=fwGHfzeLW9n2f4ZZuBwex
 P+cCJjRfh1bwtJcEru+8b9PV7OAdRQnfDR3eIu7wHhjHjU8Ct5cloNCLpKAC/pCH
 EpQu1A340AnZLlE61POkIkg9offlTbsJ7kbUC3O1ZJVAXaGtfqBG1ZOwjGSi2nol
 fEZ7/Ar0PN32tD+4bSH7J0=
Received: from fyczy$126.com ( [58.56.96.26] ) by ajax-webmail-wmsvr14
 (Coremail) ; Tue, 19 Feb 2019 18:41:34 +0800 (CST)
X-Originating-IP: [58.56.96.26]
Date: Tue, 19 Feb 2019 18:41:34 +0800 (CST)
From: "George Liu" <fyczy@126.com>
To: openbmc@lists.ozlabs.org
Subject: phosphor-net-ipmid
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
 20180927(cd7136b6) Copyright (c) 2002-2019 www.mailtech.cn 126com
X-CM-CTRLDATA: /HTZtGZvb3Rlcl9odG09MjM1OjU2
Content-Type: multipart/alternative; 
 boundary="----=_Part_111651_440788403.1550572894628"
MIME-Version: 1.0
Message-ID: <1572be36.7756.1690558b9a5.Coremail.fyczy@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: DsqowAA3Px9f3WtcL9wWAA--.16941W
X-CM-SenderInfo: xi1f65a6rslhhfrp/1tbiXB9g9VpD8ADc9QAAsW
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
X-List-Received-Date: Tue, 19 Feb 2019 10:41:51 -0000

------=_Part_111651_440788403.1550572894628
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGkgYWxsOgogICAgSSBhbSBydW5uaW5nIG5ldGlwbWlkIGZhaWxlZCBhbmQgVGlwIFVuYWJsZSB0
byBiaW5kIHNvY2tldCwgSG93IHRvIGNvbXBpbGUgcGhvc3Bob3ItbmV0LWlwbWlkClRoYW5rcw==

------=_Part_111651_440788403.1550572894628
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+SGkgYWxsOjwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwOyBJ
IGFtIHJ1bm5pbmcgbmV0aXBtaWQgZmFpbGVkIGFuZCBUaXAgVW5hYmxlIHRvIGJpbmQgc29ja2V0
LCBIb3cgdG8gY29tcGlsZSBwaG9zcGhvci1uZXQtaXBtaWQ8L2Rpdj48ZGl2PlRoYW5rczwvZGl2
PjwvZGl2Pjxicj48YnI+PHNwYW4gdGl0bGU9Im5ldGVhc2Vmb290ZXIiPjxwPiZuYnNwOzwvcD48
L3NwYW4+
------=_Part_111651_440788403.1550572894628--
