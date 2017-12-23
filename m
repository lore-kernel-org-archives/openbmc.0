Return-Path: <xow@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c00::233; helo=mail-pf0-x233.google.com;
 envelope-from=xow@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="duJdnLwP"; 
 dkim-atps=neutral
Received: from mail-pf0-x233.google.com (mail-pf0-x233.google.com
 [IPv6:2607:f8b0:400e:c00::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z3fsB5LgJzDsN5
 for <openbmc@lists.ozlabs.org>; Sat, 23 Dec 2017 20:17:01 +1100 (AEDT)
Received: by mail-pf0-x233.google.com with SMTP id e3so16204432pfi.10
 for <openbmc@lists.ozlabs.org>; Sat, 23 Dec 2017 01:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Xd6TjxjaCcihbxYreCzAsNYReh5o1K9fQIIYKj3+W2M=;
 b=duJdnLwPHfm/ByvahGgUWzOANXql4+JU9p1Cvz6u2SZwWvsdxTaK8RguBS1rrgv81g
 wJ1Jo42e/JvDbN3Uaq53sIJt4DOmKCgnoNDgRrtstZgc4TvmSlzFBWC7+Mlg0H9FqfPI
 wNWysNz2t4wcgwl9OGdqNXEAJ6zEkVpEleXIkUhYziqP0FqWqvBc3W7gPaXphB9swuLo
 vDcdObkuq8IV/WOtbLqRkE+jB/8w/LmRHpNu43/lGC5IzTwn/GjImKn591t5uspiWBSF
 kTNb0G2/t3UkQ56TT7EpmyywQ8MyxMyqJNer8SN9dDA6pE6Inrw+HqL9GPxwPQSO9x4e
 ePaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xd6TjxjaCcihbxYreCzAsNYReh5o1K9fQIIYKj3+W2M=;
 b=K99/Cw6l1h/Hg26FVC5DCG7rmzdtTRLy8LX2i0PNliUkM0hX+4rgZE8hj/nXYh6nEk
 o04y+SB6SMAikIfJFLI9By4Xtv4jiYCqDTAVn3wAHWDT/LuFeRl2BNoSDP10tqK2cQwu
 xKmhsoyV1liIM0vGScBegVY9X9jLrNe0EiH2ekCL+TbfH32Lf5w85oXR1aRrVqYXZUe/
 y/SZjkLSNyo8JrkBZuuIju2Goh/J0CRme0TpN/K/vE/hVv8FrnQSqbLRroILJZeA7GQe
 YXLrJJL3fT3kSgs+bz7dN5e64Qb14xKPCX6AwkfoGF275Kqilht6sSsqIu6ZXSVXA+KQ
 BNsg==
X-Gm-Message-State: AKGB3mJFdTWBikmAL247J+UPXHh8dJQB+AEOW7FndgTh9X/4kcO6p6fJ
 t/0rwh72dOnN2a6MX3niN19WPDHWRMfNL64MLAxBrA==
X-Google-Smtp-Source: ACJfBou9msRdcs4aFOSfFFk5+Fg4gUz41/8OVF2G8L0ELUTLK6krX8cQgq4QaM0fSmpEwF5SC7AioabGJ2xdftbazkE=
X-Received: by 10.101.81.69 with SMTP id g5mr15232756pgq.324.1514020618557;
 Sat, 23 Dec 2017 01:16:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.185.4 with HTTP; Sat, 23 Dec 2017 01:16:57 -0800 (PST)
In-Reply-To: <1513982711.5787.141.camel@fuzziesquirrel.com>
References: <7E9441B1E5EFFD4681F54958E82169932F4B253F@ORSMSX114.amr.corp.intel.com>
 <CAO=noty9Z6VuPtyuCgSqVeT4jRon4=YfwzHid=8zup50gA8u4w@mail.gmail.com>
 <1513982711.5787.141.camel@fuzziesquirrel.com>
From: Xo Wang <xow@google.com>
Date: Sat, 23 Dec 2017 01:16:57 -0800
Message-ID: <CAPH-5w4qt5mUnP0RRh+7vQ0zOmQU=4EqFmB=N=fwfZ9qhY9JEw@mail.gmail.com>
Subject: Re: Request for a development repo
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Patrick Venture <venture@google.com>, "Tanous, Ed" <ed.tanous@intel.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Dec 2017 09:17:04 -0000

On Fri, Dec 22, 2017 at 2:45 PM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
> On Thu, 2017-12-21 at 13:41 -0800, Patrick Venture wrote:
>> On Thu, Dec 21, 2017 at 11:16 AM, Tanous, Ed <ed.tanous@intel.com>
>> wrote:
>> > In the hope of being more open with our development process, we=E2=80=
=99d
>> > like to
>> > create a repo for hosting work-in-progress applications, and
>> > applications
>> > that don=E2=80=99t really fit into the other repositories.  Internally=
, we
>> > have such
>> > a repository, informally named proving ground, where we try to
>> > build out
>> > concepts to test new applications, modes, and put the things that
>> > are
>> > specific to our platform that don=E2=80=99t really fit anywhere else. =
 An
>> > example of
>> > a component that would be contained in here would be this:
>> > https://gerrit.openbmc-project.xyz/#/c/8197/
>> >
>> >
>> >
>> > With the goal of being more open, we=E2=80=99d like to find a way to m=
ake
>> > these
>> > prototypes available to the community sooner, and have our machine
>> > targets
>> > build some of the components while still in development.  The
>> > options we=E2=80=99ve
>> > considered thusfar are:
>> >
>> >
>> >
>> > 1.       Acquire a repository under github/openbmc, possibly called
>> > intel,
>> > possibly called something more company agnostic.  Here we would put
>> > our
>> > prototypes, and things that we would like to enable on our
>> > platforms.
>>
>> I vote for this option with a more generic name.  It would be handy
>> since a lot of new daemons or work has nowhere to really be staged.
>
> How would this work exactly?  Would there be one repository for the
> whole project where any submissions are accepted unconditionally?  Or
> are we driving at providing a repo to organizations and/or individuals
> that they maintain?
>
> I'm probably sounding critical of the idea...that isn't the intent -
> just wanting to understand where we are headed.
>

I wouldn't mind seeing seeing repos where the conventions of (a)
centralized code reviews and (b) one-project-per-repo are broken, so
long as they don't directly affect the main OpenBMC builds (i.e. are
not being nightly updated into the build) and they're intended to
eventually have a stable home.

I don't see much value in naming it according to a contributing
organization, even if most development efforts are de facto "owned" by
some company or group or other. The point is that you want unilateral
(ish) control over some code hosted on the OpenBMC GitHub organization
that other people can observe, review, and patch, right? It might help
to achieve your goal of openness to organize these looser repos by
their feature area than according who their controlling contributors
are.

>>
>> >
>> > 2.       Start our own repository on 01.org (Intels open source
>> > repository)
>> > and simply make our platform recipes in openbmc point to it.
>> >
>> > 3.       Create repositories for each component under openbmc, and
>> > define a
>> > faster SLA and process for requesting new repos.
>
> In the longer term this would get my vote.  But I still think we need
> to do something to enable you in the short term, until someone proposes
> a process.
>
> You mention a faster SLA and I want to touch on that because I think it
> is important.
>
> I'm reading between the lines a bit, but I'd guess if I'd created a
> repository for the project you reference above within a couple days of
> the submission (along with a couple other RFCs) we wouldn't be having
> this conversation.
>
> For better or worse, I am the maintainer of this project (at the moment
> anyway :-)).  Let me share what I think this role means because I think
> its informative here.
>
> My role is to ensure that:
>  - contributors to the project have a voice.
>  - participation and collaboration occurs transparently (open).
>  - contributions make the project better for the most number of people.
>
> If someone submits an RFC, and I just create a repository, I've done
> none of those things.  I honestly have very little motivation to hold
> up any contributions based on technical merit alone.  What I want to
> see is evidence of the bullet points above.
>
> I'm perfectly happy to personally work myself to ensure these things
> are being done for contributions from others, but that _will_ be a high
> latency process.  To make it faster, contributors themselves can
> solicit support for their ideas from others by asking them to review
> code, vocalize their support on the mailing list, etc.  People that
> helped shape the proposed code/design/idea behind closed doors don't
> count imho - that would just be a rubber stamp.
>
> Does this insight help any with the problem we are trying to solve with
> the proposed proving-ground?
>
> Sorry for the book - thoughts welcome.
>
>> >
>> > 4.       Continue with our internal fork, and publish prototypes to
>> > repositories once they fit some definition of =E2=80=9Cdone=E2=80=9D.
>> >
>> >
>> >
>> > My personal preference would be #1, but I=E2=80=99m curious if anyone =
has
>> > any
>> > thoughts on other opinions on how this should be done, or have
>> > better
>> > options that we haven=E2=80=99t thought of yet.
>> >
>> >
>> >
>> > Thanks,
>> >
>> >
>> >
>> > -Ed

xo
