Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gEowZLC6"; 
 dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43VyQr6NYNzDqGB
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jan 2019 06:19:32 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id w7so16374428pgp.13
 for <openbmc@lists.ozlabs.org>; Thu, 03 Jan 2019 11:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O2sXdAhcdM4HGbxC3rSU/+QlJQB4sezqHIjBYnUfmwc=;
 b=gEowZLC6PGjl+4yKMHW+Os5Ze456C4dTBg4ifAiObv/f/jz1gKS1mRYo03lRIS1bKm
 uQqOu8uRIR0V3qEobODU/y1CnTGgnvqutETxuouTJcEjRpwc0mJv/QdXdAnIlPJ9mq87
 +ixZ0p492ZTNOC8c9SxbyPPUM3PmAF13qM3BI8mG1ONZpGpnzRRTAYJsZv/AEIseJDjC
 DutDMUWfNYTjSJ5Qi2f0/hxtR0hynz6xQr1edljDukpM1rzdJRh/6NRdVxlvf8MG+dGO
 8a9vJ+SlsysdSjX1ugzme/XKoq+647Ajl3mcugszG38XGt++kL2DQf3VEhPkcBFHcZ0J
 5RfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O2sXdAhcdM4HGbxC3rSU/+QlJQB4sezqHIjBYnUfmwc=;
 b=gr4KwEZZXnsyW2fDhgq1IgXCDZSGj240AvVlMtNvvYitbbzqSAOMtO7CqsI8xU3qBe
 qwaTOPqqPtLyVMdzKgMkK+ofvXxsncVFldr3Np081EcES15dTFHB5KRqK95ZTPFkA8Tj
 eviFkheMMNEMXkL6nILUNaNiKnWvWpIZ98kTMTECfUoCvhAZ6p22LMGgnoyBJrM4zYVK
 LpvvM66vU8NJtpxM0/DQECOKgRCpwOr7V1UFIZ49gRp/UP+sAyE2hoxwV07YDdRdVXaZ
 lQ0PqiPqLIUVf7hguXn3GmEab2RxzlZOJ1Xoi2ZAGVduLz5SvooBcrUAl9YNJN5pfJJC
 Ln5Q==
X-Gm-Message-State: AJcUukcRirHG9zbs07inEBymmnANIYAxK3cmTCv22Y0XKaDCFb/B4OrZ
 AysSUExSax0XTptwAlrubWXmUdzISFTuliI9W2y53Q==
X-Google-Smtp-Source: ALg8bN4KQO3wOMey/t/1F10qGU0rBx0lFKFSbmE9GfmYVJA0t3rTqf/Z4cxqx9GnSjZ2AFsBf+uYh1EdBI9EYRbuVs8=
X-Received: by 2002:a63:955a:: with SMTP id t26mr18237587pgn.449.1546543170306; 
 Thu, 03 Jan 2019 11:19:30 -0800 (PST)
MIME-Version: 1.0
References: <000601d498c5$7c4c2010$74e46030$@linux.intel.com>
 <CAO=notz4=R-v8yoyYRqRDBBvSaB6mBUNAaZbeQcf0a_wCHQ7qw@mail.gmail.com>
 <e7a140e4aaeb2bed76a9d36cbc422ea6@linux.vnet.ibm.com>
In-Reply-To: <e7a140e4aaeb2bed76a9d36cbc422ea6@linux.vnet.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 3 Jan 2019 11:19:19 -0800
Message-ID: <CAO=notw81jtXKHJOK2MaqG73Pu86=ZZY1UjYzg-NbHQnaqZUjA@mail.gmail.com>
Subject: Re: journal log messages are missing with latest version
To: Matt Spinler <mspinler@linux.vnet.ibm.com>,
 William Kennington <wak@google.com>
Cc: Yong Li <yong.b.li@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 03 Jan 2019 19:19:34 -0000

On Thu, Jan 3, 2019 at 10:07 AM Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
>
> On 2019-01-02 13:09, Patrick Venture wrote:
> > On Thu, Dec 20, 2018 at 4:38 PM Yong Li <yong.b.li@linux.intel.com>
> > wrote:
> >>
> >>
> >>
> >> Hi Patrick,
> >>
> >>
> >>
> >> I encountered a problem after upgrade to the latest opnebmc version:
> >>
> >>
> >>
> >> These log messages in ipmid are missing with the =E2=80=9Cjournalctl -=
f=E2=80=9D.
> >
> > Which log messages?
>
>
> This showed up on all of our systems too, anything logged using
> phosphor-logging
> is missing from the journal.  I even ended up using a git bisect to also
> narrow
> it down to:
>
> phosphor-logging: srcrev bump 30047bf964..31552c05e2
>
>      Patrick Venture (5):
>            add sdjournal interface to inject tests
>            test: use only one main library
>            bugfix: add fixes to mock class
>            bugfix: rename method to match implementation
>            test: add test to force building of sdjournal mock
>

William, you've been digging into sdbus a lot recently, can you take a
deep look at the patchset above and see what I may have messed up?
The phosphor-logging unit-tests were broken until I got it "working."
Which lead me to believe that it's not correct -- and the daemons that
have unit-tests that hit the log message are seeing the calls.

>
> >
> >>
> >>
> >>
> >> My tests shows that the blow change is related, after I revert it, I
> >> can get these log messages.
> >>
> >>
> >>
> >> Did you meet such issue, or any suggestions/comments to narrow down
> >> this issue?
> >>
> >> https://github.com/openbmc/phosphor-logging/commit/59a6b1f27e83066baa6=
f3711c88d6a3b9a5c4d49
> >>
> >> add sdjournal interface to inject tests
> >
> > There were some follow-on patches for phosphor-logging that you
> > shouldn't need -- it's
> >
> > What SHA is for your https://github.com/openbmc/phosphor-host-ipmid ?
> > (so I know what version of that is in use by you).
> >
> > Checking the HEAD version of
> > https://github.com/openbmc/phosphor-host-ipmid/blob/master/Makefile.am,
> > I see it's including the proper libs to get the full phosphor-logging
> > objects.
> >
> >>
> >>
> >>
> >> Thanks,
> >>
> >> Yong
>
