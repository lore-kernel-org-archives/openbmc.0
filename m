Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgGlm5x8TzDsmZ
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 12:00:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=zxCmNvBt; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id 107so786003uah.2
 for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2016 19:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=jRVuw6F64LFUJrpY2gFWX4u5I5GN3hv2qyLAoHwg0IM=;
 b=zxCmNvBtCyLK6jue2Uc6Fy3C1SBohJQFezVXAN76QPyJgKcwHTjk+tgkhCMW+a9NGr
 pQADY88gWuQ0befTd+Ust2XVI2nvRgmwzdA2w1J5DLrhOrvDskyFSYjdqahv3Q528L0X
 qwB7yEhv6TD5Nn6WF9lR1GC1SRREMv++7pQL/qeTl3x72B+PQe1EqnrhTRrz0Oj8biYf
 v0xpDtFo5qkeqmmsSMnF7B3BKeoia3eqjX6qy5uB8kOVJ5Jxy7a7PvUUdeBTKFEjmNCL
 GhEIbyMe1Ij8KM3E33vSjIuz2tu07RDSwqR5wHR9GrwVSqAWAxFbswZPUWoEXlB/g15T
 X7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=jRVuw6F64LFUJrpY2gFWX4u5I5GN3hv2qyLAoHwg0IM=;
 b=jNd1l9SMSL881zi7O9COn+SN4eWssXcdA2YTb20jWDD90rextY/X8QXBjmnCKbrx6Q
 +qHqZQroglp6RHlIEu32AxDdqXxk2Eb2JkLwSg95wJGptE8HpTMYfffg/v2tuVUrEBco
 T9nzaI5E58BlAvtWRePgTN+TXTVSMbRQmP5O6Pph4kcUtHdnlIaLjFr31ACK2nSNDQgt
 vWlKih7VpyIKl+HMLn0i09sGEw/+5uo0lWrH5Ulsub9RIc0D+NYFwWL/2bJJ1DaCLdy5
 WZUd4lUncTr7ryc/2Ed0AavXdKc/x0hT+/45uZJxYf6+jfB/DFbb0Kcpq8caSEKeaxrd
 ijVA==
X-Gm-Message-State: AE9vXwM6/fEGMMlH8UUZeHZ2PgDQkhlXhWdMIw+1FZWrg7OoEehOFDwwwRdgKgf8n9/hP8tSyuRNUcbhT+CBeA==
X-Received: by 10.176.4.99 with SMTP id 90mr2037530uav.121.1474596017630; Thu,
 22 Sep 2016 19:00:17 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Thu, 22 Sep 2016 18:59:57 -0700 (PDT)
In-Reply-To: <1474306018-101166-1-git-send-email-maxims@google.com>
References: <1474306018-101166-1-git-send-email-maxims@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 23 Sep 2016 11:29:57 +0930
X-Google-Sender-Auth: FW5ygRVEC6FPY2ey5pMi-aF_T3U
Message-ID: <CACPK8XeDxCquHHG3s=Mfvn4fuy06bmWx+gQqmgsB1rWP5c6mOg@mail.gmail.com>
Subject: Re: [PATCH] aspeed/g5: Device Tree for ast2500 and eval board,
 I2C driver
To: Maxim Sloyko <maxims@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Sep 2016 02:00:21 -0000

Hello Maxim,

On Tue, Sep 20, 2016 at 2:56 AM,  <maxims@google.com> wrote:
> From: Maxim Sloyko <maxims@google.com>
>
> The driver is limited: only single master mode is supported and only
> byte-by-byte reads and writes are supported, no DMA or Pool Buffers.

Has this code been ported from the kernel driver? If so, mention it in
your commit message and/or a comment in the code. A comment about what
needed to be modified in order to make it integrate in the u-boot tree
would be helpful. Also mention where you copied the code from; which
tree or commit.

Be sure to incorporate any changes made to the upstream Linux driver
as it goes through review.

> Also, pin function configuration is performed by the I2C driver, because
> there is no pinctrl driver at the moment.

It looks like you've got several patches combined into one. To make it
easier to review, try to have a separate patch for each feature you're
adding.

> ---
>  arch/arm/dts/Makefile                       |   2 +
>  arch/arm/dts/aspeed-g5-evb.dts              |  28 ++
>  arch/arm/dts/aspeed-g5.dtsi                 | 392 ++++++++++++++++++++++++++++

This would be one patch.

I assume they came from the kernel tree? If so, mention this,
including which tree/commit you got them from.

>  arch/arm/include/asm/arch-aspeed/ast_scu.h  |   6 +
>  arch/arm/include/asm/arch-aspeed/regs-scu.h |  74 +++---

This would be another.

>  arch/arm/mach-aspeed/ast-scu.c              |  31 ++-
>  board/aspeed/ast-g5/ast-g5.c                |   2 +-

I believe these integrate the i2c driver with the arch and the board.
They should be separate commits.

>  configs/ast_g5_defconfig                    |   4 +-

Updating the defconfig should be it's own patch.

>  drivers/i2c/Kconfig                         |   6 +
>  drivers/i2c/Makefile                        |   1 +
>  drivers/i2c/ast_i2c.c                       | 306 ++++++++++++++++++++++
>  drivers/i2c/ast_i2c.h                       | 155 +++++++++++

Adding the i2c driver has nothing to do with the other functions, so
that could be it's own patch.

Cheers,

Joel
