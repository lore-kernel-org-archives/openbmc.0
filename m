Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KDE9vXOS"; 
 dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42kwVh6QjmzF1Cr
 for <openbmc@lists.ozlabs.org>; Wed, 31 Oct 2018 02:34:04 +1100 (AEDT)
Received: by mail-ot1-x334.google.com with SMTP id f24so5757044otl.5
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 08:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pE7qPMmL2xREWx4KCC4j8J/sLo+C9VH9vqsRGnwMTMg=;
 b=KDE9vXOSjvNDC4/R3yKZoMYWiin7hMSHwTT0X4XXiAn7XDoNnGKCMP1fhmmOK6knjm
 XuejPx892ujZfHvjpPHNzvGSP90ReKz5YJf1UJuYjz+QGQ1g2v9DGir3zJvTqIYIa/yo
 c5Dcw19nV4FnAmC2v0aD0VVTNgQTqZEbPQAxL84HK82n+nPj5iqFbMAMfRU6JDs+CZ0v
 YHXQT39eQbaNZmay+dhqpdwu2uf75Ro7qat+VeA+FaX21aNIsu3iQ6njV5Yjas6Dn19A
 itpUSQ7oqn6PdSCpCsereUkiL36tbFjbLEOAkOaoGgeAs8o5vHeeU1Y4SWEO1oaKzVdB
 WC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pE7qPMmL2xREWx4KCC4j8J/sLo+C9VH9vqsRGnwMTMg=;
 b=FkfdX9sLH1DOxIepdXq5Xmty9J3fJRyVovKvLZuKnUtYiGQ8wu7woVBd+KAXTnQZ3B
 rpnrC67BdLPAAO7hCDWiEVyNq2pxOZeQ04NZD9OUkua06hOzPjoGEQ3++tDGLpF0/T/B
 j2UmYF6LsbfsLt/Ng1WbXVXLJMcXG7qAOCrYkrnFKymlqYx3dR65SWuPLyLwsO/3Lkh7
 2zTki64jeT7AqSI/pmvb/pPuqwTZdwz7Z+6729gtG4cNml5U/zVz42ynApaZz10zvmU3
 zytI8qjXewYcLGS6U204c/HTN92vsztfXOuHF8XuYnXSKe0lm1qFuOSHuqEP+tWu+Tbo
 VyfQ==
X-Gm-Message-State: AGRZ1gJh19CPvpGJUhYOPxdv0eSp/lOiuWIIA3mKY64Y6x5G8j2XOc/k
 wptt1lrNyn6PeoPptNYeVCDZpLzpmVehrTWEGCzUvg==
X-Google-Smtp-Source: AJdET5f8UeY8AEdpzsf7T4iYzO4u5szTJ1MWKkpu+vhLtjjOjYumgVPpL9VNu3kyLM+FEOwb18r5AYdYjQ1nqe+Pc1g=
X-Received: by 2002:a9d:2849:: with SMTP id h9mr4904382otd.89.1540913642481;
 Tue, 30 Oct 2018 08:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.13.1540515603.32722.openbmc@lists.ozlabs.org>
 <30bb965b-31a4-b402-cfeb-855b92f6e53c@charter.net>
In-Reply-To: <30bb965b-31a4-b402-cfeb-855b92f6e53c@charter.net>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 30 Oct 2018 10:33:46 -0500
Message-ID: <CALLMt=rTpsNXkbJYgv-JwLFdTVSvz3oMTOWft3X2fKpiQ9KPhw@mail.gmail.com>
Subject: Re: jenkins.openbmc.org server infrastructure
To: joseph-reynolds@charter.net
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 30 Oct 2018 15:34:05 -0000

On Mon, Oct 29, 2018 at 9:43 AM Joseph Reynolds
<joseph-reynolds@charter.net> wrote:
>
>
> Message: 1
> Date: Thu, 25 Oct 2018 14:49:20 -0500
> From: Andrew Geissler <geissonator@gmail.com>
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: jenkins.openbmc.org ?
> Message-ID:
> <CALLMt=pqTesc1qD3wCsv6GTZVRgh2CM1_zF+PM3VVGiDyKf6Qg@mail.gmail.com>
> Content-Type: text/plain; charset="UTF-8"
>
> I'd had on my list for a while to move us over to a jenkins instance
> running on the same server as our gerrit server. The reasoning was:
>
> 1. OpenBMC has grown to the point where it deserves it's own jenkins
> instance, and tying it to openpower.xyz doesn't really fit anymore.
> 2. The gerrit server (and the new jenkins server) are running within
> Softlayer which has 24x7 support (openpower.xyz is running on donated
> hardware from Rackspace, which is awesome, but support is mainly 2nd
> hand via emails to contacts we have at Rackspace)
> 3. There have been a few instances where the openpower builds have
> affected openbmc (and vice versa).
>
> I went ahead and created a new jenkins instance at the above domain,
> but haven't done anything with it. I've been kind of wishy-washy on
> whether the extra work is really worth it. It's been quite nice having
> Joel maintain our openpower.xyz server with all the security updates
> and such :)
>
> Thoughts from the community?
>
>

Hey Joseph, I think you need to make sure your email client is in
plain text. The formatting
looks a bit off on your responses.

> Andrew, your email reads like a plea for help with OpenBMC project infrastructure (systems that host OpenBMC servers for Gerrit, Jenkins, and related CI).  If so, it may help to understand the current configuration.  Here is my understanding:

Not as much a plea for help as much as "is it worth us doing this
extra work". I've maintained
a lot of different jenkins servers in my time so it's not a ton of
work, but if no one cares
then I don't see a reason to do it.

>
>  - GitHub (source code mirror), hosted by GitHub at https://github.com/openbmc (various repos).
>  - Gerrit (code review tool), hosted by https://gerrit.openbmc-project.xyz (and redirected from gerrit.openbmc.org).
>  - Jenkins (CI server), hosted by https://openpower.xyz, proposal to move to a new server at https://jenkins.openbmc.org.
>  - Various CI build and test servers (run jobs on different hardware architectures).
>  - See history in https://lists.ozlabs.org/pipermail/openbmc/2016-July/004280.html

Yep, looks about right. We also have an internal jenkins which
coordinates the HW CI once a
job passes the basic build and QEMU CI.

>
> Then reading questions into the email:
>
> Are community members comfortable with these Gerrit and Jenkins servers in terms of ownership and administration privileges?
> Should we have a larger variety of CI servers?

More CI servers for building are always appreciated :)

> Do we need help administering these servers (workload: reboot servers, update Jenkins version, restart CI jobs, etc.)?
> What are the project ideals?

Yeah, maintaining the jenkins nodes is something I haven't been doing real well.
I think I'm going to have to start doing a maintenance window every
quarter or so and ensuring all of the
most recent Ubuntu updates are picked up. Major upgrades to new Ubuntu
LTS releases would
need a larger window (but hopefully this is a once ever other year
type thing). I'm curious how other projects
handle this. Is there a dedicated person/team to Infrastructure?
Currently this isn't a ton of work for me
but it does seem like something that's going to keep growing.

>
>
> ps: gerrit.openbmc.org will also redirect to our gerrit in case anyone
> was interested.
>
> Andrew
>
>
