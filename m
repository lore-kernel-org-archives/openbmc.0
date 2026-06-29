Return-Path: <openbmc+bounces-2148-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AA8C43458
	for <openbmc@archiver.kernel.org>; Mon, 29 Jun 2026 14:06:05 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gpp3916zVz2yT0;
	Tue, 30 Jun 2026 00:05:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782741956;
	cv=none; b=fQOc/wlbw2Qrwj3+I3utPkUWnjQ31sx01zjqS2TL2N7M9vepJFwuCJxv2Kdjr6866/169SSH+x1O13ex4EmeHukBjg+vce3sUhDhz3eZX6+FjKDDCZNgY9U7GnCOrwyii7P0wymZA9X6X4x6mYwrSeeiZ90pEgjwVhH1RWSzgamwRZ16B77h4eX1+V9MvfKV7SNL6ytjEnsC59bemVPwH+3vXmbuznvxZMd9KFQTAOnlghr7W9kfdAb5TbAAxGzSrHvGrsP3edEg96kEQu2/ALDzGdFqEPp87brTk4H45C2mvuGysrCb+HL7cpbGBLl/NKwVEgkktYCRbwZnI0X3wA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782741956; c=relaxed/relaxed;
	bh=FQDCl0VsaLJ4jiS+0c0mRJtUH9gsVFTzMg1qNVlhBmo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=CaVysb+sm7RKW2FZbD1xgA1kqfOo4RNjgxyzevBxonoVBKnldxctv9qAOVnYH0Uxco+OuI536utoQu9M9WH9TeXnlOpCxgvaqcML5kOB2kC3/5F8xaGIBqekU86kM2cXjvwFIxFd0aKJbSURElK1F9V+NAdeXCSmdV+ije0U23oG9BYjMHOH6YZZf6JeEceq8XUJzy0dti6QTj5NuLeEidtr9Zz0jfxwwcjJ05bx5Zdti06MEJuURR3uqtfJM662j/5Z6TsZefSPZe7KyS3Czj79rURQtygxyM9oWWUSYUkxW5YEzz4YiBtTrjbyijs4YNv6qOmH2ShEnU9VyqRLFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=RLvRfitu; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=RLvRfitu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gpp363jwMz2xYh
	for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2026 00:05:52 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493a613571eso12444275e9.3
        for <openbmc@lists.ozlabs.org>; Mon, 29 Jun 2026 07:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782741948; x=1783346748; darn=lists.ozlabs.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQDCl0VsaLJ4jiS+0c0mRJtUH9gsVFTzMg1qNVlhBmo=;
        b=RLvRfitukuNoAoV5IArDY+8Ll9+2iF1yGYH6ukuhcE1XcrW/d8TFTQe1dx0qfkLjRu
         Tg5PbeOC7rXsnaksBXBjQAr33xDi6f3mif+KdD2RMn3z3dyj0vclnd8rNAjPLF5sbDhh
         khU777m5cfnohl8XXYHFM5H4sfwAFcM/pwtzvXiwAPpfC6xPl6ie7k6l8Z82Vyt+OYpb
         84tZh3+YtHzNnVADQKyPnfZveQVougWugSVxJdCuut36okYknpc6aSIbL0skJaLmSOR8
         RyVZgSQC7yt5Zgdqqdv0tt8gvg38RAJxNDqWXElfeiK281qi90SK+1Ui2o06RyLy5OfL
         C+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741948; x=1783346748;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FQDCl0VsaLJ4jiS+0c0mRJtUH9gsVFTzMg1qNVlhBmo=;
        b=b56X2cXh13cUgWMem7Fy5DkiO0D+/jNmE+Y+TN30llwnuX2P0Frd5EwhWNFzK77DPT
         Q1yUZtY/dFdJBWDmbHkULimM2O8GII4xln73Sm1dar1STtxoiAbUlR2plIci6CAWNbF7
         Lc+jNlFJxLkLWT0orLB2OwFSg6ql1QaqCOc/3s9QLVqmFbk5mxgR4ygyDTiQOWhIrqDJ
         K51z2wHg/rwL2ErbfO0XWmjOJ7R5C1JhaEMN483kAp9WX66I3yV7I559UjurWX5JoLWH
         AbXecIEQE1em963rNjfwhFRXXSE8TdnNmJSLuIxN4XkJwJNzvZGfjQBoP2X6nOZd10DV
         QeqQ==
