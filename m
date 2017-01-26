Return-Path: <geissonator@gmail.com>
Received: from mail-io0-x229.google.com (mail-io0-x229.google.com
 [IPv6:2607:f8b0:4001:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v82w05lNtzDq5g
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2017 11:33:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="r9GHo+lo"; 
 dkim-atps=neutral
Received: by mail-io0-x229.google.com with SMTP id l66so27536541ioi.1
 for <openbmc@lists.ozlabs.org>; Wed, 25 Jan 2017 16:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=VSKJ7bBmY22NPhb0Tr321l/Jzky9gGuole+uQmdPr10=;
 b=r9GHo+loyuSQdVFGLAwmzdbLgM3J3OUcnZBcI8idpVGht5d7KGR/ZLTPmecBVXFWry
 CCzYOC8KDZGxu8s3Vb2rtuJdIL5UiObD86bq1tLxljj5na5wkdCbdIMmTBsUS3Nxc/lb
 //m3U0U7kd+0axrJJ0UGHaUv8lXhsgyVQ8hgjswMKIUAGPnOMVhFh116Yy7TDyWxal7J
 Ed7Bb9xo16NuGCFxsS7lV3LfbBmOfm43gExff1WfCJaAg1nwjU/Fp2V7TKH5Un0I3p8E
 5gVLWRsvSQ3ipjGsS/QGguWfqCeVwCpit980/LGbIVhuwI9vDtXpL4C+4oUj1WNm8mR8
 vWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=VSKJ7bBmY22NPhb0Tr321l/Jzky9gGuole+uQmdPr10=;
 b=Av7h6i98VTg3yeIsjrtT9wcmUBwB51YRsfjL4R1DgtgENOoQbkmkKKEdiKZQB7u+8j
 0FyhbuXNaqJavVUzDLDQZjz3SgRgc2TE97FdqHsLfLlnwX0d8m2dI7CqN6Lxmp5WJDWQ
 nAKdBYOYQs0LaC3g/ZjGerlxqABngk7204nufgH8l8N9zwqbMbNKDHt407hVVZkoX5S4
 9jJ4/0qi2x6yglHekhneNxQwyBvIODBAD9ZXx3t4LDuhNm/SzQJt08qhwNPk0lfm8wp4
 MWUQ7rsZKv0stVFGicdRy+MN1rco+3LHB1qS4Sn1NNrH+uhpjxtdeAr9+JGbn3PD/pLL
 srmw==
X-Gm-Message-State: AIkVDXLYUlm7gkuSRt2gRDbLxTy6iVlRaZgHuoQKiYIAaHuHwvQL852X8ai+zmB0UgExb1Y+yIOxrXYqxhlRog==
X-Received: by 10.107.171.135 with SMTP id u129mr519090ioe.102.1485390814092; 
 Wed, 25 Jan 2017 16:33:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.9.155 with HTTP; Wed, 25 Jan 2017 16:33:33 -0800 (PST)
In-Reply-To: <CAPH-5w4WA8aVbKA0ptR7ubtpCUuGxZ2RQpuS0W4m1csen-kU-w@mail.gmail.com>
References: <CAPH-5w4WA8aVbKA0ptR7ubtpCUuGxZ2RQpuS0W4m1csen-kU-w@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 25 Jan 2017 18:33:33 -0600
Message-ID: <CALLMt=rg+Zu_A0abRATHXqW3FbF5Yv7Q5tqgKkGc=vowvObASA@mail.gmail.com>
Subject: Re: How to deal with failing services in the boot targets
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jan 2017 00:33:37 -0000

Hey Xo,

Pretty perfect timing on this email, my new story for this sprint is
https://github.com/openbmc/openbmc/issues/1033 (handle service
failures in openbmc) precisely for the reasons you mentioned above.

We've had a few hallway talks but not much in the way of design yet.
One thought was to use the "OnFailure=" tag to start up a target that
conflicts with everything (to stop everything) and puts the system
into some sort of "termination" state.

We have two different types of targets in openbmc.  The one's that
have "wants' relationships (i.e. run these services) and targets that
are more for synchronization among those services.  I recently added a
new chassis power "wants" target, I think I'll need to add some
dependencies that you mention above there, so if someone starts the
"boot host" target, it will automatically run the "turn on power"
target.

Anyway, hope to have a few more thoughts on this out by the end of
this week.  Will do some experimenting with your notes.

Andrew

On Wed, Jan 25, 2017 at 5:29 PM, Xo Wang <xow@google.com> wrote:
> Hi folks,
>
> I'm seeing vcs-on@0.service failing occasionally. I know the cause of
> it (i2c errors) but I'd like to know how to deal with failing services
> in the context of OpenBMC boot sequencing.
>
> For example, the service failure isn't reflect by any subsequent
> target failures (it reaches obmc-chassis-start@0.target with no
> command line errors, only a journal error for vcs-on@0.service
> itself), nor did it prevent the boot from proceeding to pdbg host
> control.
>
> This is expected behavior given the systemd Unit relationships I used,
> but I don't see a clean way to make a unit like vcs-on@.service block
> the boot.
>
> I tried making vcs-on@.service [Install]
> RequiredBy=obmc-chassis-start@%i.target (and modifying the service
> install similarly), but this only prints out a message that
> obmc-chassis-start@0.target couldn't be reached due to its failed
> dependency. It did not stop the pdbg start IPL.
>
> I also tried RequiredBy=obmc-host-start-pre@%i.target. This turned out
> even worse because our targets don't require their precedent targets,
> so obmc-host-start@0.target is still reachable even with a failure in
> obmc-host-start-pre@0.target. Likewise for
> obmc-chassis-start@0.target, which now prints no console error at all.
>
> Finally I could add RequiredBy=start_host@%i.service to
> vcs-on@0.service, but this seems fragile compared to using the targets
> as synchronization points.
>
> 1) How should I make a host boot service be a blocking step in the chain?
>
> 2) Will this require a structural change in the OpenBMC targets?
> Making targets require their precedent targets comes to mind. This
> would make targets useful not only for sequencing but also for
> dependency checking.
>
> 3) Do other people also want this? To me it seems obvious that failure
> to power on should always block starting IPL, but maybe somebody else
> has a good reason to use weaker relationships.
>
> thanks
> xo
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
