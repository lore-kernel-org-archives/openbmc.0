Return-Path: <openbmc+bounces-2150-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D308C43458
	for <openbmc@archiver.kernel.org>; Tue, 30 Jun 2026 15:48:45 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gqSHC4D7Kz2yfy;
	Wed, 01 Jul 2026 01:48:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782834519;
	cv=none; b=BSpE7KUGd4Uisw5yhXMeHSiV+PaAvtSIwj4ikYtHHgqDar7Jbb5lfu4XlS1e8RRfcDz1uhfHJTkDWyIb4iwO94L1sgLzJRZRt1iEeP+BGbzEiPS16YoBLk2eLTE99HAiNpiljg9F8eYDqGw/7xhUPQhpqOKFlFu4siEtoCIHTnRBE7Tn0kFRsBcWObUVT+TaTTBYtX6LVF8ZXUsP/yQxoRdPk2Tx0cR3vW5DTrhlR1mMai5AMLERiRNe00aPYa0E6m2qNj0GvmHalLFNq6all0mT5tG7PSrrgzfc/FUY+qi8QFHGpKJPrkJcHj71D5m1/JMpauIMtVWz2v83QPmYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782834519; c=relaxed/relaxed;
	bh=kBZEp1JFxrH/4OTzag8TPsknqgwJ7BFgp8gDsVB7jmU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hGElYZDJph/IUk3E3cIUhs9o1Y8wRA4riW36QE45jfCobvnZlRb6IayjDu2s1WEhilrmlVPZVHXuARKHvfghWW9CWgoyj3I8bvqDmQH+yzCWfRoT4tYsHBRyXtNihA3T9TvZpCbeSc7/6UQnaMSwOBJSWnx51oNIivw0BV2bOCVwuCUWhfh1ExCNeW62xezZPzFC60h9refHZPhiTuyGS794feGd+oowq4WyrKC661xqlAq/0AGTeRwHR8zp2OM8/wJ/6TvNCCZtKwMd8ZBMC1GjAuTYX6XKT4jhwJ+Y5RsQj8I9rvmEPD34bY7YrCGpUE/Npn+goCGvICSwuCZkjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I6S3xUgf; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I6S3xUgf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gqSHB51R3z2yfS
	for <openbmc@lists.ozlabs.org>; Wed, 01 Jul 2026 01:48:38 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A2D2600BB;
	Tue, 30 Jun 2026 15:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660E81F000E9;
	Tue, 30 Jun 2026 15:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782834516;
	bh=kBZEp1JFxrH/4OTzag8TPsknqgwJ7BFgp8gDsVB7jmU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=I6S3xUgfLWgtD/1WNCeojQbewX/lB8YneJcPSxuul6xb+FCzhDQ2o8t0l/Chl7tt8
	 zc/tSkvtUI1DH0omkpWyNwxRffWGQTJzH2J5u8cOlX5jxc/EJVUxEtdEFGlfyaLnRA
	 K+kgVo6l63dcQ1HZ8UmtHHJfLLbgxPOotG8SBoKN836QZpY2/PdKd17ME+hC5aERZy
	 B3AUeOpW9V8BS9DCj169mLwhxs2xg4n/4WmpFcydwPX3hb+FKBC37+0ei6MBlfFIgs
	 xPjnr35yP1muyBZrZRnf6UOXAvR8bZ1UFjIUw8uJs5j6QPTttYMaH4Fn36MPH714Z6
	 vfLaxO9+xemGQ==
From: Mark Brown <broonie@kernel.org>
To: andrew@codeconstruct.com.au, Tomer Maimon <tmaimon77@gmail.com>
Cc: openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, avifishman70@gmail.com, tali.perry1@gmail.com, 
 venture@google.com, yuenn@google.com, benjaminfair@google.com
In-Reply-To: <20260609071458.2692482-1-tmaimon77@gmail.com>
References: <20260609071458.2692482-1-tmaimon77@gmail.com>
Subject: Re: [PATCH v1] spi: npcm-fiu: support dual and quad UMA writes
Message-Id: <178281884964.79320.1074539689471418305.b4-ty@b4>
Date: Tue, 30 Jun 2026 12:27:29 +0100
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
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3aT6CxRg123m2reAq5WHrVZnVtYMLxc+eKx+bwlOyv0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ+VRWpZb2kjWue0V0lyE0OjAH3ImoIn1Sg0g8
 LKQ+JtUNjSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakPlUQAKCRAk1otyXVSH
 0CBtB/9u8MLuDpmoFlcJ8j6sseelqY4nWeIAaQ8WaiJg0cfVCLlDp0kfqVta/cj5QrCWfEnfQyx
 hgMOWzoFuGc9BeVQCRJfDkhZQwGTdG/9PiUdFCvb/M2J+RFeW3A+dJ3MmiPqJaqr93bCZtvLMml
 wGwqFW7FUWioOOBCA8McimvnwBFc+GCm7hn9h0ykbZWs6Bw+g6ZD287l7KjYBcby2G14AOsSkrv
 B732j1ik9658Fk6YmuoGEUHLJOSJ+Ikrjfks8NBAS6xDGn413r3zdPX3KjTy9XaVFNRBrf1AL0v
 VOLrrXc4OwVFvcV8ABEkKQbne3Rp9RONcDDEcOgwxGTpNabR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 09 Jun 2026 10:14:58 +0300, Tomer Maimon wrote:
> spi: npcm-fiu: support dual and quad UMA writes

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/1] spi: npcm-fiu: support dual and quad UMA writes
      https://git.kernel.org/broonie/spi/c/06f2005b9421

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


