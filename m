Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F422C433EF
	for <openbmc@archiver.kernel.org>; Wed, 22 Dec 2021 10:31:30 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJqPD5wmwz305X
	for <openbmc@archiver.kernel.org>; Wed, 22 Dec 2021 21:31:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oO9NEosp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=oO9NEosp; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJqNT3Kclz2xWc
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 21:30:47 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id r139so947570qke.9
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 02:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0JXm25Q0a+BSoTsSR3DtnyRvdZ4wMiBKzmlNVZDM2f4=;
 b=oO9NEospgcXyYiVtyA7pTJ/l6L6KK1peK8nNnuPH42FWJPedYKb5WL8gWj9iL0KAvI
 yIv/RZr/72bFeyDBNWMiZgwowdlXueLFlaVb7AtAHwBCqrsmSwYCE/BhfD8asnlNZMCU
 I7/5g4jBlNJr1ql+wxaNDdOBwiE+kQq2dRudLAWkEF+iqk7E4EM6KPJ9YWdxAUanFDzY
 ZP+I0Aurz7dASP6qwRs29uQq6JNYE/1T8+2q4t4wiujrlo5mV07m6Sc10nvnqKZs9d8f
 mwlnHnIPDoj5E/RrEYxSdd23DD1kJJRqtHGvw1KeXECyVt08xZQorjRWtu2JY/w/7boy
 Bp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0JXm25Q0a+BSoTsSR3DtnyRvdZ4wMiBKzmlNVZDM2f4=;
 b=PFaHksB9/Wmm1lnc8rp2Y+nx6uLwk8cz1w8tvzD39+fHW3f6DQf/sJLfWwVoqDu0N6
 jZIUlte6ds3SCYojadc4vnJ1NgLXwYaTFJwI8YFsjtqGi80ZCoyYix8891WGBLDHLZmK
 H+HFKXZa4rbTNlJr9jhL7Jed4atQkmHi2sZHFMf8f/1n/lKVs+WjHrz6oIKf1ymQt2dc
 0lDSjbdLMotITGRpStygnJ/bor1b1CWSq31CJYepaFdyC1Z2nawVmi5Ccx2jR0hvjDFv
 WpFH1Oqa1ejDqsXVaG7WJDQEgJGHVE4ynR9ESOz6awcXddUFiTgeT4pmrREyqqmIa4LK
 RHig==
X-Gm-Message-State: AOAM533LersH1rNLZn1GiW7ZDwsW1cI3A6mwgYZorLVEdSpRfQziIUp9
 CVqXDaNpG6xW4XuEoH+/4WpFjzdxCoU34JfQPO8=
X-Google-Smtp-Source: ABdhPJzzmY2HgwUnd1EmG64liRpSVxm2KvmnAycwY18u3Ih7lPRkVMwNGszwnjtE2XMXqu1m99z6S3lnEJ4sE2ztb78=
X-Received: by 2002:a37:a895:: with SMTP id r143mr638172qke.712.1640169043805; 
 Wed, 22 Dec 2021 02:30:43 -0800 (PST)
MIME-Version: 1.0
References: <CANFuQ7AkTrtrogMj4YeAe0SWQFjG1Cd9WqFAktbvsOHmtd-Qpw@mail.gmail.com>
 <CAGm54UFK6tFt64Z0aeKQWdmseJotBrtnNFgD90wjdQidU0x9Gw@mail.gmail.com>
In-Reply-To: <CAGm54UFK6tFt64Z0aeKQWdmseJotBrtnNFgD90wjdQidU0x9Gw@mail.gmail.com>
From: George Liu <liuxiwei1013@gmail.com>
Date: Wed, 22 Dec 2021 18:30:32 +0800
Message-ID: <CANFuQ7CMEh_+UcREYNM5ZZj9YxQVbbEYeZ4LUVEnq6tMBqE8UQ@mail.gmail.com>
Subject: Re: [External] Solve the problem of bad CRC when using
 u-boot-aspeed-sdk
To: Lei Yu <yulei.sh@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, Dec 22, 2021 at 6:24 PM Lei Yu <yulei.sh@bytedance.com> wrote:
>
> On Wed, Dec 22, 2021 at 4:05 PM George Liu <liuxiwei1013@gmail.com> wrote:
> >
> > Hi, everyone:
> >
> > The 64M flash used by Inspur's fp5280g2 machine has recently found
> > that it cannot be saved when setting the u-boot environment variable,
> > and then a warning message appears when rebooting:
> >
> > ```
> > Loading Environment from SPI Flash... SF: Detected mx66l51235l with
> > page size 256 Bytes, erase size 64 KiB, total 64 MiB
> > *** Warning-bad CRC, using default environment
> > ```
> >
> > Since fp5280g2 includes `openbmc-flash-layout-64.dtsi`, the initial problem is:
> > 1. The value of CONFIG_ENV_SIZE and CONFIG_ENV_OFFSET[1] of u-boot is
> > inconsistent with the size of u-boot env of Kernel's
> > openbmc-flash-layout-64.dtsi[2].
> > 2. The `Env. size` of the fw_env_ast2600_nor.config[3] file also needs
> > to be updated
> >
> > After modifying the above problem and test by:
> > 1. Use `setenv` to add a new environment variable in u-boot and reboot
> > BMC, and then use `fw_printenv` to see this value synchronously.
> > 2. Use `fw_setenv` to add a new environment variable in BMC and reboot
> > BMC into u-boot, and then use `printenv` to see this value
> > synchronously.
> >
> > We pushed a new patch to meta-inspur and it worked fine.
> > https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/49916
>
> Good to know the issue is fixed.
> Could you kindly re-work the patches to make it applicable for all
> systems using 64MiB static layout?

Sure, We will re-test and re-push it, Thanks for your reply :)

>
>
> --
> BRs,
> Lei YU
