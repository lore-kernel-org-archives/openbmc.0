Return-Path: <openbmc+bounces-1381-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707FCE81A5D
	for <openbmc@archiver.kernel.org>; Mon, 16 Feb 2026 18:08:35 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fF9kQ03kzz2yhZ;
	Tue, 17 Feb 2026 05:08:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771265309;
	cv=none; b=eeGE3h0vTwgB9WUxlgzhmTOUXfX6nzUH96Lo1wumQmPsjCO2AKtYJuh5WV51J08HXBjc0qSr0HgXlB0ga0CeQJzJJlC4vcu187iLumJkKZCULMLr3N1bQWjs1orxwcVDvVLlBNyMzM2y4mIppzzQgeJTPnmuPyVfRW04+kVRigSoboe/AtkXC/rHSC2S0L76a+bTbMtCAFa7wuNzuF04s+vytaX1AWzzOp7mvntEcyCBgrpQFES7sVbCjfnNAsadjA9hNIF8YWx51iyLiKWyUgL8BYQtFRrq5uxUwD/ETIxufHaSL576rew3tDrlnjyW+d3EVkUGAqQkoiE4Rm0pLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771265309; c=relaxed/relaxed;
	bh=ucMjGM1rG/GVCswT2oBmDmKx7hX425LQJhOOO+Wtk64=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=idykvcZnKELDxYv4EC9ZzDYtwSzks8fvfq17G4o6YOhXryUU6gC5uK6gWRv97RjazBw3RlSQutJczw0gmjXdbZ20gy4VmlpNVaXtHsJ24BpA3jiqbDDl8P8QJVrUlvHYjPugkH9U+zJFUXv9z/5Wp8mOAHPY/g/HqwbgfrC8cNywj6s73yiYf2CkjZZJO8NM/os8hcBOA5eMxI7AEb1bP6H/sONI2NCoLMmhyppVWxPssPxcUqGxGOs8P20k2ogXtxcUbWls0q/4opyUN2VC+z8ubwTgt7totgQTKRQnhXUapAWloLkWgUhaGsqpG8FCVjDAuQAbLYFG4o18roz5qA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eFbOkB0L; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eFbOkB0L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fF9kP1mlQz2xVT
	for <openbmc@lists.ozlabs.org>; Tue, 17 Feb 2026 05:08:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F142A43D98;
	Mon, 16 Feb 2026 18:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE01C116C6;
	Mon, 16 Feb 2026 18:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771265306;
	bh=17Ji2Yw1wMoI3NDkXjlPEvp0s8IDgFaWCzLP9yCO1ng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eFbOkB0L6OZw9TLZ3+s6A/lvKgzU/M3tD36XjfJ3M+KNSdruoI70ahEtj1jKeSwn5
	 twePNArkbroa5dvrQ+LGKC9088414SOBfMXpAUqJowMtIoEUcOI0iiVVsANqciUR9m
	 2bYahXvS+Vk8irHhh+T9kNU3ekuBCbeHcfxM7nQokRMW202S1eC6ssX4NTUwAWT/+U
	 AYxqp4VTxQZYo9ftCmNliUGfYTbtBfnzRoO82Ii0fC2IZ/AqWApOtJkdzV4x0q+m0J
	 nBn0Zj1rjyMbr59cy7zmnlvHsFOwKf4ut00DnbeeeIZFEj0/6nZiAAhP8zd3wukJnY
	 8o3ckzsTVMcuw==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Felix Gu <ustc.gu@gmail.com>
Cc: openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260212-wpcm-v1-1-5b7c4f526aac@gmail.com>
References: <20260212-wpcm-v1-1-5b7c4f526aac@gmail.com>
Subject: Re: [PATCH] spi: wpcm-fiu: Fix potential NULL pointer dereference
 in wpcm_fiu_probe()
Message-Id: <177126530558.153476.16439337159534333967.b4-ty@kernel.org>
Date: Mon, 16 Feb 2026 18:08:25 +0000
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
X-Mailer: b4 0.15-dev-47773

On Thu, 12 Feb 2026 20:41:40 +0800, Felix Gu wrote:
> platform_get_resource_byname() can return NULL, which would cause a crash
> when passed the pointer to resource_size().
> 
> Move the fiu->memory_size assignment after the error check for
> devm_ioremap_resource() to prevent the potential NULL pointer dereference.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: wpcm-fiu: Fix potential NULL pointer dereference in wpcm_fiu_probe()
      commit: 888a0a802c467bbe34a42167bdf9d7331333440a

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


