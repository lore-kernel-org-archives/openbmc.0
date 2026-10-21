Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AA5606A31A
	for <openbmc@archiver.kernel.org>; Wed, 21 Oct 2026 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=HrKE23GM
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j8s9z5ZM5z2xwL;
	Thu, 22 Oct 2026 01:29:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792592983;
	cv=none; b=dWVVRQE/vjv8Cri83xOlN9yWWHQa0vzBEULA/r2sHldt0G8cE3KVZ9B8ot/prtaVqPeDk7jqFArHIliRs83Id2Cbo5DmnVfoVJ3iTChd8bcHGp4mqlBm3xgSEcZWE0TNfNGVudo14RKmod22iQggQHi/a14JH2ipBSdQpLQNo3A2XUDq+AvJDXXKSaYO9hQLZ5jEDRATsLpBX54VHw5HXRj9K/N24HMunAfEXDJRSrLvVUlryIN3T6ZaaX355Mwz7+gOG47U27Nuc5Tvc9rPvFywTp0CZmvNLkBDa+npCzlOzJQybMXnHdoen1tQUfnW21AfzyZSPMDI26ioS0NB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792592983; c=relaxed/relaxed;
	bh=vuQN5+Enbu/9EjLZUivLxWB/32rzPmZWg0KvV5G/aw4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=csRsRkJGijDdHn5f2GEMe9+K/lLf4hub3ke607CQdB9Dgh9pMPdViYN4uFELCNafCUuC4LLONybdo3tuKjI22v0t2gHF8RwZQguLFBzzmV81oGwoDX7y91oBGdoB1OhZTbZYshZNvbYrMon2gX56fRnuMOfGImDaFhguccJ6S5+kdd7rwidHLeoum3yKIlJEqVGofbg10QPjBCQxbvMFz1LLg8hsJpirBdKi5c2cu/jH/DIJnCfwkJwvSOBUr3TvBsRqtI+YJbd893ai1v34rutf7trpZYfKpsu+ABpwqzXHED15PLKArNvQD+m1hXTPuNRbgevX3Z66ZWjbNFYjeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=HrKE23GM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=HrKE23GM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j8s9x6Jt8z2xfj
	for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2026 01:29:40 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso571299f8f.3
        for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2026 07:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1792592977; x=1793197777; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vuQN5+Enbu/9EjLZUivLxWB/32rzPmZWg0KvV5G/aw4=;
        b=HrKE23GMWgjLvcVlydeSRL4xERE2sRZ7y2NFIVTmyBbYP8ykA2WazGylIhTlxuxY/8
         TJujdFyVak+3oQ0SJpQiGbiJULUxfLgS+Uz+gAvteESbuzU8RMGOL2JIBlFpITIkT+Zf
         6U2R3foyLY1k01P4bOiduWJ9KoVp14AeT13L9djW+qRLecHyolR+gbqaYKtjcq0pN5Ti
         WhkCVQSdTGVkPCqLkwmqSqzEFuSH0bvNP4NMiU4oPMAmftof06GRNNw1Mh+h1refjS2F
         fyyW6+T18Uf/EDFpX6iG3+67RfrghUKNsa67EuFzli/1yW3CsGAGjCwGrqwFKlYA2qOW
         I36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592977; x=1793197777;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vuQN5+Enbu/9EjLZUivLxWB/32rzPmZWg0KvV5G/aw4=;
        b=UWzNgd0Eva7rixctXw1y9QZPB8WrxPaORMZBsMxLi8aLNCI2I5rNujTV7QO7t+XV46
         3q/TEtwxbSXWKeToEPHmrVnA3mfnEiubt4ohzy07l7m/pqUvQ/5QC5XxVv2HHa9HlZwv
         HOiPHtn5L69nAhuthQCUuid5IgejgQs/Gkf8w2g+6J0OaP4Ky2KoWJan/U06C6RLh8Ps
         HuKJc30DEtkisboXz9YN7fXTf/BP5QMpBJVfcM1bPaiIYliGrWyjtJ8mOjWWfzzuBZ49
         4vL0rD+9xlYpnlEIz4HrngFCtoVOvfJMqa2oPeDBQdlY7V0yVUE1iMUnvkYJbjzuI+OL
         WeyA==
