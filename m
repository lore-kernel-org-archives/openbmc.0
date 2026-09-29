Return-Path: <openbmc+bounces-2670-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0653ACA5FA1
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2026 13:11:45 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hvJV31rLCz30Vs;
	Tue, 29 Sep 2026 23:11:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:30::e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790687498;
	cv=none; b=OA03pyxavtyYRMz4RMDl18avcH+NsOIdxbjzGwcobINWLDBxDy8mJsbS+cWTvVQQWASJ+lmFU2oNCUMmt4QFPGjYDI3bES/8Xmow3HUk0dvHEo8h8tk32aiacSzVG8vlCWxxZ6cnny5ZV15Txi/RVw3EY+gDoxQTVYOSkTJxL1GNXzpMf+5wYOgMyJ78k5uhmxzVpBtUCa2vA5UvoIw8vn/g8coSX0pIdubB5bh584o4z0DnzqgzIkcSRMNmzsKDLzxItutXY5gEP5RJ/EdaYG7QV+E2UWRO+N2QvJuofwVfdddt0fSmqMFzRdwiUD1ZSW/XQrnZYocPMonnRcgMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790687498; c=relaxed/relaxed;
	bh=Mpz0CW/tyDYK45uReOK1gyPtRn/MIJGKSBus5Bay4oU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gf9CbJgWrlhSEuB143JWMaKE2JX8qPGEHSVfmUjK0+AdovgrkuM2Jburw6ORZqd03jm3mI7P4eUzyb+CpQDkL46+/gvqj+6DQWdU+LZ4cHd1ZtxcAX/Ad+zNGtUBnlUhdJFKgX1mvlvzQ9DuP8MXnOL4cvLRsmfBHcngUZxc4YBT6lJfr7jZYQjAB5hE8r8zH19+rkLuBFULzIGg3gorTyBZAfl+GWFP7hDipdIuC1zqOBnU0RmTPhIIeSWyeA+um7HIrebydq3QAk2g2+a1zEVU3HRe5wP91vanBo5cp8ui8dcrgChgZcDm1p/cBqv25a65st17llRBQ9GQYSuUsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=JY+SISm+; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:30::e; helo=mail-wr2-x0e.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=JY+SISm+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:30::e; helo=mail-wr2-x0e.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wr2-x0e.google.com (mail-wr2-x0e.google.com [IPv6:2a00:1450:4864:30::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hvJV132skz30PJ
	for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2026 23:11:36 +1000 (AEST)
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48af5ae31d8so456394f8f.2
        for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2026 06:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1790687493; x=1791292293; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mpz0CW/tyDYK45uReOK1gyPtRn/MIJGKSBus5Bay4oU=;
        b=JY+SISm+fGnwrB73flCtT0ogsZsFDrEvu/5zHMFXfCkpSbCCxeQN40MeutghnhY+0P
         QVPaYJtvPjYc7jmBz4Adgx+LNFb4dgyWPtxp7rtb9d2Kgpeiwp88CkqldxATKuHpTAPx
         QnpKOAIYmrVgUK++Mvr7UF2dX9GhN1NZdvV9XLRfzR4spfhVfc1di2WcPptHeRwfYdWR
         nlx5rjlQ2trRGpVdm2R1bYprcWiuWZk9L5A23qp7UvUirRIuAcTJ1a7d5ViYlQTF/rbc
         gY2QfoukyJYn0chwBWbWDOu2qf6659VEOuG6BnsEE+22VfYEEr0VDavSbzPb9PAtC8VV
         E4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687493; x=1791292293;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mpz0CW/tyDYK45uReOK1gyPtRn/MIJGKSBus5Bay4oU=;
        b=Wlgv2O0vm0ctywnnUYiCVpBUSEqU/tQA5pTpAV8RzO4NXFNZzqS8j38UTyNJfpVbkx
         pwpz5js4e9/U996OI3iOw4GxBPw4sHvtxCUFXpNUMuTjnwnxyK+y0o2SvK5LF8UKXJx0
         zUOY9CfQZ4zx0kftMTuSnAhUkBlvNe1Brll7+DsTHq2IbyfF8t1ytBOBsASZYrWOHKqO
         Ds7cW6svMR0A2sB065ONsEVjlM+kKsfgLAcJxQVejAH/F8YlP/PAsCwxhyaUlt928e0E
         ByA6kRaCOfDD+sD9+Jy+7KJeK/Ir503O1iv82RjSUmFXSePo/i53lMpRrn+gAx2cIofA
         /Gew==
X-Gm-Message-State: AFq9FYLy1nq2ZZqJBLxUu1+29HAjJyvedpevwtB0Sbzi8hMLN9Yo50Fe
	gkKkTIfLvTIosnGNW7X2dF0yStC8Txw0a0LkgZaCuKOZp1vSEPbTCYlKcu5tgsZdB6E=
X-Gm-Gg: AYBFou1iQeLe9PTZXhhXhpUlqwvAJs87vFNoryQH8Ik/kOoChM5BaZVbAnXjfzBzMun
	cFQWwAb9x9yHvdfhAKtmAhqeHMcPGXI34kasQBFcZXdpd8x1iKO1DiR07UDEYR2k9MjMFF+xtgQ
	j7f1fk+VOamquGF4QNxVXGSEK4QdYWdFkLXHGgzCQU8HrEFF2xvsC86c5H9LNcqVzd10+uDTbJ1
	m4mjGiKZvlo5tK1ErG+Zu4Ka2htdfS5dAKvdIBIw0LYyQkgcK24vIWLh+/0jDJcGwue7WLuILBm
	4M3zNNlObdQnUFWfwEzHLUYCBsr8zm7keazzNUrwSLKFZ0sFXqDecwvVNjX0/WoUroL5XizC55y
	h5/IBEo1FqgXOyvyWRsc8t91OeR7Mb1rpk17SdVkXf1/ecIfFyjGeSSRUqycZhdnSsY1BzCMHUk
	GcDC8gb5VF/GjcqNv3uUm0M8W/YCvMaD7XlkiF+PwBpPu8Zwol/VkEZzQA0W3P8ExPKX2TUJI05
	doeFq7P
X-Received: by 2002:a05:6000:430d:b0:488:8436:b343 with SMTP id ffacd0b85a97d-4888a66a274mr16509614f8f.37.1790687492879;
        Tue, 29 Sep 2026 06:11:32 -0700 (PDT)
Received: from [10.0.5.39] ([2a01:599:840:1703:7492:67c6:8e93:cdb0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af4f8edebsm4237420f8f.2.2026.09.29.06.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:11:32 -0700 (PDT)
From: Tan Siewert <tan.siewert@9elements.com>
To: openbmc@lists.ozlabs.org, Jacky Huang <jackyhuang@nvidia.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, tan.siewert@9elements.com
In-Reply-To: <20260929090029.4166891-1-jackyhuang@nvidia.com>
References: <20260929090029.4166891-1-jackyhuang@nvidia.com>
Subject: Re: [PATCH u-boot v2] ARM: dts: aspeed: Support MGX Vera C2 BMC
Message-Id: <179068749081.280166.6681624378515565131.b4-ty@b4>
Date: Tue, 29 Sep 2026 15:11:30 +0200
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

On Tue, 29 Sep 2026 18:00:29 +0900, Jacky Huang wrote:
> MGX Vera C2 and VR-NVL share the same BMC module and U-Boot hardware
> configuration. Reuse the existing device tree for MGX Vera C2 and add
> its compatible.

Applied to openbmc/u-boot.git (v2019.04-aspeed-openbmc), thanks!

Please note: Your change will not be available in OpenBMC until the commit
reference of u-boot got bumped. This will likely happen within the next hours.

[1/1] ARM: dts: aspeed: Support MGX Vera C2 BMC
      https://github.com/openbmc/u-boot/commit/e48056695c57

Cheers,
Tan


