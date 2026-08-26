Return-Path: <openbmc+bounces-2502-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B50C5DF97
	for <openbmc@archiver.kernel.org>; Wed, 26 Aug 2026 12:32:42 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hVPDf52LQz2yb9;
	Wed, 26 Aug 2026 22:32:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::531"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787747554;
	cv=none; b=NGyTVpgthGrJ39fOyyJO204S1WmfTA2UV/AAWMH1PGYbshOFAomFg+/eV2h6D1KYIdHCRCq7+e91jIw+dq8XuHQjbGWydybXpQhcavuG8NZW0tuYGZhfjek1cRpLbIfteIrQl8622yKoOMSaCqIZPZ2jOmepmEKy8d5p25ubS0qQurbasWRKt/OI+s7j8H1BVkaT2+AzObIo5uKQvQ7DKsoVoIKDv5aezRlNzY4LTXRGeV4J5I4EidH1LKA1sFbEHtmXGJbqaRFkiJYwvq+gVy+hFzAs3sOQ28qPZ5Bdp1WXuwv6ejdz6b0NP5ArMj5gAGDaF0hxVHTEegT8Uq4J1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787747554; c=relaxed/relaxed;
	bh=MjFbu9PPBkRG8Uavj7ImjBFn5RIU7iFXkV7tK9fFy6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cJ9WABGuxA31K4B4icAn6ddxkwjtlAfluwHfGufvGVHqJfJ7RaJi/Y9ZkoPbuhSKmnM/V+FTyZbTKbuWGX2+ve5ADoCHEBjpsdaUpjB5x89x1DpC3qIE9WEjZ4PJ+1H/XeArdh95Vu8PY4qk1RW7MMEyQFSW37zZCdT1hmavbTSqQcGWaYI3FwhSjNwVxNDiSOyTyY8m1upKjtnvJsLA9Ik5BE743HaLUJuyjs2utPK9wS9N5KR7XsFvx/cX7WqEVTBxlKVgRXdmPa9yvfgeeOy8I//AvVmpxcKfOclY1b61JicmGkT10ruJFumkt98cdtCwk0O7LNm8iuVzsDBxIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=FYj1iEFu; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=FYj1iEFu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hVPDc37CJz2xGw
	for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2026 22:32:31 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso1486999a12.0
        for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2026 05:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787747546; x=1788352346; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MjFbu9PPBkRG8Uavj7ImjBFn5RIU7iFXkV7tK9fFy6o=;
        b=FYj1iEFuS1eIgGeWUBx7DvQFiUnnAmreqOg8t2a2dm/zZHIabU5r8M3i0gj9Mq7BTL
         ya2u3iWR2l/8ctlxBbB+m0Fh3N6Boc4PUQgPyha8SGKnuIJMUCU34rvL0mPwzMEYs0Uu
         ZGjf2nKnuQqzEXCQmYJYClcAmB6wjfckYJHyq6MQK2/nTri8tgCmtpuHptkXhsApmQVN
         NIQFJun85jrVsbpi6I/3l0dWMwuqVv+Af2gyrkv2wOXk5NHgnEUZWA4MPvAg58rmG57e
         HHgl8X/IhGKeIGxWDUnrAy3pbvMrKKsO1NxxsNW6l7asNhjuR2kad6zoABpGrdyyh05t
         6O3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747546; x=1788352346;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MjFbu9PPBkRG8Uavj7ImjBFn5RIU7iFXkV7tK9fFy6o=;
        b=FD/9NKpj18tepUqBJs1XhLxeHymPg952Ns/dUjTnpBQB6bdDMEHEZ337QaTYX5ZGPA
         JREUvVXjUO5ynPJ5o01nHPn4zgA1dVYLUauDXr+bRc4ovzeNAyxK6DD4taBElnOOc8hr
         MIwERQfg/kXEj3mXbEMgAxUDV8o+gD1T6885X8nKixXnBx86XXnTfrw1CHHFuAQ+1jhq
         +CF8ftCDLpIHM00SHby0TYxGqY9UwVxUUt0Bx45WYhCn8bXLDoXuWEgYtwHNxZNANvxR
         YVFgO4MswOedvwptnPDh5oXE/+53Y3+H/e981Ci3/SSFoC3XJN7aNIRWvRoZiDaljvLU
         KumQ==
