Return-Path: <openbmc+bounces-2671-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277ACCA5FA5
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2026 13:20:05 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hvJgf3VsTz30Vv;
	Tue, 29 Sep 2026 23:19:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790687998;
	cv=none; b=D/5yGHTAsi0KxczIpwRILrpuGKaiyMo0kx3Fk2NNHRDHNNxNdOOUWCn1G6AIHv7+h6L8zRj7NCk1joOPd6RD2Mb9u99wZk4x5tv4kZuBpvPIpeYRmTSzFeWaVdA9D0Rv7bqO0xBVfeD3u91kiTLPi/3cePs222bZ5MgHx3rr9MeaHfYlrDfSFvWY7srkxvSCAw1VrVSwxt8IeHD14/29yVCP5w5T0cGsweh6aajVo1myt7wsX2uNdgX1PUxSbkakUbd+Fqu8tcOE05Zqq/32NvXRB+xWmcJ0Kx8iP7OVLtXbhWHHy28yZZ9Lwb4wvh/4HlGnw6B7Ojs4oubZMfbHbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790687998; c=relaxed/relaxed;
	bh=kk70s/N+uM0L6UySCCANmt/AXt6wXop6hML2fV8Jn6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckdHhmwYTZhwl+t/W3qIYuagm4SrTwg95Fu64hNGpvo7abEc38AajcTQUFqXlxG35eY7txQPGlUf2R+tNXh88xxAcUrCc5/Q864uta/ZsNOK7l6Qc7hMDNOgRc0yvRHw/gJKIREZ0NHC8UHcznx9CFoYsxo0Gd37752PnWu1PNpC0JLd9TTcn/uFW0XhYm4XzqQsIz8kysliPznym1wyZq29ZEksXhwXCSm5uFrUQO1wZkmBuSqefC0bEwChmoGKCsdrc4uVL09bnwtTYWN2cc2KcWl2EqthfIWHrSHdphEuDcqg46+XO+2LdRNhdtanbVNYKpFljbQiCN5CtJMKJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=WA23zJEr; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=WA23zJEr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hvJgY6HN3z30Pp
	for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2026 23:19:53 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8595B600D1;
	Tue, 29 Sep 2026 13:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF381F000FF;
	Tue, 29 Sep 2026 13:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790687985;
	bh=kk70s/N+uM0L6UySCCANmt/AXt6wXop6hML2fV8Jn6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WA23zJErPJHxnXCor97v34qsNsOgL/sATdXkTmNuQZdVC9PYit5HPHkCQn50iRZaA
	 QGtETVnRuqD3TiEKL3ZGKuNc0jOw4AXSia9ZZngJGfivHAo4BEv8OX3PgIzGtweaqg
	 lAESsSpsiuRSqASnnhjD1C9pHyfUr3fpNKRgIozc=
Date: Tue, 29 Sep 2026 15:19:39 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] PECI changes for v7.4-rc1
Message-ID: <2026092907-clique-pod-9eee@gregkh>
References: <14b83bcafac21987132c08a23043254c6c43e3ec.camel@intel.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14b83bcafac21987132c08a23043254c6c43e3ec.camel@intel.com>

On Fri, Sep 25, 2026 at 09:20:59PM +0000, Winiarska, Iwona wrote:
> Hi Greg!
> 
> Please pull PECI update for Linux v7.4.
> 
> Thanks
> -Iwona
> 
> The following changes since commit 93f51579e7df248780214094418f205253383cc5:
> 
>   Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwi/linux.git tags/peci-next-7.4-rc1
> 
> for you to fetch changes up to 425125e6d408b5969afb99c3e95a391f1f1ad81d:
> 
>   peci: npcm: Initialize state before requesting IRQ (2026-09-25 22:20:38 +0200)
> 
> ----------------------------------------------------------------
> Update peci-next for v7.4-rc1
> 
> Small fixes in controller drivers including:
> - fix for uninitialized clk_init_data structure (peci-aspeed),
> - moving lock and completion initializations before registering
>   interrupt handler to avoid using them uninitialized (peci-aspeed,
>   peci-npcm).

This is based against 7.3-rc4, which is ahead of my char-misc-next
branch.  I'll wait until I get it closer before pulling, is that ok?

thanks,

greg k-h

