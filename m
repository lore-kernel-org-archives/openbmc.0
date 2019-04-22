Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="pue/jz69"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44nvZn0kmGzDqLX
 for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2019 04:03:26 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id y5so6916265qkc.11
 for <openbmc@lists.ozlabs.org>; Mon, 22 Apr 2019 11:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=slVqxrt3dejLnJSVbZ/qqTfhe1awitlKNEi8KioWkdA=;
 b=pue/jz69Ht9zUsFQrl7wMOtUKPWQMO0xPIq+hb+qKPfnsTWMqvi+SRYlipwfCwmYeI
 4MGH+OIDw54EMcJSlZo70ER6wXOBIHy8QJXfmgk2ErayGV3L5O6DW1G+D5ZOuZXf977k
 QHhuazafUDT8DCRhWX9fy/E98guGOAfba/aXkq0pnY0eASxZbTuEjtciH3To18onnQq7
 OegBZwKe/Nv/e/WTWgUqbZgYP3DJGZshnvPxWAd3LhNqSGOVpSmzaM6Tkv7mTzGdC3l9
 dHYOwh+juaQAq9PIpYJQotM1zFusEns/UcmtFPz9eYtkpPPG4WlHssIOWG62020Lld6d
 GUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=slVqxrt3dejLnJSVbZ/qqTfhe1awitlKNEi8KioWkdA=;
 b=QMwOOarqlZGdFtkzdxLtT+FjuuY6qJLhcrNJWrkuHAOLfsZZJ0s4goOc3BaSaYe9TX
 kpTYag+XNtG9G9q9sBvpW3CCBWxPTisYA7K2bVgJn/SDOO4a572AqaJmHhgg9RMsKrwG
 wkLhQyuQtWNlXuBHO6yWCUOtI3rjdRW2I6pHBQawPoCdMTjJIEKXOLFXVU6aBAgmJzqZ
 HHun6IDJ70t9l3bwprOKmDyRlgrYSL4OaSCtKc6SEjyleYP2ncJxHhqVz7iHsGxFTCO1
 oseWUqqnqYeTA+HQKRZpuqN2XzxSTqLJe3Nb0ATrAatsVgPHTASWaraSbASu3rPa5Q/R
 5XgA==
X-Gm-Message-State: APjAAAWoYcryTChZbDW+0j7HHMvv7bYB8teJNgLu5o1D0zAYfBrQ7GRk
 +rr4otNzNrpW7u7Pzp7XNWPjvPepBVnokOtx5b0yEQ==
X-Google-Smtp-Source: APXvYqzM69V9IXnKIXmG96EUKT2dEFickgDrQHCKW4eCk02xY2RUCLVqKzZIQ89ElsLAWBSEdzmoJU2f0xpRsXADv+I=
X-Received: by 2002:a37:7b05:: with SMTP id w5mr15083802qkc.354.1555956202497; 
 Mon, 22 Apr 2019 11:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwmhWoeCry_Z+xL=7N1Pp+74tJ9BCF7nr4Jq1MwqRjfOA@mail.gmail.com>
 <BYAPR02MB58478B07866A63D01DA3EB25AE210@BYAPR02MB5847.namprd02.prod.outlook.com>
 <CAO=notzqWthZ29ghauXdzS7Y8WYeVrnMbbmz6Tgt=R6n_mRRAA@mail.gmail.com>
 <BYAPR02MB5847D889707010DEF7F58A95AE220@BYAPR02MB5847.namprd02.prod.outlook.com>
 <CAO=notyZ8Qj96iGYqcPMnkMFSL-Q38-OC8F88oAgpsmu030pxQ@mail.gmail.com>
 <BYAPR02MB58475342BB3F33226E6446C9AE220@BYAPR02MB5847.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB58475342BB3F33226E6446C9AE220@BYAPR02MB5847.namprd02.prod.outlook.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Mon, 22 Apr 2019 11:03:11 -0700
Message-ID: <CAJoAoZnBEWP+x_R=55Cp9rh=iyh7QZMqfvMrnWqAjmjQ=qvvGw@mail.gmail.com>
Subject: Re: Seeking openbmc programmer's editor info
To: Mark Brown <mkbrown32@hotmail.com>
Cc: Patrick Venture <venture@google.com>,
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
X-List-Received-Date: Mon, 22 Apr 2019 18:03:30 -0000

