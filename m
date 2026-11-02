Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F452608556F
	for <openbmc@archiver.kernel.org>; Mon,  2 Nov 2026 15:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=22zsud3j
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jJFPP6z5Cz3bYG;
	Tue, 03 Nov 2026 02:05:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793631913;
	cv=none; b=GwUEV9xE/oKyPip1KbFzs2iry+UgfDpbgbDsw3cxGHaNqWOMUlvAD5ah5iUkXrjUfKZHHBbf+NbEnfxNpHBTlxp16Bxsh6Br9fcb9nNsSHdPtfQferK0MU+UEYFpnKq3btvbXk5JHuB/32xvCsyF2SaeWq5WtNY3pRjGr0Ft/6OfFWScah76WRZsRFUoekmDzJiyuquKNWYWn14cnPjXtxbBu5S/uDgwzVaH77irPpyHI0ew5qMqqBdOv+AOHItGb4DVH5R9NGDxVsaVikimY1b4MXnbao38a33ushc3vpylMuxD+8A9Col0byr7nNIaXOwNmjaDKWB8U4MIfKdWHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793631913; c=relaxed/relaxed;
	bh=F/vQzTFayyFkCRmqJbg1f47qlyovwSCO1GLJCd5nXcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4GPY4rHCQ+nN+MTC1jqxfjRoXjNVqade+ozZiqAq5lVQg9ae80/qqD0SC97wNtwmJmlsW+0r3wGLXd8jwPsxU3Vk4y4otLn/rPafSNDvCAy8rjF5Cur5zR4sXi/p/gC/MrbtKDS57rZBjFAMAY/Du2NgqaoPkXLgl52mp00R/3HDFfIWA7tgiT1t8YE3wzEmrCdKfw2OcKpDKdUcgXrIO9tvCwlQHorkOLjBd12GwKlZ+PdX/7GUtrRtNDsqZpsnWjhhxyBGIjSsKUoZ/iN9GaZN1DHeVUs8siJqGaRZSyRcWaeAoSBbFJ7Y5fYDkSpEnfiPyaoKWKL5KyWWRGSeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=22zsud3j; dkim-atps=neutral; spf=softfail (client-ip=35.89.44.37; helo=omta38.uswest2.a.cloudfilter.net; envelope-from=linux@roeck-us.net; receiver=lists.ozlabs.org) smtp.mailfrom=roeck-us.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=22zsud3j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=roeck-us.net (client-ip=35.89.44.37; helo=omta38.uswest2.a.cloudfilter.net; envelope-from=linux@roeck-us.net; receiver=lists.ozlabs.org)
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jJFPM4JBmz3bWn
	for <openbmc@lists.ozlabs.org>; Tue, 03 Nov 2026 02:05:10 +1100 (AEDT)
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id NmxXxLtHov0ndNtZSx7kPw; Mon, 02 Nov 2026 15:03:38 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NtZRxVs0WmTkmNtZRxWquS; Mon, 02 Nov 2026 15:03:37 +0000
X-Authority-Analysis: v=2.4 cv=eKsTjGp1 c=1 sm=1 tr=0 ts=6ae8a649
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=Bq6zwJu1AAAA:8
 a=QyXUC8HyAAAA:8 a=DlIQwTXsA3Kt32vZTR0A:9 a=CjuIK1q_8ugA:10
 a=KQ6X2bKhxX7Fj2iT9C4S:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F/vQzTFayyFkCRmqJbg1f47qlyovwSCO1GLJCd5nXcw=; b=22zsud3jyKjuE8iSOkWioVFvS2
	oPNLzxJBKdep+4vN+CFlmj6Zbz8dUR3FC89euC0/4oRtxMZI2xaFFbHWTojlkBKkxV4aAVBgM4Uru
	RtP8qmvMhLCBa+C3XAOH8Xx2k/AOIc8PLIfFhTCYzRet4QV7qVpr56BcD00Fo0VpMpJHH7huU0Ge/
	c3yH1gS1tTeBhzCxU2ZAy/qTOylpS0B2IIyHCiv2v+7oyLX1+EuafcmqSD0zZRyoNTZB4Bv8IQg0z
	xVLm4jvliPtHDfAuyEg4vHF4MJX+oSVdPWEPXCQQBWCb6doM0kj1wpuZi+dhw4khtl46OHHNHmXuM
	yW/UJ0PQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54142 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNtZQ-00000003q96-4333;
	Mon, 02 Nov 2026 20:33:37 +0530
Date: Mon, 2 Nov 2026 07:03:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 5/6] hwmon: (peci/cputemp) Add support for Granite
 Rapids (GNR)
Message-ID: <35bba1af-7ed5-41c2-8608-3c81fc823345@roeck-us.net>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
 <20261019114502.55307-6-changhuang.liang@starfivetech.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019114502.55307-6-changhuang.liang@starfivetech.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xNtZQ-00000003q96-4333
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:54142
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 5
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPaIVmUA528QxVMohWC9qs6gln/FkVBJfPeRT3sBXmYZRPnkCPJU7KD/6Fhaawz7iOjkoCrgvCrzIjnONqeXy0ON3l07qg/whAknfcFqhW4nUOg3ErIZ
 GXf3Vs8YM7G4u15j6J55eONCcvgvfgH5L44VsB5yjEE4ZI0pa48EzA/c6RwdZ7BfogX+T8lVlpnwK/BSp4h+RHYXIWGWrfK7hHJQex/Bkzc4X5HZtjjK9rhb
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 04:45:01AM -0700, Changhuang Liang wrote:
> Add Granite Rapids (GNR) CPU support to the PECI cputemp driver.
> 
> For Granite Rapids, the resolved cores mask must be collected from each
> compute core. This implementation is relatively complex. Since we do not
> use the resolved cores information for these CPUs, we can explicitly
> state in the driver that the core mask is not supported for this model.
> 
> Define new cpu_info structure for GNR with minimum PECI revision 0x42 and
> the thermal margin conversion function dts_ten_dot_six_to_millidegree().
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>

Applied.

Thanks,
Guenter

