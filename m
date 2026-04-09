Return-Path: <openbmc+bounces-1787-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE36F364CA
	for <openbmc@archiver.kernel.org>; Thu,  9 Apr 2026 22:36:18 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fsFCH2Qjrz2xT6;
	Fri, 10 Apr 2026 08:36:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775774171;
	cv=none; b=NAmoSt4WQ2eWFN9F8LuTsQnxhNIYPc+NJ4OJsbSOoeLReQqsNoX4o2PHh0mJPyRUZ5NKWk+L8S/QrV4V4Jten2q9hvn65UZKwn4BB3fieh7MjaM9d9osv+yxY4HE9hj85+FtktCyxqTK6rN0HncV8gs1LOVgra0zlkMA/7OLnHVURXaAlTWK83yCatfIgyGnsIVFo9fznuqfij37/PVzH/NvD2zCwrWB65RGmVgh2kGYjYQrvqQTlllbAOzMcspcPFJSJpdaB040wVXvkHD3G6SWgkASDLE7mW5ojg7FQKiZLoEBRxUm9vSPjRH3phJqSstOE/joFbiwd8pMBNEAaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775774171; c=relaxed/relaxed;
	bh=nRSeCsoxb94bbc+Zu2kdw4+x41P6bM+LC1ogfd4gjRo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OsAYktNVWuDnzYqkzExt7dN5Ng0G2M50Ao4VOIqq/TK7HYqMH3wX0j9rRpvCTsEeEc9XHlHXk2vGrZQcLmlihB9EqTCPZAoEguIoDfN8ZndvKcYtb21h0T5kNZSgXfAWKalZhLsRLsUYBPUkz0qaX8rxrzew2YfixYGnEI1uJwJd6uJsdDL5sbD3k1oZ+QRWywrs0XOdINBcGTK48ge+ztH1kse2nscbFv8Q8BePSsiFsFjrhc1YdWZkQuf6WAviGyqRDuEt1T9xocVBKbaS5L7Lnnyo7SDDFdqG2bi3Vr7g5EiK7vxXVNTveLm9fxf6TD6/vPpKo5XCmnB5f90wMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IzBElgKx; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IzBElgKx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fsFCG0xDMz2xLt
	for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2026 08:36:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E527A600CB;
	Thu,  9 Apr 2026 22:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7FADC2BC87;
	Thu,  9 Apr 2026 22:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775774166;
	bh=7KDt2OTJOjIV4P7r4uTqxHHU3n7htBGXxDjQtzg38qQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IzBElgKxsTa4Cc/fgKaT6D/XuyYCj9X1GpaLYD7JQUQ7qDhGWZ7NDy1m4PuBsO4sC
	 uWpTSpwEfv5EEtY9FzunO1MxU/0ErJGNjVucDTfGXOoZSycmAoc/IqA6WwU+ph5rUw
	 F+jYS1uLurQwOGYEtfVVQeWNe2l8yXqySO5no/m51+ge6BOfE6qd9F236SQ8ObYjDG
	 CdVtDi1c4PnnbfpCj3chlTB4BXy9VauDrR3kjZM2w8Z8GfVrfsA4yXrso6FhutYBGj
	 BwIeo9Uo7bmZ2Sswowua5oCgIxAyDclwBVVmVc3m3YJVe8ZVlZlU5+oThVSpiox/hw
	 W9zvZRq8xW0fQ==
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260409120810.388909-1-johan@kernel.org>
References: <20260409120810.388909-1-johan@kernel.org>
Subject: Re: [PATCH] spi: npcm-fiu: drop unused remove callback
Message-Id: <177576071181.997653.2589855752498069240.b4-ty@b4>
Date: Thu, 09 Apr 2026 19:51:51 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7KDt2OTJOjIV4P7r4uTqxHHU3n7htBGXxDjQtzg38qQ=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGnYKdGgfRtH9SuJtAbdlvZGFvEW8RJjao2uR5nnO2sKsQ3nx
 okBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJp2CnRAAoJECTWi3JdVIfQ8GUH/R+m
 kkhWHVydtgAvdA80HGPKy2KJsnr9kerD+WhO8KsuZkDS01kQ9sm4mMeWlvrVumxzCyz0ihIcTd9
 O5tgNL7CYtS4iFj/eG4uNvHbP0I10l1UwYjWzCsUwuI5gK/zS2J4pBse964rvbRyUznvr8/WIpr
 Av+Jobep/14tEnHsW0VOluqjBv/YQMxsg9QmoYuMw4bdROjAS4ycisSoF3yl6quJZmUxBX6Kqcz
 TKw4Ub+yRof/U7nLZeOSIzjj02KNBsknuGMPHqdwkhCih7Rqcpe+CJ2qmYLT9NkSxa1txRfKClu
 HxIDuyG3sRpZe7GmAwtM/xgDUWDgVQyY++VnHiI=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 09 Apr 2026 14:08:10 +0200, Johan Hovold wrote:
> spi: npcm-fiu: drop unused remove callback

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[1/1] spi: npcm-fiu: drop unused remove callback
      https://git.kernel.org/broonie/spi/c/48c0d3c6a4a2

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