X-Gm-Message-State: AFuF++mTxllsR60rkeATZmE3cQdIVka7P6zwRh+Q1p3xpXQLjvvl4vkE
	9R4K6lgawNFohc9seaspy1hhxZzEWPE4FI3k/sAsoHC7j7rNifR4MhTtSJ4swxyVgU4=
X-Gm-Gg: AR+sD114343MJEEm7lM/8tzEqm7qp2gV1zfnq3dzrjxRwcXPCduPnOFveybj/sgd5q5
	GaUPx3DxFTBc2UoG4Hp1n8kdGSTrMmEzXPazWBtBIDjaNliFUGKahph5jEzp6E94HQNTiTGjn8i
	f37H8JkZJgutUV+w0Men5Wzn9koRVhy3Ex3MZqSmBU+JPhaBfjb5DQpHWXd2zVugkD0WubLKTBS
	jfjta2JU0+OPl0W0GPTQf8lIgEq/QmX1etxY/2BcpzV4nWRPN1vh1zvdmqzac/UUCCkIQz38KGt
	FGh/LjzYImMp9aLXFLl7V26zRVHm29PjZyZUQWMv5Z4bNmw2z1n4GUMaZ6Hb+1iJndjBN7QqQtU
	4hUZdasE3stVKdBULwJ31bZRSv8W0oO4wTYMYt1oCbcvs4W9ASFswrpBw5j7jRntf7qhL1A7aqM
	oxFZPoB+aJ7B6TdQtG2M3fn9hwtMKoP4JpLoQQzEy6S9QCVmd2cizYyMVT6oCDKsEroCkeCcBus
	gj9Snfq508NzfXYG/0gEYNgxbHO//N2dd419Dn5GgvMeHdku9bT2VRuYvTGID0=
X-Received: by 2002:a05:6402:a511:10b0:6a5:dfb6:3618 with SMTP id 4fb4d7f45d1cf-6a5dfb6381bmr5726243a12.5.1787747546436;
        Wed, 26 Aug 2026 05:32:26 -0700 (PDT)
Received: from [10.24.10.180] (p200300e66714e50004d65da9f76f2533.dip0.t-ipconnect.de. [2003:e6:6714:e500:4d6:5da9:f76f:2533])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5deac6848sm4010236a12.24.2026.08.26.05.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:32:26 -0700 (PDT)
From: Tan Siewert <tan.siewert@9elements.com>
To: openbmc@lists.ozlabs.org, Jacky Huang <jackyhuang@nvidia.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au
In-Reply-To: <20260825103647.3023260-1-jackyhuang@nvidia.com>
References: <20260825103647.3023260-1-jackyhuang@nvidia.com>
Subject: Re: [PATCH u-boot v3] ARM: dts: aspeed: Add Nvidia VR-NVL BMC
Message-Id: <178774754517.2950812.1412002721900378534.b4-ty@b4>
Date: Wed, 26 Aug 2026 14:32:25 +0200
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

On Tue, 25 Aug 2026 19:33:03 +0900, Jacky Huang wrote:
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

Applied to openbmc/u-boot.git (v2019.04-aspeed-openbmc), thanks!

Please note: Your change will not be available in OpenBMC until the commit
reference of u-boot got bumped. This will likely happen within the next hours.

[1/1] ARM: dts: aspeed: Add Nvidia VR-NVL BMC
      https://github.com/openbmc/u-boot/commit/edc4a61d116f

Cheers,
Tan


