Return-Path: <openbmc+bounces-2306-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820C2C44515
	for <openbmc@archiver.kernel.org>; Mon, 20 Jul 2026 16:11:27 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h3lrB3vm6z2yY0;
	Tue, 21 Jul 2026 02:11:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1032"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784563882;
	cv=none; b=NMJBqNtPkeaarCZtFfB00nCx4KeauWc7Rre96xlK+xH7JQR2/TPAOE+5ycYrODSH1PvfQaCaTXMAIQI9/986a70qrX7V6cHFaT6VVdWBz78jh2E00an4/t1uWvoQZ1ulm1RrPHWNyvFKhwUsRJs07Q+t/QbktdZeNEk+1LKgUCJ59lZDRmeQCefStVzIGrljZ0ysKioisdgepK2Ub2XdSREOjwJ0C8uKdrcfqRx3tFWOtobHLDaYKpn3xHF5rhvZxUsls+DvbKpaYymq512aZ4xS+mi3sKT3O7KueJKj8NP73XXlWDvqhMGChzwrVHnr25yeXqLf7wx/EdSDQJc7jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784563882; c=relaxed/relaxed;
	bh=9xxRXY8WEN0UqvALfUo+QgEc7p0+yzjzyNQ5kB5akAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yitevs7k/cnZpCGA01WJnsM9be/dLudL2jbxD4nmx/KmmP7wDcj0kf4aWiyXjdD95lEnYAXE86XDhRzJH7u1fpVitbckqAXkpFjcuK0DYpYquPmw1D0QDws58s0LpA3+m/RqiPrhpOiNVoYAn/E31VlBnupPv/xJ4tScLU7SEl9LFIgG6eyWKPJgOVmYGPFpTbfqQpHGe6tNM5pqetICUXUptqX3mx7DJcGWv9Ymcv0hBiugmHekPiMmMuLU8WToMbza64QeUnE7yNwAo/Kx7rEj5ervskbBg7a3knUTdb0ppWgtuEdjagUmLZyZXC4rUSv359AZsPajFkdgqr4zlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V0h+nR0B; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V0h+nR0B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h3lr94Xxfz2xqJ
	for <openbmc@lists.ozlabs.org>; Tue, 21 Jul 2026 02:11:21 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38e08baf860so7885691a91.2
        for <openbmc@lists.ozlabs.org>; Mon, 20 Jul 2026 09:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563879; x=1785168679; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9xxRXY8WEN0UqvALfUo+QgEc7p0+yzjzyNQ5kB5akAQ=;
        b=V0h+nR0BXQB8+t2xmrjs9HqulkMNuNFUa3irYpzY/MUlUVuzKef6T7ciuiwcV17Oqa
         zQZDMwRWCeTsNmhZBnQcIr9dZQzb7fr0Lt2SgsyqRT3k9DM7NEXVRJun16c0WWFu3seZ
         YFnPKYG5+Tkphpjxd2Ou7root34RnSYpjxTl8+UWx4oaxs/oBqrb27Mf8s32+HKlnYvZ
         ODglA81C2prg6cyahMC5rRUNAN22vUYv99MaaeAWk1ji4Qdijn4OluyoFiaLo8lTC12r
         vdYYOa/VwbVOdscnPFknRfOkkbMmRSXyJWu79ErEWClcVGdyKU6caART9/1q5HQ9n7py
         5aLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563879; x=1785168679;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xxRXY8WEN0UqvALfUo+QgEc7p0+yzjzyNQ5kB5akAQ=;
        b=cS+vLpfkOvTy02bHlqT6KRloNflhflkMmgmrYNZ7lZU/ieFPZL3NnEalxsqmyVexl7
         pMX2UTvkMnQFQzrDavY3/d2xD8hVavfROJFKPPrgHf2PhA1sogP0zcVKdcgMgEyjSZ6c
         94y27lpSsdcd1LSzW/DShWbNAGryHBw4Dm2c6og+tDqRZKPd0kBkYFUDolzJqj8X9/a0
         0PaqhEIgqstqFqO6m4yv7g57KvdvNf/0Spck6f2ORug2wvq8an6wKKPjjfrArEXyYKTf
         Bcvie6xGaKAE9Xo4mK5LfV1YOra0iKLEpbC9q5yOd9PJ6G0x5HgImowDp0OdNme7plEt
         uPGA==
X-Forwarded-Encrypted: i=1; AHgh+Rr12Hn5VJ1UtYE+a09xxrr07VxwYdfRxu/i7lwKcQAbJ0nOnw7NyjpZOXmWHbXJGZb8dHMWiUfM@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw79X1yzk6vcokghXRdJpokAYq25xg/cHB0GljdsCB81yk2kF+h
	Z8GeIfaUl+L0+YFZLRSsObgV/nQ0Z8oyMxUeB0OFN+MMoPBf0ChK2gsx
X-Gm-Gg: AR+sD10TIrjFb+mdXhgcietzFDX6nzlbZPwcjx0cZq7808FXDA39vh7RXAiAKHtLsJf
	bB9RUGnNZ05cvFXtXJ0oVb4Uw5Pjt4M+OX2l3rI9cvqAEWRJuPXnBYtFBa7+/iHkMr0bT2pLZdL
	x0KCZ9DjuMzD35LciJC7YjD+KYdAyoEeDEWQ1UkbCVhwHZQ7GWLfh2zBIpwpcCYGzpJsMbAB2cE
	un8yTIdS/hXEF5PxOhKOSUNK5Wd+8MMwl2DPDeqtnqmVttDslcAOlumzfEJhwXHkAc5Rm0RW2aK
	JaGCsHt2dfcr/qBE12gDNtYiHwkh29I1MYvqZBrPBFfEzWcVCkfo8S6V59B28FJ1edjdwQtM5Sx
	XmWKheNYab5r4etiVOWRD7lUJnNafsrUpg17q3PSNK85DStN2cqAaQ6thXPuRs2EPIk5NQhBfN3
	cAzLOiiHRaV9+BkhE=
X-Received: by 2002:a17:90b:2c84:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-38e4b422bebmr15575435a91.8.1784563879361;
        Mon, 20 Jul 2026 09:11:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2c93sm34678064c88.3.2026.07.20.09.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:11:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 09:11:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, wim@linux-watchdog.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, corbet@lwn.net,
	skhan@linuxfoundation.org, joel@jms.id.au
Subject: Re: [PATCH v4 3/3] watchdog: npcm: add bootstatus support
Message-ID: <f0a8a606-0687-4c3f-887b-ebb500e760bf@roeck-us.net>
References: <20260706144828.3517631-1-tmaimon77@gmail.com>
 <20260706144828.3517631-4-tmaimon77@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706144828.3517631-4-tmaimon77@gmail.com>

On Mon, Jul 06, 2026 at 05:48:28PM +0300, Tomer Maimon wrote:
> The NPCM750 uses RESSR and the NPCM845 uses INTCR2 to latch reset
> indications. Read those bits during probe and map them into watchdog
> bootstatus flags.
> 
> For NPCM845, cache the sampled INTCR2 state in SCRPAD10 after the reset
> status bits are cleared so later probes can report the same boot-time
> state. Also report WDIOF_CARDRESET for the watchdog instance whose reset
> bit is latched, while leaving WPCM450 behavior unchanged.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Applied.

Thanks,
Guenter

