Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="J939Ycge"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42wLSt3lprzF3Tj
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 10:35:10 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id 189so29036461qkj.8
 for <openbmc@lists.ozlabs.org>; Wed, 14 Nov 2018 15:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hcpRpNU1JNizUd+FvOKSmTJmrsti/7dsF6Dl1KOlCms=;
 b=J939Ycgemd7j9VHSSKBiWT8obHBZwym+QFjAnJ2yZy8Lcj6ys/t5rSqEl5QuODbVWl
 mX0T+8CH+4R7iOmbachgvC5BZQZ24M/wwWR1zLjbyWN4jkGnQnunJxai44dKldH4N2+Y
 dN/w2LCVMpMvvFCH97UPvpnC+Qv6n+5bSf/ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hcpRpNU1JNizUd+FvOKSmTJmrsti/7dsF6Dl1KOlCms=;
 b=VbVyTWFGavzNZpBhSl4c9XxBy8/nlH9DzPXAcsEDQXqti1Wl7YbRYWo8mKuXT1m/18
 o3JCtceL0gDRf89WalojUeSyMHJnbsW9fMWkdbXyFon8OneOohE3njTsnhqMc5zlZGmI
 k+c/PTRk7p3F8tLxKKP/5H2M4fKlayk3y3fTW1qK/bHpRQ53dcAmjKHlN4cuL/LzHOlx
 iHAMSzKO6QnrRxz18vY+n7zUobUsSY+G44ahp+eBozt3TGB+AhE0YetbnwvWTP9S9UjT
 JsP8JrpGDQ8AlrhijyOSR9+lPapCgjiAadt7O5GYWWzs0lS/zwFPQ7GAKINNZUtsJjyy
 wTRw==
X-Gm-Message-State: AGRZ1gLBU0rs9TNSoVkYCQ7CFvFJKA5urtCZ3f/8No7SMhHBE4Hq+4SL
 NxRCTWm+6bP7fn1z2fBiBMAUxW106yBLryEHb+w=
X-Google-Smtp-Source: AJdET5fRoDjttdUe9NrQiCFJFXm4jXP2UsMtVm/XRk/PGA/G4ABiH1O8Gk1LqXbtsaGc/1yw3RgggNoKv8IuFO6CXoI=
X-Received: by 2002:a0c:e751:: with SMTP id g17mr4024647qvn.160.1542238507994; 
 Wed, 14 Nov 2018 15:35:07 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8XfRxu-4DubF4SAsAzX0y4dkpF23MYq9ynS+VT8ufPMMoA@mail.gmail.com>
 <CALLMt=pwnn=4_qbZM_Ph=GNUZw2tnmC5p2kcJ9EvAuwD47W2xA@mail.gmail.com>
 <CACPK8Xcaa+tEafXqtCR_xJ9GCT3JfPNG62G624ftFkyQ9eaM5A@mail.gmail.com>
 <CALLMt=oPg=N9FUMFB42ztmVigpVmfOuc9A+F_v7VcdJW=LVGSQ@mail.gmail.com>
In-Reply-To: <CALLMt=oPg=N9FUMFB42ztmVigpVmfOuc9A+F_v7VcdJW=LVGSQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Nov 2018 10:04:55 +1030
Message-ID: <CACPK8Xce5G-NOnKozG=ru-f1WmNc7LFVcuJv6+Kh-_A9sgCYQw@mail.gmail.com>
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
X-List-Received-Date: Wed, 14 Nov 2018 23:35:12 -0000

