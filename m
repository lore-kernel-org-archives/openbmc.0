Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Cj+ADgj0"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420DMS3yWkzDrTP
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 02:13:39 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id a4-v6so921723plm.13
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 09:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z0UM54Pt/raPzHY1+IPTR0RB8+d0j3ikRLFxyfJOcL8=;
 b=Cj+ADgj0GTbbg9jKaC+xwIVAa1hdoNxD1HJuoJQjzeSyjFN5+RVkvTAcsPEtMq5fOV
 rYklM/9KjjZTujTzPdtZvzBpVWAmn4NLZp2HyEERgYCOOPnSJd5CV/ck2kC6tyFjXO/w
 HRI5npWqBlQ7SCH6blyHEdWbEsT4IDDh/AUakvMvVL3ztDzu6W5ZexEYEqNibVSYiWu6
 6WGvxnvBtq/orjEYs/dKWT0QMOrx2wB6BV2auzxDV1+JLMzjB7Q7DZSnmkr9e4rESia7
 QDD7QGRfpUYQ/DxGlVyyGMtxNlnfA2StYqINIojKGuqXazbZrFiFu/xxECggNEGolJ91
 1dFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z0UM54Pt/raPzHY1+IPTR0RB8+d0j3ikRLFxyfJOcL8=;
 b=jDbr5e6LCPz9hHV9qcB41tW5B1llKivfIafKh0WA8x4u9m8yQ74jLyu4ITZrL0y5H2
 +L7RLRAJeD8cn2VRpJjKmdM/Vq9IzIauYWozUkFFVvMs05ZY3WoVCrg3z6huWVOCdtOy
 HVGm67OfawMJCTZZx4d+cLmcTH2kXKOHltlWaeod2CFWXiQ+gvf3W+SH0Lndue/9sCvr
 uSMYrgsMV9vlN2pWZI5y3q1AU4vkC8hdCaaz+Rk2A5DJcDkrlW3dTnHCjvIJes3IIQDi
 PTqIITBOIrprc9eng4C26Cm2bHndYJS4nsFpw8qa0wFJIRJ/bDDBcMEwKoIOsq9u7LiT
 kEtg==
X-Gm-Message-State: APzg51BreUvziR0/qMdhVHrjoOiXndNk1N0r0fqdmIX4mk+hQzjoMuR6
 nsOdVZp4pPV82KbTeQ120uC8equS8OjQcB8FxgoUHw==
X-Google-Smtp-Source: ANB0VdZxALGjOVzPI0Go6d4irZMU3aJB/hnhUXWBcftEK6lbhVDe1SiaSvFpVyVdvmhJ4YV3+iJ2STbk8h4a/dvC4X8=
X-Received: by 2002:a17:902:28eb:: with SMTP id
 f98-v6mr2183808plb.149.1535472817408; 
 Tue, 28 Aug 2018 09:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
 <CACPK8XdtitrjvDpuiPiz_ew03m972ueGRXAhd4kM_z6YSVtL3A@mail.gmail.com>
 <0E782585-1B8A-4BF7-9454-443061BA9C32@fuzziesquirrel.com>
 <CALLMt=rGmZ9-29xWMymUvdCAgVnFzQ+gyZDn3zXnWeR4imSYPA@mail.gmail.com>
In-Reply-To: <CALLMt=rGmZ9-29xWMymUvdCAgVnFzQ+gyZDn3zXnWeR4imSYPA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 28 Aug 2018 09:13:25 -0700
Message-ID: <CAO=notzcrzun128buPTaD0pmpnj-d_yYOntXUnfaNeUckMqmLw@mail.gmail.com>
Subject: Re: Proposals for commit log policy
To: Andrew Geissler <geissonator@gmail.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 28 Aug 2018 16:13:41 -0000

On Tue, Aug 28, 2018 at 8:44 AM Andrew Geissler <geissonator@gmail.com> wro=
te:
>
> On Tue, Aug 28, 2018 at 5:30 AM Brad Bishop <bradleyb@fuzziesquirrel.com>=
 wrote:
> >
> >
> > > On Aug 22, 2018, at 7:58 PM, Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > On Tue, 21 Aug 2018 at 22:01, Alexander Amelkin <a.amelkin@yadro.com>=
 wrote:
> > >
> > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >> some-package: bump version 62286ef3 to 4fa63380
> > >>
> > >> Author Name (2):
> > >>  commit 1 synopsis
> > >>  another commit synopsis
> > >>
> > >> Another Author (3):
> > >>  great commit
> > >>  yet another great commit
> > >>  fix previous not-so-great commit
> > >>
> > >> Change-Id: some-long-gerrit-hash
> > >> Signed-off-by: The Version Bumper <bumper@nowhere.net>
> > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > >> What do you think? Is this feasible? Any other ideas how we could si=
mplify creating release notes suitable for end users?
> > >
> > > I think this is a great suggestion. I would also like to see this hap=
pen.
> > >
> > > Having the maintainers or authors of the packages submit their bumps
> > > would ensure this does not become a burden for the central repository
> > > maintainer.
> > >
> > > An advantage of the maintainers of individual packages submitting
> > > their changes is they know the best timing for integrating their
> > > changes, and know what relevant details should be added to the bump
> > > commit message.
> >
> > I also would like to see this.  To be clear I mean the commit msg text =
above,
> > and not a =E2=80=98Impact=E2=80=99 token.
> >
> > The autobump script was deployed at a time in the project when _every_ =
repository
> > had the same maintainer, so it made some sense back then.  Today we hav=
e a much
> > more distributed set of maintainers.
> >
> > I=E2=80=99ve actually disabled the cron job that runs the script, becau=
se it needed
> > some rework to handle the new openbmc/openbmc repository layout.
> >
> > I plan on simply _not_ turning it back on, and let maintainers do their=
 own
> > bumps like Joel has been doing for the kernel moving forward (Thanks Jo=
el).
> > Unless there are major objections.
>
> I object!  At least 90% of the auto bumps today go through without
> issue.  This keeps our openbmc/openbmc master consistently up to date
> which I think is a big benefit to our community.  We're able to
> quickly find regressions with our automated tests which are constantly
> running against the new content coming in. I feel like we're adding
> more work with minimal benefit here.
>
> To summarize:
>
> - Adds a layer of manual work that has minimal benefits
> - Prevents us getting small continuous changes, and instead will
> encourage larger big chunks that are tougher to isolate fails on
> - Even if individual repo owners are forced to do their own bumps, I
> don't think many will address what started this thread, summaries of
> the changes and impacts of each commit.
>
> On the other side of thing I realize this is how yocto does it (manual
> bumps) and it does allow more individual control for repo maintainers.
> I just don't think at this point in our project, it's worth it.

Downstream we do manual bumps for our repo forks and it is a manual
process and we're looking at ways to automate it and provide the
information.  Right now, the bump, albeit manual ends up looking like:

"""
.... phosphor-pid-control: bump srcrev

Bump includes:
* 2524323 test: dbus: dbusactiveread
* 0ef1faf test: dbus: passive read interface
* 0df7c0f dbus: transition to interface for testing

Change-Id:
Signed-Off-By:
"""

So it's certainly not as informative as Joel's kernel ones in some
ways.  Our approach just lists, in order, the patches.  But like I
said, we're trying to automate that process to just include the
minimal details.

>
> Andrew
>
> >
> > thx - brad
> >
> > >
> > > Cheers,
> > >
> > > Joel
