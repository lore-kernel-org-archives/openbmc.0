Return-Path: <brendanhiggins@google.com>
Received: from mail-oi0-x229.google.com (mail-oi0-x229.google.com
 [IPv6:2607:f8b0:4003:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xScCW2cmqzDqrx
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 15:29:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gu7lRTLu"; 
 dkim-atps=neutral
Received: by mail-oi0-x229.google.com with SMTP id f11so65686222oic.0
 for <openbmc@lists.ozlabs.org>; Wed, 09 Aug 2017 22:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=MuDr735Sao6rIHQdSSiFOjpUX4WFVi06Cd6aJ9Xpygk=;
 b=gu7lRTLukUHdxeICzxb2IJ3gIkMaSlsIToWf/K1USGwUMxxXXgh7Y9qI3FoQ4L/nSX
 BLzmRNhLA+KOSRu6ZASEam17WuLU0olF80dGGXtn9dtSzcGPzzuVUCrwpSYLwgx3UoSS
 V49q8MxjL1Bk7wHw/nlvEKOWRDdgnQiM4HfoELhi13jNwWl2pyHyTQEPmZiInhvhhl3d
 d1oGbyc1r8eC0rYnlYaXuWfyyVBW63xDxJ8b1gz6p6T6B3jrMPYTHkgMVygm4dDKwBk/
 l6lF+AdknlITEZMYkyGGj2DnaXVazpuEnvvgErcaMNimj/tqWK7XMGXLnkDmUhJXSkRs
 +Zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=MuDr735Sao6rIHQdSSiFOjpUX4WFVi06Cd6aJ9Xpygk=;
 b=Lur6N8pmjUqfIZ3ZcVq9/Sol+G8pOTzQzYvGMd6D2YfLpgE6l90qcokywZGXBVfG2r
 TvcBI5K5Ad3i2RSGoBCZyhwJ02E5ddGctkEllYhvBtC/mELHBG/8BTThwya8oTaqprra
 kclWnAujY4d1JaWZkpu33n1Z9pixenbSfoqxOu6RfRn6CPQ/mepQ6VFR6wuUXTkdkMxP
 S4snhN6a2j+sbXuKsRQ3W1DotmsVBUQjft9a0G3ExqYzfzfjeXVH2c1dx6AimUQJTJuz
 S1NPfD7uPzpW4z9DOVHlDlUmupa26gN2SWm6zOxw3d1F2OHIQmaG0DQx3iU1/Ad5OD2Q
 TYJQ==
X-Gm-Message-State: AHYfb5jDG2XTUzP6HRVOS91Z+McPNT7oVS6QXxxhqkzS/snyzwsKGc8n
 UrAbGlaEEJJDeXNGaCcvA8DLIJ/jqOTA
X-Received: by 10.202.175.75 with SMTP id y72mr10973824oie.146.1502342997469; 
 Wed, 09 Aug 2017 22:29:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.168.69.205 with HTTP; Wed, 9 Aug 2017 22:29:57 -0700 (PDT)
In-Reply-To: <99a298c1-6241-f835-9587-31c526126453@ozlabs.org>
References: <20170808035301.1980-1-brendanhiggins@google.com>
 <20170808035301.1980-5-brendanhiggins@google.com>
 <99a298c1-6241-f835-9587-31c526126453@ozlabs.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 9 Aug 2017 22:29:57 -0700
Message-ID: <CAFd5g44uGc16t0YGgho0_ukU+VmD3ujTdGdBfPF-ZCAB_WHHbQ@mail.gmail.com>
Subject: Re: [RFC v1 4/4] ipmi_bmc: bt-aspeed: port driver to IPMI BMC
 framework
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Corey Minyard <minyard@acm.org>, Benjamin Fair <benjaminfair@google.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
 openipmi-developer@lists.sourceforge.net, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
X-List-Received-Date: Thu, 10 Aug 2017 05:30:00 -0000

On Wed, Aug 9, 2017 at 7:31 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Brendan,
>
>> The driver was handling interaction with userspace on its own. This
>> patch changes it to use the functionality of the ipmi_bmc framework
>> instead.
>>
>> Note that this removes the ability for the BMC to set SMS_ATN by making
>> an ioctl. If this functionality is required, it can be added back in
>> with a later patch.
>
> As Chris has mentioned, we do use this actively at the moment, so I'd
> prefer if we could not drop the support for SMS_ATN. However, using a
> different interface should be fine, if that helps.

Whoops, I did not realize that anyone was using it. Yeah, adding it back in
should not be too hard.

>
> Cheers,
>
>
> Jeremy
