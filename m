Return-Path: <SRS0=1wFR=KQ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB69C433B4
	for <openbmc@archiver.kernel.org>; Fri, 21 May 2021 02:44:44 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B37A4611AB
	for <openbmc@archiver.kernel.org>; Fri, 21 May 2021 02:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B37A4611AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmWCt2nhXz309L
	for <openbmc@archiver.kernel.org>; Fri, 21 May 2021 12:44:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Or5JnTkD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Or5JnTkD; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmWCN6xCLz2yXs;
 Fri, 21 May 2021 12:44:16 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so16802035oto.0; 
 Thu, 20 May 2021 19:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jcC2BPhSP2NvMB3uO6t0baUfqnJrAZMwkJkg1IIVnrY=;
 b=Or5JnTkDwo19CAzUVzfCSWaeYp7BhKjQH9H9APPDAsZi+K4n55OcJ7OjbLYBWWe3c8
 kIcWSMKfs5QZkDil1YvnvcTFG2rpKCTHoARKWAu0G49BpsjyW7pwb0dJ3SHTaFVKSXDo
 S9NPScpClLeS4d4S+dE5lsmsOudA2NddGf/8YsJQhoFRNbiADPKrt1n1I1fcd9utYunH
 oqM6tb4xOAZKF2MUZ9amRVE4Zjao/ei6vjEsEsCVRqs9USI2LuNGuJlMUk70LOq+Z8UP
 kUi8GrTEm5a34JJZmsAhDWUuVHQsLMNJCmCFJilKgMsPZ51GO4zInFyEQf1nTN3K0j6w
 6+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=jcC2BPhSP2NvMB3uO6t0baUfqnJrAZMwkJkg1IIVnrY=;
 b=EeMcCTItD8Gdhu6c93IRBGyZlHCCtPmS9rqjd32+/BHhmgBhr0lrbvfhQrXmDCiYpK
 hkjq839/ttMXFaelUkMZ0aLb/46D7QWpRqFdvoge2LSIojAh6SlSNu1T/c7XH+X3zzbW
 vxjVr3QZx9mtETHiYeosI8kQtWsod/xsPZaoOou84u02uCle3lm8axL9xgH0Clb3xXtP
 sC2Bm1ADwuKujCoRNy2Y5M2jE1yAwXU2GLOSS8+nFS7e97FuwzQz+480Rb3ysZ++4Lcw
 Ozh0HiQejmCuPxtgOD3Qs4E99PvXD2rypsPtBed6Aa6RA+S8cs1Gd5gUvbmiBXVx8XRx
 +20Q==
X-Gm-Message-State: AOAM533V0wcuvk7+9q0tM8kgeaAFsJ0JK94WlSM/IaFEKhGFQWElvXX6
 PXEDZ1AHysBE7TiPh1XgSi4=
X-Google-Smtp-Source: ABdhPJyU5xC3uLF/gHpo7/4DLq7k50dsX1NXyEpLLTlLM+N3Af9OUbfYSVNq/v0+66OfeSCLZwnE6A==
X-Received: by 2002:a05:6830:1df7:: with SMTP id
 b23mr6226393otj.163.1621565054401; 
 Thu, 20 May 2021 19:44:14 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id x9sm772536oto.79.2021.05.20.19.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 19:44:13 -0700 (PDT)
Date: Thu, 20 May 2021 19:44:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tao Ren <rentao.bupt@gmail.com>
Subject: Re: [PATCH] watchdog: aspeed: fix hardware timeout calculation
Message-ID: <20210521024412.GA3004726@roeck-us.net>
References: <20210417034249.5978-1-rentao.bupt@gmail.com>
 <20210417042048.GA109800@roeck-us.net>
 <20210521015153.GA19153@taoren-ubuntu-R90MNF91>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521015153.GA19153@taoren-ubuntu-R90MNF91>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Amithash Prasad <amithash@fb.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, May 20, 2021 at 06:51:53PM -0700, Tao Ren wrote:
> Hi Wim,
> 
> Not sure if I looked at the wrong repository/branch, and looks like the
> patch is not included. Do you have any further suggestions? Or should I
> send out v2 in case it's missed?
> 

Wim didn't send a pull request in this release cycle. I have the patch in
my watchdog-next branch, so he'll hopefully pick it up from there at some
point.

Resending the patch would just create noise at this point; please don't
do that.

Guenter
