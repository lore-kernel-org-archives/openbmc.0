Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="qjAYXxSN"; 
 dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42YgvL0GtwzF3NZ
 for <openbmc@lists.ozlabs.org>; Tue, 16 Oct 2018 01:34:53 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id m77-v6so9778911pfi.8
 for <openbmc@lists.ozlabs.org>; Mon, 15 Oct 2018 07:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LjzQy1/N7ul/53ik8jBiZrapBcKgHp+3yC5gV2CNIkQ=;
 b=qjAYXxSNxgaCPpwkvCrncxLZu9hhj8EfQmTcQIxFUxA1zL1S64dcAe0s3YD1qXWCTo
 pWSd1mFCPIubx4zmX3eFP0cBzg6g1Wxx/wI0pkhVuizYVESi7a9xuQiWQ/Fv5m62TufK
 Q1/AL1HRX/UspUPn7JONGbDh1Vj4rlCH/BxXd6to+fWQc8la4UsZh6ZrYZ10OFoa1eZr
 ttx+LyydS3QFx9YXBSZYDWGuMthaWiGkptvlr2gVhEhgZtfs+f3ixFhLyz3klaP4REn3
 92c7u/IrNPS1NuD6dN+pQCeYDL4qfpPUPzsrXnILtSYQVz5YOp8MRkZD4ZTI9QMN6+wo
 xA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LjzQy1/N7ul/53ik8jBiZrapBcKgHp+3yC5gV2CNIkQ=;
 b=bZW6Z9d8nzFIHQ1L9kmAlOPtQBl+YeQbe338W7Fn+5brCwO+eM5rBZWkVtWlvsxAtF
 TTBA2hYR5Xzrt8WkXJkjDq6546D7aDvFQwQ8E6mzUD28fnC2z8vH6c+fYY+ojA2eHSFI
 j2Cn1FpVSwMrGPlGIhBQPFX3KpzJslNcXuTQdaCvbxuWzFv/snbkk9R61A2d4H8bvKBL
 zdICu9Gn2WlOBjUE9JaKSBgSyYGt6o6dMR0L4POpQ6hPu0/kMYnjOM2+lLlScE6+WWra
 jFBYjQsWGLVDkIFyq3Zp3ujb2t7jm6WJ00nNGBlamjh/1JtF3ClImASxKCusC9p6F35M
 PkEQ==
X-Gm-Message-State: ABuFfoiuwvNvps/WPHZC17zY5/IMR8waKW2YCuImj5KdifGpHyXBuswT
 iN7LyDpdGJAHCJulDSKMUG5MA/4aYD2dtlMwYyMODg==
X-Google-Smtp-Source: ACcGV62i/8Sh99aOlSNKwdFXSvczeHfkUoemYVh5VB5F+kv6GhXbSLfuLzSpO5D1cF0eJEXVG0orMokFXj8niuqtuHE=
X-Received: by 2002:a63:e601:: with SMTP id
 g1-v6mr16528383pgh.290.1539614090836; 
 Mon, 15 Oct 2018 07:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notz_KizBdONsKjtQ6U05r4hWQOuxa_cx9Cshps7V8=PRbw@mail.gmail.com>
 <3fc8bbb4-2db9-6df0-4fc3-1addf4b94ac3@linux.intel.com>
 <CAO=notwOiB-v5LxZ=OagkGTzhM8dnt5kogO=eaTGEKGp7si14Q@mail.gmail.com>
 <e6652bad-d524-3912-6be2-9dc2bc9d4669@linux.vnet.ibm.com>
 <CAO=notyHG4EvvjouSJjo+n9oRDjp81W5vQFcvG4ZXiue_jmqzw@mail.gmail.com>
 <04b9bce1-10b9-8603-4cdb-f1020fd0f6ee@linux.ibm.com>