On Thu, 15 Nov 2018 at 08:15, Andrew Geissler <geissonator@gmail.com> wrote:
>
> On Tue, Nov 13, 2018 at 5:44 PM Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Wed, 14 Nov 2018 at 07:00, Andrew Geissler <geissonator@gmail.com> wrote:
> > >
> > > On Mon, Nov 12, 2018 at 11:08 PM Joel Stanley <joel@jms.id.au> wrote:
> > > >
> > > > Hello Andrew,
> > > >
> > > > I've been trying to get to the bottom of the slow-booting qemu issue
> > > > for a few weeks now. We commited a fix that resolve the issue on x86
> > > > hosts, but when running the same Qemu build on ppc64le it still has
> > > > the "go slow" behaviour.
> > > >
> > > >  https://github.com/openbmc/qemu/issues/14
> > > >
> > > > I propose we run the Romulus Qemu boot test on x86-only build slaves
> > > > while we work this out. That will allow us to unblock the kernel
> > > > security bumps, which have been pending for a few weeks.
> > >
> > > Unfortunately there's no way that I can find in the jenkins multi-configuration
> > > matrix plugin to specify which part of an axis goes to which slave node.
> > >
> > > The flow right now is that whichever node gets assigned to build the
> > > image, is then used to run the QEMU job (so no transfers of
> > > images have to occur).
> >
> > This sounds like the easiest thing to fix. We would still maintain all
> > four CI boxes, but ensure the Qemu job is run on an x86 box.
> >
> > We could even run the Qemu job on openpower.xyz (aka 'slave') itself,
> > as the images are already being copied here.
>
> I think to do this, we'd need something like
> https://stackoverflow.com/questions/7133027/retrieve-build-number-or-artifacts-of-downstream-build-in-jenkins
> The images are not copied to openpower.xyz until the very end
> of the job currently, to get them to the QEMU job, we'd need
> to copy them in between jobs.

Yeah, this is how I have the BSP jobs configured (which haven't run in
a while; they need some love):

 https://openpower.xyz/view/Aspeed%20BSP/

> Honestly, if it's just a couple of weeks, I think our best solution is
> to just remove the ppc64le system from the bitbake builder queue.
> With the US holiday, it should be a quieter few weeks then what we've
> had recently.

Okay. Lets go ahead with that change.

Cheers,

Joel>
> I have for other optimizations reasons always wanted a way to
> dedicate a QEMU queue, but I don't really have time to deal
> with getting that going right now.
>
> >
> > > The assignment of which node builds
> > > which config is random so builder4 (our ppc64le) node gets Romulus
> > > about 25% of the time.
> > >
> > > Removing builder4 from the build queue would work, but would
> > > also remove 25% of our build capacity.
> >
> > Is there a reason why we don't use the "openbmc-ci" build slave more?
> >
> >  https://openpower.xyz/computer/openbmc-ci1/builds
>
> openbmc-ci1 is our ppc64le that runs the gerrit server. I send the
> per-repository CI
> jobs there (i.e. the make/make check google test jobs). I don't send the
> big bitbake jobs (i.e. builder) because of the cpu impacts it would have
> on gerrit.
>
> > > > I'll continue working on fixing Qemu in the future, but I don't have
> > > > time for the next two weeks due to some higher priority work.
> > >
> > > This feels like one of those things that's always tough to come back
> > > to once you let a workaround in.
> >
> > I don't understand? There's no workaround going into Qemu, this is
> > simply for the Jenkins issue. Once Qemu is fixed we can re-enable the
> > Jenkins slave.
> >
> > > Is there a specific kernel commit
> > > you've bisected down to that we could just pull from the openbmc/linux
> > > tree? Is there a workaround we could put in our openbmc/qemu for
> > > now? I'd prefer both of these over just disabling ppc64le.
> >
> > The fix corrects a nasty bug in the Linux timer driver. Reverting this
> > fix would result in inaccurate running of timers in Linux, which is
> > what the system currently does. I would consider it a high priority
> > fix to have in the product.
>
> Yeah, just feels like we're stuck between a rock and hard place.
> I def understand the desire to keep the kernel up to date for the
> community.
>
> With the tag happening Friday, I assume we don't want to get this
> in until next week anyway? Or was this something you felt we
> really needed before the tag?
>
> >
> > The Qemu workaround is already in place, and works for x86. It doesn't
> > work for ppc64le.
