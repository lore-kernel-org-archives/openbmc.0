Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4003:c06::242; helo=mail-oi0-x242.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lrMVfpcb"; 
 dkim-atps=neutral
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QSlK46zWzF37B
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 15:47:41 +1000 (AEST)
Received: by mail-oi0-x242.google.com with SMTP id s198-v6so47064266oih.11
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 22:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DbR/PI6cy7UPcmUfX0yu0GnrPCYrYwbD/VPJe5UuE3U=;
 b=lrMVfpcbl70bjsebEAO2N6goLM6shzVNFBMbjw2ic4kYVSk1t62mS5nBzQroAnEm8G
 HeecK/CAAPJ44fuxvcOoRM+DBubnJHYBWDSjpYFrHkm8/5g9zkfZJDmLCsv/r8Z8ixK/
 +iC70zqriHk1q+0f5z6rmUb+ppmaJ8JokoeI9dnOdobGY3QHKgOxU+Tm4eI2llqVBQIu
 lYC8kAFV8Ls3u2M/TVBe32PF9WNuScO48sC3cptqZsr2fDeF3zE+TwIdse/rQ1yzWyTf
 jfoqcrmXHbVdGehw7/WjkWymZIy+fEKMBkHHz7MuUu5QLIIVvye9SRe1RZppsqcLGIdW
 9Y2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DbR/PI6cy7UPcmUfX0yu0GnrPCYrYwbD/VPJe5UuE3U=;
 b=VFplBC305d9KJKnciH+hApThk1B9c2sYVZtX9u2wDEgM1xQB5A05b2RQ2dxFG+jAA4
 Kcvk+ql+qQVpQtZVp69rIMQoB6tt0td9okZPGJM2g08T/Qt7lqXEfQ7n4bGuXCzGYhFI
 0KL7chY9GsZCOg4hle3PqzeHBTcMYvMfSfkVJL9oKdoQmqQXux1j2KaCJpcL/2VdlxJg
 E3B805r7JJzNbq5fcWeVr0lKsQF0bkW3dROMpgJDjGufLHuuRis+hUzS8wPCItYjE1Wq
 tyYfxM8H3/jY3o7foGqdZk8NPAbi3Q01xytuCR3utGTkf9Lu0iSDd0bs98HMQ4kxgaOZ
 q+KQ==
X-Gm-Message-State: AOUpUlFRFuCGlJnqH/a1OE38Se7N6amJWaMOZfz8ssdrVcuNOjsnVnjs
 y3CdgCbcWBV+ZZn22zffJW8os3VuNkWKH7rLFnLlGw==
X-Google-Smtp-Source: AAOMgpe03eGFBikhCQWao9zE3jO4COBF4tN8ADy2V0ShvdZfud92/gOXA5KgZhBf320U9H/PAGMMR3RycWz1rkS9Ewc=
X-Received: by 2002:aca:c2c1:: with SMTP id
 s184-v6mr13960190oif.117.1531288059008; 
 Tue, 10 Jul 2018 22:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20180702212028.30824-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20180702212028.30824-1-jae.hyun.yoo@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 10 Jul 2018 22:47:28 -0700
Message-ID: <CAFd5g45=SkyLWRy=DnYOZCXcmHkrbTdOSBi=n=kUgyvRPoU8Mg@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Fix initial values of master and slave state
To: jae.hyun.yoo@linux.intel.com
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed@lists.ozlabs.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, 
 james.feist@linux.intel.com, vernon.mauery@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jul 2018 05:47:42 -0000

On Mon, Jul 2, 2018 at 2:20 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> This patch changes the order of enum aspeed_i2c_master_state and
> enum aspeed_i2c_slave_state defines to make their initial value to
> ASPEED_I2C_MASTER_INACTIVE and ASPEED_I2C_SLAVE_STOP respectively.
> In case of multi-master use, if a slave data comes ahead of the
> first master xfer, master_state starts from an invalid state so
> this change fixes the issue.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 60e4d0e939a3..2714c7fbe7c9 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -111,22 +111,22 @@
>  #define ASPEED_I2CD_DEV_ADDR_MASK                      GENMASK(6, 0)
>
>  enum aspeed_i2c_master_state {
> +       ASPEED_I2C_MASTER_INACTIVE,
>         ASPEED_I2C_MASTER_START,
>         ASPEED_I2C_MASTER_TX_FIRST,
>         ASPEED_I2C_MASTER_TX,
>         ASPEED_I2C_MASTER_RX_FIRST,
>         ASPEED_I2C_MASTER_RX,
>         ASPEED_I2C_MASTER_STOP,
> -       ASPEED_I2C_MASTER_INACTIVE,
>  };
>
>  enum aspeed_i2c_slave_state {
> +       ASPEED_I2C_SLAVE_STOP,
>         ASPEED_I2C_SLAVE_START,
>         ASPEED_I2C_SLAVE_READ_REQUESTED,
>         ASPEED_I2C_SLAVE_READ_PROCESSED,
>         ASPEED_I2C_SLAVE_WRITE_REQUESTED,
>         ASPEED_I2C_SLAVE_WRITE_RECEIVED,
> -       ASPEED_I2C_SLAVE_STOP,
>  };
>
>  struct aspeed_i2c_bus {
> --
> 2.17.1
>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Thanks!

BTW, sorry for the delay, just got back from vacation. I will review
the rest tomorrow.
