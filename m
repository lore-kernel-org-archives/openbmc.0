Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39407606A31A
	for <openbmc@archiver.kernel.org>; Wed, 28 Oct 2026 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=cB0O0/jp
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jF8Q64cXHz2ygp;
	Thu, 29 Oct 2026 01:10:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793196606;
	cv=none; b=gCRDsUPzgVpRPBg3QJUEDaBtLR7Q1mb30ErRCM6lvw8TpL6vdN1rii5U77l0UL0xbQlf54uWJxR4yUCks/eX+P9bUkBt8Y3w3QQRxQgj//uMmnA0k0YBytSMtMyqC+3D5OuZROjuil+3LaOO3xkrLEyLXDqoj0xcLL7EpC0LjoXFerumpRrySezCGYP+wwBgQ4r62F5iNdsp4HLsdRm7E4iJIFulpc5lTpbGQdFawvlZUZg+hxPEXQqIy2mvRzw6IuvndfDUE5ETugpwHiGa0tjMl0nlfcoP8zW7CJxFJ8ePRcEQImH1Y41BJbAijaxz4UGUODwnvq+NhGCp+5Wnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793196606; c=relaxed/relaxed;
	bh=4ZrAHcOzJEiYptOayyPJXdl0n6mfYo8m0PJfc5SwVT4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SFAu5sGADLVlQF/KxZSQC/Es5135rpwI7TIcp3jdsFBNZkgbFLvCfAmTq1yLlIF9u+62vwtaQBL+/O45Z4liZBghpGiLZHqP5kpcPpppmGHjxRMhA89zP8Muf3u8Yl0kJ2knLRGl5CzWego+4iKBylxubjz/L9AcQvNtoQut292IB2XWiMAb+ZVteMJSKehRio03b8XoE4a/Q1/Fb+5inEEC61PSgxTBZ7CfZaRH5HM6B2hu9zGNA2fiDKR+fQp95hXjDFWt563C/X9VHN3y8p34jz+xGOnx9p8eRzVTUk4V94IO8W1CIMD7+jfOAAPtLCDp0ZSFQUUUFVmR2HnphA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=cB0O0/jp; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=cB0O0/jp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jF8Q42g4nz2y2Q
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 01:10:03 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so9113305e9.2
        for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2026 07:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1793196600; x=1793801400; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZrAHcOzJEiYptOayyPJXdl0n6mfYo8m0PJfc5SwVT4=;
        b=cB0O0/jp0/h0DBhOb6KbBkfpV6q4wrIcC5at0d1kscJ/bSBR4d2jz9ynT/M7FX9cMU
         PmkvrDO7cFc8/AZtDl2Nmg+YnLAoeUdALHYeMl/gVPUyWT9V5dX+NZEcfzNl6YpZf8kj
         b7H2uzAsl6Tj5Cn93Qb/V1pGHYsoBHb0WsyVl6e5A+ubkPV/9a8d+XjM5kkWJ7uY8EZZ
         /ICITlqRn35p/7RqrUPlKHSbIl44P2gOdPEpMAzOyjV/g0SWvL+uhRheeO18fo+uSdDy
         rnXt1dVyqGOArco/kE14lCv4EXuetxjPNMSBDcCSVPrlzxKOaKRnitDwzJm5Bpg9n3+O
         cQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196600; x=1793801400;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ZrAHcOzJEiYptOayyPJXdl0n6mfYo8m0PJfc5SwVT4=;
        b=cgXF3Q9t7aCwf2uhpk1a3vCXUxBmK1S6rpM8/P4DYkxj6kow4D3xEpl6L4qyJLyTYp
         hK9JD9rG5Dd2cdr7o6qLiqCIixtehbVWA6i4tZCeQXfXPhzoXMQ1+3gcCAJFUw13bfnK
         XtJ6NmoJH+3m8eMqoXOw+mbUO2UWrgWKOn5pqdWOnz5W89KFevcCN/ZqE76pFVSPSq09
         ZoXbtP8O269WqLFE2qPSBL2R0l7P5GfSUGw1Kn601ysm85LsKf8URmIoBb9OCNZJS5Ke
         BBBKJusTRexxkpDAtD+on+6dv71EBC5T2JTrWO5Dizug1V8pWeOO16Y0QoWBf+gI3NeI
         h5ZQ==