X-Gm-Message-State: AFq9FYIWZBtxqz8MmdoaUs8wtzbHGHwkgDYx3VWHGyx/ypI0+kNZX4sg
	+2cfU/8MoDw5lH2LlGoUarX3Ixj+/TGTp11miz5acT4ZBpUirtL27OCX+il/MqbNwznrGs8BLnM
	B/dxU
X-Gm-Gg: AYBFou2H7x/E5WBNySbhU2czN6P3TQ97k1LzLiJy7nmM/lFsKsQnX8Gg9meJftwHpFt
	7R/DO81jtnP0Qu7IltJJtDxYhOxcysLOFvWpHL9v3SfkgqpkbUp6skuZRRYMrNe46VRN8qVu5PU
	SDXZpBpsskEMVt7oQ2kVSieo/23jRM2MsKQjZinZD0omWTdJ1hRK6UcOyhGFXz2mHjfCJ2utCch
	huL1J6bsxZjFtJ8qgaNdcYoTLq0O+nkQA3FZfrT2QMFxXR2zNmsTGtUR9DmFi1r5g7zdJ9giepc
	MIJesnS9QD/1l21Myqe1k2YIhff2OAR4XIQiiq5dkyADbUJtddQ4CpcPnYPkmxZ2RVIocPoabBh
	KSEVIiOsIswvwqyOEWvdNecESSkeLzGbXDhPtGl9nHWSYMe9W/0vyPGAT6QdMCwZIaZU9Kea+Bw
	uxEtGboYv/kXOANchgYFqf38L/Fmg9guLyucWfVo+gORldBx9FkflBiOLrzRbXOtDK/6M4AQNjw
	+SEdUcUOBA1XuHNEOaoHbeVxnmVKYBgHOjbf19FIcZYm6avuWUvMSj7OE+i9gMrLW/sEvGx
X-Received: by 2002:a05:6000:230b:b0:48d:ee59:3a30 with SMTP id ffacd0b85a97d-48e264b6937mr4282525f8f.22.1792592976669;
        Wed, 21 Oct 2026 07:29:36 -0700 (PDT)
Received: from white-mocha.local ([2a01:599:840:d3c0:538e:6c7e:a95b:180f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25b04883sm6040213f8f.0.2026.10.21.07.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:29:36 -0700 (PDT)
From: Tan Siewert <tan.siewert@9elements.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, 
 tan.siewert@9elements.com, Cooper Huang <cooper_huang@aspeedtech.com>
Cc: joel@jms.id.au, vince_chang@aspeedtech.com, troy_lee@aspeedtech.com, 
 ryan_chen@aspeedtech.com, chin-ting_kuo@aspeedtech.com
In-Reply-To: <20261020112608.131187-1-cooper_huang@aspeedtech.com>
References: <20261020112608.131187-1-cooper_huang@aspeedtech.com>
Subject: Re: [PATCH u-boot v2026.10-openbmc] configs: evb_ast2700: set
 default SPI FIT address
Message-Id: <179259296295.160587.17945895452821069701.b4-ty@b4>
Date: Wed, 21 Oct 2026 16:29:22 +0200
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

On Tue, 20 Oct 2026 19:26:08 +0800, Cooper Huang wrote:
> The AST2700 EVB bootspi command reads the FIT image from ${fdtspiaddr},
> but the default environment does not define fdtspiaddr. Set it to the
> SPI-mapped FIT image address used by the OpenBMC image layout: flash
> offset 0x420000, right after the environment, in the FMC AHB window at
> 0x100000000.
> 
> 
> [...]

Applied to openbmc/u-boot.git (v2026.10-openbmc), thanks!

Given that it is v2026.10-openbmc and not being used in OpenBMC master yet I'll
not bump the reference. The open CR by Vince has to be updated tho.

[1/1] configs: evb_ast2700: set default SPI FIT address
      https://github.com/openbmc/u-boot/commit/55801cd46f94

Cheers,
Tan


