Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F273E732DE
	for <openbmc@archiver.kernel.org>; Thu, 28 Sep 2023 14:52:37 +0000 (UTC)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gTVgTYHS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxGfr11CFz3cPJ
	for <openbmc@archiver.kernel.org>; Fri, 29 Sep 2023 00:52:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gTVgTYHS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxGdl3ZZFz2xpd;
	Fri, 29 Sep 2023 00:51:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F80D61CB5;
	Thu, 28 Sep 2023 14:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42EA2C433C8;
	Thu, 28 Sep 2023 14:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695912695;
	bh=ngdTCrwOUwR55XWtCbHA962yNGY14Ep1dAAyBjjxwQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTVgTYHSZ/4DohPeRJvnKEz4QGDirx/RUKg7f9vzVf96KqcyIsGEzI/+ijF9AUthp
	 bWD2MMbUokoHk21y8A1E16Tctsy0lD0crrPFEucksYdsdb4zcxjAU42/8ZRYod34oV
	 c1w1ke6DiVaSfK+6TEivFYAAGhCwwjM/cORRpSF9yWICf+mWnk5aBVRyVREIgiXAYf
	 GEyU0yCuWA8Mqr9JPNWnVqOIG1/L6+iANcWKPALPRDjieFmYGj7CQ2p7sU3OeT4GEM
	 jJ+6LrLbCaaPHqzypENARfRuokM3hUwwj1Xo30YVJqWB17R8n94sXj9KPwfccAsRAI
	 hlLjYjW+wJeTw==
Date: Thu, 28 Sep 2023 16:51:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jian Zhang <zhangjian.3032@bytedance.com>
Subject: Re: [PATCH v2] i2c: aspeed: Fix i2c bus hang in slave read
Message-ID: <20230928145128.tjflbgvena4apivs@zenone.zhora.eu>
References: <20230927154244.3774670-1-zhangjian.3032@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927154244.3774670-1-zhangjian.3032@bytedance.com>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, andrew@aj.id.au, "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>, yulei.sh@bytedance.com, open list <linux-kernel@vger.kernel.org>, Tommy Huang <tommy_huang@aspeedtech.com>, Wolfram Sang <wsa@kernel.org>, brendan.higgins@linux.dev, "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>, joel@jms.id.au, zhangjian3032@gmail.com, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, xiexinnan@bytedance.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Jian,

On Wed, Sep 27, 2023 at 11:42:43PM +0800, Jian Zhang wrote:
> When the `CONFIG_I2C_SLAVE` option is enabled and the device operates
> as a slave, a situation arises where the master sends a START signal
> without the accompanying STOP signal. This action results in a
> persistent I2C bus timeout. The core issue stems from the fact that
> the i2c controller remains in a slave read state without a timeout
> mechanism. As a consequence, the bus perpetually experiences timeouts.
> 
> In this case, the i2c bus will be reset, but the slave_state reset is
> missing.
> 
> Fixes: fee465150b45 ("i2c: aspeed: Reset the i2c controller when timeout occurs")
> Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>

Why I'm failing to find your v1 patch? And where is the
changelog?

Andi
