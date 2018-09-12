Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="S1GEscW4"; 
 dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 429P503D42zF1nv
 for <openbmc@lists.ozlabs.org>; Thu, 13 Sep 2018 00:17:55 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id i26-v6so1073134pfo.12
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 07:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zq2Ex1+HBBRScgCyDmb7Iipq+5+XR14IAwTVvBq6NIk=;
 b=S1GEscW4XBNIUpBhvN+BOZOIPn8KobAVToWwkRZjr4LnbBDidiWq7+9l9npSK8T2p+
 Vf8Uj7vZTTkETRPBJP78z8tzBlOeeJA4SFOn4hpIQ4uXD/WpOePN1qdoHoa34ywF0Ws/
 Jq0KjcrRL9I/myZdSnteby5ZSyEEjL6Dn205QjYhvBXOXgQlYfKb6NoDk8UB7fMnSK7u
 1w2NR/qrZ4q8pisAXOjxwWJjd+Ozmm+nMQAlcWbZthJvD58qBSB7coyiQfca+iRDJnol
 QtgxONH0OUK6nO0oMg9eKnc8ucrwwUa7S7/XSofQW6bk8U3U/qaaJBL4pB3KHyVji/VM
 dhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zq2Ex1+HBBRScgCyDmb7Iipq+5+XR14IAwTVvBq6NIk=;
 b=TRUv0gipyMGxBRbHyd2YhQKbvyoyS0yBXz6zDTS98h1cFYrrnXuOnjqcopPCDPtcl2
 gQuSiWzuuT0bQBKDpWMly5GlcgSi3ttPJdl1FFItTqQwo5LgzOnM0wfEqvVVEg5J6iLo
 3UursUx1VA4vHn87pz8VMpU5V+ORzddjgl9aR55g1vOmo7db9COgyvi9/blg93/YmA17
 9d2U9pXnL6AlBiiwbE4/pOL/w6i1FKlUilUgWTiKxsy1w0cjSnK1b0387wvpk3vpwS0x
 JIwKO3eKzyvNoCgpM5wWraKa5d43mFIQ5zbpPtxRoK0uAi+rn+KtVfR9uRaBMFQIxKPh
 cRgQ==
X-Gm-Message-State: APzg51DXNd3HQspEm0imBmSm5vOdlXqj3RXjF8IAkrcmRPrDNEGvg0TE
 Eu5vAYgLfAWY+PO9GkXhn/V27qv8JCV8YNo2z5QcYw==
X-Google-Smtp-Source: ANB0VdZnpZLUOTTfzdl57X34ytLZ8foBGUXTdP8YwC9NsEFh2mFU1supb9FuzEWC4OReLgscgDdwAvPDKZcqWDG+Kus=
X-Received: by 2002:a63:a5c:: with SMTP id
 z28-v6mr2506373pgk.209.1536761872941; 
 Wed, 12 Sep 2018 07:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=noty5q98Vzhi-cCdf0DtdMFiCrQv8HUor6G8kjDinovrRUg@mail.gmail.com>
 <EBD6A54B-2862-4DF8-9E03-5343C29349DF@fuzziesquirrel.com>
 <CAO=notzcJFGD6fJn_LpKQgHUkyU_whW-2CiTe26kcq-+G3T7Ww@mail.gmail.com>
In-Reply-To: <CAO=notzcJFGD6fJn_LpKQgHUkyU_whW-2CiTe26kcq-+G3T7Ww@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 12 Sep 2018 07:17:41 -0700
Message-ID: <CAO=notxmEwWc1Ti4LFj963E-Su2Sy8Hp6NFOaYM1w2k0mf+jOA@mail.gmail.com>
Subject: Re: phosphor-ipmi-blobs
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 12 Sep 2018 14:17:58 -0000

On Mon, Sep 10, 2018 at 9:01 AM Patrick Venture <venture@google.com> wrote:
>
> On Mon, Sep 10, 2018 at 5:49 AM Brad Bishop <bradleyb@fuzziesquirrel.com>=
 wrote:
> >
> >
> >
> > > On Sep 7, 2018, at 7:51 PM, Patrick Venture <venture@google.com> wrot=
e:
> > >
> > > If there is a phosphor-ipmi-blobs repository, I can push what code ba=
se in one
> > > patchset along with the design in markdown.
> >
> > Sure.  I=E2=80=99ll wait a couple days for anyone with any objections t=
o speak up.  Please
> > remind me if I forget :-)
>
> No problem!

Brad, if you create a phosphor-ipmi-blobs repository and set myself
and Kun Yi (kunyi731@gmail.com) as maintainers via the system (I can
create the maintainers file).  I will submit the code in one patch.  I
can put it up for review first to gather feedback -- since we haven't
fully integrated it into things, this is a great time.

Patrick
