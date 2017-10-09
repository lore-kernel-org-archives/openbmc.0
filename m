Return-Path: <mouse@yandex-team.ru>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yandex-team.ru
 (client-ip=5.255.227.106; helo=forwardcorp1j.cmail.yandex.net;
 envelope-from=mouse@yandex-team.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.b="a1nW0Dmz"; dkim-atps=neutral
X-Greylist: delayed 452 seconds by postgrey-1.36 at bilbo;
 Mon, 09 Oct 2017 22:29:22 AEDT
Received: from forwardcorp1j.cmail.yandex.net (forwardcorp1j.cmail.yandex.net
 [5.255.227.106])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y9dLV5Vn4zDqlv
 for <openbmc@lists.ozlabs.org>; Mon,  9 Oct 2017 22:29:22 +1100 (AEDT)
Received: from mxbackcorp1g.mail.yandex.net (mxbackcorp1g.mail.yandex.net
 [IPv6:2a02:6b8:0:1402::301])
 by forwardcorp1j.cmail.yandex.net (Yandex) with ESMTP id A4FAD20258;
 Mon,  9 Oct 2017 14:21:34 +0300 (MSK)
Received: from webcorp01e.yandex-team.ru (webcorp01e.yandex-team.ru
 [5.255.227.50])
 by mxbackcorp1g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 U4qO7KyOrR-LYk01aha; Mon, 09 Oct 2017 14:21:34 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1507548094; bh=8G6mqlPZvDBwg4Pfryg5m4KqAxliHWo8sac96+6dMWM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date;
 b=a1nW0DmzCLgBsIqCrCQ+pV1e+oZ21IDaAJScxf0pIz29gaN0t0utYrpohQUAeSo9B
 F/4c6+jTql5d2Aj6AHqDP/F6n8Ite8HoPV4T0Tdk66YH0IyOKtjn2LmysdGqTuooVk
 z0XYe3APPIKJ5IooWQLt/0lN+wHmwKMHwRygNjNw=
Authentication-Results: mxbackcorp1g.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000001030
Received: by webcorp01e.yandex-team.ru with HTTP;
 Mon, 09 Oct 2017 14:21:34 +0300
From: Anton D. Kachalov <mouse@yandex-team.ru>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "tomer.maimon@nuvoton.com" <tomer.maimon@nuvoton.com>
In-Reply-To: <CACPK8XdfxO5y3DHfBeZgvK=jUCM4noh2YFmX4w0GxEH8UDD+9A@mail.gmail.com>
References: <CACPK8XdfxO5y3DHfBeZgvK=jUCM4noh2YFmX4w0GxEH8UDD+9A@mail.gmail.com>
Subject: Re: Moving to kernel dev-4.13
MIME-Version: 1.0
Message-Id: <525151507548094@webcorp01e.yandex-team.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 09 Oct 2017 14:21:34 +0300
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2017 11:29:24 -0000

PGRpdj5IZWxsbyw8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5JIHJlcG9ydGVkIGEgeWVhciBhZ28g
Y3JpdGljYWwgYnVnIGZvciBhc3BlZWQgdGltZXIgKHJhY2UgYmV0d2VlbiB0aW1lciBkaXNhYmxl
L2NvdW50IHJlZ2lzdGVyIHJlbG9hZCB3aXRoICJyZWxvYWQiIHJlZ2lzdGVyJ3MgdmFsdWUpOjwv
ZGl2PjxkaXY+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvbGludXgvaXNzdWVz
LzEwNyI+aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvbGludXgvaXNzdWVzLzEwNzwvYT48L2Rp
dj48ZGl2PsKgPC9kaXY+PGRpdj5TaW5jZSB0aGF0IGRyaXZlciB3YXMgcmV3cml0dGVuLCBidXQg
a2VlcGluZyB0aGUgc2FtZSBlcnJvcjo8L2Rpdj48ZGl2PjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHVi
LmNvbS9vcGVuYm1jL2xpbnV4L2Jsb2IvZGV2LTQuMTMvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1l
ci1mdHRtcjAxMC5jI0wxMzUiPmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2xpbnV4L2Jsb2Iv
ZGV2LTQuMTMvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1mdHRtcjAxMC5jI0wxMzU8L2E+PC9k
aXY+PGRpdj7CoDwvZGl2PjxkaXY+MDkuMTAuMjAxNywgMTA6MDUsICJKb2VsIFN0YW5sZXkiICZs
dDtqb2VsQGptcy5pZC5hdSZndDs6PC9kaXY+PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHA+SGVs
bG8gT3BlbkJNQ2Vycyw8YnIgLz48YnIgLz5JJ3ZlIHB1c2hlZCBhIG5ldyBicmFuY2ggdG8gdGhl
IE9wZW5CTUMga2VybmVsIHJlcG9zaXRvcnkuIEl0J3MgY2FsbGVkPGJyIC8+ZGV2LTQuMTMsIGFu
ZCBpcyBiYXNlZCBvbiB0aGUgbGF0ZXN0IHN0YWJsZSByZWxlYXNlIGZyb20gdGhlIDQuMTM8YnIg
Lz5icmFuY2ggKDQuMTMuNSkuPGJyIC8+PGJyIC8+VGhlcmUgYXJlIGN1cnJlbnRseSA0MCBwYXRj
aGVzIG9uIHRvcCBvZiB0aGUgdXBzdHJlYW0gcmVsZWFzZSB0aGF0PGJyIC8+aW5jbHVkZSB0aGUg
cGF0Y2hlcyBzZW50IHVwc3RyZWFtIHNpbmNlIDQuMTMgd2FzIHJlbGVhc2VkLiBJbjxiciAvPmFk
ZGl0aW9uLCB0aGVyZSBpcyB0aGUgbmV3IEFzcGVlZCBjbGsgZHJpdmVyIHRoYXQgaXMgb3V0IG9u
IHRoZTxiciAvPnVwc3RyZWFtIGxpc3RzIGZvciByZXZpZXcuPGJyIC8+PGJyIC8+SWYgeW91IHdp
c2ggdG8gaGF2ZSB5b3VyIG5vbi11cHN0cmVhbWVkIHBhdGNoZXMgYWRkZWQgdG8gdGhpcyB0cmVl
LDxiciAvPnBsZWFzZSBzZW5kIHRoZW0gdG8gdGhlIGxpc3Qgd2l0aCB0aGUgW1BBVENIIGxpbnV4
IGRldi00LjEzXSB0YWcuPGJyIC8+PGJyIC8+SWYgeW91IGhhdmUgYW55IHF1ZXN0aW9ucyBvciBj
b25jZXJucyB0aGVuIHBsZWFzZSB1c2UgdGhpcyB0aHJlYWQgdG88YnIgLz5raWNrIG9mZiBhIGRp
c2N1c3Npb24uPGJyIC8+PGJyIC8+Q2hlZXJzLDxiciAvPjxiciAvPkpvZWw8L3A+PC9ibG9ja3F1
b3RlPjxkaXY+wqA8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj4tLcKgPGJyIC8+QW50b24gRC4gS2Fj
aGFsb3Y8YnIgLz7CoDwvZGl2Pg==
