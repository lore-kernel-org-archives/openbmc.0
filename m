Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD9560A2625
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 04:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DYFrDMAY
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFWtT5kYDz30DK;
	Thu, 29 Oct 2026 15:47:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793249249;
	cv=none; b=JBchFJrw1CIEhnlTTDLEsn1K/LobhE9+gcZYprF2mGEz2Sj+SB3k42I1NXbiY5U8ZZ7LqW7xb2k3nczPusZQ0yN+V0oY8E1ecGZ3IDWNbBt4nTFKyVFssTogxCPkFGqBgUjjpTRniYazOVvA+ATwKAOu0JVkPBtOsixtsCoz2hl7/I/Gp+uZZectgNfulWm0GcN5dul0TvuPxsTiNUSiUKYiMj3+VwHAO/sznzHw5m2woFL0gNnVtHcpa6OIMwkzLM8PMbbKCHhnzCKghSzs1KlOjSTXMHCJvyHmoBd5Jw4aWYgjO+LHT7bKyKz2uvuhHSJfoT/vMCueia5nOW3+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793249249; c=relaxed/relaxed;
	bh=MRdVC4VhCocO5psjgSrSm42VnFtZ6DRjJownts0EUnI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RTsQiAIRTM01ELORrwhC2ljlMEC/EDAhZLAxpC70bwWOX6meiqVNTgSEWpQ5gwE4qiF6ej+QV8RozK3zDGVqyU/zgVvGsmarRIqgQT4SZB4UINDGWScWb/5njz4rtpKMnDwAKugR7VYmLEOnmaeHY2W1y2og2bMmjpvNr21EaHk0ZGc5JFaibFu8Ua5qbdte2Gh1seob4Onp207xOz8oCk6rtBFRAYn2ETW9hU5bFTL3wuTZjLf7tVSQZmkBc6HB4LhYydAi6Z5Fs2/JCmt3wBLVmt6+qL/1WoMhjXNn6HDz3uIFAVob54q3w7QoiwrB44yyxUpDrXC+bNE93y3hyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DYFrDMAY; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DYFrDMAY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFWtS6RS1z3048
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 15:47:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793249248;
	bh=MRdVC4VhCocO5psjgSrSm42VnFtZ6DRjJownts0EUnI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DYFrDMAYt2svmNx6PTJx4nF8uVB07BC1jACoa9osd9ftVCJpFNswjb5r7tHJsV0QU
	 YS2QOCsQ8ehq5ZHVwVxIoZvYh468fmA19fmWGvlZ/ANYRFJs2Yzb15m8cIdkQGxrxV
	 zZGL9k/m11HMKpZfYHDKEsvu840rcYqcGk0pizuquVFApc0zc/7RRXHF/KPGHGlP0G
	 gyESb48cEOFRUApukcAXvIWuR/wJGOYxmjFy601ObmGJDGZsu+n3EuISMUaRrs18PB
	 j0jyLaLI2XWGD7Dh5HZ+Q0LTWkIfeq0b1lHHOoM3mOkCxbu6RFr/YlOhCR1cRDClIW
	 u1zW+1FjCGzqg==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1F8D470D46;
	Thu, 29 Oct 2026 12:47:28 +0800 (AWST)
Message-ID: <f5f822d0bfcc02458bad0379b00cd336b3aeb788.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.18 4/6] spi: aspeed: Centralize address
 decoding region management
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Vince Chang <vince_chang@aspeedtech.com>, openbmc@lists.ozlabs.org, 
	tan.siewert@9elements.com
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, joel@jms.id.au, Mark Brown
	 <broonie@kernel.org>
Date: Thu, 29 Oct 2026 15:17:27 +1030
In-Reply-To: <e0aa46eed23f6ee906030dcf6b8af73938bab8b1.camel@codeconstruct.com.au>
References: <20261029013428.277816-1-vince_chang@aspeedtech.com>
		 <20261029013428.277816-5-vince_chang@aspeedtech.com>
	 <e0aa46eed23f6ee906030dcf6b8af73938bab8b1.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCAyMDI2LTEwLTI5IGF0IDE1OjE0ICsxMDMwLCBBbmRyZXcgSmVmZmVyeSB3cm90ZToK
