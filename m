Return-Path: <openbmc+bounces-1927-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B90ACD4F39
	for <openbmc@archiver.kernel.org>; Thu, 14 May 2026 19:12:50 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gGg2P4wyXz2yFC;
	Fri, 15 May 2026 05:12:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778785965;
	cv=none; b=ePekmR+b1u5uHeGeV/AX09+JWeBe/7CGDpEF7encXzF9ko3LrdLiN8CJZbgAkQOCdLPnXzXE86COo/+CHvevmo0Yr7y9FH5C8C+phBT4TSF3lQwMUibgKjzSkEQ4zsWo1trnPQhUDmMTKSp8ZUc67T4Io9Ff7fLLM+dzuEtvL82kAZzX9sOyvixNnDQ0dff4DoBFioPkScDHVBDiIo/zJO0wMSeTRT1bfGY2Xe61TN+T70wmHRGYnKSlDiw4LWj3DzICSae9kgWxruKEUQ3fBHypaSzwlChlV3wjGujhKqWaW+81yZV1+e7v3+MuMgM/QiWkfx8Zl8Oq+tCGebNhXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778785965; c=relaxed/relaxed;
	bh=Camob43+mMfi7jHUeTXMYV9HAjICsHZvu/KiEn45VGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAqzS1AwaxdCxUoPDTJX+0e7ktlCNNhDgMhduthL/0VgdSAILfwBO3uOXaDK8+OqgyqY0/D4rGZ1KReb0uV2kiSYS46CvEls5lBFY8cJoWOKS68XzbfwLR/vfj/s+FljqetCTSQGetriDTPRhyT9BAvmUWn+HhycfdsiEkFYi2gZ1Gb21kmYlOJK9JHoEi879QocplXOQv7beGj+zLLQmp08Ykmx+fU4a6vwlmnM4bu0BgITAO0lR2OmhPmWwM/pGuW7pfbxshCTSd5vi51ZzQ0Y+YqamDdOfGxGTG2WhXZnfltxK7GbsH9nt0zJotrfBKztFd1dFUVGVH161ncH6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AyXuMFuD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1333; helo=mail-dy1-x1333.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AyXuMFuD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1333; helo=mail-dy1-x1333.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x1333.google.com (mail-dy1-x1333.google.com [IPv6:2607:f8b0:4864:20::1333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gGg2N5S6rz2xy8
	for <openbmc@lists.ozlabs.org>; Fri, 15 May 2026 05:12:44 +1000 (AEST)
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so19750276eec.0
        for <openbmc@lists.ozlabs.org>; Thu, 14 May 2026 12:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778785963; x=1779390763; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Camob43+mMfi7jHUeTXMYV9HAjICsHZvu/KiEn45VGE=;
        b=AyXuMFuDqE09kDY+m3+KXvk25IH8DyGtxILJK76eweQtPTWGEqh/PnVutf51TOvZxx
         2YiSf8UlJSOqvXpuKXU+nIbmYLyBqfDxFXPqs09M+LWU94jgtywATq8ykrrbsd0uAkDL
         uScULIcP9WJziHwMiZWuRrlRCC3VutP/Pws38nOes2vNhB5cayq/3lzaRqJZduoOlA2x
         t5SSX7XiQU91CogAGPrQ62gOy2fY4i2IeerL8YsL8mfSfiDtZ75Y9WoEtC9lC9PvhVIN
         6GCTYSuYfWnaPAc8Zivu1o7jpa6AFXhy8tD8RSV+xe7coWLsA16BGqkFFAQ4bZdaIXDY
         /jog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778785963; x=1779390763;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Camob43+mMfi7jHUeTXMYV9HAjICsHZvu/KiEn45VGE=;
        b=EfS0sqR9BoO/vacge+cCnWdNZudnZuasknMQEEtsRiWpbcp3oFEuxN61/RMWlyR0Zt
         r5bb5jQywdsxqk+dCBABHvJCC1Lo3r9oalUQafBP2FXNaZQjq3rxBrwEqbIMTGlSN5js
         pWpedNPARMBeKsgH4+FtYf4k3dGHAcFVu75oWON2AtV4HYuLXyWnBBV34NYTdFI/3Lwg
         TXOe7QJAfqMCighYQEKWtf2YMrtweysPK3idz4y0kXv/n5kVUFMu8KLy1kowGSRWr/rq
         +I0VxRxM+G8FnQEXw9PwJFRBD2swyFuYEXIDMNM0iOXbFkN+jWeSec+mBUpD+zra0TWf
         I7pw==
X-Gm-Message-State: AOJu0YzwzbLmO394fhViqXgGGdaaNc9Q0E+zwfuiXEIh5xmQkAfjaxuO
	ufuAZDdGhmRuQzJ291QzTFte71j+JnmDObyB6f8HUFYXQSIfSlt77T751Qa29Q==
X-Gm-Gg: Acq92OHl3e/kP0fs61BrK+uhHlZNzUXoBxVEwXZe8vAwu4dixdRaaxFu08WXqEzJcdc
	KGqJUQ0YV9uYTetLFEV1be7mNXcDHN0LjxBAgyLKj0+6/ECHzofTl95oUMAUWdGWRTGXAJagL2B
	i8kdOPDEtE2ZpAoYErNbBexFDYIqIDJ3K334wj/mW1J4p2SghODXZEps/LHvoupCcLXx1A2hWjn
	TE2aA5npPP+q0ZAUM8nc7iHDtPsTzd04PbLnEQJ/7nZGR8jfo8sbayMF32Uitk42EwWRmCDYlDk
	TG8RrIaIwVxvuzagnhfFYvoPFic6rCxOJsAJGp+tTDhQl/JdVKgdB6CZAdRjXedBb8JRfIXEfgM
	seS0/XOmM0n9IzucGGuX+ZQvPY9oPbUiiS7povJk5HbKcYCqMGhkvOSW0vbzhM3/FGzgsfEI8TS
	EUKgPNsvrR7FyQcCNRlQV+yU0X8cVKbYoidUqJ
X-Received: by 2002:a05:7300:a509:b0:2f6:811e:c840 with SMTP id 5a478bee46e88-30398681505mr452832eec.18.1778785962634;
        Thu, 14 May 2026 12:12:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffdf0sm4232845eec.8.2026.05.14.12.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:12:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 14 May 2026 12:12:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	Colin Huang <colin.huang2@amd.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH linux dev-6.6 0/3] add support for Delta E50SN12051
Message-ID: <5da4baff-2411-451c-a598-b58df9f416ce@roeck-us.net>
References: <20260514-backport-dev-6-6-e50sn12051-driver-v1-0-44d2ef6c18dd@gmail.com>
 <CAPBH0A_NbaE-gM1AOK52NCVFxVPcfMEfumQr16V3J=jw+E+FFQ@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPBH0A_NbaE-gM1AOK52NCVFxVPcfMEfumQr16V3J=jw+E+FFQ@mail.gmail.com>

On Thu, May 14, 2026 at 07:29:07PM +0800, Colin Huang wrote:
> Hi Joe & Andrew,
>   This is my first time to backport openbmc kernel repo.
>   If I miss anything, please let me know.
>   Thanks. Regards
> Colin

Yes, you are creating noise to people who are not involved in openbmc.
If you keep doing that, I'll block you at the service provider level.

Guenter
> 
> Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org> 於
> 2026年5月14日週四 下午6:49寫道：
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> > Colin Huang (3):
> >       dt-bindings: trivial-devices: Add Delta E50SN12051
> >       Documentation/hwmon: add Delta E50SN12051 documentation
> >       hwmon: (pmbus) add support for Delta E50SN12051
> >
> >  .../devicetree/bindings/trivial-devices.yaml       |  2 +
> >  Documentation/hwmon/e50sn12051.rst                 | 81 ++++++++++++++++++++++
> >  Documentation/hwmon/index.rst                      |  1 +
> >  drivers/hwmon/pmbus/Kconfig                        |  9 +++
> >  drivers/hwmon/pmbus/Makefile                       |  1 +
> >  drivers/hwmon/pmbus/e50sn12051.c                   | 52 ++++++++++++++
> >  6 files changed, 146 insertions(+)
> > ---
> > base-commit: e11fa6b1ff6c27c808d17e479bd7d5582e772062
> > change-id: 20260514-backport-dev-6-6-e50sn12051-driver-1a55edcc33b6
> >
> > Best regards,
> > --
> > Colin Huang <u8813345@gmail.com>
> >
> >

