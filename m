Return-Path: <xow@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::22b; helo=mail-pg0-x22b.google.com;
 envelope-from=xow@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Z5ud/uKz"; 
 dkim-atps=neutral
Received: from mail-pg0-x22b.google.com (mail-pg0-x22b.google.com
 [IPv6:2607:f8b0:400e:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybSgq561jzDql9
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 11:15:03 +1100 (AEDT)
Received: by mail-pg0-x22b.google.com with SMTP id j16so8433188pgn.9
 for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2017 16:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ed7IqTRYxtekCoZt0VG7qtClajfhdhjX7ErHa09B/aA=;
 b=Z5ud/uKzaDZBcFyrHb8ZPmORjEDJ0cm9tf2w0hPAx5+k0I30MGeCVoYmhdcfWYwODb
 4TdMuwBgFW167Ka8KtjB4yWgcZG1kwazETSBtc4SLYxUxgtTkKDiBylXY51/bsS7FWBk
 yB0NLJIq74kH6ajVuO3rwFAu1OTe683Uqd0LHqUAtQ2Y3V9pCkd3UsYTroM+xz1x8ehm
 yMPtaQbsYwtkA7VHgNNybSHiiPuizg3/s4Yn0Mk65VKY6oWy8UFCFBxBA8OkPyQqWc7I
 +08VJNWXIVXQiljoYYgPhy2tjtHs8MCVG5Z6BAcYEE7s8uyB31j0FkQ7moBWhfP4FIqi
 +nSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ed7IqTRYxtekCoZt0VG7qtClajfhdhjX7ErHa09B/aA=;
 b=GtSOPjliA4EK43x5M1ST8DqOX9Xy7jY2B58BvvWLTrGkRevRxv5zFDVokGv0fim9Mg
 ShFUCmEd2+TchOWdcC6+Hs+D1wfKrrfW88yR2bFUebOiHxUF9avL+l8Lxv4kLUWwuk77
 tc01EAcYB/TnnwXkBrtaRaLfYP6t4tqwcM05lFjDVwC5UYmbbJcBgkdegk4vQcN6iysZ
 V7LUpMKjKyktSTt48lC4efdcAl/1dOn3GPwh+J+yzMwZJxOn2UFNIx4rV5OenvYOqJ5A
 TPCcLwZPB74VDudaK61PWdT8Z2j5pU6HWPFQLzW1Yim63tKE/M9E7SoC8Wnl2IqOepim
 5uEQ==
X-Gm-Message-State: AJaThX7b3FnpOsQsoKMoFU6jBkt18lE9UtXfixtYQRosLADsGRrM8gTF
 eGT/D3ILqstAWdhUxRfRKGyEqqHCRdrhFNGtlfmAww==
X-Google-Smtp-Source: AGs4zMYyA8htc5bShsCDTSTGb2k4xkniFWnyu+db9Oj6vhlAKUdacst8JprnsmGNerfnSBE7cVbW2kclAolY2Vi3W+4=
X-Received: by 10.84.129.70 with SMTP id 64mr10593180plb.444.1510618500489;
 Mon, 13 Nov 2017 16:15:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.138.38 with HTTP; Mon, 13 Nov 2017 16:14:59 -0800 (PST)
In-Reply-To: <1510551468.4287.76.camel@aj.id.au>
References: <CACPK8Xf0mLw=fGDEGwdvQ6Bycgmf3jUU8WGJJ3+8VcTUJ_9CUA@mail.gmail.com>
 <1510551468.4287.76.camel@aj.id.au>
From: Xo Wang <xow@google.com>
Date: Mon, 13 Nov 2017 16:14:59 -0800
Message-ID: <CAPH-5w66kJosk_D8KFKxupHz1Nh_ajeopU7DU6f3B4BvBcq0Wg@mail.gmail.com>
Subject: Re: Yocto, Kernel and OpenBMC security maintenance
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed.tanous@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 14 Nov 2017 00:15:04 -0000

On Sun, Nov 12, 2017 at 9:37 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> On Tue, 2017-11-07 at 15:56 +1030, Joel Stanley wrote:
> > On todays community call we chatted about security updates for the
> > project. Nancy pointed out that there tools in the tree that are many
> > versions out of date and have security fixes available, but not
> > applied to our tree.
> >
> > To date there has been no focused effort on ensuring known
> > vulnerabilities are patched, weather this be backporting patches or
> > updating to newer releases. I suggested we focus on ensuring the
> > OpenBMC tree, as the upstream for our products, is where security
> > fixes are applied.
>
> For what it's worth there's some discussion of upgrading to Yocto 2.3
> and what we might do to better track master on the issue tracker:
>
> https://github.com/openbmc/openbmc/issues/2461
>
> I agree we need to improve how we track things such as security patches
> that go into upstream.
>
> Andrew

Any opinions on whether to merge point releases (e.g. currently 2.2.x
releases) or to continuously pull in from the stable branch (e.g.
currently yocto's morty branch)?

Also does anyone have objections to pulling in 2.2.2 at this time? It
could potentially be painless. The fixes we'd get are noted in release
notes.
https://www.yoctoproject.org/downloads/core/morty221
https://www.yoctoproject.org/downloads/core/morty222

cheers
xo
