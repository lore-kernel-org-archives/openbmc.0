Return-Path: <geissonator@gmail.com>
Received: from mail-io0-x22b.google.com (mail-io0-x22b.google.com
 [IPv6:2607:f8b0:4001:c06::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tRrJS6cVqzDvM8
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 13:30:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="t7xJwhj9"; 
 dkim-atps=neutral
Received: by mail-io0-x22b.google.com with SMTP id c21so202742874ioj.1
 for <openbmc@lists.ozlabs.org>; Sun, 27 Nov 2016 18:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8u/8J7MASlzNK6j1pSp5OYK3hlV5iE8XH1n18LyI320=;
 b=t7xJwhj9Zpi7o8fy4xW4mT7HtYFYtco5/kKASHZ9+ia+xaxAohYuIoYnt7HX50ZpVQ
 ReyO8jye927Sv42/GtkFBnU4uLjZ5VTqkUuU6juV7VcTBcF/1OM5/pleQp26goEyMrb0
 ePSMKUFdJyXj1Zxf7S0YLHP3GA94qvOfYPMCnsgMiHi3GJMWI3orUuUHkTwvyPFg7wLr
 r8shhficOoQrwsLvKY3KO2lSwbqIG4FVv/H+pIU3WhFO4/CTpD09szY9by1FtjzcAcz7
 Wo1EsIWttn10+Tz+wMstY8b7u2I25BzCNHxSDwOUm9FpVyKoC62dbvkreHSwuR1AGEIP
 ih2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8u/8J7MASlzNK6j1pSp5OYK3hlV5iE8XH1n18LyI320=;
 b=Hj3os8V0ukndddyLrLLqkn9onbjsSBsPPCpf6hlaYVGozLBZn64xLcMg/Mr/wCO/GM
 7ijLfPOJQnwVx2YNjmmmWDEtLniNnB8+BG7WFkLSRYQyyOvp2R/g+Uk4hiKfYXPEKbsC
 q5CSCXLmjCWUmwYzW8G4nRNLNAumfGIMLT5MVw4XBtkXJN5t1OIs84EgcQL/X8mCI795
 1q9prwCVpgrUE1Kq2u7afvj0TmPgDRZAO/zarxazYX5UMFeCPBJG2juk1aePWxJr1/Zd
 FmY6uhOr6SkN10ctCkulWc08eQr5k5f5TYBP6MPlKcpoJlMWwB3BdK053Bbzeb9Iqzf7
 NCaQ==
X-Gm-Message-State: AKaTC01wk3PrXW6OtxVtCcYzCPAAFiOT5ibM8OhZCcOXpYUGiQ62VtMx/sxzcFDhck/hLsEdM0QkZd1iD0CwpQ==
X-Received: by 10.107.27.211 with SMTP id b202mr16372631iob.15.1480300246169; 
 Sun, 27 Nov 2016 18:30:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.151 with HTTP; Sun, 27 Nov 2016 18:30:45 -0800 (PST)
In-Reply-To: <1479863279.2503.42.camel@aj.id.au>
References: <CALLMt=oZ7neAge4of5KwzEQbA9nZ_ayuaYwFyUPGqN14Oq-5fA@mail.gmail.com>
 <CACPK8XebH8SnRGkxqSHS=QN1PYyWL2vt-NBw-sNA6d8qL6ZCEw@mail.gmail.com>
 <CALLMt=pUaq39-YtUQgOcwPOzzhFM8pOB2LgML02uifpKCT3_5Q@mail.gmail.com>
 <1479786054.2503.23.camel@aj.id.au>
 <CALLMt=rNQSyYX6m--TKns1Hf1frFVmCfE+M77RVcADD8QyfuPg@mail.gmail.com>
 <1479863279.2503.42.camel@aj.id.au>
From: Andrew Geissler <geissonator@gmail.com>
Date: Sun, 27 Nov 2016 20:30:45 -0600
Message-ID: <CALLMt=rMsUO4yKw9Cs5PVU67dE34Ru-WL+rfE67OtD9t-NKiow@mail.gmail.com>
Subject: Re: BMC and Host State Management Refactor
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, jdking@us.ibm.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 28 Nov 2016 02:30:49 -0000

On Tue, Nov 22, 2016 at 7:07 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Tue, 2016-11-22 at 11:23 -0600, Andrew Geissler wrote:
>> > On Mon, Nov 21, 2016 at 9:40 PM, Andrew Jeffery <andrew@aj.id.au> wrot=
e:
>> > On Mon, 2016-11-21 at 20:28 -0600, Andrew Geissler wrote:
>> > > > > > > > On Sun, Nov 20, 2016 at 11:55 PM, Joel Stanley <joel@jms.i=
d.au> wrote:
>> > > > Hi Andrew and Josh,
>> > > >
>> > > > On Sat, Nov 19, 2016 at 7:01 AM, Andrew Geissler <geissonator@gmai=
l.com> wrote:
>> > > > > Josh and I are working two stories this sprint that deal with
>> > > > > refactoring the bmc and host state management code out of skelet=
on
>> > > > > (#772/#783).  Here=E2=80=99s the proposal on this work.
>> > > >
>> > > > Thanks for sending out your plan, this is great. I have a few comm=
ents
>> > > > that came up as I was reading.
>> > > >
>> > > > > The overall design for both state management objects is that the=
y will
>> > > > > provide a set of properties on which to operate.
>> > > > > - DesiredState
>> > > > > - CurrentState
>> > > > >
>> > > > > CurrentState will be a read only property.
>> > > >
>> > > > You've chosen to make the desired and current states be separate,
>> > > > which works. Another option would be to have them be the same list=
 of
>> > > > states, so you know that when current=3D=3Ddesired you're not wait=
ing on
>> > > > anything to happen. What do you think?
>> > > >
>> > >
>> > > Hmmm, I'm thinking from a DBUS/REST api perspective here.  2 seems
>> > > more intuitive, but also I don't think I understand your proposal
>> > > fully :)
>> >
>> > I think you might be misinterpreting. I don't think Joel was suggestin=
g
>> > you eliminate one of the DesiredState or CurrentState "variables",
>> > rather that the /types/ of the CurrentState and DesiredState variables
>> > be equal. That is, that the same set of states can be assigned to both=
.
>> >
>>
>> I see now.  I'm still not seeing any huge advantages on either
>> proposal over my original.
>
> The advantage I see in Joel's proposal is that we have fewer types
> involved in the problem. The alternative (as mentioned below) is you
> rename DesiredState to Transition, in which case I think what you are
> suggesting is okay. Transitions and states are distinct and well
> defined concepts.
>
> I don't like the idea of "desiring" a state that doesn't exist. Joel's
> initial question suggests he thinks along these lines as well.
>

Ahh, ok I see your guys point now.  I could def rename the Desired
variables to something like DesiredHostTransition.  Maybe even make
their values verbs (TURN_ON, TURN_OFF, REBOOT)?  I could even knock of
the "Desired" part (i.e. HostTransition)?  I'm not real strong on it
either way.

>>  I think I'm just going to stick with it
>> for now since there are times where the valid states associated with
>> each (Desired vs. Current) are different
>
> Can you expand on this to make it clear what you are arguing for?
>
>>  and I think having the two as
>> I've defined is a bit more user friendly.
>
> In what way?
>
> Cheers,
>
> Andrew
