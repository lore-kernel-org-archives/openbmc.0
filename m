Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="TcrUbDFL"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42vkjl4sl0zF3Cn
 for <openbmc@lists.ozlabs.org>; Wed, 14 Nov 2018 10:44:11 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id n12so22771320qkh.11
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 15:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eWUkca2I/YATe/Xgnl/uElr5u21c+h4k9YyJzQYdvNE=;
 b=TcrUbDFLaviaMWIlq+p7bdknFCdV/iygpiOcrJIdhwH5ESmnkEmVTsdvjBz0XIdN3X
 O2iUkq6wnyS7Fj9+7LG+vF4n/ihezjDUtP/WOLlGvEZ0Mj5PQJO+SON2eMI9y7W0bCMd
 wfp0D5OMhjzX39kgoRupJxC+MSG0UmQdsjtew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eWUkca2I/YATe/Xgnl/uElr5u21c+h4k9YyJzQYdvNE=;
 b=kN51cR0kihP9QfiFmMZ/yPBr10xNK6NIHlHk2SCt6PzPLaFVItOEecwbIVS7uSg091
 bdXCgIP3IFghiM0x/DDJ2AFvHk6Q6yiSD9MzJzYJ7CAm7mfmGq+fP8pPV9wgHhQgI3aw
 vPDNGudaXQluX/LPhdwxuw0fG/161+UAjjaV2SVoje4knnvgfnX591jFvotHZRNaMxsK
 WEq8qse1EbGDEArfjUvUO54Stn4nQeT4JKa9CQgOT2SF6C/ctmFGnsamPm/lYmvgvbG2
 /ylhBPBcgCKDqPSPfZRkxQnn9/geK0Y3lMblQLtv/FwwweNOmCT/cMpuhwVqYjXsztaw
 32LQ==
X-Gm-Message-State: AGRZ1gJEm6PL8C270ln9DAOoZfDxRt+nNRHu/S0zOnGhmAzVBvrYNzhb
 tMQw/mn9llwI0PQLd+qATOGo7NrORkOjnm7O2ik=
X-Google-Smtp-Source: AJdET5di/Ki07CyG9jqT5UxcPv1ltWauA5IT0A49+PSXkrpQfnY56oOvkdy5mNGHMDZX51fxnbEIK1PAWHgSn0R2Q6Y=
X-Received: by 2002:ae9:eb96:: with SMTP id b144mr6897455qkg.127.1542152648904; 
 Tue, 13 Nov 2018 15:44:08 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8XfRxu-4DubF4SAsAzX0y4dkpF23MYq9ynS+VT8ufPMMoA@mail.gmail.com>
 <CALLMt=pwnn=4_qbZM_Ph=GNUZw2tnmC5p2kcJ9EvAuwD47W2xA@mail.gmail.com>
In-Reply-To: <CALLMt=pwnn=4_qbZM_Ph=GNUZw2tnmC5p2kcJ9EvAuwD47W2xA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 14 Nov 2018 10:13:57 +1030
Message-ID: <CACPK8Xcaa+tEafXqtCR_xJ9GCT3JfPNG62G624ftFkyQ9eaM5A@mail.gmail.com>
Subject: Re: Disabling ppc64le hosts for Qemu tests
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Tue, 13 Nov 2018 23:44:13 -0000

On Wed, 14 Nov 2018 at 07:00, Andrew Geissler <geissonator@gmail.com> wrote:
>
> On Mon, Nov 12, 2018 at 11:08 PM Joel Stanley <joel@jms.id.au> wrote:
> >
> > Hello Andrew,
> >
> > I've been trying to get to the bottom of the slow-booting qemu issue
> > for a few weeks now. We commited a fix that resolve the issue on x86
> > hosts, but when running the same Qemu build on ppc64le it still has
> > the "go slow" behaviour.
> >
> >  https://github.com/openbmc/qemu/issues/14
> >
> > I propose we run the Romulus Qemu boot test on x86-only build slaves
> > while we work this out. That will allow us to unblock the kernel
> > security bumps, which have been pending for a few weeks.
>
> Unfortunately there's no way that I can find in the jenkins multi-configuration
> matrix plugin to specify which part of an axis goes to which slave node.
>
> The flow right now is that whichever node gets assigned to build the
> image, is then used to run the QEMU job (so no transfers of
> images have to occur).

This sounds like the easiest thing to fix. We would still maintain all
four CI boxes, but ensure the Qemu job is run on an x86 box.

We could even run the Qemu job on openpower.xyz (aka 'slave') itself,
as the images are already being copied here.

> The assignment of which node builds
> which config is random so builder4 (our ppc64le) node gets Romulus
> about 25% of the time.
>
> Removing builder4 from the build queue would work, but would
> also remove 25% of our build capacity.

Is there a reason why we don't use the "openbmc-ci" build slave more?

 https://openpower.xyz/computer/openbmc-ci1/builds

> > I'll continue working on fixing Qemu in the future, but I don't have
> > time for the next two weeks due to some higher priority work.
>
> This feels like one of those things that's always tough to come back
> to once you let a workaround in.

I don't understand? There's no workaround going into Qemu, this is
simply for the Jenkins issue. Once Qemu is fixed we can re-enable the
Jenkins slave.

> Is there a specific kernel commit
> you've bisected down to that we could just pull from the openbmc/linux
> tree? Is there a workaround we could put in our openbmc/qemu for
> now? I'd prefer both of these over just disabling ppc64le.

The fix corrects a nasty bug in the Linux timer driver. Reverting this
fix would result in inaccurate running of timers in Linux, which is
what the system currently does. I would consider it a high priority
fix to have in the product.

The Qemu workaround is already in place, and works for x86. It doesn't
work for ppc64le.
