Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x234.google.com (mail-yw0-x234.google.com
 [IPv6:2607:f8b0:4002:c05::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wx9Qz5shJzDr1p
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 23:49:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jHNTLy8A"; 
 dkim-atps=neutral
Received: by mail-yw0-x234.google.com with SMTP id s127so764389ywg.1
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 06:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Z+GYLi0YbffeUJB9+MdNjANwduPnKDB3JAgznS8bmdY=;
 b=jHNTLy8Acu4hHu9II6YN+jUqlzsurdqK0Bp1EmwjvZRppgYvJsIDuai1ArMrSDbKLJ
 HGIWg0pb72cKpJfEv9OW1BFR8td5Sx9O+ehbPMk/6TyGG9ThfeKcrKaMa4VthbFbUR6b
 NpNaPVUierL0dgi+VSJc1Nw9LUVPKS1dGO5z9HHB4s+BCg8VJyvLTNvkECnCe8MukS2X
 1tiPoxqI+Km91EVJET+vQQ7Xm8QKVbfgibT8pXHbnQ9MMKfdCWfhzEZMrduruFd1j67E
 UfilM39XygBOIsy+PakWcmuaCc6FKshuTseFeHQdFBxAWUZhuTza2vQAzAuGKYr75qX3
 xuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Z+GYLi0YbffeUJB9+MdNjANwduPnKDB3JAgznS8bmdY=;
 b=GNfiPPabv7wT6dhQeG0q1hd6CDkfF8sefEepVUstTfKoiXZQ4y42U+Ii/+oUSF2DvQ
 TifgI5BzqAusti4yV0ZccrjNEN2i/4C+ZYm0Rvqre29lldofv5meE6zXGnHRe9YjixQV
 fv0oCioEtS1gWC00dwxt1Bv51VvRdmk8k6rNV73LT7VbMvQ2rHkNM93r1fEPjU5GztQ5
 qdp4bcu9eDZQNLu0mTfCAvAYWfWZy3/qixssJ2eyXtE6LIx5AYnJeQSkQCJG7Ibaa1xf
 Kgl/i2fawIvqMPpcBHp6lcsIzAyvZMJCKkNkEq4r57BmHSDZ2k1MX2hd+KPjxvGcbsE+
 39hg==
X-Gm-Message-State: AKS2vOz2eqh6SV4nVhZbetHVmrK40xFIvuUSq4HNxquFVPQ1Ern0t5gj
 mJKtWtpr7tXrLFy5lq0xhvcVVnBOyfYklLjPsA==
X-Received: by 10.129.93.133 with SMTP id r127mr200435ywb.135.1498484985183;
 Mon, 26 Jun 2017 06:49:45 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.177.8 with HTTP; Mon, 26 Jun 2017 06:49:24 -0700 (PDT)
In-Reply-To: <VI1PR05MB3247D186793DAD7F1CB37EEDEFDF0@VI1PR05MB3247.eurprd05.prod.outlook.com>
References: <20170602091701.189794-1-c_mykolak@mellanox.com>
 <CACPK8Xc4PJ-NmZfN=vi4t4Tc6yauZ=wp3vfkbNWiB4RdSWgEVg@mail.gmail.com>
 <VI1PR05MB3247D186793DAD7F1CB37EEDEFDF0@VI1PR05MB3247.eurprd05.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 26 Jun 2017 23:19:24 +0930
X-Google-Sender-Auth: 8wJQWpWLJ1jrzg30ZxbplrVdaA0
Message-ID: <CACPK8XefYSpZA9D8SfLDW=7vXuHuxth1G+x40XAhZVYwSs=zOQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] Aspeed: ast-g5 change
 configuration order to allow 2-nd boot
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 26 Jun 2017 13:49:48 -0000

On Mon, Jun 26, 2017 at 11:16 PM, Mykola Kostenok
<c_mykolak@mellanox.com> wrote:
> Thanks for your attention.
>
> Best regards. Mykola Kostenok.
>
>> -----Original Message-----
>> From: joel.stan@gmail.com [mailto:joel.stan@gmail.com] On Behalf Of Joel
>> Stanley
>> Sent: Monday, June 26, 2017 1:15 PM
>> To: Mykola Kostenok <c_mykolak@mellanox.com>
>> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>> Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] Aspeed: ast-g5
>> change configuration order to allow 2-nd boot
>>
>> On Fri, Jun 2, 2017 at 6:47 PM, Mykola Kostenok
>> <c_mykolak@mellanox.com> wrote:
>> > +config FIRMWARE_2ND_BOOT
>> > +       bool "Firmware second boot WD2 enable."
>> > +       default n
>>
>> Looking at the most recent platform.S for the G5:
>>
>> /**********************************************************
>> ********************
>>  Disable WDT2 for 2nd boot function
>>
>> **********************************************************
>> ********************/
>> /*
>> #ifndef CONFIG_FIRMWARE_2ND_BOOT
>>     ldr   r0, =0x1e78502c
>>     mov   r1, #0
>>     str   r1, [r0]
>> #endif
>>
>> By setting this option we disable this code, so we do not clear the
>> WDT2 status register.
>>
>> The help text for your Kconfig option is confusing; I would think that it means
>> we enable WDT2.
>>
>> Can you clarify?
>>
>
> We can change help text to "Firmware second boot support enable".
> By default after power up WDT2 enabled. This code disable WDT2 in u-boot.
> So when CONFIG_FIRMWARE_2ND_BOOT defined - WDT2 not disabled in u-boot.

Ok. The current version of platform.S has this entire chunk commented
out, so the state of CONFIG_FIRMWARE_2ND_BOOT is irrelevant.

 https://github.com/openbmc/u-boot/blob/ed9e4abbf3f0aab348bc64d5439aadda03f42e4c/arch/arm/mach-aspeed/platform_g5.S#L612

Do you need WDT2 disabled in u-boot? With your other changes applied
you should be able to drop to the prompt, etc, and the watchdog is
serviced.
