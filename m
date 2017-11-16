Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::236; helo=mail-ua0-x236.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="tw6ZuSf4"; 
 dkim-atps=neutral
Received: from mail-ua0-x236.google.com (mail-ua0-x236.google.com
 [IPv6:2607:f8b0:400c:c08::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yd4nw6NZLzDr1t
 for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2017 02:25:55 +1100 (AEDT)
Received: by mail-ua0-x236.google.com with SMTP id l25so10770908uag.8
 for <openbmc@lists.ozlabs.org>; Thu, 16 Nov 2017 07:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+ve05d71Li/GdfW+uyi5cb+x0Iugjlys0IFmP2DYqqo=;
 b=tw6ZuSf4w3RLGf4kHl7cAVBps2OduVO49PCmFaiHhN1RVpqy0LDsAwVuU1u+6tjZnT
 ybyrLg72okXnTW41FK9Rflid1gEIA11PquRh5o0LdGJ5GCTs2SxWaBdNGoWDi0o7bP4H
 hfpuIp4eNH/kFhzdBdPrf1RjLfN5XCclo6D1wesM72ZQzMkAa0ALrR7b7bHj3U7wvvHu
 2EsBuvWWZ/QWFi0KM0i/oNpFSfx5TiWAqCVdr+nXoJVkoWDLKm0Ug5XaN6/a6UmH7PqV
 IZerdcfM5e3aiQE5tss0w8DPGiAD+A4Jn7nhLBoNOijEemd5bqBxH1oSLTL+0m+0Hkn9
 DJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+ve05d71Li/GdfW+uyi5cb+x0Iugjlys0IFmP2DYqqo=;
 b=ZAlewcSMggXA/A+qBsaaVkhl1d3lV+Ja/z5AD+Dg92dXcwuzR+Ho17l4EdMIYnITNF
 umHDmkjK3Mx8ugw9cyr6xft6Pmtss9weThESwFicitgQHM2ibFtvIc4dCJlHKkhSfox/
 cYQ1i4Yon9hwLxqFcBHbtVI8sP7DDYLgp6toanesFAq+lbB7OpYYdPEpgxdi8pdj/MX4
 FGFIbvoeZZrcACrUu6Xbyeui9lI91atmG7oFVlU/E0l/cKra1H2Cuh+E5Y1mQ0kzNjQk
 fiB1hWJ2FOtTfD400I8ffWOOVX/5rrYdRlzA5LuN6n18hP++HTLyP8i1eBYAqAcu7XcR
 7++w==
X-Gm-Message-State: AJaThX4ER4crs7X7cv+ggHi5TRe8CMngpdUWKZkJhj1w5mXuo4QB8y3t
 kgSz+7dkfbNdZToDQDi+Qh56Kw/vXYdmXMIscWh27w==
X-Google-Smtp-Source: AGs4zMbKM/bee7eiWs+lN802RSFIOz93sTVbsPsejhqqmMysZar31mCFyiNLWbC2wgNmpVLcKXdRy66A8SADDnEZbSE=
X-Received: by 10.176.71.226 with SMTP id w34mr1827777uac.33.1510845953063;
 Thu, 16 Nov 2017 07:25:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.94.150 with HTTP; Thu, 16 Nov 2017 07:25:32 -0800 (PST)
In-Reply-To: <1510798154.4287.86.camel@aj.id.au>
References: <7E9441B1E5EFFD4681F54958E82169932EAF506B@ORSMSX105.amr.corp.intel.com>
 <1B00151F-6B6E-4060-8316-F955F9A8E20F@fuzziesquirrel.com>
 <1510798154.4287.86.camel@aj.id.au>
From: Patrick Venture <venture@google.com>
Date: Thu, 16 Nov 2017 07:25:32 -0800
Message-ID: <CAO=notwsaQ1agzXi-r9jcKXL84ix2WWLP9PcCDRL1Kcubxj1Lw@mail.gmail.com>
Subject: Re: Gerrit code review velocity
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, "Tanous,
 Ed" <ed.tanous@intel.com>, OpenBMC <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 16 Nov 2017 15:25:57 -0000

On Wed, Nov 15, 2017 at 6:09 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Wed, 2017-11-15 at 19:09 -0500, Brad Bishop wrote:
>> > Do we have  a process for how long code review->test->merge should
>> > take, and what process it should follow?
>>
>> We don=E2=80=99t.  My personal preference would be for this to be at the=
 repo
>> maintainers discretion.  I=E2=80=99m sure that sounds bad since I am the
>> maintainer of nearly all of them, but I do want other people
>> maintaining eventually and I=E2=80=99d still say the same thing even aft=
er it
>> wasn=E2=80=99t me.
>>
>> That said, I=E2=80=99m more concerned in building a community here, so I=
=E2=80=99m
>> willing to submit to group-think if others feel one way or the other.
>
> Maybe patches should be left up for review for at least 2 business days
> if they're not a hot security fix or something equally drastic.

Not a bad idea.

>
> We probably need a way to identify the list of people who would likely
> be interested in reviewing them as well.

In terms of different daemons, typically the selection of reviewers
comes from the contributors for that daemon.  In point of fact, I pick
people partially by checking the blame history on the file(s) I've
modified when submitting a patchset.  Clearly other people may be
interested to know about a specific set of changes or perhaps more
straightforwardly, to follow a specific daemon.  In the former case, I
can't think of a way to handle this, but in the latter -- perhaps sub
email lists that are added to the CC line of reviews?

>
> Andrew

Patrick
