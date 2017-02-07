Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vJ0DN6ZhFzDq8f
 for <openbmc@lists.ozlabs.org>; Wed,  8 Feb 2017 10:00:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RKg0nrRy"; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id n125so3488274vke.3
 for <openbmc@lists.ozlabs.org>; Tue, 07 Feb 2017 15:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=sbo6YxBy17jfvMZwjZHBb9tKreXOk/cYx5/8Awe+v0o=;
 b=RKg0nrRyEYrwvWCngU8gWP00gYgmqntz0fGAp4rGFqh8HmUGQOhtuBOBnIHQeahjf1
 B8SU2FWTOMAVVTTM6A8gpBVgUq3SgBzjnCI6u1qP+Z0JmZr2CFdRs+GSBo2cuvaQJA5T
 1v/cbJJ8m2jBR4vt0dlVXx1FwEY+6ySVe9UsFqTVZByDrY24ZU3SiBvvycRwgIDOyWxS
 PDtAOXbfTkh4ht8pE/pEzSfOsEK1tCvY0r47dwxTdNZtp+CLZL+90fYjfY92qTlkM96U
 w503bq/47M4TSXVPh0M064RCeKPVeAG38hhB3ghZEv5kdVBiCxWD3apRUnKvTOjMcV4P
 BLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=sbo6YxBy17jfvMZwjZHBb9tKreXOk/cYx5/8Awe+v0o=;
 b=iC5ORPODQYRKNA7tp6VXbOqsBVcHNHOQSU4oBEv1yZSysfSKwiCqCJb/6rtijKv5bZ
 ayychyaOUEERgNPi/pX4/wpy6hpGXxd9Ak84milJlhGuT5kLwDZGxJGQKF13gQD+XDXW
 DU8VgFP7TcbNOd8vvNIalvoHxAhJdI8/LlBE4m0aEZmu/PUW70bSb39t67I6hMdggGQa
 71KrHLqeiuAmnrP9Hq3lIBCrU0FDH5LYcN9RrRSb/S7IJLdMAtc3E6JKE/ot7Two763W
 KfmsesCW0dzWXLAqE0+USXR8k1ZsAFH0GX4i/Ar6lQT3kX+s451s0T4hICZ4dGxNmKB1
 xO9g==
X-Gm-Message-State: AMke39kCpUNNEeR8kNa9kCJLoDVaWbMkfWweG8aL5EXfRBeS5ae5MBMXCGy+nTkEfVOq1sc13X+DtmS6V6+wqA==
X-Received: by 10.31.47.85 with SMTP id v82mr8748292vkv.2.1486508418503; Tue,
 07 Feb 2017 15:00:18 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.92.150 with HTTP; Tue, 7 Feb 2017 14:59:58 -0800 (PST)
In-Reply-To: <1486508229.3824.1.camel@gmail.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-5-cyrilbur@gmail.com>
 <CACPK8XcsScjrit-7VHh4oL=zPiMeEAB5_R550U0uPsuQ4WF1mg@mail.gmail.com>
 <1486508229.3824.1.camel@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 Feb 2017 09:29:58 +1030
X-Google-Sender-Auth: ID4LdnFx2deI3gUYKE6ngtP5x8c
Message-ID: <CACPK8XfxgUvvTYNxJTaUC3yAuiF=Wznr9e1AL_gc0P3SVUUAvg@mail.gmail.com>
Subject: Re: [PATCH 4/4] drivers/mailbox: Add ASpeed mailbox driver
To: Cyril Bur <cyrilbur@gmail.com>
Cc: devicetree@vger.kernel.org, jassisinghbrar@gmail.com, 
 Arnd Bergmann <arnd@arndb.de>, gregkh@linuxfoundation.org, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Xo Wang <xow@google.com>,
 Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Tue, 07 Feb 2017 23:00:21 -0000

On Wed, Feb 8, 2017 at 9:27 AM, Cyril Bur <cyrilbur@gmail.com> wrote:
>> > diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
>> > index ceff415f201c..10a7f3f2765c 100644
>> > --- a/drivers/mailbox/Kconfig
>> > +++ b/drivers/mailbox/Kconfig
>> > @@ -152,4 +152,13 @@ config BCM_PDC_MBOX
>> >           Mailbox implementation for the Broadcom PDC ring manager,
>> >           which provides access to various offload engines on Broadcom
>> >           SoCs. Say Y here if you want to use the Broadcom PDC.
>> > +
>> > +config ASPEED_MBOX
>>
>> Call this ASPEED_LPC_MAILBOX, as it's a in the LPC IP block.
>>
>
> I think I'll stick with ASPEED_LPC_MBOX, the rest of the file uses MBOX
> more widely when talking about controllers.

No worries. I just wanted the _LPC bit added.

Cheers,

Joel