X-Gm-Message-State: AFq9FYI3n/zlDqxujFvJAMscwyGtBODxW8HXqmwytjuAD9DnMyZSFFSw
	zd6PThzEgjprS9BkYKamy8McMrWXQpviA58Q7bj4KVeTAcYFBbqKO2gmSSiEgBnv2rFlfSp8pdD
	3hsqK
X-Gm-Gg: AYBFou2+42n77EBmem+Hpg4hXD3wKn40Tab+WWLUV1LrW9QhpmRy2kw+fImSqxQPR8F
	4HHtGUo/MqVqvEUGhWY+t+HyORVQ/ZptuHlcIfy3vKOdVejM9Mg2G2/4mwHUGc9QutC6gUDLS7V
	uP5/xMEJKefBxmQYdW9FI/f8c9f4fsLYsAfBlL58ls9X+0ev1iI7KYODCgKV7Tsxk55lKHsitug
	42qBv/KMe+6Nmjb4SCWo783vom6oIEHidqgP4dSfVI2j2AKRWrDssMtOp5o7XreL3A+MLrpzIrz
	qpkRFuiuN/Ik1R8DVrXIjR1RWpnauVHBjBulmH6ggx6CwauUIzsFZsMpqyfI2MAGV+8laIXSJmR
	s5qa29Cj2ijCk2wnR1+1711Xa+49HRkqOfhMSahMk+VNC2WEk748pzJAR4WyqaL58TchasWsWNO
	99ZPDSI3BnPSPAWgLyXEVlAmCsh3m8E/Zd4IJ7mCH4lENS4v1I7KYizDZ4EynUZ/XwoJQjbosIF
	kBc+u3LMlyKYLp5rZODAq6HoXXHJxKaVyWZDjNkJ1A3fyhZtSN2OQ8TjFHW7PjZV8+2+9QhpgxL
	446QOvRIFcxIqe41tFg1J/9jTf1PDWnlZz1Nq3YV07PV6j8inCXTU4G6E2I=
X-Received: by 2002:a05:600c:3b07:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4a967203057mr52959395e9.31.1793196600509;
        Wed, 28 Oct 2026 07:10:00 -0700 (PDT)
Received: from [10.0.5.39] ([2a01:599:441:aa83:be8d:8cc8:902:f501])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48fasm28478184f8f.31.2026.10.28.07.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:10:00 -0700 (PDT)
From: Tan Siewert <tan.siewert@9elements.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, 
 tan.siewert@9elements.com, Cooper Huang <cooper_huang@aspeedtech.com>
Cc: joel@jms.id.au, vince_chang@aspeedtech.com, troy_lee@aspeedtech.com, 
 ryan_chen@aspeedtech.com, chin-ting_kuo@aspeedtech.com
In-Reply-To: <20261028021914.1828256-1-cooper_huang@aspeedtech.com>
References: <20261028021914.1828256-1-cooper_huang@aspeedtech.com>
Subject: Re: [PATCH u-boot v2026.10-openbmc] spi: aspeed: Add read timing
 calibration
Message-Id: <179319659806.18585.17354252383590555371.b4-ty@b4>
Date: Wed, 28 Oct 2026 15:09:58 +0100
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 10:19:14 +0800, Cooper Huang wrote:
> At high SPI clock frequencies, the controller must delay the sampling
> of the read data, and the right delay depends on the board. Port the
> read timing calibration from the Linux driver: golden data is read at
> HCLK/16, then the timing settings of each HCLK divider, from the
> fastest one allowed down to HCLK/5, are scanned until the reads match.
> 
> Until the calibration is done, the flash is accessed at HCLK/16, as in
> Linux, since faster settings may not work without the timing
> compensation. If no setting passes, or the calibration cannot be done,
> the flash stays at HCLK/16 with a warning.
> 
> [...]

Applied to openbmc/u-boot.git (v2026.10-openbmc), thanks!

Please note: Your change will not be available in OpenBMC until the commit
reference of u-boot got bumped. This will likely happen within the next hours.

[1/1] spi: aspeed: Add read timing calibration
      https://github.com/openbmc/u-boot/commit/196cee41b402

Cheers,
Tan


