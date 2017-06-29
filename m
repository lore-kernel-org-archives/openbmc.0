Return-Path: <venture@google.com>
Received: from mail-pf0-x232.google.com (mail-pf0-x232.google.com
 [IPv6:2607:f8b0:400e:c00::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wyhWL3mzWzDr4V
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 11:13:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lUtg6Abh"; 
 dkim-atps=neutral
Received: by mail-pf0-x232.google.com with SMTP id e7so41826685pfk.0
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 18:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jN68U4PcPGKV+lpWdNd/jRhgZrQbTr2QY66V9L7FH/M=;
 b=lUtg6AbhSvvB7KeuJH6EdE4FXfN9PvdTnHfWoxWzkTIzEJxLotJqIXSJrxfjvy817U
 zeDf6xKsAQRHOHernGnhZFBTbmxTnIoQciCd99as/ga7WEVrZm8rshC5ucpD8LwZft97
 H6tLiwF5tGzeyiEfbCSGXyR1robOrIeZIWF6kfpj180x3BCdhkRWDdEWrxx4VZo/tIZh
 724rA1Zp/tcxWRca8b7BO+h1pit+l7f3qB58oyh6Y8m0grvgmOtLqt3CjM34/49tZPRb
 PrwGckq0VA2k+dV1m0V9+unL0Ll+XYNsvLJzejnTSHk2ayZJNz43HrusdY8o5Zz27X0A
 V2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jN68U4PcPGKV+lpWdNd/jRhgZrQbTr2QY66V9L7FH/M=;
 b=NvBu8FbLoj0sMzEG3dlBEuYbWRj1WQUkwt/jGaKMtEVBEWUCgLfGPz9amYEDMoSBcA
 2iRtAJjtXcl8i0WC4wpnibcC9nAY4pNHpozsSWhbA9U9BdW9Dihmg3n/TwGBKj9Kf3Rr
 GWKYRrB/JizYLUq4HI1oox+D7ZFEfzsr53rGmU9d+Yiv/s61wONGmQTsjPc0V3pZO/Ng
 XgUNA0Xjp4+V5fJxYNZjrOjqCfYEc3eiNBw4GVtzcju2SQxSSrDMC+OGgx783b+59CSc
 O0knCwf/YNihHCGD3x3NBFPvZMK5TCZVnC0i7u5VLM0IwAE1EL12BmYr67wiN+w+zRAS
 33Jw==
X-Gm-Message-State: AKS2vOwLFqNjLR7Fy5ZWfa/+DRrtG4bVei34qwDBwTUV6XbQeHr1WBXh
 7OzTU7K7pkRsihVjnPTf7FOllxaSRpDT4Rw=
X-Received: by 10.98.69.76 with SMTP id s73mr13497389pfa.94.1498698828032;
 Wed, 28 Jun 2017 18:13:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.165.205 with HTTP; Wed, 28 Jun 2017 18:13:27 -0700 (PDT)
In-Reply-To: <FB3659C0-EF79-40D3-8001-17D9116FA522@fuzziesquirrel.com>
References: <CAO=notxJgr=+fyCaNWH+i6EL2v06aW5LkMp19uFbpYArv7FS3Q@mail.gmail.com>
 <FB3659C0-EF79-40D3-8001-17D9116FA522@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 28 Jun 2017 18:13:27 -0700
Message-ID: <CAO=notzHV07bANYK=f+QsqBpx_t83rYAJxvYzSAZb9qeYUPwLw@mail.gmail.com>
Subject: Re: Swampd PID-driven Fan Controller
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 29 Jun 2017 01:13:51 -0000

On Tue, Jun 27, 2017 at 3:34 PM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
> Hi Patrick
>
>> On Jun 27, 2017, at 12:51 PM, Patrick Venture <venture@google.com> wrote=
:
>>
>> Per the requirements to have a fan controller for the quanta-q71l that
>> runs within the OpenBMC framework+, I developed the swampd
>> application.  It was designed to leverage sdbusplus and other OpenBMC
>> libraries and coding standards.
>
> Sweet!  First let me say thanks for your willingness to share your
> application.

No problem.
>
>>
>> It supports:
>> * build-time yaml descriptions of the sensors and PID loops
>> * run-time configuration of the above
>> * run-time fan speed set-point control
>> * IPMI controlled manual mode
>> * passively and actively read sensors
>> * sensors that are from the host
>> * any variation on sysfs IO that is configured.
>
> Sounds like a solid feature set.  Can you speak to what level of support
> exists for things like hot plugging and/or degraded mode operation?

Right now it's at ~80*% done, so I'm still working with people here to
design the best practices for what they want in failure modes.  It was
designed with input from a few engineers who have ties to its primary
use cases.  And there is a an expectation that things with this will
behave similarly to how the predecessors behaved.  So that drove a
fair amount, but there are certain failure modes this doesn't yet
handle that it needs to.  If the sensors stop reporting information,
for instance, it goes into a pre-configured fail-safe mode.


*Functionally complete but still has lots of room for improvement.

>
>>
>> The design document is too large to really paste in this email, so
>> I'll summarize.
>>
>> Each sensor is created based on the configuration provided.  Each PID
>> loop is created per zone.  Each zone lives on a separate thread (could
>> be merged into one thread that iterates through zones).  The zone
>> loops every 0.1s to steer the fans closer to their goal while every
>> second it adjusts the goal.
>>
>> Some things I know OpenBMC won't like: it's multi-threaded.  It wasn=E2=
=80=99t
>
> True, we are trying to avoid multi-threaded applications, but if the
> problem being solved by threads can=E2=80=99t reasonably be solved some o=
ther
> way that seems fine.
>
>> built into the current fan-presence package.
>
> I don=E2=80=99t have any issue with this.
>
>>
>> I'm at a crossroads with this project because I'd like to make it
>> generally available.  Should I try to submit it for review on this
>> list, if so, how?  Or should I push it to Google's github projects
>> first?
>
> I think this depends on a couple factors.
>
> As you know, another team is also developing a fan control algorithm.
> If the two algorithms are similar I don=E2=80=99t see any point in hostin=
g two
> applications that do the same thing.  It would just make it more confusin=
g
> for others coming to OpenBMC to pick one or the other for their platform.
>
> Now, if each provides their own unique, fundamentally different fan contr=
ol
> strategy - each with a different set of pros/cons - that is exactly what =
we
> had anticipated and bringing it in seems like a great idea.

It does look like there has been some progress on the
phosphor-fan-presence/control.   Although I'd have to hack it anyway
to support Control.FanPwm because I lost that community argument.

There are definitely some differences.  However, some things can be
done in separate daemons -- as has been suggested.  As an alternative
to separate threads.

>
> For the second factor, I=E2=80=99m going to be a little frank and critica=
l, because
> my point is fundamental to the project goals and vision.  Please don=E2=
=80=99t take
> this personally.
>
> This is what is known in OSS circles as a code dump.  It isn=E2=80=99t OS=
S development.
> OSS development happens...in the open.  The first three bullet points her=
e touch
> on this:
>
> https://people.redhat.com/rjones/how-to-supply-code-to-open-source-projec=
ts/
>
> In an OSS development model, the entire community is given the opportunit=
y
> to collaborate and shape the result of the end product, _as_it_is_develop=
ed_
> through feedback and contributions.
>
> I=E2=80=99m no zealot.  I completely understand that many times factors l=
ike product
> delivery schedules, etc get in the way of this model, and thats fine.  Th=
ats
> why most products using OSS don=E2=80=99t ship with vanilla versions of t=
he project
> they are based on.
>
> But the other fan control algorithm _is_ being developed in the open.  A =
lot of
> folks have invested many many hours of peer review in it.
>
> So the question becomes, are you prepared to submit your application to t=
hat
> same level of peer review and reciprocate by investing the time required =
to
> address the feedback and get it to a point where the community feels comf=
ortable
> assuming maintenance responsibility for it?
>

I would have liked to develop this in the open, but as you touched on
it, schedules.  My platform is under a compressed schedule.  Under any
situation, I'll be responsible for maintaining this code base.  And
expanding it to support other platforms.  As implementing it wasn't
done in a vacuum, I feel fairly confident that outside contributions
at least in furthering the design to make it simpler or more modular
would be warranted.

Obviously, it was designed around very specific execution
requirements, which drove my adding an interval to phosphor-hwmon and
quite a few downstream hacks.  That said, those specific execution
requirements do have an impact on the ability to change the design
from input.  If the design suggestions or ideas violate the terms of
service that we're providing the data centers -- it can be forked,
effectively.

> Thx - brad
>
>>
>> +As well as other requirements.
>>
>> Thanks,
>> Patrick