In-Reply-To: <04b9bce1-10b9-8603-4cdb-f1020fd0f6ee@linux.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 15 Oct 2018 07:34:39 -0700
Message-ID: <CAO=notxOhtgCOd6fKBcM3R5vBS6y6SKCxTQhMbBM16ET2vP=nA@mail.gmail.com>
Subject: Re: Notion of Flakiness in Sensor Readings
To: Matthew Barth <msbarth@linux.ibm.com>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 James Feist <james.feist@linux.intel.com>
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
X-List-Received-Date: Mon, 15 Oct 2018 14:34:55 -0000

On Mon, Oct 15, 2018 at 6:40 AM Matthew Barth <msbarth@linux.ibm.com> wrote:
>
>
>
> On 10/12/2018 04:32 PM, Patrick Venture wrote:
> > On Fri, Oct 12, 2018 at 2:28 PM Matt Spinler
> > <mspinler@linux.vnet.ibm.com> wrote:
> >>
> >>
> >>
> >> On 10/12/2018 4:23 PM, Patrick Venture wrote:
> >>> On Fri, Oct 12, 2018 at 2:09 PM James Feist <james.feist@linux.intel.com> wrote:
> >>>> On 10/12/2018 01:53 PM, Patrick Venture wrote:
> >>>>> Currently, there are a few approaches in phosphor-hwmon on how to
> >>>>> handle sensors being present sometimes, or flaky on reads.  We've
> >>>>> talked in the past about how to handle a read failure that should be
> >>>>> ignored.  A real failure that is flaky or temporary.
> >>>>>
> >>>>> I was thinking of just adding a property to the Sensor.Value interface
> >>>>> to report information.  Basically, someone reading the value needs to
> >>>>> know if it's valid.  The idea of a range check for validity doesn't
> >>>>> work as cleanly for this specific purpose, in my opinion.  The min/max
> >>>>> can be used cleanly to determine the linearization though!
> >>>>>
> >>>>> I was thinking perhaps a boolean, that you can check to see if the
> >>>>> value should be used or trusted.  Then, I thought, perhaps, a enum
> >>>>> with a series of states, starting with the states of "Valid',
> >>>>> "Invalid."  Not being able to think of a third state, I fell back onto
> >>>>> a boolean.
> >>
> >> If the hwmon driver for your device provides a _fault attribute, and
> >> that gets set, the code is already
> >> set up to create an OperationalStatus interface on that sensor instance
> >> and set the Functional
> >> property to false.
> >
> > I'd like to drop this such that the failure behavior can be returning
> > a NaN double.
> > https://github.com/openbmc/phosphor-hwmon/blob/master/hwmonio.cpp#L127
> >
> > For the drivers that don't have the fault attribute, and in the case
> > where phosphor-host-ipmid doesn't check for that kind of failure.
> >
> IMHO, we should handle this by removing the sensor from dbus instead of
> using a special value type if we're unable to use the OperationalStatus.
> In either case, the code utilizing this sensor would need to
> specifically handle this NaN value or handle having the sensor removed
> from dbus. It seems more generically, to me, to have hwmon remove the
> sensor from dbus instead of using a NaN double so this can be used
> across other sensor drivers that may not return a double type.

In our infrastructure if we removed the sensor from dbus we'd have to
report an invalid reading but not a sensor missing reading.  So, to
us, if it's NaN or not on dbus we have to treat it the same way
basically, so fewer code changes to support it is more or less the
goal.  Although right now phosphor-host-ipmid isn't set up nicely to
deal with NaN(). I have a downstream change that I needed to introduce
so that it excepts on that specific type of failure and then returns
invalid reading (or something akin to that).

> >>
> >>>> For Valid / Invalid we've produced nan on D-Bus to know that the sensor
> >>>> is in an invalid state (like power off for tach values). Although I'm
> >>>> not sure how this would be produced using the int64 interface, for the
> >>>> double std::nan will go over d-bus correctly.
> >>> So if i just wait until we're using double, the issue basically
> >>> resolves itself? :D :D
> >>>
> >>>>> Thoughts?
> >>>>>
> >>>>> Patrick
> >>>>>
> >>
> >
>
