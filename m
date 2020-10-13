Return-Path: <SRS0=a1Tx=DU=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AF7C433E7
	for <openbmc@archiver.kernel.org>; Tue, 13 Oct 2020 21:30:57 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EB1821582
	for <openbmc@archiver.kernel.org>; Tue, 13 Oct 2020 21:30:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="nY30yW+W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EB1821582
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9pct0648zDqmY
	for <openbmc@archiver.kernel.org>; Wed, 14 Oct 2020 08:30:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=nY30yW+W; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9pbD3D17zDqMl
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 08:29:26 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id s66so1507259otb.2
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 14:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BQVUP6sy3PX6Q3C2BLkQ+7wHeBtTeqDYnlZeUE9CcjA=;
 b=nY30yW+WJ9MyaUbcO1v/mKwFDXq94hxYfbWo/1L56jEnYbDaOUoYy9nIdcUT28q/3c
 Uq9y09kxs8N4qWd/Ff1kdavb8TyIc6oBlU3oviAsPjgw5zqHaKMjWs85k6EGx1lxqE03
 VQTguqayk1ztH//dzkEuTPpRd/rbKtMe5TYkZHhAmRaVfWU6khywIlm/eXZEB8R3YU/t
 RvblJocOk1w4YKITaedGGSW+l4IlsJxZKuoRhJl4WWr78Rm5iE0CXNAtN8R0QHvYHTcS
 E2nLmPwqNzyIxnEb9m2N39CFYlvmttezElfEknCVV0scF33M9yCSq3OfXIi84EC3hOJ5
 U74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BQVUP6sy3PX6Q3C2BLkQ+7wHeBtTeqDYnlZeUE9CcjA=;
 b=fB5vHP4phenrD9BO7HddMFtOLXFndMVrHb+sanvDMAUhVLeP45VozM2XePqVtwPQVa
 sdlQ1ZH21MP64S4KoseGdffE2woDSvbyFVUekWQDVt7hzLuy2Cu77fzIyetkPUFRB6FW
 MeLyeJUHH3rEFGXPzxwIoyEzlJ08wiO1sdd2oxZUDobCoGkiWILratElalq5ylg470E6
 ArfnIcp+MgQMqnjoXHV8czoz6dapp2YcQ9258RL7fFJHWU5ejtIJTAFcTQB4rG1jYfxa
 At3/ke92JE1+lJAwqzMrvYOWs4ZAqGHLnsoh3LDJgY6XsM2ilqLuRdaQa+Ex8Swxfnd4
 GFiw==
X-Gm-Message-State: AOAM533z6FrTUbH/FM5w+xbJdTQ3Te9wRvMBLAj4T8/mMNl/6hS6TLsx
 gxgvWBfX0Z3MhUgah2oTPhUKV75y79OQHk8yJUAQow==
X-Google-Smtp-Source: ABdhPJyWjnabEyver0ZLJs3j3vpJ6dQJC3dFlcNQoNysjkLGxpSekou/SW+1ozZsc27Ff8tuKWkk2Jcm4I0Yp/Rrics=
X-Received: by 2002:a9d:7b59:: with SMTP id f25mr1167062oto.306.1602624562402; 
 Tue, 13 Oct 2020 14:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201013100314.216154-1-tali.perry1@gmail.com>
 <20201013115023.GL4077@smile.fi.intel.com>
In-Reply-To: <20201013115023.GL4077@smile.fi.intel.com>
From: Alex Qiu <xqiu@google.com>
Date: Tue, 13 Oct 2020 14:29:11 -0700
Message-ID: <CAA_a9xKSYjjX47AT_XduA7WyrM5nCNu4vJLUsjwBEAyy7jn0BQ@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: npcm7xx: Support changing bus speed using debugfs.
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Benjamin Fair <benjaminfair@google.com>,
 Avi Fishman <avifishman70@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Tested again, and the updated patch is still working.

On Tue, Oct 13, 2020 at 4:49 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Oct 13, 2020 at 01:03:14PM +0300, Tali Perry wrote:
> > Systems that can dynamically add and remove slave devices
> > often need to change the bus speed in runtime.
> > This patch expose the bus frequency to the user.
> > This feature can also be used for test automation.
>
> > --
> > v2 -> v1:
> >       - Fix typos.
> >       - Remove casting to u64.
> >
> > v1: initial version
>
> Above block should go after cutter '---' (see below) line...
>
> > Fixes: 56a1485b102e (i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver)
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Reviewed-by: Alex Qiu <xqiu@google.com>
Tested-by: Alex Qiu <xqiu@google.com>

> > ---
>
> ...here.
>
> >  drivers/i2c/busses/i2c-npcm7xx.c | 35 ++++++++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
>
> As we discussed previously I'm not a fan of the functionality this gives and a
> way it's done, but this is debugfs and not anyhow an ABI. Also it's localized
> inside one driver. In the future we may come up with better approach.
>
> That said, no objections from me.
>
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> > index 2ad166355ec9..633ac67153e2 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -2208,6 +2208,40 @@ static const struct i2c_algorithm npcm_i2c_algo = {
> >  /* i2c debugfs directory: used to keep health monitor of i2c devices */
> >  static struct dentry *npcm_i2c_debugfs_dir;
> >
> > +static int i2c_speed_get(void *data, u64 *val)
> > +{
> > +     struct npcm_i2c *bus = data;
> > +
> > +     *val = bus->bus_freq;
> > +     return 0;
> > +}
> > +
> > +static int i2c_speed_set(void *data, u64 val)
> > +{
> > +     struct npcm_i2c *bus = data;
> > +     int ret;
> > +
> > +     if (val < I2C_FREQ_MIN_HZ || val > I2C_FREQ_MAX_HZ)
> > +             return -EINVAL;
> > +
> > +     if (val == bus->bus_freq)
> > +             return 0;
> > +
> > +     i2c_lock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
> > +
> > +     npcm_i2c_int_enable(bus, false);
> > +
> > +     ret = npcm_i2c_init_module(bus, I2C_MASTER, (u32)val);
> > +
> > +     i2c_unlock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
> > +
> > +     if (ret)
> > +             return -EAGAIN;
> > +
> > +     return 0;
> > +}
> > +DEFINE_DEBUGFS_ATTRIBUTE(i2c_clock_ops, i2c_speed_get, i2c_speed_set, "%llu\n");
> > +
> >  static void npcm_i2c_init_debugfs(struct platform_device *pdev,
> >                                 struct npcm_i2c *bus)
> >  {
> > @@ -2223,6 +2257,7 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
> >       debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
> >       debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
> >       debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
> > +     debugfs_create_file("i2c_speed", 0644, d, bus, &i2c_clock_ops);
> >
> >       bus->debugfs = d;
> >  }
> >
> > base-commit: 865c50e1d279671728c2936cb7680eb89355eeea
> > --
> > 2.22.0
> >
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

- Alex Qiu
