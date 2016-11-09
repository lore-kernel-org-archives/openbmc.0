Return-Path: <mouse@yandex-team.ru>
X-Greylist: delayed 450 seconds by postgrey-1.36 at bilbo;
 Wed, 09 Nov 2016 11:08:48 AEDT
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.b="tvbhlh7V"; dkim-atps=neutral
Received: from forwardcorp1g.cmail.yandex.net (forwardcorp1g.cmail.yandex.net
 [IPv6:2a02:6b8:0:1465::fd])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tD63N0Wn0zDt31
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 11:08:48 +1100 (AEDT)
Received: from mxbackcorp1m.mail.yandex.net (mxbackcorp1m.mail.yandex.net
 [IPv6:2a02:6b8:0:2519::301])
 by forwardcorp1g.cmail.yandex.net (Yandex) with ESMTP id F27AC20C71;
 Wed,  9 Nov 2016 03:01:04 +0300 (MSK)
Received: from webcorp01d.yandex-team.ru (webcorp01d.yandex-team.ru
 [5.255.216.158])
 by mxbackcorp1m.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 tlC2lhT6Pv-14mef6s3; Wed, 09 Nov 2016 03:01:04 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1478649664; bh=4I7hDY+XYe6OHZ1VGY9HcUPR9SuiNbIczgb2AoEDHFU=;
 h=From:To:In-Reply-To:References:Subject:Message-Id:Date;
 b=tvbhlh7Vn/LmT16wnYn5839H1ZQN/gAxPplsbAtiWH0U7z4ablUoIEymvZAfmfbf9
 SoG/luG6G1q5Fudr/51MZTvUXvBuDMdk5URHr+Il/DxuNOK/CxzRNVvb2v1iwFdotg
 oXG2q8q5i8IHHePO4mGw64u36ulz3onWZzoBv64c=
Authentication-Results: mxbackcorp1m.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000001030
Received: by webcorp01d.yandex-team.ru with HTTP;
 Wed, 09 Nov 2016 03:01:04 +0300
From: Anton D. Kachalov <mouse@yandex-team.ru>
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <CANsWYUXcJ6zKwJ2R2maOJLHxMGjMCPELvFatW5F6nUNzf1Lf6A@mail.gmail.com>
References: <CANsWYUXcJ6zKwJ2R2maOJLHxMGjMCPELvFatW5F6nUNzf1Lf6A@mail.gmail.com>
Subject: Re: Question regarding PWM types in AST2500
MIME-Version: 1.0
Message-Id: <209171478649664@webcorp01d.yandex-team.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 09 Nov 2016 03:01:04 +0300
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Nov 2016 00:08:49 -0000

PGRpdj5IZWxsby48L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5Gcm9tIG15IGZpbmRpbmdzLCB0aG9z
ZSB0aHJlZSB0eXBlcyBqdXN0IHRvIGhhdmUgdGhyZWUgaW5kZXBlbmRlbnQgUFdNIHNvdXJjZS4g
RWFjaCBjb3VsZCBiZSBhc3NpZ25lZCB0byB0aGUgOCBQV00gY2hhbm5lbHMgKGFzdDI0MDApIHdp
dGggaXQncyBvd24gc2V0dGluZ3MgKGZhbGxpbmcvcmlzaW5nIHBvaW50KS4gVHlwZXMgTiBhbmQg
TSBoYXMgYSAiRmxhdEVuWCIgYml0LCBidXQgSSBkb24ndCBrbm93IGl0J3MgcHVycG9zZS48L2Rp
dj48ZGl2PsKgPC9kaXY+PGRpdj4wOC4xMS4yMDE2LCAyMDo1NSwgIkphZ2hhdGhpc3dhcmkgUmFu
a2FwcGFnb3VuZGVyIE5hdGFyYWphbiIgJmx0O2phZ2h1QGdvb2dsZS5jb20mZ3Q7OjwvZGl2Pjxi
bG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxkaXY+PGRpdj5UaGVyZSBhcmUgMyB0eXBlcyBvZiBQV00g
LSB0eXBlIE0sIHR5cGUgTiwgdHlwZSBPIGdpdmVuIGluIGFzcGVlZCDCoCDCoCDCoCDCoCDCoCDC
oCDCoMKgPC9kaXY+PGRpdj5hc3QyNTAwIGRhdGFzaGVldChwYWdlIDY3MSkuIEZyb20gdGhpcyBs
aW5rIEkgc2VlIHRoYXQgdGhlcmUgYXJlIDMgdHlwZXMgb2YgwqAgwqDCoDwvZGl2PjxkaXY+UFdN
IDogPGEgaHJlZj0iaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvUHVsc2Utd2lkdGhfbW9k
dWxhdGlvbiNUeXBlcyI+aHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvUHVsc2Utd2lkdGhf
bW9kdWxhdGlvbiNUeXBlczwvYT4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8L2Rpdj48ZGl2Pkhv
dyB0byBmaW5kIHdoaWNoIHR5cGUgaXMgcmVsYXRlZCB0byB3aGljaCBkZWZpbml0aW9uPyBJbiB0
aGUgZGF0YSBzaGVldCB0aGV5IMKgwqA8L2Rpdj48ZGl2PmhhdmUgYWxzbyBnaXZlbiByaXNpbmcg
YW5kIGZhbGxpbmcgYml0LiBJZiB0aGUgdHlwZSBpcyBub3QgZml4ZWQgZm9yIGEgwqAgwqAgwqAg
wqAgwqA8L2Rpdj48ZGl2PnBhcnRpY3VsYXIgZGVmaW5pdGlvbiwgZG8gd2UgbmVlZCB0byB1c2Ug
dGhlc2UgdHdvIGJpdHMgdG8gbWFrZSB0aGUgcHdtIHR5cGUgwqAgwqA8L2Rpdj48ZGl2PmJlaGF2
ZSBhcyBwZXIgdGhlIHdpa2kgZGVmaW5pdGlvbi48L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5UaGFu
a3MsPC9kaXY+PGRpdj5KYWdoYTwvZGl2PjwvZGl2Piw8cD5fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXzxiciAvPm9wZW5ibWMgbWFpbGluZyBsaXN0PGJyIC8+
PGEgaHJlZj0ibWFpbHRvOm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyI+b3BlbmJtY0BsaXN0cy5v
emxhYnMub3JnPC9hPjxiciAvPjxhIGhyZWY9Imh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0
aW5mby9vcGVuYm1jIj5odHRwczovL2xpc3RzLm96bGFicy5vcmcvbGlzdGluZm8vb3BlbmJtYzwv
YT48L3A+PC9ibG9ja3F1b3RlPjxkaXY+wqA8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj4tLcKgPGJy
IC8+QW50b24gRC4gS2FjaGFsb3Y8YnIgLz48YnIgLz7CoDwvZGl2PjxkaXY+wqA8L2Rpdj4=
