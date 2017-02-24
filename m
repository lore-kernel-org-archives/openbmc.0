Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x22e.google.com (mail-it0-x22e.google.com
 [IPv6:2607:f8b0:4001:c0b::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vVR1G1VWTzDqH5
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 09:41:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nY2EGZcc"; 
 dkim-atps=neutral
Received: by mail-it0-x22e.google.com with SMTP id h10so33315325ith.1
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 14:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=krP8qge8H3Csxj86Hr9bmSAl07yCaJuAdALaWcKJCF0=;
 b=nY2EGZccPEXdAnU9h53FKRNCESW2YNP9xbCdlDbnn0Cp56MS/pdFKqg5KvPbqvK0u3
 hL0qT8TPCssPBjp9JtTnYVZ6XW4vxk2Pfr5PJeg3HqDEbQKTqWF3D3lCAuQCoavDcGU3
 4TZoUKCnWg9NtO+8DS2tSK1WdmWAkkuTfRuGjiAnkJoCbwqZBHeoGlVEVe88WxkKYkww
 YewwmQt7nT8c0Bohy2kHLVlHUalmRUClxQJtv+9hCRsb5enrKTS0kvppn8BaS1RGFzVo
 k1cFMyM+KpJBnFH7g1C5smVV155PFPKDCmFWOPpthPkMkE3R0eUP9RED+ljUQdbQAh8a
 wX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=krP8qge8H3Csxj86Hr9bmSAl07yCaJuAdALaWcKJCF0=;
 b=ONIGn/Skj5O/chAy45BzCl8//Lyj4OEEYjenw5TtF5B1a5IXXYyfUahW8TE8Wvpjri
 hahnz1fWSKQJxKEEXlNJicJ39oeXQ96OGaik+F0Wfb5K74MBk8Q0mqdhVVmalcNE0KTD
 7m7fFRScMGcAjKWGWfX72HTa02iL5pXO7OJylt3zLqKaDrNG+0zchYgdlrL6GLtR74Ev
 E77z9wlvcIjZzw1wkElBCzzjtLFRyu43ULlCe2Lgj32FsboMILtPIhsmz5CrbVuzVFSv
 x/O7XW7eNHVDdf+2Fe+rxfkK10WmB8EcEIEO5fykYJot7aVOYsUza9QIA+IZJUZfF7jL
 h2hw==
X-Gm-Message-State: AMke39nd12QAd8SyDw+fYpL31jj0ZQuJ8mNNsa0svUs2xjmY0zR6Ei7drS3BsQGzNI7o+IJoY+Xe8OUidbtxLQ==
X-Received: by 10.36.202.195 with SMTP id k186mr327956itg.33.1487976111708;
 Fri, 24 Feb 2017 14:41:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.53.91 with HTTP; Fri, 24 Feb 2017 14:41:51 -0800 (PST)
In-Reply-To: <CAPLgG==4zm+tKQrN5zZq04YhYGsMi9O_Jnk8Pr7dM_o=YQGa=A@mail.gmail.com>
References: <CALLMt=r62pSsVx+5DRsyxRThX0WahOO8wk5ENcc+t7ZfyoPoVw@mail.gmail.com>
 <CACPK8XfDvDi_fUEzFo2vBHU2O=djucY1t27gqY-=RgoJQo3LWQ@mail.gmail.com>
 <45AAA114-D2B4-4B75-8485-B4B7F4AFD989@fuzziesquirrel.com>
 <CAPLgG==jF4v_Ln=vP8DB0F7wbS5F29ch=yEFWEZmNFGHHPxdwg@mail.gmail.com>
 <74BF93A2-A512-4EDF-BECF-86FCE40B2615@fuzziesquirrel.com>
 <CAPLgG==4zm+tKQrN5zZq04YhYGsMi9O_Jnk8Pr7dM_o=YQGa=A@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 24 Feb 2017 16:41:51 -0600
Message-ID: <CALLMt=ppe0afveX24bAQ6qgQ3SW0X1_bW3+kRK5iG1jbeN_=hg@mail.gmail.com>
Subject: Re: Target name refactoring
To: Rick Altherr <raltherr@google.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
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
X-List-Received-Date: Fri, 24 Feb 2017 22:41:54 -0000

ok so refactored action targets and their relationships would look like thi=
s

obmc-host-start
  -> Requires: obmc-chassis-power-on

obmc-host-shutdown
  -> Requires: obmc-host-stop
    -> Requires: obmc-chassis-power-off

The synch targets would follow similar conventions, I may break that
into a separate task since the action targets are what users interact
with and I'd like to get done ASAP.

Andrew

On Fri, Feb 24, 2017 at 3:31 PM, Rick Altherr <raltherr@google.com> wrote:
> I prefer the second.
>
> On Fri, Feb 24, 2017 at 10:24 AM, Brad Bishop <bradleyb@fuzziesquirrel.co=
m>
> wrote:
>>
>>
>> > On Feb 24, 2017, at 11:41 AM, Rick Altherr <raltherr@google.com> wrote=
:
>> >
>> > nit: stop is a verb. Stopped is a state.
>>
>> Right.  So using one of the conventions below we=E2=80=99d have either:
>>
>> obmc-stop-host
>> obmc-host-stopped
>>
>> or
>>
>> obmc-host-stop
>> obmc-host-stopped
>>
>> I=E2=80=99m guessing the first person to reply with a preference will pr=
obably
>> win.
>>
>> >
>> > On Feb 24, 2017 5:59 AM, "Brad Bishop" <bradleyb@fuzziesquirrel.com>
>> > wrote:
>> >
>> > > On Feb 21, 2017, at 10:00 PM, Joel Stanley <joel@jms.id.au> wrote:
>> > >
>> > > On Tue, Feb 21, 2017 at 8:50 AM, Andrew Geissler
>> > > <geissonator@gmail.com> wrote:
>> > >> Some design decisions came out of my last set of changes in the
>> > >> OpenBMC state area.  There was a proposal to rename our targets
>> > >> responsible for booting and powering on/off the system.
>> > >>
>> > >> Currently we have this:
>> > >> - PowerOn: obmc-power-chassis-on.target    obmc-chassis-start.targe=
t
>> > >> - PowerOff: obmc-power-chassis-off.target    obmc-chassis-stop.targ=
et
>> > >>  obmc-stop-host.target
>> > >>
>> > >> The obmc-power-chassis-*.targets are responsible for doing whatever
>> > >> is
>> > >> required to apply pgood to the chassis.
>> > >> The obmc-chassis-*.targets are responsible for starting and stoppin=
g
>> > >> all host related services
>> > >> The obmc-stop-host.target is where we have the soft power off servi=
ce
>> > >> (notify host of shutdown, wait for host to shutdown gracefully)
>> > >>
>> > >> Refactoring Proposal:
>> > >> - First the chassis-start and chassis-stop target names don=E2=80=
=99t make
>> > >> sense anymore with the new bmc, chassis, and host state break down=
=E2=80=99s
>> > >> so:
>> > >>  - Rename obmc-chassis-start.target to obmc-start-host.target
>> > >>  - Rename obmc-chassis-stop.target to obmc-stop-host.target
>> > >>  - Rename the current obmc-stop-host.target to
>> > >> obmc-shutdown-host.target
>> > >
>> > > Can I suggest putting the host before the action?
>> > >
>> > > obmc-host-stop
>> > > obmc-host-start
>> > > obmc-host-shutdown
>> >
>> > We have two types of targets, synchronization targets (for example
>> > network-pre.target),
>> > and action targets(for example multi-user.target).  Sync targets are n=
ot
>> > directly
>> > start/stoppable - they have to be started implicitly by systemd.  I
>> > would like a way
>> > to be able to tell which one I am looking at from the name.  For
>> > example:
>> >
>> > obmc-stop-host # Action - stop the host.
>> > obmc-host-stop # Sync - the host has been stopped.
>> >
>> > I had proposed this obmc-[verb]-[what] for actions and
>> > obmc-[what]-[state] to Andrew
>> > privately..I=E2=80=99m fine with something else, again, as long as it =
is
>> > consistent.
>> >
>> > I can think of two conventions:
>> >
>> > obmc-[verb]-[what] for actions
>> > obmc-[what]-[state] for sync points
>> >
>> > or
>> >
>> > obmc-[what]-[verb] for actions
>> > obmc-[what]-[state] for sync points
>> >
>> > Either one is fine with me.  The former seems slightly easier to
>> > distinguish between
>> > the two.
>> >
>> > >
>> > >>
>> > >> The target relationships are then the following:
>> > >>
>> > >> obmc-host-start.target requires obmc-power-chassis-on.target
>> > >> obmc-shutdown-host.target requires obmc-stop-host.target requires
>> > >> obmc-power-chassis-off.target
>> > >
>> > > obmc-host-start requires obmc-chassis-poweron
>> > >
>> > > obmc-host-shutdown requires obmc-host-stop requires
>> > > obmc-chassis-poweroff
>> > >
>> > > I think the rest of your proposal sounds good, from what I understan=
d.
>> > >
>> > > Cheers,
>> > >
>> > > Joel
>> > >
>> > >>
>> > >> When a system goes to the quiesce target, the host state manager wi=
ll
>> > >> call the obmc-stop-host.target.  Otherwise, the host state service
>> > >> will call the obmc-shutdown-host.target when power off is requested=
.
>> > >>
>> > >> Thoughts/Comments?
>> > >> Andrew
>
>
