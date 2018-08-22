Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vXxh7eGg"; 
 dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wThB5ll0zDqC8
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 00:00:09 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id b11-v6so1029057pfo.3
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 07:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KfTSGvXq42wY2Pj7bVn/iTpW2Dx2U0wRTv4GLDMkCJY=;
 b=vXxh7eGgkx40NUkeCTvqo0oz5icWwK3UE4Jcz1+w8iXSLsLF1Zzu5lqcK3kkssftrJ
 G5xgCInVYLBplGPyuqh7s2YsDepRO37wXrxydBJ5q36/uzgVkcqFOstcsM4kRoQYc+OT
 fguJituakG8FWJznVD7P1U13O3qiA77I09+gz/8GsYNVz5l8GyfS1+dhCCuFA9luGqwC
 A0qUwYq+xrFhvhAZVUwozoVf/ptD2bUVxC9dqIKhHChI3GW6ZpCa9BbtrFBNqi5PbRRH
 kSeD635nRtYATBInD30mz165hNcfHfH4eaz81HPzsWB4HfDYtWdX5uKMOTIcsajRWTLx
 jmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KfTSGvXq42wY2Pj7bVn/iTpW2Dx2U0wRTv4GLDMkCJY=;
 b=buKlrrm9o/Hk26pgz1MZGlLREZwo/KYjUWJtNJRj6iP+TUHUVliDFsHc7+V8BvJ/pm
 BU2xQoGZKFRzDeYjqHR+vfExiQJLE6KW+Rv7yjzVisMvYkLQTRKs5YmyB6LO6gsH7njD
 e5lhqYxU96za2PkPOZkO7PmhsHUUg16OwC/Rwd8ZR/bTvezqPP+7xafb3G4YGPyN/2LL
 DYpP/uCnIqDFMjb8AVZlWiu7FzNMlRMS41FT4211SUB+9JK8kXistnX0xWraHIAp+kgo
 /ePiyE68Ax8T8hlHiJN1BSSguvyoo6I82l8WQm0S7Por5lD+JErn0PsE4PYn89eb+th4
 4j+g==
X-Gm-Message-State: AOUpUlHr/KtYAg9Gn5MxE9Nw0a70xJG4zZxAVyweX18rogcWCKWtNryI
 fs0ktZtnF0K2yrtASOXTRiWETM6XvCXZEaiL6QAffnRc3R4=
X-Google-Smtp-Source: AA+uWPww/KGho+4rbJ9Bzm6NfWgI31Tu3PV7hVY6NWH1kyuRRsnBm8rPB1+gfLRLXEauTRfrmZqWz/ESYH6NJfc+6Qs=
X-Received: by 2002:a62:9101:: with SMTP id
 l1-v6mr23456224pfe.226.1534946405981; 
 Wed, 22 Aug 2018 07:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XeWPtw=5R0rBeT0-hSdFf+xKgM9RRzXmy2d5TMQLvH=Ww@mail.gmail.com>
In-Reply-To: <CACPK8XeWPtw=5R0rBeT0-hSdFf+xKgM9RRzXmy2d5TMQLvH=Ww@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 22 Aug 2018 06:59:54 -0700
Message-ID: <CAO=notx=_L9uAmGWk1qZvVgu1wyN5XUf2uvBibUytpBB+OMw8g@mail.gmail.com>
Subject: Re: Tagging master
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 22 Aug 2018 14:00:12 -0000

On Tue, Aug 21, 2018 at 6:09 PM Joel Stanley <joel@jms.id.au> wrote:
>
> Hello,
>
> I would like to propose we create a tag of master.
>
> The tags are useful for those who are working on openbmc, but also
> supporting fellow developers and testers who may be working on the
> host firmware, operating system or other tools like openstack. When
> they have issues, a glance at the tag give us a rough idea of how old
> their firmware is. As a developer, this gives me a rough idea of what
> kind of issues to expect, but also how far I should dig before
> suggesting "you need an update".
>
> I suggest we use tags as a lightweight epoch in our commit history.
> They don't need to carry any additional meaning beyond being easier to
> pronounce than 006d86903586b1dde915f5b0d90a68fd31935095. This means
> there's no garuntee that a tag contains new features, or has had any
> more testing than any other commit.

So this would be a non-versioned tag?  I believe we already have
versions that are meant to track behind or with yocto (once the
release schedule hits).  Since these aren't tested, I'd suggest they
do have a naming scheme based on version, with may date in the tag and
some indication that it's not stable.

>
> Cheers,
>
> Joel
