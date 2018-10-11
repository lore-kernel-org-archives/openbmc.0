Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="l/xs72+4"; 
 dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42WPDJ0BypzDqC7
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 08:26:39 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id c10-v6so4775883pgq.4
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 14:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o7cOzdJwnaQB3OFl0r1x3lgFLoiGMZu4djL+E7Ng/78=;
 b=l/xs72+4ugWk9v0EUoFQUGE3TZebnztTWM/AEtLYlv28dOfJ6CUqHPYkitroUsEI9x
 5Wkoy3HUkSeCVnVAM5Qi6PA1jNlgCdtuzv+CVLtPIild5LGjLpATGn7hdWIg5jYHGlPc
 i6ZbFFGqhgyvCJG4a0vqpGTXvDueWzQo3QVNFXMUT3jZpcLOiCpmD8AsOlDcfBBMLmtH
 SMcNTRKLp9ydSznJoilqXwPdbnloEENxbv+KjOzwV/9I6m7kfKTLTaXfkyZK5SrJBnmx
 JYOHttSOBB51WnrYOfuuu7uhjqQPXt1M2MohJZZyH/r0LriH9fwaOlcUFlVSmUPKRoRc
 cUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o7cOzdJwnaQB3OFl0r1x3lgFLoiGMZu4djL+E7Ng/78=;
 b=lruOmHDDt5JgTPaa8p32RybK+prwwGXe68Bl8OvBarKXGFyBa4iGcRHIOUUlmIcnOD
 lM8E3vSsHC9bCb211MFdE0kLqd2ltOVzyIqCp06U8J2Tp3GExSPtLvDuinxJ7N39z57X
 jaclDG3VLgj8YxUFbG+jDic4uUJSblsl7dX8+DMTzXeu7GxBfR6ZBjAPinZcMri2bQFe
 0JLlMGbryWSg+FeV5XRebJHSrstttmHnxRpruBtzrlITHQ+RIbjqszSwOfFtd5rDu9FA
 epe3lb/59u0kvFJ+LFjrDWIAdbeTvZmPtuMzZmmKi/S1onzj82sFH2yjWp6tX81VF+N3
 OzHQ==
X-Gm-Message-State: ABuFfoibxsOmgxspi6kmsVzsIdw+/x8Lv8+Loy7+kgF9s55IRu49rqsV
 tYLqT1Kq3RM6Q26ydtYoPeZiEXtH7+ktZlJJjzZOTg==
X-Google-Smtp-Source: ACcGV60fxfx5x2rZPmQJ7ZeYSiVcFM48H0BYyvN0648OXS/D9P9/uleW/URQWmH+n8ZaAv4C9GUTcUSNoXhzH8/MwkE=
X-Received: by 2002:a63:a42:: with SMTP id z2-v6mr2840994pgk.209.1539293197343; 
 Thu, 11 Oct 2018 14:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAJoAoZn3CSHRrtTi3r-B3aWn6t1CH3W3SLk_b_BJ3wiPsWrQvg@mail.gmail.com>
 <CA+YB3rb76TCnpLh3nXqcVtzGu0BUVWboWY87cNqgewm3ib=nFg@mail.gmail.com>
 <CAJoAoZ=fspkuFtZgyErrF6JjD2oR=uau3=gVb4ipugNQ2Qv2Kg@mail.gmail.com>
 <481b4ab3-8ecb-769c-5d23-25242ad394e5@gmail.com>
 <CAO=notz--AX88W=OrY0MyQxk-=XZOyiRz+n0k34YPHgGxDk1iA@mail.gmail.com>
 <CAJoAoZnPrkRoioHxwGnWfdB-J5ArHAFtnkdD_CTwW6V3fYCuUQ@mail.gmail.com>
In-Reply-To: <CAJoAoZnPrkRoioHxwGnWfdB-J5ArHAFtnkdD_CTwW6V3fYCuUQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 11 Oct 2018 14:26:26 -0700
Message-ID: <CAO=notw73kUmhkqYYYNLDWO2ZnpOEpt+ZeWaJZKwYxLqqQgUwg@mail.gmail.com>
Subject: Re: Community Code of Conduct
To: Emily Shaffer <emilyshaffer@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 krtaylor <kurt.r.taylor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 11 Oct 2018 21:26:40 -0000

