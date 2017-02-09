Return-Path: <xow@google.com>
Received: from mail-qt0-x230.google.com (mail-qt0-x230.google.com
 [IPv6:2607:f8b0:400d:c0d::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vK7Ql4fXPzDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 06:28:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="supsEiZR"; 
 dkim-atps=neutral
Received: by mail-qt0-x230.google.com with SMTP id x49so13935386qtc.2
 for <openbmc@lists.ozlabs.org>; Thu, 09 Feb 2017 11:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=RcW+bVTQKVeX8Cs5K88WHmdSb15wD32Xtkz7zaL7r5U=;
 b=supsEiZRmJZxAvEIsuRrRy5lYboBVPXRMFNvqIe/xa5dYc3ztBvZjToQU8jDgt9k9X
 weVwxWS7+cLbg1rv6QGZJ5M7CSzckkfw9eWmBpeeeWjPy0j0vq0OQslRchrK2Q49QqE/
 zPFQNI2uPLPkW0WrEJFbYjSdrUINP4bcUohD3KG/Bw00DJI0K8PAF3n5ZeSsZ9KkG9Ti
 vKoak985PFq+ImrpV1dyGuBCoWQEPB8n0ANx24NucUgjqXUIWURj8B0M05F09L00RGDK
 fvMIOgB6FcMkNzS+7ytyX0/SICMJjFd9pkUlQX3+YSY2usP67iGjRvw4gVVYVNcGN3Sw
 Zmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=RcW+bVTQKVeX8Cs5K88WHmdSb15wD32Xtkz7zaL7r5U=;
 b=G7BWwjBRqE9Z7cmX+6EVrMc/Kl5LFhbpst8gqnMeMoubk7UhBD/TK/97ipwijXHeaP
 RgNv9PhBUe1cph5s2EpdpetYH7tpgA8gqegV3PqxRhA3K7RsG6v6U4AG2LEakhzinhI2
 mH70M3kDgZbK6thv4A8sGW9aZVz4xfK/TZhc4qRApDaEN7Gs57xuNnSaTpuTszjGtNv9
 5/YlQJyjW9+Qw60ZSFZNvA2UDUEPue0RZxtYly/2jwpfx/8QSBLe3h+4fG3B/rMdayVO
 xMSGb9Sptgo2JMFHpp4uhnscDY4uJewXBZUdyV+rte97GyvJ1/4e8f/J0Db9k43gkjpu
 Sgvg==
X-Gm-Message-State: AMke39lSYa1ED+4LTSNHKRTHOiJAh1QHe5zoa5wJ9sMl2VPmWkufCzcEuhYhVsEi0LcPgUFOIftN6GZzxpliiF6W
X-Received: by 10.237.60.49 with SMTP id t46mr4988937qte.140.1486668492197;
 Thu, 09 Feb 2017 11:28:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.116 with HTTP; Thu, 9 Feb 2017 11:28:11 -0800 (PST)
In-Reply-To: <CALLMt=rHDvrGppGkNp8hXNu0Lwxbr36HFDwptFkeTP62nS+7XQ@mail.gmail.com>
References: <CAPH-5w4WA8aVbKA0ptR7ubtpCUuGxZ2RQpuS0W4m1csen-kU-w@mail.gmail.com>
 <1485479779.4137.13.camel@aj.id.au>
 <CALLMt=qq97zpRTxomzzucenceiZBEJqgbXANoeU_3Kd1S0313A@mail.gmail.com>
 <1486104037.7271.10.camel@aj.id.au>
 <CALLMt=rHDvrGppGkNp8hXNu0Lwxbr36HFDwptFkeTP62nS+7XQ@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Thu, 9 Feb 2017 11:28:11 -0800
Message-ID: <CAPH-5w68zsyXVzOLO_L9o3_76VSr1V_T2msepoac4erQXXjvWw@mail.gmail.com>
Subject: Re: How to deal with failing services in the boot targets
To: Andrew Geissler <geissonator@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 09 Feb 2017 19:28:16 -0000

On Thu, Feb 9, 2017 at 8:32 AM, Andrew Geissler <geissonator@gmail.com> wrote:
> Some updates on this topic as I've gone into implementation.
>
> The use of "system" in the quiesce target resulted in a lot of
> discussion.  What's a system in relation to a chassis or host?  We
> then started discussing blade centers (1 bmc to many blade servers)
> and high end servers (1 bmc to many chassis).
>
> This also led to discussion on whether we can really do a generic
> recovery when the chassis power on target vs. the host start target
> fails.
>
> The outcome was the following:
> - We'll rename the  obmc-quiesce-system@.target to
> obmc-quiesce-host@.target.  We'll create an instance per host (which
> is currently 1 for all systems).
> - When the chassis power on target fails, we'll have it's
> "onFailure=chassis power off" instead of quiesce.  The power on should
> be very minimal and if we fail, the only recovery is to power off and
> try again.  When the host start target fails, we'll go to the host
> quiesce target.  The recovery from that could be to power on/off again
> but it could also be to just re-run the host start target (i.e. leave
> chassis power on).
>

Sounds reasonable to me. If at some point we have specific power
sequencing requirements, this would handle "tearing down" that
sequence in the correct order.

> Also, Brad noted in the code review that we should not be putting the
> target to service dependencies in the target files.  The target files
> are meant to be generic to allow different implementations on the
> services required to achieve them.  Instead, I'll be putting the
> relationship into the recipe files.
>

I guess normally this is expressed by the [Install] directives in the
service files, then associated to targets at service install time by
systemd.

It looks to me like our installation is handled by SYSTEMD_LINK in
obmc-phosphor-systemd so, agreed, that's ultimately where we express
the relationships.

> If you'd like to follow along on the reviews:
> https://gerrit.openbmc-project.xyz/#/c/2253/  # doc updates
> https://gerrit.openbmc-project.xyz/#/c/2115/  # target and recipe updates
>
> Andrew
>

Thanks for taking this on Andrew.

cheers
xo
