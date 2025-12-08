Return-Path: <openbmc+bounces-977-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86300D3B7E2
	for <openbmc@archiver.kernel.org>; Mon,  8 Dec 2025 18:40:18 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQ9lH4d9Fz2xSb;
	Tue, 09 Dec 2025 05:40:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765219211;
	cv=none; b=fQgIZ0Ptc9tLlWALj7HeZr6HcqRIiQ6+DTh4U+zg9OBjOwbdqt/6yzoFt8yhBG5WArxLTRAuxEHwKnsozzQr92WSSaYK63RM7aAaAgss2x5qVAtlgyapmu7s445A5CMrhDiAJoILQcbBAfJ8EQ1OguBSbpVJ2RZOntIVFEuP/lGn+e4POKpucV3jIMvys/pRD3q+RecGG1EZAm0r/Hxr26QWa46h3KWY1UseZRLJRCLlbtIWpZr+fetZqHp1YnbQ8D/xc/FJ2BQ9Oe/k14fg5BVJSW6qpIbkuiIDkU3U4QAfWY1/p5SlTLXJ1SXljABND27nLtpm/TonTsJnw86s5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765219211; c=relaxed/relaxed;
	bh=yLzKuVB9SRbRu6KABlxK9U/BOBG3oxrbOo+OTMvlotw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Go//pVN6Ind7RO8WSGUCZCG2Ux4LflHnMJHubNMqTBMcUmeMhtZI2fqNWqZQDDw+P2tX6QQHP0Dr64d6EsMLPV0tIHdiH/EW+gor9NzlpC6IolMCLFdt7vPnIbGiPB8lVWyn/cY+rD+aP+N6fYYUR+OvDGanOMcFTiEm35NZjGjmV5jzbGC/LXYtgnhINrdDqnzJ5B7hsuDUx1I7iLZrXtwi6aQDu8tfOGMDPMZByZKN4bI8NRdvqkVEEfzyMZwaBwesUlcQ242sDRHc3qqWhSO8t7E6iyVZkY0NAmjLqAsmJAWJMrwQTr0HdScJD2lBvLXLNH1Be0vsYrFuNJuEag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CLnNfxgB; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CLnNfxgB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQ9lF0VvXz2xDD
	for <openbmc@lists.ozlabs.org>; Tue, 09 Dec 2025 05:40:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=yLzKuVB9SRbRu6KABlxK9U/BOBG3oxrbOo+OTMvlotw=; b=CLnNfxgBY0q5YgCfYzG3Dlh34b
	EEtmJtTusDTKsZbTYzaXhcu0062Ml+ROgkjDjvTdVCGOyI1WiqRal51qFDhJku9JOUdVEgOoDzDvZ
	FmxiWs9IpvtAnwnVt9QhEaz94qttqk9HtlYcwgT9XnjH/nZJaOPdL+/weryaY/RvWkRN6m6m+LWVL
	vOlh2ZpvnEm5cjAi8QGFaorWBMCjGSiewTGrxtA6zy3SM4XDLPQSA6e7KPHYOjKG/wQ1R9pDzaszP
	fkakMEtmCiLYQBRpi+HMs3PVPUdX8nQCYgcBRU3ydDbye0g0QWoyOcsIQCvVqF5ATGtmMIDIZQH0A
	ZaaML9ww==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSg9Q-0000000DR7O-2RyS;
	Mon, 08 Dec 2025 18:40:01 +0000
Message-ID: <873236c8-4dab-4f1e-a2bf-d233ec74bd49@infradead.org>
Date: Mon, 8 Dec 2025 10:39:58 -0800
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
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig dangling references (BZ 216748)
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 andrew.jones@linux.dev, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-sound@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 chrome-platform@lists.linux.dev, Paul Cercueil <paul@crapouillou.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, linux-sh@vger.kernel.org,
 x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
 <aTcVXrUXVsyjaT22@shepard>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aTcVXrUXVsyjaT22@shepard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/8/25 10:13 AM, Paul Kocialkowski wrote:
> Hi Randy,
> 
> On Sun 07 Dec 25, 18:04, Randy Dunlap wrote:
>> from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
>>
>> The bugzilla entry includes a Perl script and a shell script.
>> This is the edited result of running them (I removed some entries that were noise).
> 
> [...]
> 
>> DRM_KMS_DMA_HELPER ---
>> drivers/gpu/drm/adp/Kconfig:9:	select DRM_KMS_DMA_HELPER
>> drivers/gpu/drm/logicvc/Kconfig:7:	select DRM_KMS_DMA_HELPER
> 
> For these two, the symbol was removed in commit
> 09717af7d13d63df141ae6e71686289989d17efd but these two drivers either were
> missed by the batch rename or were introduced a bit later.
> 
> Since the symbol selected DRM_GEM_CMA_HELPER (which is still needed by the
> drivers), it should be replaced with DRM_GEM_CMA_HELPER.
> 
> Are you expecting to craft a patch for fixing this or should I do it myself?

Hi Paul,
Please take care of it yourself.

Thanks.
-- 
~Randy


