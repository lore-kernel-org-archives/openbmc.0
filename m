Return-Path: <openbmc+bounces-2299-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245E8C4450A
	for <openbmc@archiver.kernel.org>; Sun, 19 Jul 2026 13:50:35 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h34m35HTnz2yQL;
	Sun, 19 Jul 2026 23:50:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784469027;
	cv=none; b=HDPp7RiryC8EkqS2gJV5WIvLON42FCHlA8g5X5xD1p9d29gak1XsOkc81Ynzv6dpM/yvEgSuEhc1gZI+2Unl/NHIFqV5DI9fQ3X4ToBvXhBdztMOuSN1ryMhbkaz06nhfw944xw4B5ntLzJE7g4MKxK1ZN/df2WRG0GwBY8H9QCzb+6Mo7c/FXN11xaJ14tKdlsbEn+5zdFZOTGfRD2AqyNKfsG+XfKCL1b6aNknatBu6F+iFgrlzDNhbLdhP1sAeeBCBnxp/NJA+YGSCJAwgkbnE63FzyQDkULnMriyNuGo01bPAsdNZ7Lf8MB4bwXK4j3qcHbRW9c0iIOu7ZLhyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784469027; c=relaxed/relaxed;
	bh=orC1d/ry4EDJvubbUTs825XTGt9QUdyeUeZHc5cnAM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRBMY7If8Y1tX77vE4H7g+WywhZnBXsW6Dag47vF+g5xYegbiDj+BbVLab1dkukQHUG09rmRTu5TRDood6NywTHWMEB1102Xl5kZm55j//kPk/Ttio81wTwroRrAqA8UwsAwyk2prInhC9zn86zalIaLjorIyexhh4T90LqrwoH6hjibIxeGvuJjqXi6uvyh7eW8n9PEWpQbRohT+3e/Z/3LretuKJHAjgox+GOVyvkcycMH11OoOtMN6gK7dK63U8nTloE75O7jLBQn6yS+02pj6EC0jRY6KDDeQ7HhLv7S90UJzaYN/WuDZNK3HU5fN9Cuf+H+Iw0H/uN4ZgKubg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A/04Lc+l; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A/04Lc+l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h34m06Q6rz2xd2
	for <openbmc@lists.ozlabs.org>; Sun, 19 Jul 2026 23:50:24 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38e08baf860so6910470a91.2
        for <openbmc@lists.ozlabs.org>; Sun, 19 Jul 2026 06:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784469021; x=1785073821; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=orC1d/ry4EDJvubbUTs825XTGt9QUdyeUeZHc5cnAM8=;
        b=A/04Lc+lyTcOjf+QYnZzwugXI+kMRU5weZ3Fpl2OogxPhijum69UwnlgeKWmvFalfH
         WpNpSgKH4h2zIzL4/T71hADroFPeBud7zFlKuJK9Cg7OkZPqqCqgNn+jX57hPQzAVl+d
         f/3xUtu/5XrwE1u/uhT6C6/dmtUeZEpGV3MeX2je3A/xGyrogXt/gFIRSDC+XwBJ6VbS
         qbQeGVW0M2n9rIiOcjO6g6fR6+ROFPT1icgiFjIIqxUx25nC3lfa1NqhF6nmn5dAd0xU
         +Rl1JWejFvubjLa8IAqvfTOTzREACxOL/wbQdHu4uBZ9m4kAR/57kun9W3Yf/udzM2P5
         AMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784469021; x=1785073821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=orC1d/ry4EDJvubbUTs825XTGt9QUdyeUeZHc5cnAM8=;
        b=FOi/sAuOu5Rr7LkYWMnfgeESVBj+mtMqrkEwQa3kceAOmZHSZECAzsXhgcJHlsp1PS
         01blNZWd+1T29uGjt6J62O1bmvb6I+Ja5FuLWMWDwP9wgWqos2Wnen7/diqcGpDmuJRt
         rEc10PRaDdnambmsgalxPSn9dvgYzPVe6BDddwJBOYYHnOhGQNpgnSTrZ2KluoP9DS3g
         lh5OCNOtSsso76GR1JVnPTeu+I7vQi2M3WHk/Qq331a46PMc/+5CnL5jpFBG7T7xRy1S
         LHeKmmBuLDFE56dahDeJFBeru6s7NZ9igK1aMa/4VY0YQrwPiGEq72jZ1F0NxmTDFTeG
         HxqA==
X-Forwarded-Encrypted: i=1; AHgh+Rquud4htFn/2flei3Qjru4Gi06hDPlEMfi9MJJXXalzjJCu39KEbBABm3HuvqLPC7zYDnk08sy5@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy3YRxSdAJAFihE35Q4ZWkwrTA8RtW1AFLVgBpJx1KSv+cSAwSr
	WqpfCLrSQjdKMq2vI/5utmKk3SDXHWIbg4vBYUSHnd1+cilErJkU2B5e
X-Gm-Gg: AfdE7cnH5CBgH8u5BEZp3BZXQ843qsJciW7N0mdi+R7f/L86zASlo4PKx6Xw0x840pU
	OKfEE4UFB5pjgr/EhrYVyVi8/qerT5r6dtqsErxqAMW4s3coMKPUePfXZbZsn0eJFpRek1QAnqx
	CMP9S7MLPqqSvzqzJ/VJzR4uel2K7nyjrBwP+ga+KVeYNSg5WRtwQ4k/Q9cWMzuG53CKtRgvyVc
	Ps4ra9F+8uxPfVMRgGpKAkYGezQ40/2E9sNvW8IrAxRcnHeUrNTGLj8S9YG1ZJtW/J82jeBl5ZF
	wKFeN3A3ZZnW1AUGMD38l0PICgN+PVQTRgmDWBBPXWN7FqUcV+NaPTmfX3LtSPF7sXtPlpNr9d7
	Wq6ISVbu3ep3f80qz0H+iu5Ze4rRHctmEXnAOzIp9uXzyGdgcq6lYOEHT4GbAnIA282E5AleC2y
	yw3rOjbeSNXHoeiLQ=
X-Received: by 2002:a17:90b:2f85:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-38e4b4227b8mr9496688a91.7.1784469021299;
        Sun, 19 Jul 2026 06:50:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de7875sm6106250a91.2.2026.07.19.06.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 06:50:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 06:50:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pan Chuang <panchuang@vivo.com>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	"open list:AXI-FAN-CONTROL HARDWARE MONITOR DRIVER" <linux-hwmon@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/NUVOTON NPCM ARCHITECTURE" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 1/2] hwmon: Remove redundant dev_err()/dev_err_probe()
Message-ID: <2334832c-fbc6-4356-83fa-1e331e5ebea4@roeck-us.net>
References: <20260714130228.449233-1-panchuang@vivo.com>
 <20260714130228.449233-2-panchuang@vivo.com>
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
In-Reply-To: <20260714130228.449233-2-panchuang@vivo.com>

On Tue, Jul 14, 2026 at 09:02:24PM +0800, Pan Chuang wrote:
> The devm_request_irq() and devm_request_threaded_irq() automatically
> log detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() and dev_err_probe() calls.
> 

One patch per driver, please, and provide a reference to the patch
introducing the error message (because I can not find it). I am not
going to spend lots of time trying to figure out if this is real
or not.

Guenter

