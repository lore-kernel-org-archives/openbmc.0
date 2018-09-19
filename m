Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UZ/plkeh"; 
 dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FjbS0CdMzF3FG
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 00:55:46 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id f6-v6so2811966plo.1
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 07:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Vvt4SpjaXQgU+pbSx/bfpuX/at6UwhbQHuCO233+cUI=;
 b=UZ/plkeh479ovOEtqFnH2wNV1zjcNkFBO6xyXGQTMXJaluX2zXN7GIZ6JOFgd9rIo3
 /7EESyu6OwSOEZWtXVgDcB56ue7KGbHJ7/Q9N1HrgCmIqw00SpICqH21+lNMyYzPh5P6
 MshuH6FKLBfFsoTSrsV8QwJRMg2LGjri3sU78IAWn5wNvNfyB3EQRvmp600xpUeexviq
 Ke4PH/etHvKlPi4oKd6Ek22zblJyYAqkUfpnsm3emC17kw6mOc7QrEmx/LHnbxWtDeTP
 fD5JxhY7u52HdJWi3sWU95BP2XZpSuP6lCfuhYBSFUbBSzwL8UBPsHY04mOGlU0QPOCT
 2U4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Vvt4SpjaXQgU+pbSx/bfpuX/at6UwhbQHuCO233+cUI=;
 b=VSN+DeUc81CHgqbolZnr4QsnITjbwLvi3TSfU1oTgUVcTLnsfdAHW2rZmYeLxcE0Le
 1AzBqxGgegqFuEURE0fGBPOQwFLh3ps0ASRGiPvJaPeULbFY4IZ5IB8qfA3x83nvIBai
 WzODp6cMSFGm0S2DV/NXyCSDyQ0dHA8aKknG9343nV0Sd9i5XiDwFD1b1W8rvglfuow7
 Wgp1QeubmOxIUEUiw69cLag4ZHqD6GvZzd9LcuAdcFL8WE8BqHt8wj43qF56M9tVnEI7
 PENlI/yO29+ebn8ThV6M7E/Ayb6N6yTlCtZgwxeLDMX3PfpPKjQu6MBECQCGgQD47Uy5
 YzTg==
X-Gm-Message-State: APzg51BL0yAPiH9oOm2tttTUpyC3xUQ1zGUwK29e8QZHZ30iC4SGfYFY
 AsRqxthWRk7PM05E7rCAzHAERUQvZaNZf060wussNw==
X-Google-Smtp-Source: ANB0VdYwzOiO3umS/nJCNvxpJK/kEF6fJG/A4srObouSf48y2bCpKtjMULIhw/rxVCiUxL8pG2BhWcaqbQLXbt0Mkh8=
X-Received: by 2002:a17:902:788d:: with SMTP id
 q13-v6mr7601659pll.149.1537368944571; 
 Wed, 19 Sep 2018 07:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=noty_TQ2jvQw-Yxb-RYe+0xOXa4F39ozF11r9PN1w2Qt_Dw@mail.gmail.com>
 <C385EBD1-871A-4E5B-8FDE-80146795CC6D@fuzziesquirrel.com>
 <CAO=notx9KnTNNC1UnL=DQkfpgqaUmKsbMeAG1H8CkodXGDVQ4Q@mail.gmail.com>
 <DAB66DC6-18D1-4784-9875-BAD64C2AD861@fuzziesquirrel.com>
In-Reply-To: <DAB66DC6-18D1-4784-9875-BAD64C2AD861@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 19 Sep 2018 07:55:33 -0700
Message-ID: <CAO=notyjsimVKO3bjc_pJBPFYTkRc05o5xW+HnC86exAk8LTmA@mail.gmail.com>
Subject: Re: New Repository Request
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, 
 Emily Shaffer <emilyshaffer@google.com>, tomjoseph@in.ibm.com
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
X-List-Received-Date: Wed, 19 Sep 2018 14:55:49 -0000

On Tue, Sep 18, 2018 at 3:37 PM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
> > On Sep 18, 2018, at 11:47 AM, Patrick Venture <venture@google.com> wrot=
e:
> >
> >> On Fri, Sep 14, 2018 at 6:00 AM Brad Bishop <bradleyb@fuzziesquirrel.c=
om> wrote:
> >>
> >> It might be good to have a conversation around how we handle the OpenB=
MC OEN
> >> though.  Putting things there would seem to have lasting impact for ev=
eryone
> >> using OpenBMC and we don=E2=80=99t have any process in place for that.
> >
> > That's correct.  So, right now, the extra handlers aren't enabled to
> > be included in the image by default.
>
> I=E2=80=99m more concerned with the number the end user types in when the=
y run ipmitool.
>
> > Someone would need to select them, which I like.  As that's an opt-in b=
ehavior.
>
> I=E2=80=99m not understanding the relationship between opt-in and the OEN=
 number.  In my
> mind there isn=E2=80=99t one.  Isn=E2=80=99t the question instead: for a =
given OEM extension, is
> the OEN number OpenBMCs or foo-corps (irrespective of whether or not a sy=
stem
> integrator opts-in or opts-out of including a specific extension in their=
 image).

So the OEN just existing in the source doesn't impact anything.  It
only allows some piece of code to use that number.  And any handlers
that register in that space only exist on a platform if the platform
owner selects them to.  If a functionality isn't there, the ipmitool
users just get an unsupported style error indicative of any command
not recognized -- which is what happens now with the commands that
aren't implemented in the core.

I think the general goal with companies exposing their IPMI special
handlers is to share compliance with each other to some extent, which
is less about the end user and more about infrastructure layers.  I
don't imagine many people playing around with ipmi will care or build
images that enable these extra commands, but companies may.

I'm not sure if that was your concern.

>
> > And if there=E2=80=99s interplay between the things, they can explicitl=
y indicate that in
> > bitbake and in a README.
> >
> > Consider, that each company may want to share their handlers - which I
> > think is great.  It enables vendors, if nothing else, and encourages
> > them to switch to OpenBMC to sell hardware to IBM, Google, etc.  I
> > also prefer the opt-in model for features, which this fits (repeated
> > point).
> >
> > If we share them openly and register the numbers in
> > phosphor-host-ipmid, we can better enable a vendor or someone to say,
> > I want to support _all_ the environments, and just flip all the
> > switches.  To this end, I'm considering re-submitting the oemgoog
> > header to phosphor-host-ipmid, but by flagging its inclusion via a
> > build-time flag.  So, one could say, build a clean phosphor-host-ipmid
> > by building the default, but if they --enable-google or --enable-intel
>
> I feel like there has to be a way to do the same thing without the need f=
or
> =E2=80=94-enable-xyzcorp switches.  I wouldn=E2=80=99t want to maintain t=
hat.

Yeah, I went down that road a bit and it doesn't stay pretty long.
But really it's unnecessary to gate whether a header file exists when
that header file only provides a list of numbers.
