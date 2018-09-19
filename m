Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="M3DHUWuU"; 
 dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Fl5b5f2LzDqXw
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 02:03:27 +1000 (AEST)
Received: by mail-ot1-x32a.google.com with SMTP id e18-v6so6285755oti.8
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 09:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NwLzSdbB817Hp7ElTlLoufiYYz32L1FxyC4HxRsXro0=;
 b=M3DHUWuUrh8oOKeUoF2HVdSqeHNHNq+exQjqbIoTDJ8MzIqMBiTtQ8/qRS/Smy1eKp
 URm9eqyyeK3F9rfFl1I61im09UXm5P2Kpdi1Era/BIAnkBVOhCb4aRmLv00DIxJCznAQ
 yOH0FgaEoOJqoadP6x0E+XjNrWZVtPb0K4RkR1JJtWxVtZVqWUCZmw4dR2PKVlT4tH0y
 xlhOZ+mQdh0+pTJjZG3ahaZEQMmhzmbWngkU24MYJb0RZg8UVg+fICSPNN8KZQU3lLCB
 5JN0tIRlYRBRobcZOT7BpH4lsAV/EkHKArVof5C5PiLfHHFH80OeB9+OtIKoHbNjv5k/
 oRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NwLzSdbB817Hp7ElTlLoufiYYz32L1FxyC4HxRsXro0=;
 b=ES/D0VhjvWM/DM7ks7Yjo3ewvbqYKMpaoc0rJg8uM+INk98YIteUWrO6sg6gzS2rUv
 +J7CCh1qhfy9+TGUEqeYR5b2dZZZuAqCjY66QJDJyS7cHhB36DEBVUz7lgF4ZmwXw68R
 Ssq48hAFE4uOI0/iX/LFW5T20a+nrOY6FeWFOnXEey2Y6IJH3OKk+232HMMk2ak90hyH
 yxn+vPL2CH3o4iycVyJWaZnwyu/0DKcx2+vYsRVid4YkGpsPcA8CNrbohE7xydvS0UBJ
 cTgOcJS+DU1mKwtkYcGKrFSCHHgR1cis9ZGtaRbcbim9LHloNaPNFu9we+GNUFdQOGbo
 8/zA==
X-Gm-Message-State: APzg51DtFvbBEXqaTyDlr5EEYqekGnKdFLY0KU3W9bSrkCj2E36luzhN
 /bZfrSDqNYkXEVxl3naT/pHWfsPTOUYA21AawiWdOGyB
X-Google-Smtp-Source: ANB0VdYLWqaF4ed0574Y89YQqwL6AMmhc9nALgqzlEvZeUJirSm7zkFSv9EUzpM9ok+6qFVehkdJaUQhrorSDItHfo0=
X-Received: by 2002:a9d:3f9a:: with SMTP id
 r26-v6mr18553592otc.113.1537373004924; 
 Wed, 19 Sep 2018 09:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxg=KimTVEuJXgR-iN9T5FiKcMA2TJD-E6pM_KVO9338g@mail.gmail.com>
 <5C90478E-E89A-428D-873F-3E4CCD5595D4@fuzziesquirrel.com>
 <CAO=notz2-wfv_kep5FhGP9T7rdQehvSqBSECvPywNis=uRXTKw@mail.gmail.com>
In-Reply-To: <CAO=notz2-wfv_kep5FhGP9T7rdQehvSqBSECvPywNis=uRXTKw@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 19 Sep 2018 11:03:13 -0500
Message-ID: <CALLMt=rthqi3e3vHNbNFkjyhBEp8P6P8KoYC0e4XrdKMhip1Hg@mail.gmail.com>
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
X-List-Received-Date: Wed, 19 Sep 2018 16:03:33 -0000

On Wed, Sep 19, 2018 at 10:01 AM Patrick Venture <venture@google.com> wrote:
>
> On Mon, Sep 17, 2018 at 12:28 PM Brad Bishop
> <bradleyb@fuzziesquirrel.com> wrote:
> >
> >
> >
> > > On Sep 17, 2018, at 3:17 PM, Patrick Venture <venture@google.com> wrote:
> > >
> > > The first meta-google patchset was pushed by Brad into github.
> > > Interestingly, the second patchset which was merged into gerrit 3 days
> > > ago still hasn't been automatically pushed into github.  It makes me
> > > think there's some box we need to check or a setting to push.
> > >
> > > Brad, can you dig into this please?  I don't have any permissions to
> > > poke at it on Gerrit.
> >
> > Will do.  Agreed there is a problem here - I noticed meta-x86 was out
> > of sync too.  In the meantime I've manually fixed these.
>
> I know it hasn't been long, but I was curious if there any thoughts,
> since it appears to be all new repositories, and not just the meta
> ones.

Yeah, there's a bug in either gerrit or the github plugin to gerrit
(or a mismatch in the levels).  If we restart gerrit it picks up all
the missing synch's and then works fine with that repo after. I'm
hoping to just defer this until the next gerrit maintenance window in
a month or so.  Wouldn't be an issue if we weren't adding so many
freaking repos to openbmc :)  jk

But yeah, until then, Brad please just ping me and I'll manually
restart gerrit when you add new repos, it just takes a few seconds to
get back up and running.  If it gets annoying enough I'll dig in a bit
sooner.

Andrew
