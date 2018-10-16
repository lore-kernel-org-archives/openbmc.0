Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HxEtomUG"; 
 dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Yzsr461yzF3Wg
 for <openbmc@lists.ozlabs.org>; Tue, 16 Oct 2018 13:34:40 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id m77-v6so10643010pfi.8
 for <openbmc@lists.ozlabs.org>; Mon, 15 Oct 2018 19:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pGS2VQLyBiMognqPO4+PmS0lEs4MgAYevZ7F/e73Mak=;
 b=HxEtomUG/0k9jPDJWp1nINv+NabYgeSgSohutCkhI5pgoJmdeaezyq3X5ijwLWFzqm
 IgQV18VzLt0INNNOcf34E1hAliKWAQ6tvX/AWmz9TcuZ8fwkB+jUZYRTuSbTOP+0urE8
 53FEi8MvL4RL/ALtSflcFzo6sX9wMvgGZdvhxQAEhASwABV7RcszATLSWbfdkY1GphGE
 0uNDv0Q+A04k0ziH8WyTnsLRqWe95rcL6xUHOMC9VPJAf2hnLpBWeCmQ2q4eaCTaoF/p
 BHp361NtkkzqMPwCgeW+aab2CptiEJNkp5yr4Y8GvcrTqDhBJScivzhfmhDJfYJjCNvj
 ex1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pGS2VQLyBiMognqPO4+PmS0lEs4MgAYevZ7F/e73Mak=;
 b=cmfrBp79qySAqcJmEhuLv1jvG8CguFsi9JeqKOm+TqaD+yTeb8ayybnLNxLkXtyZU7
 AO5F9Gc0st3fviSob/eTEvu7w/GcvUSKzXPzXRrMONxZjHDiKb917cOLSSsazGb/OAEI
 OCKNRxP5QJ1H49nzRkQAyeZbXK0MS/+zJu/iMI9XOE21jksmHCP6Ay2zeydqVZhHWqfr
 Qr0YbqOJGowWZKl/n0eNIAqZQYAft3rG+ntBn67ykKAmcahuXno1AWrWqzMKJjMtEzSL
 GDODfRKaH3Ra3F/cDG0b/fHmQZzLcfGoGit1RWGnhao5WcSGSXP6ueBeE4INq/4MZd/L
 WkjQ==
X-Gm-Message-State: ABuFfogVYitYskN2x1zrzsYhl4Sba1Og1x9FCzGv+/AFMmW40rlp6VPF
 4JRcQM1lNFlkhLHlLXv65sYES57mY3mcFOBt6slwrg==
X-Google-Smtp-Source: ACcGV62MKsnu+Rt9ICIxc2+YPqFCPkblo+dFW5C8tbFs7qAEba0qlY5nEBaXKmKOmQqh1wSmAnw6/E2TGLPRxMMFKeM=
X-Received: by 2002:a63:e601:: with SMTP id
 g1-v6mr18649487pgh.290.1539657278143; 
 Mon, 15 Oct 2018 19:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notz_KizBdONsKjtQ6U05r4hWQOuxa_cx9Cshps7V8=PRbw@mail.gmail.com>
 <3fc8bbb4-2db9-6df0-4fc3-1addf4b94ac3@linux.intel.com>
 <CAO=notwOiB-v5LxZ=OagkGTzhM8dnt5kogO=eaTGEKGp7si14Q@mail.gmail.com>
 <e6652bad-d524-3912-6be2-9dc2bc9d4669@linux.vnet.ibm.com>
 <CAO=notyHG4EvvjouSJjo+n9oRDjp81W5vQFcvG4ZXiue_jmqzw@mail.gmail.com>
 <57667218-5BC4-4206-B548-C636426A4571@fuzziesquirrel.com>
 <CAO=notzKG=sqpY06Akv2uznzcXtizvC2X7Y_=A4pwOqC_d8Azg@mail.gmail.com>
 <5D506CB1-FCD4-4A5F-85FB-28D47533784D@fuzziesquirrel.com>
In-Reply-To: <5D506CB1-FCD4-4A5F-85FB-28D47533784D@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 15 Oct 2018 19:34:26 -0700
Message-ID: <CAO=notykoObziLuEBcE_dcc5UcRgykYm1Z2BWp9-qqFdv4U7kQ@mail.gmail.com>
Subject: Re: Notion of Flakiness in Sensor Readings
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>,
 James Feist <james.feist@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 16 Oct 2018 02:34:41 -0000

