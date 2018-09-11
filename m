Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="W9+kr9Pi"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4290Zb6rJNzF37V;
 Wed, 12 Sep 2018 08:53:43 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id 130-v6so17893894qkd.10;
 Tue, 11 Sep 2018 15:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yecEx44M8PDKMBTNei5rTsr98sIveDfTubDW32UfeNA=;
 b=W9+kr9PiBTLMZIsIgqC+gYpeByqEE5FyJlxptKbWASdvfptxJFesDpaVOdPjbHzMkq
 3MIra+4URbx9Z/Qd0udQebHm3wCadOJZcsFAf83Q/ZZP91ygXmaxmroeKzUIVeeJM4kl
 ZnEBVKDxw0WtWqqZMtei3e3G2vrJrZuoNBpvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yecEx44M8PDKMBTNei5rTsr98sIveDfTubDW32UfeNA=;
 b=uM1Kp+wHh9q07LR6Pfh8cvMd9kn4gDnDEpkjkfRUWLjRhA+ky1mNhlp/HaF7f78xPk
 erkVGEjnrRnP/eIQZWD4MQMpkdzzKrVNZY6wM2U08pXbd9GM13i5pND6nLQ5hWc2jSnz
 57TEvlfC4Dbp+U8y+Ao7l8VP4cvhTth1K5CJvRvuQ+aYrBS1PpcCxRvDkeXE//r8/4Tm
 8HX+FxWLHJ2x+aY/RsBIUut31iQuix9oPdtP0QKjyeo/bwET9tRWaWn6+vrvLa/n8/rw
 HaE7HQGEbRFISTdXZlF3Kj6XMe3ejN45nB+iItgNLTrhcywybSptV7jczVdyyZfkfFqw
 2K7g==
X-Gm-Message-State: APzg51DxaaY8ug+LDMcou1G5L/No+lLIOPetbgdKwpECYT6RkeR8H/w7
 yZPq/Jk2U5dQGmE1oFZDdb24e2RFeqFvMjvsWKWIvA==
X-Google-Smtp-Source: ANB0VdZV//eMibxhpLRInlz48XxZzBxIQTwzsaeCnOrbY24mPEHbyZYY5jzaTe5GoP83MKrKOlR3Q7+YTxZ7/6auB1U=
X-Received: by 2002:a37:bd02:: with SMTP id
 n2-v6mr21038412qkf.336.1536706421114; 
 Tue, 11 Sep 2018 15:53:41 -0700 (PDT)
MIME-Version: 1.0
References: <20180823225731.19063-1-jae.hyun.yoo@linux.intel.com>
 <20180911183734.GA21976@roeck-us.net>
 <1f34fe8c-69ef-5f2d-25dc-d5f6037cc558@linux.intel.com>
 <20180911204107.GA26017@roeck-us.net>
 <e5135af4-9105-214f-5de2-65cc03804222@linux.intel.com>
In-Reply-To: <e5135af4-9105-214f-5de2-65cc03804222@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Sep 2018 08:23:29 +0930
Message-ID: <CACPK8Xdv3aP_zOHAL0WMgwvkpBHAUesU7OdhW==jgvXjRmt-Zw@mail.gmail.com>
Subject: Re: [PATCH i2c-next v6] i2c: aspeed: Handle master/slave combined irq
 events properly
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-aspeed@lists.ozlabs.org, 
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Brendan Higgins <brendanhiggins@google.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, James Feist <james.feist@linux.intel.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-i2c@vger.kernel.org
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
X-List-Received-Date: Tue, 11 Sep 2018 22:53:46 -0000

On Wed, 12 Sep 2018 at 07:48, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> On 9/11/2018 1:41 PM, Guenter Roeck wrote:
> > On Tue, Sep 11, 2018 at 01:30:41PM -0700, Jae Hyun Yoo wrote:

> >> I checked this patch again but it doesn't have any change that could
> >> affect to the probing flow. I'll debug the issue on qemu 3.0 environment
> >> and will share if I find something.
> >>
> > The problem may be that qemu and the new code disagree how interrupts
> > should be generated and handled, and the new code does not handle the
> > interrupts it receives from the simulated hardware. This will result
> > in i2c device probe failure, which in turn can cause all kinds of
> > problems.
> >
>
> Yes, that makes sense. Looks like it should be reverted until the issue
> is fixed. Will submit a patch to revert it.

Let's not rush. The qemu model was written in order to allow us to
test the kernel code, and was validated by the kernel driver we have.
We've had situations in the past (with the i2c driver in fact) where a
change in the driver required an update of the model to be more
accurate.

I suggest we wait until Cedric has a chance to look at the issue
before reverting the patch.

Cheers,

Joel
