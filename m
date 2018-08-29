Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="suBN2rdv"; 
 dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420skl5QNGzF1RN
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 03:17:35 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id w14-v6so2581251plp.6
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 10:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SV/U6y1RwtO9J0sH3ojEO2BYBlEq13mAQj/nQFrPCXs=;
 b=suBN2rdv93QPcaPsRWnJDvcN/VQmjzi0orX+D1wWKKisSo3rcR2zCUUp2gdVgqKFyW
 c7spFljxb5Cp1kOb8h9oIzOACXY1BPNq9VuTKfGpaRjs4zIMySNIDw5iEGShzL33FPDz
 qu/TdmvYyuaFHm9R14n0kZkMA6ST+C33DDFlPPw8vhja6G/Kfh5cGDeDY0mZZqgnDM7V
 c1dsQckBIXijMrWTCNVbB2qo+4odAxgHJ5IzY4M0oY0c8dZ+yk+mQJe84jmnQMjWsq1G
 CE5CK4brF3p5ptHDHP1ifyzJHFkc/0QCsMNAylwtTxz9UrKiHUJHPF1rGYS2X3JjEFC4
 5YqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SV/U6y1RwtO9J0sH3ojEO2BYBlEq13mAQj/nQFrPCXs=;
 b=FSdkrLKO5CBnoplHjNIoWwv1e4AIntIlm0ui/NEQHWKIxhBH/xrfaSrQW1C0sng+0U
 GBXPkXgQOTsbL6Ek+9dun4D7u2rvUbn8o8WNjKZr9H945mKwmrsgytYcaL/DgN8bKogw
 Wmz4ma16CZzsYAJSzofcoWhvp5QYGRcGBQzFJGUb85fNtax/7ycDqYMj2/QK0ocyxwCJ
 WsqAZkd3+VXgHz8RqrDvAFmAOF/vbdMR1QU4yAvFnLri+FAivZRZYVByaPToAqMScqI5
 Nf9jD2u2IqadSFw3mSgGbiaf4D+Y4/ZDwOvjitgq4EYonn8tMaV5kXO9ALW/aVCTh6Zb
 UEDw==
X-Gm-Message-State: APzg51APzzo5/qZ5HTkJQY9SY5t80sfnhySzmPNykhCZWFZQkz6g48m1
 qvYg7d2WdBbNpLiQp2wmeZygUN44BZAcaoUakm86uw==
X-Google-Smtp-Source: ANB0VdYcIvuDPH0lFRdUfVnDw3iJLZJ/xuhsbRGqCoJS3JzeX+GzPPO1akLPvQHR0YFxVa8GpLiMc+oaucWEsnWa75E=
X-Received: by 2002:a17:902:28eb:: with SMTP id
 f98-v6mr6755534plb.149.1535563052862; 
 Wed, 29 Aug 2018 10:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxjhD7u8Gfa-D5zdJysuqzFMNqQM4fsfa3RmN5geudgrw@mail.gmail.com>
 <CAPnigKk0USYdx7iJNtei5rkuutvKWqxJoKhBpQNj44+BVOabNQ@mail.gmail.com>
In-Reply-To: <CAPnigKk0USYdx7iJNtei5rkuutvKWqxJoKhBpQNj44+BVOabNQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 29 Aug 2018 10:17:21 -0700
Message-ID: <CAO=notxqgfdnWz41T0riD+2oLB7LHpMr=GP9hRU+ZLQu6F+srA@mail.gmail.com>
Subject: Re: Single-Source
To: William Kennington <wak@google.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 29 Aug 2018 17:17:37 -0000

On Wed, Aug 29, 2018 at 9:29 AM William Kennington <wak@google.com> wrote:
>
> So I've taken the source from
> https://github.com/openbmc/docs/blob/master/cpp-style-and-conventions.md#clang-formatting
> which closely matches what is in sdbusplus and modified it for the
> projects I've created to better enforce the style guide. I don't think
> it's possible to have a single source of truth at the moment since
> some projects have more relaxed style. Although I don't think it would
> be too big of a deal to force those projects to reformat. My current
> delta between the original openbmc one and a more strict formatter is:
> diff sdbusplus/.clang-format sdeventplus/.clang-format
> 20c20
> < AlwaysBreakTemplateDeclarations: false
> ---
> > AlwaysBreakTemplateDeclarations: true
> 45c45
> < DerivePointerAlignment: true
> ---
> > DerivePointerAlignment: false
> 68d67
> < PointerAlignment: Right
> 70c69,70
> < SortIncludes:    false
> ---
> > SortIncludes:    true
> > SortUsingDeclarations: true

Other than SortIncludes which is being handled at another level,
please update the model clang-format file in the documentation to make
it model more closely to the spec as you've described.

Obviously, a problem can be that the clang-format goal is regularly
changing, but there isn't an urgency in its usage.  I think eventually
consistent is a reasonable approach.  Some repositories will be behind
until some point, but it's not really a problem.

> On Wed, Aug 29, 2018 at 8:54 AM Patrick Venture <venture@google.com> wrote:
> >
> > Brad;
> >
> > While working on updating the documentation, which holds a
> > clang-format example in it, within the markdown, I was curious if
> > there was a single-source of truth w.r.t configurations of this
> > nature?  I imagine it hasn't been an issue yet, but I'm going to
> > update clang-format files to use the header inclusion, once we settle
> > on the exact pattern, and it'd be useful to have a single-source file
> > where I could make the change, and copy that file out into places --
> > since I'm not sure of a reasonable automated approach.
> >
> > Any suggestions or thoughts would be appreciated.
> >
> > Patrick
