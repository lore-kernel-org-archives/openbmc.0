Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::233; helo=mail-oi0-x233.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fP2CRZiz"; 
 dkim-atps=neutral
Received: from mail-oi0-x233.google.com (mail-oi0-x233.google.com
 [IPv6:2607:f8b0:4003:c06::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FmN82PXJzF1QM
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 03:01:11 +1000 (AEST)
Received: by mail-oi0-x233.google.com with SMTP id v198-v6so5732877oif.9
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 10:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j7d0dA7Ev9f5HvBHUlUG73oQNpfgpag+Biyx+x50h1w=;
 b=fP2CRZizWiAR2a8B9zSFyzXu1zidtHLjN9SC9F5PkydDVXMFsm8PwYAH1Lc/mm01uL
 pAzHRP3eDTQV9L7TdWczzSJ5tO7j6u2h1HY177jMhivK2rFDyvMxPYcj/daFb1hYzXp6
 tpBep9pIJSVewAdikwEq8e5t89X7SJgtMUyW2EumnwUVMdIczeypd2ncysWG0t7hrwDn
 zqkmA2Z1m4iOAAQ6INx85Xx/pRLW+IfMh0h7ueM6PmEhbXHtsxN+uiaZ7uogEAOfFqDB
 eGHk2c7H/DXFHJJXlrA4weouHUUrVKA2EIeitkDRIJZUQ+a9zgbDVtSNYZ+JAB0XwkyA
 hJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j7d0dA7Ev9f5HvBHUlUG73oQNpfgpag+Biyx+x50h1w=;
 b=ViXAk/iWegb/daGcfOdBMT/WClFluSJXCMvdokaXzJD+fwJvqEQb5JxPV/cQ3aacVO
 8lqyRXz1Q9znIIsH6EEwctxJyF4VkW4mOoKNuHSDVha3t7Th4rLDnj7+LpWqZKTBjPHR
 sAeAZ7GBTzDvz6gt6ei8JBOl471GzVQ7tQCalkY7KBDndwiOoFiHJ7rA5AoK19JQtp2f
 jqeh7FMu4LzSITEFd1AiFfyw1nebH2emZD3QtnK6zkli4CRsqihHJoUYVsyO4t1f89NO
 6rfNQtIfl5CZKtwjOcdA3uHkoZT9buGTczY0sukd9EVfAyeDWkY88qA1ALZ5tR+k+Axo
 +V9A==
X-Gm-Message-State: APzg51CgmhMEndnvJhDHqPPouqIan7vYpABONlMKPnkeiDfN8QPMSxDM
 T6x5Q0UvoZHkQDyBQ8rRT6VL2w2jp3p5YKEZtUk=
X-Google-Smtp-Source: ANB0Vdai3Znq/VMINcHtD5Kgv3hLQG3rej6y/tHWB/+9s6Y3ElSWAUtkCKm/wIX8cnwPfzsB1BL8eKJ1RTXxbMMgdTo=
X-Received: by 2002:aca:f58f:: with SMTP id
 t137-v6mr2273805oih.244.1537376469427; 
 Wed, 19 Sep 2018 10:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxg=KimTVEuJXgR-iN9T5FiKcMA2TJD-E6pM_KVO9338g@mail.gmail.com>
 <5C90478E-E89A-428D-873F-3E4CCD5595D4@fuzziesquirrel.com>
 <CAO=notz2-wfv_kep5FhGP9T7rdQehvSqBSECvPywNis=uRXTKw@mail.gmail.com>
 <CALLMt=rthqi3e3vHNbNFkjyhBEp8P6P8KoYC0e4XrdKMhip1Hg@mail.gmail.com>
 <CAO=notxPfx-RufZXncqAX5LsdJCaQLirgxy-M+3hFPKYvrpTDw@mail.gmail.com>
In-Reply-To: <CAO=notxPfx-RufZXncqAX5LsdJCaQLirgxy-M+3hFPKYvrpTDw@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 19 Sep 2018 12:00:58 -0500
Message-ID: <CALLMt=o2y0TpXZCwjw--MiLJWo_5tg38i2K00Ety1AScO1M9Ew@mail.gmail.com>
Subject: Re: Link-up between Gerrit & Github
To: Patrick Venture <venture@google.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 19 Sep 2018 17:01:13 -0000

On Wed, Sep 19, 2018 at 11:37 AM Patrick Venture <venture@google.com> wrote:
>
> On Wed, Sep 19, 2018 at 9:03 AM Andrew Geissler <geissonator@gmail.com> wrote:
> >
> > On Wed, Sep 19, 2018 at 10:01 AM Patrick Venture <venture@google.com> wrote:
> > >
> > > On Mon, Sep 17, 2018 at 12:28 PM Brad Bishop
> > > <bradleyb@fuzziesquirrel.com> wrote:
> > > >
> > > >
> > > >
> > > > > On Sep 17, 2018, at 3:17 PM, Patrick Venture <venture@google.com> wrote:
> > > > >
> > > > > The first meta-google patchset was pushed by Brad into github.
> > > > > Interestingly, the second patchset which was merged into gerrit 3 days
> > > > > ago still hasn't been automatically pushed into github.  It makes me
> > > > > think there's some box we need to check or a setting to push.
> > > > >
> > > > > Brad, can you dig into this please?  I don't have any permissions to
> > > > > poke at it on Gerrit.
> > > >
> > > > Will do.  Agreed there is a problem here - I noticed meta-x86 was out
> > > > of sync too.  In the meantime I've manually fixed these.
> > >
> > > I know it hasn't been long, but I was curious if there any thoughts,
> > > since it appears to be all new repositories, and not just the meta
> > > ones.
> >
> > Yeah, there's a bug in either gerrit or the github plugin to gerrit
> > (or a mismatch in the levels).  If we restart gerrit it picks up all
> > the missing synch's and then works fine with that repo after. I'm
> > hoping to just defer this until the next gerrit maintenance window in
> > a month or so.  Wouldn't be an issue if we weren't adding so many
> > freaking repos to openbmc :)  jk
> >
> > But yeah, until then, Brad please just ping me and I'll manually
> > restart gerrit when you add new repos, it just takes a few seconds to
> > get back up and running.  If it gets annoying enough I'll dig in a bit
> > sooner.
>
> I'd appreciate it if you can restart it shortly to pick up a slew of
> new repos, although the meta-x86 wasn't new IIRC, but maybe it's new
> in that gerrit hasn't been restarted since it was added.

I did the restart and saw some of our new repos get synched up
(entity-manager, google-ipmi-sys, phosphor-ipmi-blobs) but nothing
from meta-x86.

I'm not seeing much in gerrit for meta-x86?
https://gerrit.openbmc-project.xyz/#/q/project:openbmc/meta-x86

>
> >
> > Andrew
