Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RvjwKE1k"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Vk256rGgzF13x
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 06:00:29 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id b5-v6so2972344plr.5
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HBRjZ2PzPfXoQQyQf6KW4ZCf6sPX4hEhArqEIuKZ5GU=;
 b=RvjwKE1kJ/EvVbQXlng3doyCpbIQX1MbUF4XKmYYBUT++0faiObleNwnbBmBI5mlAY
 /EaXu7rUKZg5/BRWe94jTc6X/4mGiJjbw03c+XcrWl6rNwAN1jC9WUgMs1zcfj7tTCi9
 W7unkXqSLhlRynihGVhcjDArn8ri9id8BH77uKbhFp8LkV5poypij/rTbU7sNhMOyKC2
 twDjZUOgGpCL1+8ke7L71gKEXdZzG5DYdp41Smkr9HN6r7S2i0DjJpDHb/duiMcXiyfo
 yYwBRZZiiwDA/S82SPRHzcDYo6NfYpehAqLxa+KSHrpMOOQQCcPAd3fqJEPLPgkXypof
 nNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HBRjZ2PzPfXoQQyQf6KW4ZCf6sPX4hEhArqEIuKZ5GU=;
 b=di00kJXB6AfMNNODkdnowITCko37q/+u7Nr4oPvx+1Ooee0AVUUHu57lSAdBUnJWIc
 A0jXSXn5zAF65qbwKhFsIVdHOZwe+MZxaUljeIZ5jWx7MykV/djZm+t2Z2DeTM0maN1a
 iXG5kLJVBDuTVb0VE4jr0hku1fgsCXyllU5UWnDXeg81OMvcR22Rj8wpAOdp7wz7eCDP
 MY19iZns88fTzysopQszQXAqOk2K8c1GCk084QT5nRp4sFhozc9vAxltkdKRi3h+RFeG
 KREywq4PUluu3Ibb5JKiCl7APk+tX2z6mo9vazIb0/GsLDLmz+LfMJvZ2Arng7z7L6q6
 6X8A==
X-Gm-Message-State: ABuFfohLmOI9I1B+ZMOrZZBkk7Yy5YIjvrbzHD4kA2n0/y9ajJLwYdSh
 9R7lGz7EE+No1VGiPCSYdNTtCQPdOJC6US38OZti4A==
X-Google-Smtp-Source: ACcGV639GA9jBLt50bX9TQ5c2rCxsRrjXttyDcmHBVUjVa6Zs7E5e4KVhil0FEI735Qh4KIXNoQKYklfD66FZ/uH97Y=
X-Received: by 2002:a17:902:a03:: with SMTP id
 3-v6mr33920066plo.323.1539198027161; 
 Wed, 10 Oct 2018 12:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyKtrecZeAypPcjY7qi6rBqj_cPwPosFRds=wYpeHW8wA@mail.gmail.com>
 <9dc677b3c95c2bc7e7c5a11a97df49a7@linux.vnet.ibm.com>
 <CAO=notx9Sncg2w68Z=OTsMAWJtoyENc2KUZJfz-8vDCGhJ7afA@mail.gmail.com>
 <CAO=notwU5z2bb2C51s=8PEEuwgqUjNa3bctNH12P=GVmMaHkRw@mail.gmail.com>
 <CAO=notzG9PMZTry+WHP1SJoxA2O=5GFGjGmCpMr3CiTWHgmD5g@mail.gmail.com>
In-Reply-To: <CAO=notzG9PMZTry+WHP1SJoxA2O=5GFGjGmCpMr3CiTWHgmD5g@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 10 Oct 2018 12:00:14 -0700
Message-ID: <CAO=notw-d+ihmf3eoKtXJjXzC-vXjgAtFwyLQ-PMp+Po1B=h6g@mail.gmail.com>
Subject: Re: Recipe Renames, etc
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 10 Oct 2018 19:00:31 -0000

On Wed, Oct 10, 2018 at 11:50 AM Patrick Venture <venture@google.com> wrote:
>
> On Wed, Oct 10, 2018 at 11:46 AM Patrick Venture <venture@google.com> wrote:
> >
> > On Wed, Oct 10, 2018 at 11:45 AM Patrick Venture <venture@google.com> wrote:
> > >
> > > On Wed, Oct 10, 2018 at 11:38 AM Matt Spinler
> > > <mspinler@linux.vnet.ibm.com> wrote:
> > > >
> > > > On 2018-10-02 10:28, Patrick Venture wrote:
> > > > > I've sent a bunch of recipe renames, but I'm still updating each with
> > > > > an individual tested footer.  I will try marking them all as WIP now
> > > > >
> > > > > Patrick
> > > >
> > > >
> > > > Hi Patrick,
> > > >
> > > > I think you broke master with these.  For example, the phosphor-rest
> > > > recipe - it has a default url-config.json, and then a layer specific file gets
> > > > applied from the meta-ibm layer, like:
> > > >
> > > > meta-ibm/recipes-phosphor/interfaces/phosphor-rest/url_config.json
> > > >
> > > > However, from the log.do_unpack from the phosphor-rest build, it doesn't
> > > > look there, it now only looks in phosphor-rest%.  So any override directory without
> > > > a % isn't being found.
> > >
> > > Interesting that the CI didn't catch the break since witherspoon is
> > > one of the systems built via it.  But I'll take a look.
> >
> > Although I have had configuration files disappear when the wildcard is
> > missing from the directory, the recipe normally complains about being
> > unable to find the file.  For a file override, if there's already that
> > file - presumably then it wouldn't complain.
>
> I've fired off a witherspoon build locally from openbmc HEAD, and will
> report back.  Very few of the recipes were updated in this fashion so
> I'm not terribly worried about a general breakage.

https://gerrit.openbmc-project.xyz/q/topic:%22rename_step_1_of_3%22+(status:open%20OR%20status:merged)
- in case you're curious which recipes were updated in the 3-step
approach.

Looks like only the rest, gevent, and webui were updated in this fashion.

This shows https://gerrit.openbmc-project.xyz/q/topic:%22rename_step_2_of_3%22+(status:open%20OR%20status:merged),
those need the 3rd step to finish out the job and this should also fix
the build for those systems with phosphor-rest/gevent.

And these are those staged paches:
https://gerrit.openbmc-project.xyz/q/topic:%22rename_step_3_of_3%22+(status:open%20OR%20status:merged)

>
> >
> > >
> > > >
> > > > I haven't looked to see what all is broken yet and in how many layers,
> > > > at least our phosphor-rest and phosphor-gevent, which is why the web UI stopped
> > > > working on witherspoon.  Not sure if any other systems are also having problems.
> > > >
> > > >
