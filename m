Return-Path: <openbmc+bounces-2057-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6638CD8CAA
	for <openbmc@archiver.kernel.org>; Tue,  9 Jun 2026 12:08:40 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gZSNy4CgBz30FP;
	Tue, 09 Jun 2026 22:08:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781006914;
	cv=none; b=HgjEDTXG2TSbNtvGpXpAN3k7ZY90HLXbmlEo5bF5Y2zjwE/Bh1aOuBfuvk6S9Xjg7NizKrW0J9eCRtdtCSon+xSTMoi3oD6OphxDxFium9AqXHCxnURVP8r7trTGNk14FjrF9qvvFULdeoCkmWp87FYgl0/ze3E/4FnYwuzVnGWSkVzEHKQ0cYlv9g0j76C9BKdnVGXd0RfGBQSQR/qIEmsEROzdmsUNEkFXXGArBhINekzXhk90TaOvrUbi67LhO9WQFJO9yKM+fp/wEtejslNuVO7TwJeuBR5EJtp/e38WRFqInwuxw0KsL7+3Z4/x3sjPC8HxmWZZmgKOMe0AuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781006914; c=relaxed/relaxed;
	bh=z4QYzDYf4/LUWmcbI+d1Kkrx+Xii4UCyajoKUl5bZMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TofJxMiYOIAAY/7YrwEV2C0Ce5OhWtfUemGb53rNsa6T+esPkeLnlpcD2zGmSbr5R4nIeBZ/0uAz6m6OAUjY2nV20f4qs55yoFGYAtxlVQI2u6wdwn+5aeSABFoYtc8hjG1UEU1ag7CKujGO7DjeM/D9z44vNsEoucfYQEVfYlHurTsc1MKqjkT3+mvz7LuViSlIywYWZG9lCGtfEIpLpbLfeMyphHSWrPng4vvvsJAiJlOwojvLNcZaWqOLdEYPL3Ixn4jwPzaA3RJI3jNkbyRyW02vOVlJ9ECDWmq27DnLlfEPV2m228PYYo1p0onxW9wTUdQgpoDUh7D0hk7Gvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C6zkuvUM; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C6zkuvUM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gZSNx5Xh2z2ySf
	for <openbmc@lists.ozlabs.org>; Tue, 09 Jun 2026 22:08:33 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E33443215;
	Tue,  9 Jun 2026 12:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE911F00893;
	Tue,  9 Jun 2026 12:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781006911;
	bh=z4QYzDYf4/LUWmcbI+d1Kkrx+Xii4UCyajoKUl5bZMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C6zkuvUMo1dX1Oo/ktt7gDmslK7EFxj38ahtkJ2xhdF/GSRgn25j7AHTBZmIcJUMT
	 JFyLmyMZMs9YbeBIkOcAoAD29R0IWlkwfFuz5Pno6wfrGhFk5aJ383vGdJW8jGo+F1
	 Zfw/8DdrADuIzwPS+e/HO+qR/5JutfPOXuNR7XR2HYiVFBE27v+Ag1YQDLgMfSV1nF
	 iDwyHxQYYScK5TJUtxONzMJ3kgRjFAatKT2/r758I9LBWIrhgac+xJLIUiOQV+MpR3
	 QDc9paWZMSQzQXiSFwxiuktCDkiW0l5ci9ZP+en6IGlKmLV6SIQzLFexkNi3N9FVRf
	 iloZ0b3GkLgCQ==
Date: Tue, 9 Jun 2026 14:08:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc <soc@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] nuvoton: First batch of arm64 devicetree changes for
 v7.2
Message-ID: <20260609-beagle-of-splendid-contentment-bbaae3@quoll>
References: <0743460993783da99c633acbfb84bfe065cb303d.camel@codeconstruct.com.au>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0743460993783da99c633acbfb84bfe065cb303d.camel@codeconstruct.com.au>

On Wed, Jun 03, 2026 at 11:25:29AM +0930, Andrew Jeffery wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoton-7.2-devicetree-0
> 
> for you to fetch changes up to eae82b6e8c2399892e145195cae9aaa0b960fdaf:
> 
>   arm64: dts: nuvoton: Add Ethernet nodes (2026-05-18 23:18:01 +0930)
> 
> ----------------------------------------------------------------

Thanks, applied

Best regards,
Krzysztof