PiBPbiBUaHUsIDIwMjYtMTAtMjkgYXQgMDk6MzQgKzA4MDAsIFZpbmNlIENoYW5nIHdyb3RlOgo+
ID4gQEAgLTUyNyw0MSArNTA0LDI0IEBAIHN0YXRpYyBpbnQgYXNwZWVkX3NwaV9jaGlwX2FkanVz
dF93aW5kb3coc3RydWN0Cj4gPiBhc3BlZWRfc3BpX2NoaXAgKmNoaXAsCj4gPiDCoAkJCSBjaGlw
LT5jcywgc2l6ZSA+PiAyMCk7Cj4gPiDCoAl9Cj4gPiDCoAo+ID4gLQlhc3BlZWRfc3BpX2dldF93
aW5kb3dzKGFzcGksIHdpbmRvd3MpOwo+ID4gLQo+ID4gwqAJLyogQWRqdXN0IHRoaXMgY2hpcCB3
aW5kb3cgKi8KPiA+IC0Jd2luLT5vZmZzZXQgKz0gbG9jYWxfb2Zmc2V0Owo+ID4gLQl3aW4tPnNp
emUgPSBzaXplOwo+ID4gKwlhc3BpLT5jaGlwc1tjaGlwLT5jc10uYWhiX3dpbmRvd19zaXplID0g
c2l6ZTsKPiA+IMKgCj4gPiAtCWlmICh3aW4tPm9mZnNldCArIHdpbi0+c2l6ZSA+IGFzcGktPmFo
Yl93aW5kb3dfc2l6ZSkgewo+ID4gLQkJd2luLT5zaXplID0gYXNwaS0+YWhiX3dpbmRvd19zaXpl
IC0gd2luLT5vZmZzZXQ7Cj4gPiAtCQlkZXZfd2Fybihhc3BpLT5kZXYsICJDRSVkIHdpbmRvdyBy
ZXNpemVkIHRvICVkTUIiLAo+ID4gY2hpcC0+Y3MsIHdpbi0+c2l6ZSA+PiAyMCk7Cj4gPiArCXRv
dGFsX3dpbmRvd19zaXplID0gMDsKPiA+ICsJZm9yIChjcyA9IDA7IGNzIDwgYXNwaS0+ZGF0YS0+
bWF4X2NzOyBjcysrKQo+ID4gKwkJdG90YWxfd2luZG93X3NpemUgKz0gYXNwaS0KPiA+ID4gY2hp
cHNbY3NdLmFoYl93aW5kb3dfc2l6ZTsKPiA+ICsKPiA+ICsJaWYgKHRvdGFsX3dpbmRvd19zaXpl
ID4gYXNwaS0+YWhiX3dpbmRvd19zaXplKSB7Cj4gPiArCQlhc3BpLT5jaGlwc1tjaGlwLT5jc10u
YWhiX3dpbmRvd19zaXplIC09Cj4gPiAodG90YWxfd2luZG93X3NpemUgLQo+ID4gKwkJCQkJCQnC
oCBhc3BpLQo+ID4gPiBhaGJfd2luZG93X3NpemUpOwo+ID4gKwkJZGV2X3dhcm4oYXNwaS0+ZGV2
LCAiQ0UlZCB3aW5kb3cgcmVzaXplZCB0byAlemRNQiIsCj4gPiArCQkJIGNoaXAtPmNzLCBhc3Bp
LT5jaGlwc1tjaGlwLQo+ID4gPiBjc10uYWhiX3dpbmRvd19zaXplID4+IDIwKTsKPiA+IMKgCX0K
PiAKPiAKPiBUaGlzIHByb2R1Y2VzIHRoZSBmb2xsb3dpbmcgd2FybmluZyB3aGVuIGJ1aWxkaW5n
IGZvciBhcm02NDoKPiAKPiDCoMKgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9pbmNsdWRlL2xp
bnV4L2RldmljZS5oOjE1LMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJvbSAuLi9pbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2Rl
dmljZS5oOjEzLMKgwqAgCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZnJvbSAuLi9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jOjEzOgo+IMKgwqAgLi4vZHJpdmVy
cy9zcGkvc3BpLWFzcGVlZC1zbWMuYzogSW4gZnVuY3Rpb24g4oCYYXNwZWVkX3NwaV9jaGlwX2Fk
anVzdF93aW5kb3figJk6Cj4gwqDCoCAuLi9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jOjUx
NzozNzogd2FybmluZzogZm9ybWF0IOKAmCV6ZOKAmSBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUg
4oCYc2lnbmVkIHNpemVfdOKAmSwgYnV0IGFyZ3VtZW50IDQgaGFzIHR5cGUg4oCYdTMy4oCZIHth
a2Eg4oCYdW5zaWduZWQgaW504oCZfSBbLVdmb3JtYXQ9XQo+IMKgwqDCoMKgIDUxNyB8wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X3dhcm4oYXNwaS0+ZGV2LCAiQ0UlZCB3aW5k
b3cgcmVzaXplZCB0byAlemRNQiIsCj4gwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IMKgwqAgLi4vaW5jbHVkZS9saW51eC9k
ZXZfcHJpbnRrLmg6MTEwOjMwOiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmGRldl9w
cmludGtfaW5kZXhfd3JhcOKAmQo+IMKgwqDCoMKgIDExMCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgX3BfZnVuYyhkZXYsIGZtdCwgIyNfX1ZBX0FSR1NfXyk7wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+IMKgwqDCoMKgwqDCoMKgwqAgfMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Xn5+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgCj4gwqDCoCAu
Li9pbmNsdWRlL2xpbnV4L2Rldl9wcmludGsuaDoxNTY6NjE6IG5vdGU6IGluIGV4cGFuc2lvbiBv
ZiBtYWNybyDigJhkZXZfZm104oCZCj4gwqDCoMKgwqAgMTU2IHzCoMKgwqDCoMKgwqDCoMKgIGRl
dl9wcmludGtfaW5kZXhfd3JhcChfZGV2X3dhcm4sIEtFUk5fV0FSTklORywgZGV2LCBkZXZfZm10
KGZtdCksICMjX19WQV9BUkdTX18pCj4gwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn7C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIAo+IMKgwqAgLi4vZHJpdmVycy9zcGkvc3BpLWFz
cGVlZC1zbWMuYzo1MTc6MTc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhkZXZfd2Fy
buKAmQo+IMKgwqDCoMKgIDUxNyB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2
X3dhcm4oYXNwaS0+ZGV2LCAiQ0UlZCB3aW5kb3cgcmVzaXplZCB0byAlemRNQiIswqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIAo+IMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIAo+IMKgwqAgLi4vZHJpdmVycy9zcGkvc3Bp
LWFzcGVlZC1zbWMuYzo1MTc6NjM6IG5vdGU6IGZvcm1hdCBzdHJpbmcgaXMgZGVmaW5lZCBoZXJl
Cj4gwqDCoMKgwqAgNTE3IHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfd2Fy
bihhc3BpLT5kZXYsICJDRSVkIHdpbmRvdyByZXNpemVkIHRvICV6ZE1CIiwKPiDCoMKgwqDCoMKg
wqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfn5eCj4gwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4gwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb25nIGludAo+IMKgwqDCoMKgwqDCoMKgwqAgfMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAlZAo+IAo+IEl0J3Mgbm90IGNsZWFyIHRvIG1lIHRoYXQgdGhlcmUncyBhbiBleGlzdGlu
ZyB1cHN0cmVhbSBmaXggZm9yIGl0LgoKTmV2ZXIgbWluZCwgaXQncyByZW1vdmVkIGluIHRoZSBw
YXRjaCB0aGF0IGltbWVkaWF0ZWx5IGZvbGxvd3MuCgpTb3JyeSBmb3IgdGhlIG5vaXNlLgoKQW5k
cmV3Cg==