OpenBMC is cross-compiled to target the embedded chip that it will run
on (often an Aspeed or Nuvoton part). I really doubt anybody is doing
their coding on an AST2400 :) Those stale-Ubuntu-targeted instructions
might still work, and if they don't, please let us know which
libraries are missing.

I use a Debian derivative and Vim. However, it's worth noting that
openbmc/openbmc references a bunch of other Git repos. Bitbake will
pull these down and build for you, but if you want to edit anything,
you'll need to either check them out on your own or use devtool.

Can you paste the errors you're seeing with C-Scope? (I don't use it,
but the text of the error might help us suss out what's going wrong.)

By the way, even for questions like this, it's better to mail the
entire list than choose one person at random to ask in a direct email.
Later developers may have the same question and your email will help
answer it for them. :)

Welcome to the project!

On Mon, Apr 22, 2019 at 9:22 AM Mark Brown <mkbrown32@hotmail.com> wrote:
>
> On the official github   openbmc/openbmc   page:
>
> https://github.com/openbmc/openbmc
> ==================================================
> 1) Prerequisite
> Ubuntu 14.04
> sudo apt-get install -y git build-essential libsdl1.2-dev texinfo gawk chrpath diffstat
> Fedora 28
> sudo dnf install -y git patch diffstat texinfo chrpath SDL-devel bitbake rpcgen
> sudo dnf groupinstall "C Development Tools and Libraries"
> ==================================================
>
> ________________________________________
> From: Patrick Venture <venture@google.com>
> Sent: Monday, April 22, 2019 9:16 AM
> To: Mark Brown
> Cc: OpenBMC Maillist
> Subject: Re: Seeking openbmc programmer's editor info
>
> + openbmc mailing list
>
> On Mon, Apr 22, 2019 at 9:11 AM Mark Brown <mkbrown32@hotmail.com> wrote:
> >
> > The openbmc build instructions state that Ubuntu 14
> > should be used.
> > Are you saying that you read, navigate, modify source code
> > in a different development platform from the build ?
>
> Yes, what documentation are you reading that says to use ubuntu 14?
> It's likely just out of date.
>
> >
> > Also, someone else mentioned Vim/C-scope -- however, I experience
> > many "cannot find file" errors and then hangs of the Term window
> > under C-scope.
>
> I don't use C-scope.
>
> >
> >
> > ________________________________________
> > From: Patrick Venture <venture@google.com>
> > Sent: Monday, April 22, 2019 7:26 AM
> > To: Mark Brown
> > Subject: Re: Seeking openbmc programmer's editor info
> >
> > I don't use Ubuntu 14, but generally grep/sed/vim are used most.
> >
> > On Sat, Apr 20, 2019 at 5:30 PM Mark Brown <mkbrown32@hotmail.com> wrote:
> > >
> > > I am a firmware guy watching the traffic on this email list.
> > > I am interested to know what programmer's editor is most useful,
> > > under Ubuntu 14,
> > > to navigate and read the source code here, perform multi-file searches,
> > > and help find bugs.
> > > Which editor is most commonly used here ?
> > >
> > > Mark
> > >
> > > ________________________________________
> > > From: openbmc <openbmc-bounces+mkbrown32=hotmail.com@lists.ozlabs.org> on behalf of Patrick Venture <venture@google.com>
> > > Sent: Friday, April 19, 2019 12:43 PM
> > > To: Joel Stanley; Brad Bishop; Andrew Jeffery
> > > Cc: OpenBMC Maillist
> > > Subject: meta-ingrasys patches required for new merged drivers
> > >
> > > If you don't work on or maintain meta-ingrasys/meta-zaius you can stop
> > > reading and go on with your Friday. :D
> > >
> > > All;
> > >
> > > https://gerrit.openbmc-project.xyz/20692 and below are all ready-to-go
> > > and some are required for the meta-aspeed bump staged for
> > > openbmc/openbmc.
> > >
> > > I wanted to throw this into an email to it jumps out more.
> > >
> > > Patrick



-- 
Emily Shaffer