On Mon, Oct 15, 2018 at 7:30 PM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
>
>
> > On Oct 15, 2018, at 10:15 PM, Patrick Venture <venture@google.com> wrot=
e:
> >
> > On Mon, Oct 15, 2018 at 6:14 PM Brad Bishop <bradleyb@fuzziesquirrel.co=
m> wrote:
> >>
> >>
> >>
> >>> On Oct 12, 2018, at 5:32 PM, Patrick Venture <venture@google.com> wro=
te:
> >>>
> >>> On Fri, Oct 12, 2018 at 2:28 PM Matt Spinler
> >>> <mspinler@linux.vnet.ibm.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 10/12/2018 4:23 PM, Patrick Venture wrote:
> >>>>> On Fri, Oct 12, 2018 at 2:09 PM James Feist <james.feist@linux.inte=
l.com> wrote:
> >>>>>> On 10/12/2018 01:53 PM, Patrick Venture wrote:
> >>>>>>> Currently, there are a few approaches in phosphor-hwmon on how to
> >>>>>>> handle sensors being present sometimes, or flaky on reads.  We've
> >>>>>>> talked in the past about how to handle a read failure that should=
 be
> >>>>>>> ignored.  A real failure that is flaky or temporary.
> >>>>>>>
> >>>>>>> I was thinking of just adding a property to the Sensor.Value inte=
rface
> >>>>>>> to report information.  Basically, someone reading the value need=
s to
> >>>>>>> know if it's valid.  The idea of a range check for validity doesn=
't
> >>>>>>> work as cleanly for this specific purpose, in my opinion.  The mi=
n/max
> >>>>>>> can be used cleanly to determine the linearization though!
> >>>>>>>
> >>>>>>> I was thinking perhaps a boolean, that you can check to see if th=
e
> >>>>>>> value should be used or trusted.  Then, I thought, perhaps, a enu=
m
> >>>>>>> with a series of states, starting with the states of "Valid',
> >>>>>>> "Invalid."  Not being able to think of a third state, I fell back=
 onto
> >>>>>>> a boolean.
> >>>>
> >>>> If the hwmon driver for your device provides a _fault attribute, and
> >>>> that gets set, the code is already
> >>>> set up to create an OperationalStatus interface on that sensor insta=
nce
> >>>> and set the Functional
> >>>> property to false.
> >>>
> >>> I'd like to drop this such that the failure behavior can be returning
> >>> a NaN double.
> >>
> >> One benefit I see here is that everything is in the same DBus interfac=
e
> >> (the same property even), but with OperationalStatus you have two and
> >> thus more DBus calls, if you are polling?  Is that it or are there oth=
ers?
> >>
> >>> https://github.com/openbmc/phosphor-hwmon/blob/master/hwmonio.cpp#L12=
7
> >>>
> >>> For the drivers that don't have the fault attribute,
> >>
> >> It seems like OperationalStatus could be extended to emulate easily he=
re.
> >>
> >>> and in the case where phosphor-host-ipmid doesn't check for that kind=
 of
> >>> failure.
> >>
> >> So is there no value in consistency of interface?  A lot of things
> >> can be =E2=80=98not working=E2=80=99 on a BMC besides sensors - do you=
 want to model that
> >> in the DBus API differently for each domain (which seems like the dire=
ction
> >> you are headed)?
> >>
> >> Further this model falls apart if you ever want something besides _wor=
king_
> >> and _not_working_ for possible states.  I realize YAGNI, but 1 - I hav=
e seen that
> >> in the past, 2 - it seems trivial to implement, and 3 - the down-side =
of
> >> OperationalStatus is not apparent to me.
> >
> > I have no issue with OperationalStatus for this -- I believe Matt's
> > comment was that it's available gratis if the driver supports it.
>
> Correct.  But I think it could be extended to emulate it for drivers that
> don=E2=80=99t - similar to the thresholds.
>
> > Since this driver may not (doesn't, but i haven't checked recently), I
> > haven't dug back into that use case.
> >
> > The idea of a sensor falling off and being added to the dbus every
> > other time the sensor needs to be read falls over for at least one key
> > reason: 1) You can't read the sensor on demand anymore.
>
> I agree - I don=E2=80=99t think we want to do this anymore, when we have
> options like OperationalStatus or NaN.
>
> >
> > I brought all this up because I want to get away from -errno patches,
> > and I want the error path to follow the natural state of things.
> > Reading a dbus double and seeing NaN() may be enough of an error, and
> > you can check OperationalStatus or other interfaces for more
> > information if desired.
>
> That SGTM.  I thought you wanted to drop OperationalStatus completely.

No, I definitely want to keep it.  And the idea of emulating it was
sort of the idea going in -- although I hadn't thought of it when I
started this chain - - the but general idea that I can use something
like NaN and get the results for the flakiness situation with few
changes in phosphor-host-ipmid, I'm pretty happy with it.

There may be other types of errors that warrant using OperationStatus,
but that is a second check, so that's something that could be avoided
for some errors.

I think we're all on the same page.

>
> >
> >>
> >>>
> >>>>
> >>>>>> For Valid / Invalid we've produced nan on D-Bus to know that the s=
ensor
> >>>>>> is in an invalid state (like power off for tach values). Although =
I'm
> >>>>>> not sure how this would be produced using the int64 interface, for=
 the
> >>>>>> double std::nan will go over d-bus correctly.
> >>>>> So if i just wait until we're using double, the issue basically
> >>>>> resolves itself? :D :D
> >>>>>
> >>>>>>> Thoughts?
> >>>>>>>
> >>>>>>> Patrick
