Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x232.google.com (mail-it0-x232.google.com
 [IPv6:2607:f8b0:4001:c0b::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDFRd6HfDzDq5k
 for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2017 07:42:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cFPOxw+5"; 
 dkim-atps=neutral
Received: by mail-it0-x232.google.com with SMTP id c7so26586482itd.1
 for <openbmc@lists.ozlabs.org>; Wed, 01 Feb 2017 12:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ycmJaqvwzXZMOykkEWCIzd8l30MdgDFGrJaYRSdFsSo=;
 b=cFPOxw+51mI7oQdynacESVTG37IcMW6LXt5FKMSH7P61HZayitZLi7NEqg6hBOo2ex
 LcUy4QQFtp0h+pNj9VJErQpoAfTlErdRuM1f05KfofqIFUxE+LlMYM+tJYw7XsFEt3fm
 fD38U4U0DsIlcWyZ92bbbzABmYvE4WvMGI7y5jBApXaAk9iZSRagWLNbJh1Un9Qm1xaw
 JcOlpjA9muqsOjSmxk3JX9Z9p3t3LiZgZRSAaVT35Io/qbuI+tw99JxAJjoMEoitfTEt
 k+iDVHIXXA7xiiOHbzUidCp+hg10/TcvO1Yq/a5jShGm1dyed5pCdzIz/1A+56yhrf79
 qoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ycmJaqvwzXZMOykkEWCIzd8l30MdgDFGrJaYRSdFsSo=;
 b=HeZYb0oCCpHEG5xiqbcD7u52S7MLWlh6w4F+00wOwNwTs4unjRvJ/sJBT8GWHEU4sq
 4iw8VVuIRVzAfqyM8DOA6BcJUYtNBl5lK2pwPkAb9XOkS5mlUpWkBFa9mU97I5yRivdd
 NjSHr+fs+la+wr58NyV0QjL8ZToT8q4TAP+laxC9WIbX17PtA/fXLrLB0PYTJ+Fk9caX
 8jlDIl5lUegVyc6ZCnZL4oE39FGhJE4dH87vYFYshv4Hh44EYLBnFJknfJ09CiS23YTz
 u1+q7NeK8OfjXPIdsVJXYNE0RpDKXL20GBJVx2RlGNHDBaNUHI11GyrAFNjGoHDAsbKB
 WnGQ==
X-Gm-Message-State: AIkVDXJ5eCCGeKPC8s+WRtjSdoGtEiO8HQoxwiPag/B+lpzo91Jqja1yUUlloDY3awfHmcQ2WJH8LznJhIvcRQ==
X-Received: by 10.36.79.71 with SMTP id c68mr3980000itb.47.1485981723277; Wed,
 01 Feb 2017 12:42:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.9.155 with HTTP; Wed, 1 Feb 2017 12:42:02 -0800 (PST)
In-Reply-To: <1485479779.4137.13.camel@aj.id.au>
References: <CAPH-5w4WA8aVbKA0ptR7ubtpCUuGxZ2RQpuS0W4m1csen-kU-w@mail.gmail.com>
 <1485479779.4137.13.camel@aj.id.au>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 1 Feb 2017 14:42:02 -0600
Message-ID: <CALLMt=qq97zpRTxomzzucenceiZBEJqgbXANoeU_3Kd1S0313A@mail.gmail.com>
Subject: Re: How to deal with failing services in the boot targets
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Xo Wang <xow@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 01 Feb 2017 20:42:06 -0000

Finally got around to doing some testing on this, here's what I got.

My story this sprint, https://github.com/openbmc/openbmc/issues/1033,
is focused on handling errors when things go wrong.  Specifically,
when required services fail to execute properly during a systemd
target execution (power on, power off).  When a fail happens, the obmc
software needs to notify the users of the system and provide
mechanisms for either the system to automatically retry the failed
operation (i.e. reboot the system) or to stay in a quiesced state so
that error data can be collected and the fail can be investigated.

Michael is working on a story that ties in with this function this
sprint, https://github.com/openbmc/openbmc/issues/942, in which we=E2=80=99=
ll
allow system users to enable or disable the auto reboot function on
errors (service failure, host checkstop failure, host watchdog
failure).  He will utilize the new target I=E2=80=99ll be creating in my st=
ory
for this.

So we have two main fail scenarios:

1. A service within a target fails
- If the service is a oneshot type, and you put that it is required
(not wanted) by the target then the target will fail if the service
fails
  - You can simply define a behavior for when the target fails using
the =E2=80=9COnFailure=E2=80=9D option (i.e. go to a new failure target if =
any
required service fails)

- If the service is not a oneshot, then you can not have it fail the
target (the target only knows that it started successfully)
  - You have to define a behavior for when the service fails (OnFailure) op=
tion.
  - The service can not have "RemainAfterExit=3Dyes=E2=80=9D otherwise the
OnFailure action does not occur until the service is stopped (instead
of when it fails)

2. A failure outside of a normal systemd target/service (host watchdog
expires, host checkstop detected)
- The service which detects this failure is responsible for logging
the appropriate error, and instructing systemd to go to the
appropriate target

The current proposal is that we create a new quiesce target.  This is
the target that the target/services put for their =E2=80=9COnFailure=3D=E2=
=80=9C
instruction and where the services in fail #2 above detect a problem
will instruct systemd to go to.  We=E2=80=99ll then have code that monitors
for the entry into this new quiesce target and handles the halt vs
automatic reboot functionality.

The above info sets up some general guidelines for our targets and
services (and some refactoring for my story this sprint)

- All targets should have an =E2=80=9COnFailure=3Dobmc-quiesce-system@.targ=
et=E2=80=9D
- All services which are required for a target to achieve it=E2=80=99s
function should be RequiredBy that target (not WantedBy)
- All services should first try to be Type=3Doneshot so that we can just
rely on the target fail path
- If a service can not be =E2=80=9CType=3Doneshot=E2=80=9D, then it needs t=
o have a
=E2=80=9COnFailure=3Dobmc-quiesce-system@.target=E2=80=9D and a "RemainAfte=
rExit=3Dno=E2=80=9D
- If a service can not be any of these then it=E2=80=99s up to the service
application to call systemd with the obmc-quiesce-system@.target on
failures

Thoughts/Questions?
Andrew

On Thu, Jan 26, 2017 at 7:16 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Wed, 2017-01-25 at 15:29 -0800, Xo Wang wrote:
>> 3) Do other people also want this? To me it seems obvious that failure
>> to power on should always block starting IPL, but maybe somebody else
>> has a good reason to use weaker relationships.
>
> Sounds highly desirable to me. In an effort to better understand our
> dependencies I dumped them out with `systemd-analyze dot`. Safe to say
> I'm not much wiser having seen the graph:
>
> http://ozlabs.org/~arj/openbmc/systemd.svg
>
> (Source: http://ozlabs.org/~arj/openbmc/systemd.dot.xz )
>
> Andrew
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
