Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="T5SskOHK"; 
 dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42X1Jz0B6rzF3LC
 for <openbmc@lists.ozlabs.org>; Sat, 13 Oct 2018 08:32:50 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id g12-v6so6414149pgs.1
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 14:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jOuEodmIGZCrfmDipI8tQnSF63D+G3G2mHNWzZEtXfU=;
 b=T5SskOHKYu12ucs2ByJaOWpU/FY/wdizsaIOFrw94+YLvdEV5YGc64CBN3Qh3B9soV
 zMpC2h8unLM91w6z/VeD2ec3vNqeEk+408UabfKiAeFtdlri9L8GpDahNGKji8/q9QLi
 vB1EYpz9D8l16+QDKkLN0otAURe32tJY5w9PZLOdA3rqaDNBjoCGWqUv8QptHiLGma/+
 FBVPmuG4DHgBiV053KGqkbNGVU5n1qzr5IJK3iq9FkgYDFRZOoObr3cAg76MZ/9Y4n5c
 IZEbR/9/fvzCcBxzoRkm2NRZ+DcrK31BDjJutkJ3iTvFvZtdNMAJCSvuMvZWXfndPU+f
 YZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jOuEodmIGZCrfmDipI8tQnSF63D+G3G2mHNWzZEtXfU=;
 b=tNIUHWzAO9eFk1nUsk+R39bEyHPSA+FH6O9zMPPWiDLdG5CwbzhBWUNY763SoH8xt2
 aK6y9miMFCrjP0sgHDk1Fze9m+JX4rqTIZ/D4RltmqBGLF6O9vabOzNA4WeDXlujOjw7
 DyXfcug2fGVnRZqEvKWmyXe6n1Ft4iwqGQBByuYf0E4YMtj0PXNglALXFB3LNv6MLNfj
 AFb8go5cjvAgPwF90q3ujzRZOaP+69QgnDVbLucN70nYai2xDDWxwbicttrWF0pq85uR
 cG4FnaimqNdwwRbKeJQ6EbaQrfUpWxzFgL97JsBTRn/0MJXQf2+IwSmN4Oeaxrv4IJ1O
 ve/Q==
X-Gm-Message-State: ABuFfohaoCsCvkGe3zyH7NNLxe5E1Mtc3Zc74OSvBR/GZvnVcSNijl5D
 /071fPcyPv9s9bdWtca9ledpSvJDCtiIX7Jz6cZvBI9a2So=
X-Google-Smtp-Source: ACcGV632/oz0AA5hcdLkFbbcdqf+mrZbvklJuYPrQ3FU3U+5brtV/KavpoEqwcxHMd0ERIbwDHYInC6OAoK9GMnL2uU=
X-Received: by 2002:a63:a42:: with SMTP id z2-v6mr6861614pgk.209.1539379968861; 
 Fri, 12 Oct 2018 14:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notz_KizBdONsKjtQ6U05r4hWQOuxa_cx9Cshps7V8=PRbw@mail.gmail.com>
 <3fc8bbb4-2db9-6df0-4fc3-1addf4b94ac3@linux.intel.com>
 <CAO=notwOiB-v5LxZ=OagkGTzhM8dnt5kogO=eaTGEKGp7si14Q@mail.gmail.com>
 <e6652bad-d524-3912-6be2-9dc2bc9d4669@linux.vnet.ibm.com>
In-Reply-To: <e6652bad-d524-3912-6be2-9dc2bc9d4669@linux.vnet.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 12 Oct 2018 14:32:37 -0700
Message-ID: <CAO=notyHG4EvvjouSJjo+n9oRDjp81W5vQFcvG4ZXiue_jmqzw@mail.gmail.com>
Subject: Re: Notion of Flakiness in Sensor Readings
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: James Feist <james.feist@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Fri, 12 Oct 2018 21:32:51 -0000

On Fri, Oct 12, 2018 at 2:28 PM Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
>
>
>
> On 10/12/2018 4:23 PM, Patrick Venture wrote:
> > On Fri, Oct 12, 2018 at 2:09 PM James Feist <james.feist@linux.intel.com> wrote:
> >> On 10/12/2018 01:53 PM, Patrick Venture wrote:
> >>> Currently, there are a few approaches in phosphor-hwmon on how to
> >>> handle sensors being present sometimes, or flaky on reads.  We've
> >>> talked in the past about how to handle a read failure that should be
> >>> ignored.  A real failure that is flaky or temporary.
> >>>
> >>> I was thinking of just adding a property to the Sensor.Value interface
> >>> to report information.  Basically, someone reading the value needs to
> >>> know if it's valid.  The idea of a range check for validity doesn't
> >>> work as cleanly for this specific purpose, in my opinion.  The min/max
> >>> can be used cleanly to determine the linearization though!
> >>>
> >>> I was thinking perhaps a boolean, that you can check to see if the
> >>> value should be used or trusted.  Then, I thought, perhaps, a enum
> >>> with a series of states, starting with the states of "Valid',
> >>> "Invalid."  Not being able to think of a third state, I fell back onto
> >>> a boolean.
>
> If the hwmon driver for your device provides a _fault attribute, and
> that gets set, the code is already
> set up to create an OperationalStatus interface on that sensor instance
> and set the Functional
> property to false.

I'd like to drop this such that the failure behavior can be returning
a NaN double.
https://github.com/openbmc/phosphor-hwmon/blob/master/hwmonio.cpp#L127

For the drivers that don't have the fault attribute, and in the case
where phosphor-host-ipmid doesn't check for that kind of failure.

>
> >> For Valid / Invalid we've produced nan on D-Bus to know that the sensor
> >> is in an invalid state (like power off for tach values). Although I'm
> >> not sure how this would be produced using the int64 interface, for the
> >> double std::nan will go over d-bus correctly.
> > So if i just wait until we're using double, the issue basically
> > resolves itself? :D :D
> >
> >>> Thoughts?
> >>>
> >>> Patrick
> >>>
>
