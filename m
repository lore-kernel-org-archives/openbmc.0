Return-Path: <fyczy@126.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=126.com
 (client-ip=220.181.15.15; helo=m15-15.126.com; envelope-from=fyczy@126.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=126.com header.i=@126.com header.b="Rg77hvKJ"; 
 dkim-atps=neutral
Received: from m15-15.126.com (m15-15.126.com [220.181.15.15])
 by lists.ozlabs.org (Postfix) with ESMTP id 447sHv3q00zDqPy
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 19:22:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=iNIk0
 sVmaeBkIbeJG6HHpV/v+35KXvKlFxGIXFdJ5IE=; b=Rg77hvKJd6d90wlrMAAdz
 CebtdRVsxvQICCebEaUzrg1z3gSg9sjFg8+SGvpGRy3xZydw21YE6GEPkjVw8+5f
 NxDTJqyrhWgt0k5m9sOZw0kN9oGlS8539SsrNQL6TEpIuKrHHtif2tDcZEedTj0I
 RxsRQgJpChbwqfs+2YZjfg=
Received: from fyczy$126.com ( [60.208.111.211] ) by ajax-webmail-wmsvr15
 (Coremail) ; Tue, 26 Feb 2019 16:22:24 +0800 (CST)
X-Originating-IP: [60.208.111.211]
Date: Tue, 26 Feb 2019 16:22:24 +0800 (CST)
From: "George Liu" <fyczy@126.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: couple questions for DBUS
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
 20180927(cd7136b6) Copyright (c) 2002-2019 www.mailtech.cn 126com
X-CM-CTRLDATA: 6//PjWZvb3Rlcl9odG09NDU0OjU2
Content-Type: multipart/alternative; 
 boundary="----=_Part_103813_1795548359.1551169344075"
MIME-Version: 1.0
Message-ID: <517b868d.6e48.16928e5d24c.Coremail.fyczy@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: D8qowAC3YEhB93RcZrobAA--.15641W
X-CM-SenderInfo: xi1f65a6rslhhfrp/1tbi7xFn9VpD5gPTSAACsJ
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
X-List-Received-Date: Tue, 26 Feb 2019 08:22:38 -0000

------=_Part_103813_1795548359.1551169344075
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGkgQWxsOgogICAgQ3VzdG9taXplIHRoZSBEYnVzIGludGVyZmFjZSwgYWRkIGEgbmV3IGRidXMg
b2JqZWN0IGFmdGVyIHJlY2VpdmluZyB0aGUgbWVzc2FnZSB2aWEgdGhlIHlhbWwgZmlsZSBjb25m
aWd1cmF0aW9uIG1ldGhvZCwgdXNlIGJ1c2N0bCBpbnRyb3NwZWN0IGNvbS54eHgueHh4IC9jb20v
eHh4L3h4L3h4L3h4IGlzIGNvcnJlY3QsIGJ1dCB1c2UgbWFwcGVyIGdldC1zZXJ2aWNlICIvY29t
L3h4eC94eC94eC94eCIgcHJvbXB0IEVycm9yIGZpbmRpbmcgJy9jb20veHh4L3h4L3h4L3h4JyBz
ZXJ2aWNlOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5ClRoYW5rcyE=
------=_Part_103813_1795548359.1551169344075
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+SGkgQWxsOjwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwOyZu
YnNwO0N1c3RvbWl6ZSB0aGUgRGJ1cyBpbnRlcmZhY2UsIGFkZCBhIG5ldyBkYnVzIG9iamVjdCBh
ZnRlciByZWNlaXZpbmcgdGhlIG1lc3NhZ2UgdmlhIHRoZSB5YW1sIGZpbGUgY29uZmlndXJhdGlv
biBtZXRob2QsIHVzZSBidXNjdGwgaW50cm9zcGVjdCBjb20ueHh4Lnh4eCAvY29tL3h4eC94eC94
eC94eCBpcyBjb3JyZWN0LCBidXQgdXNlIG1hcHBlciBnZXQtc2VydmljZSAiL2NvbS94eHgveHgv
eHgveHgiIHByb21wdCBFcnJvciBmaW5kaW5nICcvY29tL3h4eC94eC94eC94eCcgc2VydmljZTog
Tm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeTwvZGl2PjxkaXY+VGhhbmtzITwvZGl2PjwvZGl2Pjxi
cj48YnI+PHNwYW4gdGl0bGU9Im5ldGVhc2Vmb290ZXIiPjxwPiZuYnNwOzwvcD48L3NwYW4+
------=_Part_103813_1795548359.1551169344075--
