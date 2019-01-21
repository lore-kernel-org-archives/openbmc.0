Return-Path: <fyczy@126.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=126.com
 (client-ip=220.181.15.63; helo=m15-63.126.com; envelope-from=fyczy@126.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=126.com header.i=@126.com header.b="QplWn+PT"; 
 dkim-atps=neutral
Received: from m15-63.126.com (m15-63.126.com [220.181.15.63])
 by lists.ozlabs.org (Postfix) with ESMTP id 43jmnc2dqjzDqVL
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jan 2019 20:43:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=hOgVm
 HQOiytgW6rHZ/Kb7oAixJMvagrrk92Hs37tNao=; b=QplWn+PTLWttY0kRUA7x/
 WuSsQZcw0QpBRWc6MT4HEe+1h4k/SZJJsHlBiXok/P4X4xLjylmESyZgYY+czgqz
 2xdNsRfXQ8PE2iu7oC42W3VvdSzi5rrf2Xp/d/4FmBizvRD3xfk1/D0nSKqBwLK/
 i1HW+ytHr/61a8VxCPD+40=
Received: from fyczy$126.com ( [58.56.96.29] ) by ajax-webmail-wmsvr63
 (Coremail) ; Mon, 21 Jan 2019 17:43:06 +0800 (CST)
X-Originating-IP: [58.56.96.29]
Date: Mon, 21 Jan 2019 17:43:06 +0800 (CST)
From: "George Liu" <fyczy@126.com>
To: openbmc@lists.ozlabs.org
Subject: couple questions for Event Log
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
 20180927(cd7136b6) Copyright (c) 2002-2019 www.mailtech.cn 126com
X-CM-CTRLDATA: 3oVKZGZvb3Rlcl9odG09NDIyOjU2
Content-Type: multipart/alternative; 
 boundary="----=_Part_118144_1161375160.1548063786605"
MIME-Version: 1.0
Message-ID: <421daf7d.7dda.1686fcac66d.Coremail.fyczy@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: P8qowADXhX0rlEVcI7IJAA--.63636W
X-CM-SenderInfo: xi1f65a6rslhhfrp/1tbi6AtD9VpD75hMxwAAsw
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
X-List-Received-Date: Mon, 21 Jan 2019 09:43:19 -0000

------=_Part_118144_1161375160.1548063786605
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGk6CjEuIENvdWxkIGFueW9uZSB1c2UgaW1waXRvb2wgc2VsIGxpc3QgdG8gcmVhZCB2YWx1ZXMg
YWZ0ZXIgY2FsbGluZyB0aGUgc2Rfam91cm5hbF9zZW5kIG1ldGhvZD8KMi4gQ2FsbGluZyB0aGUg
c3RhcnRUaHJlc2hvbGRFdmVudE1vbml0b3IgbWV0aG9kIG9mIHRoZSBwaG9zcGhvci1zZWwtbG9n
Z2VyIG1vZHVsZSwgd2h5IGdldCB0aGUgdmFsdWVzIG9mIG1heCwgbWluLCBzZW5zb3JWYWwgYXJl
IGFsbCAwPyBCdXQgSSBjYW4gZ2V0IHRoZSBjb3JyZWN0IHZhbHVlcyB0aHJvdWdoIGRidXMuClRo
YW5rcw==
------=_Part_118144_1161375160.1548063786605
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+SGk6PC9kaXY+PGRpdj4xLiZuYnNwO0NvdWxkIGFueW9u
ZSB1c2UgaW1waXRvb2wgc2VsIGxpc3QgdG8gcmVhZCB2YWx1ZXMgYWZ0ZXIgY2FsbGluZyB0aGUg
c2Rfam91cm5hbF9zZW5kIG1ldGhvZD88L2Rpdj48ZGl2PjIuJm5ic3A7Q2FsbGluZyB0aGUgc3Rh
cnRUaHJlc2hvbGRFdmVudE1vbml0b3IgbWV0aG9kIG9mIHRoZSBwaG9zcGhvci1zZWwtbG9nZ2Vy
IG1vZHVsZSwgd2h5IGdldCB0aGUgdmFsdWVzIG9mIG1heCwgbWluLCBzZW5zb3JWYWwgYXJlIGFs
bCAwPyBCdXQgSSBjYW4gZ2V0IHRoZSBjb3JyZWN0IHZhbHVlcyB0aHJvdWdoIGRidXMuPC9kaXY+
PGRpdj5UaGFua3M8L2Rpdj48L2Rpdj48YnI+PGJyPjxzcGFuIHRpdGxlPSJuZXRlYXNlZm9vdGVy
Ij48cD4mbmJzcDs8L3A+PC9zcGFuPg==
------=_Part_118144_1161375160.1548063786605--
