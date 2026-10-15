Return-Path: <openbmc+bounces-2756-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8975ECC6B33
	for <openbmc@archiver.kernel.org>; Thu, 15 Oct 2026 14:53:27 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j59zz5cFXz2xSZ;
	Fri, 16 Oct 2026 01:53:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792075999;
	cv=none; b=Cvx0C8VePvudLdK7Ivp6iTGO6tHqk9y+5T86+3d6kAUls9T/fezq54GnkdY9xknMx139xMwidjxAXeuchqOqcyGH/GT9jb0CHKn//NHJJxjmUMs9b+LiPE17elCpjGkgzoOFX6XwJy4Z0ctqSrMfo9zOiXe3gL7xlC91UrWrR+/MkdClfsGk+FSWH9f0LnEvgeRD3ejPtmPJXt0ONXlxavcQn4IubWs/koLsjWPUnsHvcjBTzGCv+B41SEY1WUBLifUTL02966tVpYSPCPCEiBLoDbJZPS0KhWJKcat/6vbqVPeBem6wjFtHmeudRwNDUAPnXBOhQ47QpKQq+RdEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792075999; c=relaxed/relaxed;
	bh=nNFolf/5Pl7iChkD4w7HfQEmWjzsXeGSR9BvxDfi2Cw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U4qYGE5YPwooHztk9aQkSqoY5vBTmL5oV9SEVjioTr5ctBrNxg+nQAJTc0mpMrR8gE6avNV+hePrjZXbora7l42tisooaasDAazLc56bhu+8xsJIlvGQVA9js7ko/XAnAxkPDunZepnKZsaRrBv9rwO2parfbAoAavdNXAe5WI5v/XhmQrHB1z+wgPHIPMXnpV58sehcxrAxNTqjih87ftefRGN3tBlR77ShX+H9n2zsh7xguWl+MoWHubSyRBBgMgbqopQ+9Z1646Z+aRN++MUJvmTNp1qEZDF6TdCuo1+sMRUYLJ/oJt7MfAJ2sDBKyOaEJtjCX1ktAHb4HgIZRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SCuGbF+3; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SCuGbF+3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j59zy3B9sz2xLv
	for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2026 01:53:18 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EA0560120;
	Thu, 15 Oct 2026 14:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F711F000C4;
	Thu, 15 Oct 2026 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792075995;
	bh=nNFolf/5Pl7iChkD4w7HfQEmWjzsXeGSR9BvxDfi2Cw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SCuGbF+3BzLPq1hYhu9WvfwrXLmaTC9RkD7xRSAM9XGxwFZf9WOSMCR338nGihHWO
	 2YtQ1HHQhWee8KuU3YX/bHTXVQG74GP6t13uvcTdGLNRSpeMyQNChYnq8KgQdlUSTk
	 FWu0R8KPVq6fJ3EIqojulWvgt5gb36ZlzldJYZvEPVT259Cd1vctQJcfvUqS1T8v0w
	 Sk4s/ZSYbq0zU1+K5Gt2nRpkO5Gi+pmGSjCuhTO5cPKLpgTcuAKTq9gyYi10s4SWjF
	 mV9urKuffWOfkH4qdXy8wuBFXnRfJdu0q4lOuPcmRtbG+/5bVtzelS9JmrF5IWcSPL
	 E0UJkufitZ/1A==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, tmaimon77@gmail.com, 
 Weibin Liu <liuwb@xiaopeng.com>
Cc: venture@google.com, andrew@codeconstruct.com.au, yuenn@google.com, 
 tali.perry1@gmail.com, benjaminfair@google.com, avifishman70@gmail.com, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 stable@vger.kernel.org, Guanglei Zhu <zhugl3@xiaopeng.com>
In-Reply-To: <20261015-npcm-fiu-uma-datasize-v1-1-7dee91cadee6@xiaopeng.com>
References: <20261015-npcm-fiu-uma-datasize-v1-1-7dee91cadee6@xiaopeng.com>
Subject: Re: [PATCH] spi: npcm-fiu: limit UMA data_size to the 16-byte
 staging buffer
Message-Id: <179207339706.134795.190497503693781801.b4-ty@b4>
Date: Thu, 15 Oct 2026 15:09:57 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RNHLIxQk8X6ooDPIH8L6s/qAd8Q+9omHz90xlgl14sg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIuvLjeo6c2XVD5XKDgm5pNjM9fvch4rRTZ8aB/1pumN
 9U3BffUd5SyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAixc0M/+OqloVFphx/XREV
 d36BsUxy5QOra+v//vA9kOLtus5Y7jnD/8BDR33+rFiTJnQuKbB8WeQi9wc8zu+/Z0Qzqv9Xfxy
 fzQcA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 15 Oct 2026 10:10:12 +0800, Weibin Liu wrote:
> spi: npcm-fiu: limit UMA data_size to the 16-byte staging buffer

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/1] spi: npcm-fiu: limit UMA data_size to the 16-byte staging buffer
      https://git.kernel.org/broonie/spi/c/f0be928a4138

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


