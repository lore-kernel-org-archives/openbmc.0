Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x22b.google.com (mail-qk0-x22b.google.com
 [IPv6:2607:f8b0:400d:c09::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYm4M0rXrzDq5c
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 21:40:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=DzH9+vOu; 
 dkim-atps=neutral
Received: by mail-qk0-x22b.google.com with SMTP id t127so16199888qkf.1
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 04:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=eEn4XbeAwKvqPDwKsxTtzid6LBWgrMIQG4kmHjDrhCA=;
 b=DzH9+vOuDGkSQCLTkQEoe01QRx9An+xwBOGsKo44jzg03WRDyGbJKAaxT7D1aQEUnn
 pZB1bkWgYacysW7OaQU4NrWlUoxR/SPSYxKR6sCI9xw7i1AH2XEqQQ7rL6nr9YeLGcLj
 wWqw4eEUwFwsGH5/l4hpOzm8Uw4dPDEypyhTHqYl058/4g1ZWB7DPaaASRzF4tpxhFcK
 mcZOxTZSuoeWMbRt1UK/8zLZh1nTRHo+AdgpA54sDRb/BwobR5k7G9VJwJh8BJS966it
 wr2VVY8qo8wM12W5b5XYJ3n30zxELpz8SbHUlhwBjXRdKptDdCkdXcNnDDXYZBRF2W9c
 flYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=eEn4XbeAwKvqPDwKsxTtzid6LBWgrMIQG4kmHjDrhCA=;
 b=ZMCBGkMD7X5DUdZbofcjm9ya5P2TEk1D+ynIsvHpnCjYdCwzST4HVq4r/jW77twmXF
 mzTfwOzqMAheNQVEaO24/q1vDp34JAsd0p4B3U+jPAK1eJnWHe6yvSW3veDUgQdynJRu
 ApC2zmFEfG8zYDxUNnRNNSyysdynoyXAJfnuQD/I1pdaDH5c1OivZf98cILCQMhGyHsI
 s9Oui7HlT4zNe1X9e7RAi9IuiKhWYLsQdbV5SPN0uZBpaj73XpHMGiMe0uyKchCbQpuc
 kesj8yCm7CfEIEkavgz6lZbfGfGV5Pd2kQoUK+RmRQ2f6ZUO4rtIRUUhXOyLYkPMLWwt
 l/tA==
X-Gm-Message-State: ALyK8tIrrg+dgCJnrg37hlGwOZwgIkTxOgqiV80+0PKB8rzqotXc6retKS7pMkDcSI5B8ZG75UvnvD5r+dJv2g==
X-Received: by 10.55.107.6 with SMTP id g6mr28051589qkc.166.1466509216765;
 Tue, 21 Jun 2016 04:40:16 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Tue, 21 Jun 2016 04:39:57 -0700 (PDT)
In-Reply-To: <47db0c5d-907c-4622-0659-2cef581a467c@kaod.org>
References: <1466494185-24459-1-git-send-email-joel@jms.id.au>
 <47db0c5d-907c-4622-0659-2cef581a467c@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Jun 2016 21:09:57 +0930
X-Google-Sender-Auth: LBs3zOQOBAsVMwVKy8jHphow4HM
Message-ID: <CACPK8XdXSeaa8_CopXjz2JdxYRE5eDs7-z=LtmwfzxSMU-MZhg@mail.gmail.com>
Subject: Re: [u-boot 0/3] Add minimal ast2400 support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Teddy Reed V <teddy.reed@gmail.com>, Andrew Jeffery <andrew@aj.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jun 2016 11:40:19 -0000

On Tue, Jun 21, 2016 at 5:41 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> On 06/21/2016 09:29 AM, Joel Stanley wrote:
>> Hello OpenBMC u-boot hackers!
>>
>> This series adds minimal ast2400 support to the v2016.05 tag of u-boot. =
It
>> applies on top of the v2016.05-ast2500 tree that Cedric created for the
>> ast2500-evb.
>>
>> It is a copy of the code from the Aspeed SDK with minimal changes to get=
 it to
>> compile in a modern u-boot tree.
>>
>> Pending review, I will add this to a branch called v2016.05-aspeed-openb=
mc in
>> the openbmc u-boot repository and point all of our 2400 and 2500 systems=
 at
>> this branch.
>
> Looks good to me.

Great. I pushed it along with some other cleanups to my tree:

 https://github.com/shenki/u-boot/tree/v2016.05-aspeed-openbmc

I'll boot test it on a palmetto, ast2500evb, and witherspoon tomorrow
and then move openbmc to use this branch.

>
>> Joel Stanley (3):
>>   ast-g5: Simplify config and board file
>
> The configuration system has changed and a lot more can be configured
> through Kconfig now. I think the aspeed code relies a bit too much on
> #define still.

Yeah, the config files are still very messy. Before we add any more
platforms we should move our existing ones to Kconfig.

>
>>   ARM: AST2400: add support
>>   arm: aspeed: Remove cpu directory
>
> We could to the same for G5.

Done.

>
> G5 also has this hunk which needs investigation :

Eww. Can you please open a bug on openbmc/u-boot?

> --- a/arch/arm/cpu/arm1176/start.S
> +++ b/arch/arm/cpu/arm1176/start.S
> @@ -35,7 +35,6 @@
>   */
>
>         .globl reset
> -
>  reset:
>         /*
>          * set the cpu to SVC32 mode
> @@ -82,8 +81,9 @@ cpu_init_crit:
>         orr     r0, r0, #0x00001000     @ set bit 12 (I) I-Cache
>
>         /* Prepare to disable the MMU */
> -       adr     r2, mmu_disable_phys
> -       sub     r2, r2, #(CONFIG_SYS_PHY_UBOOT_BASE - CONFIG_SYS_TEXT_BAS=
E)
> +       /* Ryan TODO ....*/
> +#      adr     r2, mmu_disable_phys
> +#      sub     r2, r2, #(CONFIG_SYS_PHY_UBOOT_BASE - CONFIG_SYS_TEXT_BAS=
E)
>         b       mmu_disable
>
>         .align 5
> @@ -92,7 +92,7 @@ mmu_disable:
>         mcr     p15, 0, r0, c1, c0, 0
>         nop
>         nop
> -       mov     pc, r2
> +#      mov     pc, r2
>  mmu_disable_phys:
>
>  #endif
