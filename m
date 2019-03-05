Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HKXBXwv5"; 
 dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44DW1F3Zy0zDqHf
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 08:56:00 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id h1so6727882pfo.7
 for <openbmc@lists.ozlabs.org>; Tue, 05 Mar 2019 13:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1IIGKQgNmM23VnPAbQvkwWx/J6gTEDYQTwZkT+qcb3U=;
 b=HKXBXwv5SEOiZOwgtJ2VEdAi/JOWTeD/AV6nWys9HIMrv2MfX3Z7oy/Uu4z3DNcQ5Q
 JpmZaEbSV/EHIhD3w3U0XUKBfG4H3q1DMg9pSO5Y5CwTGzBH0aNEmyzFbs6sD1EbEnvu
 /U0gbHSjjbodWY5oIorMtxiZI0AK1r75BcAm/1EDmlGa5m0GLIrJE7UIwtVIzCUvkMjC
 maVq/CFR555+yJ6dIyGLGfeVffvIjR79G9fMI6ub/cpypQiK28i+z/+MLCUMmxhBmYpC
 UT52IOQugJSoA0BuRt0P9qWy92/avX5D6bjsB6ifuhKDJMi9iHYDLVbvKcdY0HhcwD2r
 ymsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1IIGKQgNmM23VnPAbQvkwWx/J6gTEDYQTwZkT+qcb3U=;
 b=Qso0v+rJ5IBAAigjGtVVXuRwNpyKLoAAwjXA+Azxblv6wYdMeW8obESrhaZLYqSW/d
 yIf2ZW4BQz97FVlxQnso1af5oCFzjEs4taljpe/YbRLLwzSxXjrJ2ND4wNAdrhYYm+pz
 Nh4gHesehHS5FU2IlgTmpnxwL2+bnCMhoUxJI0hGT7v8s9nw3lzlwVdXmjIW1cDdMr5g
 Dt+2v99WKWbGcZXLRGO5YLHrhUBbE/fkJOrIYKTrfZ9x8DwNRn7BS59DVmi1ggNS1JAQ
 YtzmM3HQ7v+FBfuWl3XRMHUWhDQkLkkLNFJLvznsRHKEAhW4+Hxa+dAVWwDawW4qRkeC
 R3vw==
X-Gm-Message-State: APjAAAVVGnaHbm4LeyrHy7bwxipmLhxlfaskNerTLEE24Bcda30YRHwS
 pcQAylK2QyLsg65ZL2QMlP1w72NHJUDfZ5/Jx4Wasw==
X-Google-Smtp-Source: APXvYqwlGw1yAoVcTavl3k/bODRGglgLF4xZaevIDERfdYGEOAJTk5nCYA8uBnnsx+PyaXFLkqotsxYmlyH2BdMfiTs=
X-Received: by 2002:a62:76c9:: with SMTP id r192mr3997221pfc.251.1551822958420; 
 Tue, 05 Mar 2019 13:55:58 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notzgE0XdR_paQsbzbS7jfoshdT=pti3kMZ0wObb7q6hU0g@mail.gmail.com>
 <CAO=notwZ0RX2WeqyEFgNBYYaYL_eMXjZzknpfwwGuanT1WpwrQ@mail.gmail.com>
 <CAO=notwHkTs1NhWLOu22vjcQuXkOaHOAi1A7ZodgtPFKkNfkdQ@mail.gmail.com>
 <20190305215604.tyyu6yz7ospzxmi7@thinkpad>
In-Reply-To: <20190305215604.tyyu6yz7ospzxmi7@thinkpad>
From: Patrick Venture <venture@google.com>
Date: Tue, 5 Mar 2019 13:55:47 -0800
Message-ID: <CAO=notxAAY6h1ChP5GkpyA6ssDf+y7mzkXjnfKbR23X=7WVCaQ@mail.gmail.com>
Subject: Re: new repo request
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Kun Yi <kunyi731@gmail.com>, 
 Natarajan Gurumoorthy <natg@google.com>,
 Benjamin Fair <benjaminfair@google.com>
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
X-List-Received-Date: Tue, 05 Mar 2019 21:56:02 -0000

No problem, thanks!

On Tue, Mar 5, 2019 at 1:55 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Tue, Mar 05, 2019 at 01:23:12PM -0800, Patrick Venture wrote:
> >On Mon, Mar 4, 2019 at 11:33 AM Patrick Venture <venture@google.com> wrote:
> >>
> >> On Mon, Mar 4, 2019 at 10:12 AM Patrick Venture <venture@google.com> wrote:
> >> >
> >> > Brad,
> >> >
> >> > Please create a repo: ipmi-blob-tool (or) phosphor-blob-tool (at your
> >> > discretion).
> >>
> >> This codebase is meant to run on the host and not the BMC, but will be
> >> specifically used by other host-tools talking to OpenBMC.
> >>
> >> >
> >> > I'm going to write up the blob tool as a library and then a small
> >> > utility, and then use that in phosphor-ipmi-flash so that we can have
> >> > other blob tools more easily.  There are a few other use-cases we've
> >> > run into, and the core blob code for the tool currently lives in
> >> > phosphor-ipmi-flash, which is sub-ideal.
> >> >
> >> > Patrick
> >
> >Thanks!
>
> Np.  You asked for this some weeks back in a different thread and I
> forgot.  Sorry ABT.
>
> -brad
