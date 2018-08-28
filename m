Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::233; helo=mail-oi0-x233.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IRfCIYLq"; 
 dkim-atps=neutral
Received: from mail-oi0-x233.google.com (mail-oi0-x233.google.com
 [IPv6:2607:f8b0:4003:c06::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420ChN5159zDrq8
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 01:43:16 +1000 (AEST)
Received: by mail-oi0-x233.google.com with SMTP id 13-v6so3684032ois.1
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 08:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v5sWdjCVCxJQm7P1C+NdiQMtqR+dmTX/ssg4MC8k51o=;
 b=IRfCIYLqCFY/+rCF4f/wbYbtIpPX/otozC7qEJSzqcZMl0KKRPYVij3OsgL8q9q/w8
 VxHvyZR8pQ+ldMSGO+u3X22N1QoWK9NmR7hzeoOrrCW3mM+f3xtzfCa32195AKji7BVp
 TFG3uVg81kxtiP7w7pw9isEGGZiDaSmf4vdt6idy7Zx5imREUr/xSTjHZoT+FtKQcF9Z
 RiSXMIYyCjTVfImj/nL6wADtVd6wUgkAWXu2H5fPDojlzGv46dVdYC/IpHk57WEQJp+6
 5gORiETNrsyb6NkibIRO4EQJlAABF843ozFMVKrsftrHbiIdveXFq1Yu6/Gc9kXKkDnj
 t7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v5sWdjCVCxJQm7P1C+NdiQMtqR+dmTX/ssg4MC8k51o=;
 b=tgzt5QCLAxNvrHnef2s/4utcxXm3J5M6sj0nZhsREDS4F2Fulkjf34kojpIT+RUoOg
 BpMH/RSb/rPzasMZhOGCdV4LHyRZd/2+HAzxvRXZmVNIQR9RIrRVdLOlH4T7gBMHomDj
 qqA5u3DziYR6CigXdQx2+t+Sawngk6fUcoDGxbRta+jlmYczZZMlmmKd7fJsYKYW+srT
 +4iMedy3Gw/8RDYXWT//gccRG59Zpm1xPPAt4htFhi56zFxXGn5HHgMOjh2e0BNy4uC7
 KGNMMzh/Lx2NT1X2BsSmeMTpB2Wjvg+bGLie7JSZDEPNggkGwvh8I2n7IWxALQfxu6Xh
 0GVw==
X-Gm-Message-State: APzg51AjJrza6f0q1K6QTwi8hgC9fYGzEJcdQuVT1Ukqx19Bmk9trixI
 alLpm829raKjB2gy/EA4C38DAK1LP1kR6LSNVtOK3jna
X-Google-Smtp-Source: ANB0VdZEjqFQb9wFeb7rH8LmxDEONI/K9eGfko4jGcb/+RYSuBR4EvKr1DSUYmbEDevpORt72Hd3vnOnuafG6ij5H6U=
X-Received: by 2002:aca:5dc5:: with SMTP id
 r188-v6mr1815162oib.320.1535470993439; 
 Tue, 28 Aug 2018 08:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
 <CACPK8XdtitrjvDpuiPiz_ew03m972ueGRXAhd4kM_z6YSVtL3A@mail.gmail.com>
 <0E782585-1B8A-4BF7-9454-443061BA9C32@fuzziesquirrel.com>
In-Reply-To: <0E782585-1B8A-4BF7-9454-443061BA9C32@fuzziesquirrel.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 28 Aug 2018 10:43:02 -0500
Message-ID: <CALLMt=rGmZ9-29xWMymUvdCAgVnFzQ+gyZDn3zXnWeR4imSYPA@mail.gmail.com>
Subject: Re: Proposals for commit log policy
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
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
X-List-Received-Date: Tue, 28 Aug 2018 15:43:18 -0000

On Tue, Aug 28, 2018 at 5:30 AM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
>
> > On Aug 22, 2018, at 7:58 PM, Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Tue, 21 Aug 2018 at 22:01, Alexander Amelkin <a.amelkin@yadro.com> w=
rote:
> >
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> some-package: bump version 62286ef3 to 4fa63380
> >>
> >> Author Name (2):
> >>  commit 1 synopsis
> >>  another commit synopsis
> >>
> >> Another Author (3):
> >>  great commit
> >>  yet another great commit
> >>  fix previous not-so-great commit
> >>
> >> Change-Id: some-long-gerrit-hash
> >> Signed-off-by: The Version Bumper <bumper@nowhere.net>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >> What do you think? Is this feasible? Any other ideas how we could simp=
lify creating release notes suitable for end users?
> >
> > I think this is a great suggestion. I would also like to see this happe=
n.
> >
> > Having the maintainers or authors of the packages submit their bumps
> > would ensure this does not become a burden for the central repository
> > maintainer.
> >
> > An advantage of the maintainers of individual packages submitting
> > their changes is they know the best timing for integrating their
> > changes, and know what relevant details should be added to the bump
> > commit message.
>
> I also would like to see this.  To be clear I mean the commit msg text ab=
ove,
> and not a =E2=80=98Impact=E2=80=99 token.
>
> The autobump script was deployed at a time in the project when _every_ re=
pository
> had the same maintainer, so it made some sense back then.  Today we have =
a much
> more distributed set of maintainers.
>
> I=E2=80=99ve actually disabled the cron job that runs the script, because=
 it needed
> some rework to handle the new openbmc/openbmc repository layout.
>
> I plan on simply _not_ turning it back on, and let maintainers do their o=
wn
> bumps like Joel has been doing for the kernel moving forward (Thanks Joel=
).
> Unless there are major objections.

I object!  At least 90% of the auto bumps today go through without
issue.  This keeps our openbmc/openbmc master consistently up to date
which I think is a big benefit to our community.  We're able to
quickly find regressions with our automated tests which are constantly
running against the new content coming in. I feel like we're adding
more work with minimal benefit here.

To summarize:

- Adds a layer of manual work that has minimal benefits
- Prevents us getting small continuous changes, and instead will
encourage larger big chunks that are tougher to isolate fails on
- Even if individual repo owners are forced to do their own bumps, I
don't think many will address what started this thread, summaries of
the changes and impacts of each commit.

On the other side of thing I realize this is how yocto does it (manual
bumps) and it does allow more individual control for repo maintainers.
I just don't think at this point in our project, it's worth it.

Andrew

>
> thx - brad
>
> >
> > Cheers,
> >
> > Joel
