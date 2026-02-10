Return-Path: <openbmc+bounces-1339-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7871AE94625
	for <openbmc@archiver.kernel.org>; Tue, 10 Feb 2026 00:31:15 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f92Y80CZrz2yrn;
	Tue, 10 Feb 2026 11:31:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770683467;
	cv=none; b=XSh2LXfuKh9W/ct/+OZ5nA7Z9DN1nxEzH3RX/Se0S6tdf6upFkaqHPnbZXd1AKwRmwhUltvdjFNXu4LOwpgq6FIlakODJtsoyx26o/0Hf+J1BSsUGBJHbFDRlvGV7Ck59MCsDz58jAuZTqISzcGBNpEqIPIitASchQ9BP94TpMHfiAp79Jzb3r0d1R6QRPho27RgRnbLxLKOYxRctJnemqqW9JbLIQ36uWtpXNlIWOkXABYPF8VmQZmWInEScrgU4ojH3DCvg1qQkcis8fOmnzLKTC0yGs+a4ux3MQy8p5FcBzlxrQPoaF5g1o21eAOiYOhk0WE0WlOksdWHMoDFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770683467; c=relaxed/relaxed;
	bh=vIC6klmE2grs757S2BtTR4Xf9BMT0al058Lg2IE70rw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l8Yez/KRF9HdqfV1bqJVpUe3kZa/FCcuEHM7yDxsR0a5/YURdYyWcPa44X+09niah+lZPyDaBSXJ3zq2c8VYiSdLJCHbaUbzHNOfCyrZfh7q3zQhCxU8pcMgDePHHDZ6oxoEGgTx2rTj6L31S6WU1ny1KdzB/2Lht9RjzSdSQHs3nMi7O+um36f1cRDZpR2vOgFpus/mSCB3Dz7vKi+Pve2aL17+5LVmX0VpRBS5rdXxrUuM/doerzFP4WHqHB8evJRZyep3KmeBUxgyGlM92N4zQUJlk5RQhASw2buAvjQ7Gk1hH4PiYKErlodwuxnwlkVpZqcHvYkFT3QiB1Iflw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fFcjQSfw; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fFcjQSfw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f92Y66lKDz2xNB
	for <openbmc@lists.ozlabs.org>; Tue, 10 Feb 2026 11:31:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770683465;
	bh=vIC6klmE2grs757S2BtTR4Xf9BMT0al058Lg2IE70rw=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=fFcjQSfwk5xL7JlY8b7bQoORLgAySbr26ErTQGVByeFUePdI1pleid4rHIbU/26f6
	 XJRDmOZgst73UtVozgz8SZWS+Rf7fuM0H/wFEJGFQzF4yrWyfeaH4b9TJRhphYU/+s
	 rcIgsdxYIl5Oxi7AJUtpj91t7WM/mNTnGamR00lbTBZPXg26LyI9/nbZON/AEDrvfq
	 I+QNE/Y6JIHvm4Qewip7E44rSDYeRAB/ijk1NmQ1dNEhelP+Drk3bLN0KzweMyouUP
	 jh/6V6i81w5cqHq128xKcSuFx9soUZ0s8YtBUr5YHlNt1DYuD+8GGHSXpu4DLisP8X
	 EsRW1rFUJGluA==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 04897603B4;
	Tue, 10 Feb 2026 08:31:03 +0800 (AWST)
Message-ID: <9f8ff691fbee2680b3070abcc4838a964892fb72.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.18 0/2] hwmon: Add support for MPS mp5926
 chip
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au
Date: Tue, 10 Feb 2026 11:01:03 +1030
In-Reply-To: <20260130021701.2357288-1-potin.lai.pt@gmail.com>
References: <20260130021701.2357288-1-potin.lai.pt@gmail.com>
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
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0

T24gRnJpLCAyMDI2LTAxLTMwIGF0IDEwOjE2ICswODAwLCBQb3RpbiBMYWkgd3JvdGU6Cj4gQmFj
a3BvcnQgbXA1OTI2IGRyaXZlciBzdXBwb3J0IHRvIGtlcm5lbCA2LjE4Lgo+IAo+IFl1eGkgV2Fu
ZyAoMik6Cj4gwqAgZHQtYmluZGluZ3M6IGh3bW9uOiBBZGQgbXBzIG1wNTkyNiBkcml2ZXIgYmlu
ZGluZ3MKPiDCoCBod21vbjogYWRkIG1wNTkyNiBkcml2ZXIKPiAKPiDCoC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3RyaXZpYWwtZGV2aWNlcy55YW1swqAgfMKgwqAgMiArCj4gwqBEb2N1bWVudGF0
aW9uL2h3bW9uL2luZGV4LnJzdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKg
IDEgKwo+IMKgRG9jdW1lbnRhdGlvbi9od21vbi9tcDU5MjYucnN0wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCA5MiArKysrKysrKysKPiDCoE1BSU5UQUlORVJTwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqAgNyArCj4gwqBkcml2ZXJzL2h3bW9uL3BtYnVzL0tjb25maWfCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgOSArCj4gwqBkcml2ZXJzL2h3bW9uL3BtYnVzL01h
a2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPiDCoGRy
aXZlcnMvaHdtb24vcG1idXMvbXA1OTI2LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMTgzICsrKysrKysrKysrKysrKysrKwo+IMKgNyBmaWxlcyBjaGFuZ2VkLCAyOTUgaW5z
ZXJ0aW9ucygrKQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vaHdtb24vbXA1
OTI2LnJzdAo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaHdtb24vcG1idXMvbXA1OTI2
LmMKCkkndmUgYXBwbGllZCB0aGlzIHNlcmllcywgaG93ZXZlciBJJ3ZlIGRvbmUgaXQgYnkgYmFj
a3BvcnRpbmcgdGhlCnBhdGNoZXMgb3V0IG9mIGh3bW9uLW5leHQuIFBsZWFzZSB0YWtlIGEgbG9v
ayBhdCB0aGUgZGV2LTYuMTggYnJhbmNoLgoKSW4gdGhlIGZ1dHVyZSwgaWYgeW91IHNlbmQgYmFj
a3BvcnRzIGxpa2UgdGhpcywgY2FuIHlvdSBwbGVhc2UgaW5jbHVkZQp5b3VyIFNpZ25lZC1vZmYt
YnksIGFuZCB3aGVyZSBhcHByb3ByaWF0ZSwgdXNlIGBnaXQgY2hlcnJ5LXBpY2sgLXhgIHRvCm1h
a2Ugc3VyZSB0aGUgY29tbWl0LXRyYWNraW5nIGluZm9ybWF0aW9uIGFwcGVhcnMgaW4gdGhlIHBh
dGNoLgoKVGhhbmtzLAoKQW5kcmV3Cg==


