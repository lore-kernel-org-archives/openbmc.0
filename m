Return-Path: <fyczy@126.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=126.com
 (client-ip=220.181.15.33; helo=m15-33.126.com; envelope-from=fyczy@126.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=126.com header.i=@126.com header.b="Q9nFvPGz"; 
 dkim-atps=neutral
Received: from m15-33.126.com (m15-33.126.com [220.181.15.33])
 by lists.ozlabs.org (Postfix) with ESMTP id 43gwcY5P9zzDqty
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jan 2019 20:28:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=gi25Y
 9tbu9eKglf49CdqTPIP213y6PP1Ez2SHsyTsY4=; b=Q9nFvPGzoZioZ+Kmar5Si
 d/CHSe1wfYyvrvrj+TtcB+8jUPIgN1vQXm2jOGDQMk2b2+W2yr1xvW3SlzCtK79W
 Q3yhQwtRTvQi/IzNrtKhT2hOIFBvih5kgTXawLGlafnszYA5PvStUbfBsU73TWfc
 AQlpdGN4kYsK6ic+cSIo7g=
Received: from fyczy$126.com ( [58.56.96.29] ) by ajax-webmail-wmsvr33
 (Coremail) ; Fri, 18 Jan 2019 17:28:44 +0800 (CST)
X-Originating-IP: [58.56.96.29]
Date: Fri, 18 Jan 2019 17:28:44 +0800 (CST)
From: =?GBK?B?wfXO/c6w?= <fyczy@126.com>
To: openbmc@lists.ozlabs.org
Subject: couple questions for Event Log
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
 20180927(cd7136b6) Copyright (c) 2002-2019 www.mailtech.cn 126com
X-CM-CTRLDATA: iHlXYWZvb3Rlcl9odG09MjAzNDo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_119466_559030783.1547803724069"
MIME-Version: 1.0
Message-ID: <5aff6ce7.7e70.168604a8925.Coremail.fyczy@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: IcqowACnr8NNnEFci0oIAA--.8477W
X-CM-SenderInfo: xi1f65a6rslhhfrp/1tbimgRA9VpD7V22MwABsG
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
X-List-Received-Date: Fri, 18 Jan 2019 09:29:04 -0000

------=_Part_119466_559030783.1547803724069
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGkKCjEuICAgICAgIEhvdyB0byBkZWJ1ZyB0aGUgc3lzdGVtIGV2ZW50IGxvZywgaG93IHRvIGNv
bmZpZ3VyZSBpdCwgYW5kIHdoYXQgbW9kdWxlcyBhcmUgcmVsYXRlZCB0byB0aGUgbG9nIGZ1bmN0
aW9uPwoKMi4gICAgICAgV2hlbiBpcyB0aGUgcGhvc3Bob3Itc2VsLWxvZ2dlciByZWdpc3RyYXRp
b24gbWV0aG9kIChJcG1pU2VsQWRkLCBJcG1pU2VsQWRkT2VtKSBpbnZva2VkPyBIb3cgdG8gdXNl
IERCVVMgdG8gcmVhZCBqb3VybmFsY3RsPwoKMy4gICAgICAgQ291bGQgYW55b25lIHNoYXJlIGEg
ZGVzY3JpcHRpb24gb2YgdGhlIHlhbWwgZmlsZSBhYm91dCBwaG9zcGhvci1sb2dnaW5nPwoKVGhh
bmtz
------=_Part_119466_559030783.1547803724069
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVT
Ij5IaTxvOnA+PC9vOnA+PC9zcGFuPjwvcD4KCjxwIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBoIiBz
dHlsZT0ibWFyZ2luLWxlZnQ6MzkuMHB0O3RleHQtaW5kZW50Oi0xOC4wcHQ7Cm1zby1jaGFyLWlu
ZGVudC1jb3VudDowO21zby1saXN0OmwwIGxldmVsMSBsZm8xIj48IS0tW2lmICFzdXBwb3J0TGlz
dHNdLS0+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJtc28tZmFyZWFzdC1mb250LWZhbWlseTpD
YWxpYnJpO21zby1mYXJlYXN0LXRoZW1lLWZvbnQ6bWlub3ItbGF0aW47Cm1zby1iaWRpLWZvbnQt
ZmFtaWx5OkNhbGlicmk7bXNvLWJpZGktdGhlbWUtZm9udDptaW5vci1sYXRpbiI+PHNwYW4gc3R5
bGU9Im1zby1saXN0Oklnbm9yZSI+MS48c3BhbiBzdHlsZT0iZm9udDo3LjBwdCAmcXVvdDtUaW1l
cyBOZXcgUm9tYW4mcXVvdDsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOwo8
L3NwYW4+PC9zcGFuPjwvc3Bhbj48IS0tW2VuZGlmXS0tPjxzcGFuIGxhbmc9IkVOLVVTIj5Ib3cg
dG8gZGVidWcgdGhlIHN5c3RlbSBldmVudApsb2csIGhvdyB0byBjb25maWd1cmUgaXQsIGFuZCB3
aGF0IG1vZHVsZXMgYXJlIHJlbGF0ZWQgdG8gdGhlIGxvZyBmdW5jdGlvbj8gPG86cD48L286cD48
L3NwYW4+PC9wPgoKPHAgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGgiIHN0eWxlPSJtYXJnaW4tbGVm
dDozOS4wcHQ7dGV4dC1pbmRlbnQ6LTE4LjBwdDsKbXNvLWNoYXItaW5kZW50LWNvdW50OjA7bXNv
LWxpc3Q6bDAgbGV2ZWwxIGxmbzEiPjwhLS1baWYgIXN1cHBvcnRMaXN0c10tLT48c3BhbiBsYW5n
PSJFTi1VUyIgc3R5bGU9Im1zby1mYXJlYXN0LWZvbnQtZmFtaWx5OkNhbGlicmk7bXNvLWZhcmVh
c3QtdGhlbWUtZm9udDptaW5vci1sYXRpbjsKbXNvLWJpZGktZm9udC1mYW1pbHk6Q2FsaWJyaTtt
c28tYmlkaS10aGVtZS1mb250Om1pbm9yLWxhdGluIj48c3BhbiBzdHlsZT0ibXNvLWxpc3Q6SWdu
b3JlIj4yLjxzcGFuIHN0eWxlPSJmb250OjcuMHB0ICZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90
OyI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Cjwvc3Bhbj48L3NwYW4+PC9z
cGFuPjwhLS1bZW5kaWZdLS0+PHNwYW4gbGFuZz0iRU4tVVMiPldoZW4gaXMgdGhlIHBob3NwaG9y
LXNlbC1sb2dnZXIKcmVnaXN0cmF0aW9uIG1ldGhvZCAoSXBtaVNlbEFkZCwgSXBtaVNlbEFkZE9l
bSkgaW52b2tlZD8gSG93IHRvIHVzZSBEQlVTIHRvCnJlYWQgam91cm5hbGN0bD88bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+Cgo8cCBjbGFzcz0iTXNvTGlzdFBhcmFncmFwaCIgc3R5bGU9Im1hcmdpbi1s
ZWZ0OjM5LjBwdDt0ZXh0LWluZGVudDotMTguMHB0Owptc28tY2hhci1pbmRlbnQtY291bnQ6MDtt
c28tbGlzdDpsMCBsZXZlbDEgbGZvMSI+PCEtLVtpZiAhc3VwcG9ydExpc3RzXS0tPjxzcGFuIGxh
bmc9IkVOLVVTIiBzdHlsZT0ibXNvLWZhcmVhc3QtZm9udC1mYW1pbHk6Q2FsaWJyaTttc28tZmFy
ZWFzdC10aGVtZS1mb250Om1pbm9yLWxhdGluOwptc28tYmlkaS1mb250LWZhbWlseTpDYWxpYnJp
O21zby1iaWRpLXRoZW1lLWZvbnQ6bWlub3ItbGF0aW4iPjxzcGFuIHN0eWxlPSJtc28tbGlzdDpJ
Z25vcmUiPjMuPHNwYW4gc3R5bGU9ImZvbnQ6Ny4wcHQgJnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1
b3Q7Ij4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsKPC9zcGFuPjwvc3Bhbj48
L3NwYW4+PCEtLVtlbmRpZl0tLT48c3BhbiBsYW5nPSJFTi1VUyI+Q291bGQgYW55b25lIHNoYXJl
IGEKZGVzY3JpcHRpb24gb2YgdGhlIHlhbWwgZmlsZSBhYm91dCBwaG9zcGhvci1sb2dnaW5nPzxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4KCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVO
LVVTIj5UaGFua3M8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PC9kaXY+PGJyPjxicj48c3BhbiB0aXRs
ZT0ibmV0ZWFzZWZvb3RlciI+PHA+Jm5ic3A7PC9wPjwvc3Bhbj4=
------=_Part_119466_559030783.1547803724069--