X-Gm-Message-State: AOJu0YweKOysxzDWQ8DHpRTWDs7Aa/NwsywATa5XrUk7nZZxFhRyM2Ac
	xMMaBkVczAZ6AgQ+7GBpS5/XWsH2mtFGB+9ssudLoeLhJufw83FzZaYAXuPCK83D4lk=
X-Gm-Gg: AfdE7cmBZZKBDkWiMgox6y2+pwE3GZqJJK4CEdo+qzSI9rQB95ZusVlQrPa4Z8odczq
	W7oax6gXun1oyNRafeXYJvooF7ItMqB9wcoPRdorDt4bv1uFA/N2AhX136KJcYXu5ZU462tq5JN
	E1bB2H71raxHzNjIi91Nt+V5vTbM24+RUKx+eZwRnd8rApJO0rlLAuj6zXvM1VXIAAg9/G6yXs1
	f5RxGpKy7CP67MZsYqvzgnV8y4NM9ctns/jx45C35IvBoGAg0IyMmhlM0yE4daiA1oSmGURYNIQ
	cgY8P97F4RSbXoSXlTP30ydARRZmRNoqO1jgURkpnT6PIhcLsK/KvJziYmLX2YAtKneD864rufD
	HL/dYKCJsGTtMp10sx/qMz2BNZ66ZT1LiGIUUXj+xE+lWPUZCRRdw0CS9d6OcVi3QhZydM5P4u4
	kWB+7FW5zpKFoo7apS6kcysVKzC8lFDZAWuhSl4cQSlEc7FXI5bsNxlPUuGmv/3yefvfXIR0Zeb
	72eI8RbFYoU/fnsMfXP
X-Received: by 2002:a05:600c:3e8d:b0:493:a5d4:3798 with SMTP id 5b1f17b1804b1-493a5d438e1mr97111905e9.1.1782741948020;
        Mon, 29 Jun 2026 07:05:48 -0700 (PDT)
Received: from white-mocha.local (p200300e6670c9100b6e14944d2c593ac.dip0.t-ipconnect.de. [2003:e6:670c:9100:b6e1:4944:d2c5:93ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4927038578bsm258495325e9.4.2026.06.29.07.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:05:47 -0700 (PDT)
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
Subject: Re: [PATCH u-boot v2] ARM: dts: aspeed: Add Nvidia VR-NVL BMC
From: Tan Siewert <tan.siewert@9elements.com>
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: openbmc@lists.ozlabs.org, tan.siewert@9elements.com, 
 andrew@codeconstruct.com.au, joel@jms.id.au
In-Reply-To: <20260629105202.1417679-1-jackyhuang@nvidia.com>
References: <20260629105202.1417679-1-jackyhuang@nvidia.com>
Date: Mon, 29 Jun 2026 16:05:37 +0200
Message-Id: <178274193725.172081.7147250378666008406.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782741947; l=621;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=eaB+t7EDqV7u8JoIKd9NXgQkXAskCQHZxKvQSOJs+xE=;
 b=X4TwM8Ofy5u4azPxqMkWLOQGJYfVkyNxxj8AO4z4Vc385fHPPBOhsHge1fKoFxA22dw8OMthi
 o/WVpS72kKCAcNUmElsd/SSQEwQrXm4Zt61iRKrYZZlHBuoeSuJEBkq
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

On Mon, 29 Jun 2026 19:52:02 +0900, Jacky Huang <jackyhuang@nvidia.com> wrote:
> Adds a dts for the NVIDIA VR-NVL BMC board, an AST2600-based BMC for
> the Vera Rubin NVL platform.
> 
> MAC0 uses phy-mode = "rgmii-id" with no SoC-side clk-delay node, so it
> relies on the zero default introduced by commit 3f6198c0db1c ("clk:
> ast2600: set default clk-delay for all ethernet macs to 0"). With that
> change in place, MAC0 brings up its MDIO bus and establishes a link
> with the on-board PHY.
> 
> [...]

Reviewed-by: Tan Siewert <tan.siewert@9elements.com>

-- 
Tan Siewert <tan.siewert@9elements.com>

