Return-Path: <raltherr@google.com>
Received: from mail-io0-x22f.google.com (mail-io0-x22f.google.com
 [IPv6:2607:f8b0:4001:c06::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vVPSY4rKQzDqH5
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 08:31:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="tFWUM7p/"; 
 dkim-atps=neutral
Received: by mail-io0-x22f.google.com with SMTP id l66so2141797ioi.1
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 13:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ycjQlYtTLPsX1EVPyJJQHApuVlmtTFe3XfwJQDainTU=;
 b=tFWUM7p/lsJzrYyfC7ia4MKk9MvwYM5T5+bJCC65kRSUT5OgfHca1QynbI4iPlwYQL
 erdNvo3wAQ/2F7MhlW/5XZyDjwF0DppiXCxtJeMcoALBb91R7W8GB4jn6yLA2nVgNoih
 MZGwm+/7LUbJ/mjimmR9vVs2/3ztxwKTGtHjZUMgLxli5QZwChrloBBsmRw3/p7/HBeu
 C1vejsn1l4lI/qaweAzlLt9sq3YMK8dzm57eUuhbMorSlwWvuBPpw+zWLcldS1T05TT1
 ESPTQ55z6sVnKb/WV39gnX/tUQK0SPnalH6DiCRw0AnHrOCW8fl28cnVe9dI6xLNYdjy
 SC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ycjQlYtTLPsX1EVPyJJQHApuVlmtTFe3XfwJQDainTU=;
 b=NdrtCDje6n8+VzGsdyezPJuiz809p/AiolGpEh7f432GMkTSUEvFPpVnZ6aJfYEZDP
 HLgQWpBeMfRkzeVWFkao1TDxKBTzmyaRidWgPLKe7VlZVExXYRX6iVSfgHn5ZkYnRVfJ
 ZgzlQuHxL7CQe809/+gXiyyxD5cNYvXYHzoZs2kGuZ80GMZhW190w0kGXyZ1UL8YikJC
 566oZX0VlcqXEi6IjJWHjmTygJp3G9EglGMTxvRevKzzDFj4/JsPSeqyKiXFaTEJ/PYP
 YC5tE5xzkQGMutUy9AQKa6tMBnsnxz3ORE56zO89mkSjsNuUzbY8ynvomLMVn/oUbtkf
 /M1w==
X-Gm-Message-State: AMke39mfk93LYmJgq498BzCanDth+BVDb8TQJRd8CRZK2kIAwfAP5oo4DZ+4a9z14a0Aq3Lnq57Z5fy4MCa6O07i
X-Received: by 10.107.180.8 with SMTP id d8mr4530455iof.101.1487971915169;
 Fri, 24 Feb 2017 13:31:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Fri, 24 Feb 2017 13:31:54 -0800 (PST)
In-Reply-To: <74BF93A2-A512-4EDF-BECF-86FCE40B2615@fuzziesquirrel.com>
References: <CALLMt=r62pSsVx+5DRsyxRThX0WahOO8wk5ENcc+t7ZfyoPoVw@mail.gmail.com>
 <CACPK8XfDvDi_fUEzFo2vBHU2O=djucY1t27gqY-=RgoJQo3LWQ@mail.gmail.com>
 <45AAA114-D2B4-4B75-8485-B4B7F4AFD989@fuzziesquirrel.com>
 <CAPLgG==jF4v_Ln=vP8DB0F7wbS5F29ch=yEFWEZmNFGHHPxdwg@mail.gmail.com>
 <74BF93A2-A512-4EDF-BECF-86FCE40B2615@fuzziesquirrel.com>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 24 Feb 2017 13:31:54 -0800
Message-ID: <CAPLgG==4zm+tKQrN5zZq04YhYGsMi9O_Jnk8Pr7dM_o=YQGa=A@mail.gmail.com>
Subject: Re: Target name refactoring
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c05a65670e65c05494d75ca
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
X-List-Received-Date: Fri, 24 Feb 2017 21:31:58 -0000

--94eb2c05a65670e65c05494d75ca
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I prefer the second.

On Fri, Feb 24, 2017 at 10:24 AM, Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

>
> > On Feb 24, 2017, at 11:41 AM, Rick Altherr <raltherr@google.com> wrote:
> >
> > nit: stop is a verb. Stopped is a state.
>
> Right.  So using one of the conventions below we=E2=80=99d have either:
>
> obmc-stop-host
> obmc-host-stopped
>
> or
>
> obmc-host-stop
> obmc-host-stopped
>
> I=E2=80=99m guessing the first person to reply with a preference will pro=
bably win.
>
> >
> > On Feb 24, 2017 5:59 AM, "Brad Bishop" <bradleyb@fuzziesquirrel.com>
> wrote:
> >
> > > On Feb 21, 2017, at 10:00 PM, Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > On Tue, Feb 21, 2017 at 8:50 AM, Andrew Geissler <
> geissonator@gmail.com> wrote:
> > >> Some design decisions came out of my last set of changes in the
> > >> OpenBMC state area.  There was a proposal to rename our targets
> > >> responsible for booting and powering on/off the system.
> > >>
> > >> Currently we have this:
> > >> - PowerOn: obmc-power-chassis-on.target    obmc-chassis-start.target
> > >> - PowerOff: obmc-power-chassis-off.target    obmc-chassis-stop.targe=
t
> > >>  obmc-stop-host.target
> > >>
> > >> The obmc-power-chassis-*.targets are responsible for doing whatever =
is
> > >> required to apply pgood to the chassis.
> > >> The obmc-chassis-*.targets are responsible for starting and stopping
> > >> all host related services
> > >> The obmc-stop-host.target is where we have the soft power off servic=
e
> > >> (notify host of shutdown, wait for host to shutdown gracefully)
> > >>
> > >> Refactoring Proposal:
> > >> - First the chassis-start and chassis-stop target names don=E2=80=99=
t make
> > >> sense anymore with the new bmc, chassis, and host state break down=
=E2=80=99s
> > >> so:
> > >>  - Rename obmc-chassis-start.target to obmc-start-host.target
> > >>  - Rename obmc-chassis-stop.target to obmc-stop-host.target
> > >>  - Rename the current obmc-stop-host.target to
> obmc-shutdown-host.target
> > >
> > > Can I suggest putting the host before the action?
> > >
> > > obmc-host-stop
> > > obmc-host-start
> > > obmc-host-shutdown
> >
> > We have two types of targets, synchronization targets (for example
> network-pre.target),
> > and action targets(for example multi-user.target).  Sync targets are no=
t
> directly
> > start/stoppable - they have to be started implicitly by systemd.  I
> would like a way
> > to be able to tell which one I am looking at from the name.  For exampl=
e:
> >
> > obmc-stop-host # Action - stop the host.
> > obmc-host-stop # Sync - the host has been stopped.
> >
> > I had proposed this obmc-[verb]-[what] for actions and
> obmc-[what]-[state] to Andrew
> > privately..I=E2=80=99m fine with something else, again, as long as it i=
s
> consistent.
> >
> > I can think of two conventions:
> >
> > obmc-[verb]-[what] for actions
> > obmc-[what]-[state] for sync points
> >
> > or
> >
> > obmc-[what]-[verb] for actions
> > obmc-[what]-[state] for sync points
> >
> > Either one is fine with me.  The former seems slightly easier to
> distinguish between
> > the two.
> >
> > >
> > >>
> > >> The target relationships are then the following:
> > >>
> > >> obmc-host-start.target requires obmc-power-chassis-on.target
> > >> obmc-shutdown-host.target requires obmc-stop-host.target requires
> > >> obmc-power-chassis-off.target
> > >
> > > obmc-host-start requires obmc-chassis-poweron
> > >
> > > obmc-host-shutdown requires obmc-host-stop requires
> obmc-chassis-poweroff
> > >
> > > I think the rest of your proposal sounds good, from what I understand=
.
> > >
> > > Cheers,
> > >
> > > Joel
> > >
> > >>
> > >> When a system goes to the quiesce target, the host state manager wil=
l
> > >> call the obmc-stop-host.target.  Otherwise, the host state service
> > >> will call the obmc-shutdown-host.target when power off is requested.
> > >>
> > >> Thoughts/Comments?
> > >> Andrew
>

--94eb2c05a65670e65c05494d75ca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I prefer the second.</div><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On Fri, Feb 24, 2017 at 10:24 AM, Brad Bishop <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com" target=3D=
"_blank">bradleyb@fuzziesquirrel.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><span class=3D""><br>
&gt; On Feb 24, 2017, at 11:41 AM, Rick Altherr &lt;<a href=3D"mailto:ralth=
err@google.com">raltherr@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; nit: stop is a verb. Stopped is a state.<br>
<br>
</span>Right.=C2=A0 So using one of the conventions below we=E2=80=99d have=
 either:<br>
<br>
obmc-stop-host<br>
obmc-host-stopped<br>
<br>
or<br>
<br>
obmc-host-stop<br>
obmc-host-stopped<br>
<br>
I=E2=80=99m guessing the first person to reply with a preference will proba=
bly win.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; On Feb 24, 2017 5:59 AM, &quot;Brad Bishop&quot; &lt;<a href=3D"mailto=
:bradleyb@fuzziesquirrel.com">bradleyb@fuzziesquirrel.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; &gt; On Feb 21, 2017, at 10:00 PM, Joel Stanley &lt;<a href=3D"mailto:=
joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Tue, Feb 21, 2017 at 8:50 AM, Andrew Geissler &lt;<a href=3D"m=
ailto:geissonator@gmail.com">geissonator@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt; Some design decisions came out of my last set of changes in t=
he<br>
&gt; &gt;&gt; OpenBMC state area.=C2=A0 There was a proposal to rename our =
targets<br>
&gt; &gt;&gt; responsible for booting and powering on/off the system.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Currently we have this:<br>
&gt; &gt;&gt; - PowerOn: obmc-power-chassis-on.target=C2=A0 =C2=A0 obmc-cha=
ssis-start.target<br>
&gt; &gt;&gt; - PowerOff: obmc-power-chassis-off.target=C2=A0 =C2=A0 obmc-c=
hassis-stop.target<br>
&gt; &gt;&gt;=C2=A0 obmc-stop-host.target<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The obmc-power-chassis-*.targets are responsible for doing wh=
atever is<br>
&gt; &gt;&gt; required to apply pgood to the chassis.<br>
&gt; &gt;&gt; The obmc-chassis-*.targets are responsible for starting and s=
topping<br>
&gt; &gt;&gt; all host related services<br>
&gt; &gt;&gt; The obmc-stop-host.target is where we have the soft power off=
 service<br>
&gt; &gt;&gt; (notify host of shutdown, wait for host to shutdown gracefull=
y)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Refactoring Proposal:<br>
&gt; &gt;&gt; - First the chassis-start and chassis-stop target names don=
=E2=80=99t make<br>
&gt; &gt;&gt; sense anymore with the new bmc, chassis, and host state break=
 down=E2=80=99s<br>
&gt; &gt;&gt; so:<br>
&gt; &gt;&gt;=C2=A0 - Rename obmc-chassis-start.target to obmc-start-host.t=
arget<br>
&gt; &gt;&gt;=C2=A0 - Rename obmc-chassis-stop.target to obmc-stop-host.tar=
get<br>
&gt; &gt;&gt;=C2=A0 - Rename the current obmc-stop-host.target to obmc-shut=
down-host.target<br>
&gt; &gt;<br>
&gt; &gt; Can I suggest putting the host before the action?<br>
&gt; &gt;<br>
&gt; &gt; obmc-host-stop<br>
&gt; &gt; obmc-host-start<br>
&gt; &gt; obmc-host-shutdown<br>
&gt;<br>
&gt; We have two types of targets, synchronization targets (for example net=
work-pre.target),<br>
&gt; and action targets(for example multi-user.target).=C2=A0 Sync targets =
are not directly<br>
&gt; start/stoppable - they have to be started implicitly by systemd.=C2=A0=
 I would like a way<br>
&gt; to be able to tell which one I am looking at from the name.=C2=A0 For =
example:<br>
&gt;<br>
&gt; obmc-stop-host # Action - stop the host.<br>
&gt; obmc-host-stop # Sync - the host has been stopped.<br>
&gt;<br>
&gt; I had proposed this obmc-[verb]-[what] for actions and obmc-[what]-[st=
ate] to Andrew<br>
&gt; privately..I=E2=80=99m fine with something else, again, as long as it =
is consistent.<br>
&gt;<br>
&gt; I can think of two conventions:<br>
&gt;<br>
&gt; obmc-[verb]-[what] for actions<br>
&gt; obmc-[what]-[state] for sync points<br>
&gt;<br>
&gt; or<br>
&gt;<br>
&gt; obmc-[what]-[verb] for actions<br>
&gt; obmc-[what]-[state] for sync points<br>
&gt;<br>
&gt; Either one is fine with me.=C2=A0 The former seems slightly easier to =
distinguish between<br>
&gt; the two.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The target relationships are then the following:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; obmc-host-start.target requires obmc-power-chassis-on.target<=
br>
&gt; &gt;&gt; obmc-shutdown-host.target requires obmc-stop-host.target requ=
ires<br>
&gt; &gt;&gt; obmc-power-chassis-off.target<br>
&gt; &gt;<br>
&gt; &gt; obmc-host-start requires obmc-chassis-poweron<br>
&gt; &gt;<br>
&gt; &gt; obmc-host-shutdown requires obmc-host-stop requires obmc-chassis-=
poweroff<br>
&gt; &gt;<br>
&gt; &gt; I think the rest of your proposal sounds good, from what I unders=
tand.<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt;<br>
&gt; &gt; Joel<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; When a system goes to the quiesce target, the host state mana=
ger will<br>
&gt; &gt;&gt; call the obmc-stop-host.target.=C2=A0 Otherwise, the host sta=
te service<br>
&gt; &gt;&gt; will call the obmc-shutdown-host.target when power off is req=
uested.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Thoughts/Comments?<br>
&gt; &gt;&gt; Andrew<br>
</div></div></blockquote></div><br></div>

--94eb2c05a65670e65c05494d75ca--
