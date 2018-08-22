Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::243; helo=mail-qt0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="njjvPmch"; 
 dkim-atps=neutral
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wTn14X4SzDr4h
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 00:04:21 +1000 (AEST)
Received: by mail-qt0-x243.google.com with SMTP id r37-v6so2175630qtc.0
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 07:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cQjCaBguEXo8m4VYT/2cB4NR73nrgQmKCYuHdG8UlJ0=;
 b=njjvPmch8q8E1hreS5ExRNoGV/AvJNMwh26FtmhxUhzX9DJd+Ioia+IJrQlnNs05l5
 bnQjN+iQ7C7vmt0V2fmlnzfk2NKeCp7iXbfX7vw/5rPR8mDwYkkJBSj8hfjK9ZlKJ2si
 9NFkg2G7G/ttIDzYSNEsZMFTn36cCHa8TSNm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cQjCaBguEXo8m4VYT/2cB4NR73nrgQmKCYuHdG8UlJ0=;
 b=c9HJuQR9hTJ3xrlE35zv+hd8DJNJjesGfYBwvfJ+v3dbPS/N1EaWZqCrH+VLrx8Odz
 Vg2xVDIAd0pQDw2eEgUOsdjnHiN1pU+ezQX5d0S5UVIXSXVPluZMzQQRKCdQbRzHh2vo
 D8Xc2yMahxoJdMb91VClGj39IYk6u7fUAfGWEp04WcCYCZk0U33CVPI+GEkHaPfqo56a
 dl6haXSKho5KThlKrLTDSP+cxQAqT7/zU5p7ECkmOa4+f0JFIeGp/rR+8fVZ90RmMKa9
 oQhDvcFpmLVXo1C/Cv6mWr9vArbgCZDDw4u2xp+5n6o+/QpDybbzdfE+22YeGaR2IbQu
 u0Mw==
X-Gm-Message-State: AOUpUlFILGh/xUsMNJLhjhS+VrZXuhs2wX6BS2ReCxOUBt8XkosrAHHo
 akdaXJNiJ+DZyM+QiMc+Acu5aFa4Hm8UxTZG3bk=
X-Google-Smtp-Source: ANB0VdaQwzQhvn/SJP6NYCfG+RsX2uNfc+cavdtcY1bw1BcA17TvPXF83yoUO7B2qfz6cS2S0fzvwC7HqBAuoX5J3NI=
X-Received: by 2002:ac8:4152:: with SMTP id
 e18-v6mr15948816qtm.330.1534946658881; 
 Wed, 22 Aug 2018 07:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XeWPtw=5R0rBeT0-hSdFf+xKgM9RRzXmy2d5TMQLvH=Ww@mail.gmail.com>
 <CAO=notx=_L9uAmGWk1qZvVgu1wyN5XUf2uvBibUytpBB+OMw8g@mail.gmail.com>
In-Reply-To: <CAO=notx=_L9uAmGWk1qZvVgu1wyN5XUf2uvBibUytpBB+OMw8g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Aug 2018 23:34:07 +0930
Message-ID: <CACPK8Xdg6F9N79-qvKNuc-DnjTubKPdgRmmW4+LyOMiifqTvbA@mail.gmail.com>
Subject: Re: Tagging master
To: Patrick Venture <venture@google.com>
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
X-List-Received-Date: Wed, 22 Aug 2018 14:04:22 -0000

On Wed, 22 Aug 2018 at 23:30, Patrick Venture <venture@google.com> wrote:
>
> On Tue, Aug 21, 2018 at 6:09 PM Joel Stanley <joel@jms.id.au> wrote:
> >
> > Hello,
> >
> > I would like to propose we create a tag of master.
> >
> > The tags are useful for those who are working on openbmc, but also
> > supporting fellow developers and testers who may be working on the
> > host firmware, operating system or other tools like openstack. When
> > they have issues, a glance at the tag give us a rough idea of how old
> > their firmware is. As a developer, this gives me a rough idea of what
> > kind of issues to expect, but also how far I should dig before
> > suggesting "you need an update".
> >
> > I suggest we use tags as a lightweight epoch in our commit history.
> > They don't need to carry any additional meaning beyond being easier to
> > pronounce than 006d86903586b1dde915f5b0d90a68fd31935095. This means
> > there's no garuntee that a tag contains new features, or has had any
> > more testing than any other commit.
>
> So this would be a non-versioned tag?  I believe we already have
> versions that are meant to track behind or with yocto (once the
> release schedule hits).  Since these aren't tested, I'd suggest they
> do have a naming scheme based on version, with may date in the tag and
> some indication that it's not stable.

I don't follow. I was proposing we continue with the existing scheme,
so the tag for today would be v2.4.

All of our builds are tested to some extent, what I meant by "not
tested" was we would not have a freeze, release candidate, branching
or similar. It would be a commit that passed CI.