On Thu, Oct 11, 2018 at 2:21 PM Emily Shaffer <emilyshaffer@google.com> wro=
te:
>
>
>
> On Wed, Oct 10, 2018, 7:52 PM Patrick Venture <venture@google.com> wrote:
>>
>> On Wed, Oct 10, 2018 at 7:58 AM krtaylor <kurt.r.taylor@gmail.com> wrote=
:
>> >
>> > On 10/9/18 1:53 PM, Emily Shaffer wrote:
>> > > Reading through this, I've got a couple concerns:
>> > >
>> > > - There's a clause for enforcement. How do we want to assign ownersh=
ip
>> > > when enforcement is needed? We probably want to lay it out, I'm not =
sure
>> > > that it should come through the TSC. Maybe Kurt would be a good star=
t as
>> > > the community manager? No offense to Kurt but I'd also like an
>> > > escalation path or alternative path - with these kinds of things it'=
s
>> > > important to be able to bypass an individual if necessary.
>> >
>> > Re: Community Manager, I am already partially doing that in an
>> > unofficial sense, but for an escalation path, I would highly recommend
>> > first reaching out to the TSC. Any inappropriate activity or harassmen=
t
>> > must be taken care of immediately and the community leadership would b=
e
>> > tasked to take care of that.
>> >
>> > >
>> > > - The clause on scope seems to me like it may leave a gap surroundin=
g
>> > > harassment of community members outside of the official OpenBMC sett=
ing
>> > > - ie, Foo posts to their Twitter account, "I'm having a lot of troub=
le
>> > > with Bar's code reviews. What an idiot! Tell them so - their email i=
s
>> > > bar@baz.org <mailto:bar@baz.org>!" I'm not sure I'm seeing how the
>> > > contributor covenant protects against this kind of behavior. Maybe I=
'm
>> > > just misreading and this counts as "prviate communication"?
>> >
>> > This would absolutely require that the person be put on notice. Maybe =
it
>> > will help, but I have also never seen this behavior work for anyone
>> > trying to harass anyone. It has always backfired on the person doing t=
he
>> > harassing in every case I can think of (I have been involved in a coup=
le).
>> >
>> > >
>> > > On Tue, Oct 9, 2018 at 11:31 AM Jeff Osier-Mixon <jefro.net@gmail.co=
m
>> > > <mailto:jefro.net@gmail.com>> wrote:
>> > >
>> > >     Hi folks
>> > >
>> > >     We strongly recommend the contributor covenant coc. Being adopte=
d by
>> > >     many projects.
>> > >
>> > >     https://www.contributor-covenant.org/version/1/4/code-of-conduct
>> > >
>> > >     Glad to discuss more
>> >
>> > As I said in my previous email, we already have a CoC under the LF
>> > policies, but I am not opposed to adopting a new one. That said, do we
>> > need to improve the existing one? Is there something missing? Has anyo=
ne
>> > compared the two? Did I just sign up to do that?  :)
>> >
>> > Kurt Taylor (krtaylor)
>>
>> I just read over the LF CoC and I think it's pretty solid.
>
>
> I'd say my only serious concern about the LF one is that it directs conce=
rns to someone outside of the project, first. It seems like we can expedite=
 responses if we encourage folks to report via the TSC or community manager=
 first, and escalate to the LF community manager if necessary.

True, but one would typically see this be a level thing -- if
something isn't severe, keep it in house, otherwise escalate. But who
defines when to escalate or what's severe or,... yeah, it is nice to
keep some aspect in the project so that minor things might be worked
out more quickly.. but I don't know.

>
> As a side point, we should make it more clear that we adhere to the LF Co=
C. I would be comfortable mentioning it explicitly in some doc in docs/ or =
the openbmc/openbmc readme, or something. Looking for LF membership and the=
n from there to the CoC isn't very clear to me.

We should definitely point to something somewhere.
