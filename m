Return-Path: <raltherr@google.com>
Received: from mail-it0-x234.google.com (mail-it0-x234.google.com
 [IPv6:2607:f8b0:4001:c0b::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vVH0z5XbKzDqHs
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 03:41:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="g/0vZVyW"; 
 dkim-atps=neutral
Received: by mail-it0-x234.google.com with SMTP id 203so26967227ith.0
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 08:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=7uhUS9USYrXNNchOT1fKwrzpfLKUDx7ww3ozpWU72C8=;
 b=g/0vZVyW7/Xu3lWRvVaSsTbRE9CKj1LuMqu40Obqq/8ItUglva8N9cCB6Uzrphoh1q
 nryqbXo4Nx+dhQXpu3XlGsLHEttkmIHBrYkOKFm2cGCwmM5rlcz+meVeoUyKWfK5d9Ky
 1FZZZ8jweezgH4yFXtKfqK2CJoIwYSmxBHr633uVLVxfwDJwUxBX5T8QfHrf1XUMdg9/
 Gzb6w/5UJwHU9amdFDUKZED8o/vOeJfE0l1qMdEEaotoH9/6cs8rDlJ3ue3ALqV5THqQ
 AD1Isa652Svnra8W3CCVGbOjZfe8yJeDUpeaNSwWQqXSk8kaNGCPVZ5LoB8juz6hRBLy
 3tKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=7uhUS9USYrXNNchOT1fKwrzpfLKUDx7ww3ozpWU72C8=;
 b=SOdXrcaIBqwo08Ea2BNxPJsvkUYjEJnq8xIA/l0ExozQFXB4/5kjfXykGOxp7qNHAN
 EklqQZy2BUNltHasAz8e6AK9SlM0khiTeGfHfrSG4dZPwHcZ5YfrV3ACxhVUjhZvNV/L
 ukoQafeKx8CN4Ez3w6+r4LU99keUpNpf+Q2XR/Usmp4m9av0y9Sf4/MVosezwP6FTCuG
 QMZ+lsZ3HwSJpN3nL9eaag3QoRUUzzwhy065KbEg+mIJf6GvvWcrpcdwGpnRtqCwRnpe
 Jp95mr4GncO1ehHK4IsIGCpbYOPiLEknU4l9LWX09BVS9GX4BMa1NGrcot+AFjjW2qPc
 ZGXQ==
X-Gm-Message-State: AMke39mw2WFkLPwH92P4zA8tm0lD98UyiwbSWC6v5vu95gynNuB7tbqaYTVyz0qlFoLWbfWWDY55DxTSopuEZRdb
X-Received: by 10.36.44.4 with SMTP id i4mr2948574iti.105.1487954465037; Fri,
 24 Feb 2017 08:41:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Fri, 24 Feb 2017 08:41:04 -0800 (PST)
Received: by 10.64.133.226 with HTTP; Fri, 24 Feb 2017 08:41:04 -0800 (PST)
In-Reply-To: <45AAA114-D2B4-4B75-8485-B4B7F4AFD989@fuzziesquirrel.com>
References: <CALLMt=r62pSsVx+5DRsyxRThX0WahOO8wk5ENcc+t7ZfyoPoVw@mail.gmail.com>
 <CACPK8XfDvDi_fUEzFo2vBHU2O=djucY1t27gqY-=RgoJQo3LWQ@mail.gmail.com>
 <45AAA114-D2B4-4B75-8485-B4B7F4AFD989@fuzziesquirrel.com>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 24 Feb 2017 08:41:04 -0800
Message-ID: <CAPLgG==jF4v_Ln=vP8DB0F7wbS5F29ch=yEFWEZmNFGHHPxdwg@mail.gmail.com>
Subject: Re: Target name refactoring
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a11440eb454f6c805494965a0
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
X-List-Received-Date: Fri, 24 Feb 2017 16:41:08 -0000

--001a11440eb454f6c805494965a0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

nit: stop is a verb. Stopped is a state.

On Feb 24, 2017 5:59 AM, "Brad Bishop" <bradleyb@fuzziesquirrel.com> wrote:

>
> > On Feb 21, 2017, at 10:00 PM, Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Tue, Feb 21, 2017 at 8:50 AM, Andrew Geissler <geissonator@gmail.com=
>
> wrote:
> >> Some design decisions came out of my last set of changes in the
> >> OpenBMC state area.  There was a proposal to rename our targets
> >> responsible for booting and powering on/off the system.
> >>
> >> Currently we have this:
> >> - PowerOn: obmc-power-chassis-on.target    obmc-chassis-start.target
> >> - PowerOff: obmc-power-chassis-off.target    obmc-chassis-stop.target
> >>  obmc-stop-host.target
> >>
> >> The obmc-power-chassis-*.targets are responsible for doing whatever is
> >> required to apply pgood to the chassis.
> >> The obmc-chassis-*.targets are responsible for starting and stopping
> >> all host related services
> >> The obmc-stop-host.target is where we have the soft power off service
> >> (notify host of shutdown, wait for host to shutdown gracefully)
> >>
> >> Refactoring Proposal:
> >> - First the chassis-start and chassis-stop target names don=E2=80=99t =
make
> >> sense anymore with the new bmc, chassis, and host state break down=E2=
=80=99s
> >> so:
> >>  - Rename obmc-chassis-start.target to obmc-start-host.target
> >>  - Rename obmc-chassis-stop.target to obmc-stop-host.target
> >>  - Rename the current obmc-stop-host.target to obmc-shutdown-host.targ=
et
> >
> > Can I suggest putting the host before the action?
> >
> > obmc-host-stop
> > obmc-host-start
> > obmc-host-shutdown
>
> We have two types of targets, synchronization targets (for example
> network-pre.target),
> and action targets(for example multi-user.target).  Sync targets are not
> directly
> start/stoppable - they have to be started implicitly by systemd.  I would
> like a way
> to be able to tell which one I am looking at from the name.  For example:
>
> obmc-stop-host # Action - stop the host.
> obmc-host-stop # Sync - the host has been stopped.
>
> I had proposed this obmc-[verb]-[what] for actions and obmc-[what]-[state=
]
> to Andrew
> privately..I=E2=80=99m fine with something else, again, as long as it is
> consistent.
>
> I can think of two conventions:
>
> obmc-[verb]-[what] for actions
> obmc-[what]-[state] for sync points
>
> or
>
> obmc-[what]-[verb] for actions
> obmc-[what]-[state] for sync points
>
> Either one is fine with me.  The former seems slightly easier to
> distinguish between
> the two.
>
> >
> >>
> >> The target relationships are then the following:
> >>
> >> obmc-host-start.target requires obmc-power-chassis-on.target
> >> obmc-shutdown-host.target requires obmc-stop-host.target requires
> >> obmc-power-chassis-off.target
> >
> > obmc-host-start requires obmc-chassis-poweron
> >
> > obmc-host-shutdown requires obmc-host-stop requires obmc-chassis-powero=
ff
> >
> > I think the rest of your proposal sounds good, from what I understand.
> >
> > Cheers,
> >
> > Joel
> >
> >>
> >> When a system goes to the quiesce target, the host state manager will
> >> call the obmc-stop-host.target.  Otherwise, the host state service
> >> will call the obmc-shutdown-host.target when power off is requested.
> >>
> >> Thoughts/Comments?
> >> Andrew
>

--001a11440eb454f6c805494965a0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">nit: stop is a verb. Stopped is a state.</div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Feb 24, 2017 5:59 AM, &q=
uot;Brad Bishop&quot; &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com">br=
adleyb@fuzziesquirrel.com</a>&gt; wrote:<br type=3D"attribution"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><br>
&gt; On Feb 21, 2017, at 10:00 PM, Joel Stanley &lt;<a href=3D"mailto:joel@=
jms.id.au">joel@jms.id.au</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Feb 21, 2017 at 8:50 AM, Andrew Geissler &lt;<a href=3D"mailto=
:geissonator@gmail.com">geissonator@gmail.com</a>&gt; wrote:<br>
&gt;&gt; Some design decisions came out of my last set of changes in the<br=
>
&gt;&gt; OpenBMC state area.=C2=A0 There was a proposal to rename our targe=
ts<br>
&gt;&gt; responsible for booting and powering on/off the system.<br>
&gt;&gt;<br>
&gt;&gt; Currently we have this:<br>
&gt;&gt; - PowerOn: obmc-power-chassis-on.target=C2=A0 =C2=A0 obmc-chassis-=
start.target<br>
&gt;&gt; - PowerOff: obmc-power-chassis-off.target=C2=A0 =C2=A0 obmc-chassi=
s-stop.target<br>
&gt;&gt;=C2=A0 obmc-stop-host.target<br>
&gt;&gt;<br>
&gt;&gt; The obmc-power-chassis-*.targets are responsible for doing whateve=
r is<br>
&gt;&gt; required to apply pgood to the chassis.<br>
&gt;&gt; The obmc-chassis-*.targets are responsible for starting and stoppi=
ng<br>
&gt;&gt; all host related services<br>
&gt;&gt; The obmc-stop-host.target is where we have the soft power off serv=
ice<br>
&gt;&gt; (notify host of shutdown, wait for host to shutdown gracefully)<br=
>
&gt;&gt;<br>
&gt;&gt; Refactoring Proposal:<br>
&gt;&gt; - First the chassis-start and chassis-stop target names don=E2=80=
=99t make<br>
&gt;&gt; sense anymore with the new bmc, chassis, and host state break down=
=E2=80=99s<br>
&gt;&gt; so:<br>
&gt;&gt;=C2=A0 - Rename obmc-chassis-start.target to obmc-start-host.target=
<br>
&gt;&gt;=C2=A0 - Rename obmc-chassis-stop.target to obmc-stop-host.target<b=
r>
&gt;&gt;=C2=A0 - Rename the current obmc-stop-host.target to obmc-shutdown-=
host.target<br>
&gt;<br>
&gt; Can I suggest putting the host before the action?<br>
&gt;<br>
&gt; obmc-host-stop<br>
&gt; obmc-host-start<br>
&gt; obmc-host-shutdown<br>
<br>
We have two types of targets, synchronization targets (for example network-=
pre.target),<br>
and action targets(for example multi-user.target).=C2=A0 Sync targets are n=
ot directly<br>
start/stoppable - they have to be started implicitly by systemd.=C2=A0 I wo=
uld like a way<br>
to be able to tell which one I am looking at from the name.=C2=A0 For examp=
le:<br>
<br>
obmc-stop-host # Action - stop the host.<br>
obmc-host-stop # Sync - the host has been stopped.<br>
<br>
I had proposed this obmc-[verb]-[what] for actions and obmc-[what]-[state] =
to Andrew<br>
privately..I=E2=80=99m fine with something else, again, as long as it is co=
nsistent.<br>
<br>
I can think of two conventions:<br>
<br>
obmc-[verb]-[what] for actions<br>
obmc-[what]-[state] for sync points<br>
<br>
or<br>
<br>
obmc-[what]-[verb] for actions<br>
obmc-[what]-[state] for sync points<br>
<br>
Either one is fine with me.=C2=A0 The former seems slightly easier to disti=
nguish between<br>
the two.<br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; The target relationships are then the following:<br>
&gt;&gt;<br>
&gt;&gt; obmc-host-start.target requires obmc-power-chassis-on.target<br>
&gt;&gt; obmc-shutdown-host.target requires obmc-stop-host.target requires<=
br>
&gt;&gt; obmc-power-chassis-off.target<br>
&gt;<br>
&gt; obmc-host-start requires obmc-chassis-poweron<br>
&gt;<br>
&gt; obmc-host-shutdown requires obmc-host-stop requires obmc-chassis-power=
off<br>
&gt;<br>
&gt; I think the rest of your proposal sounds good, from what I understand.=
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Joel<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; When a system goes to the quiesce target, the host state manager w=
ill<br>
&gt;&gt; call the obmc-stop-host.target.=C2=A0 Otherwise, the host state se=
rvice<br>
&gt;&gt; will call the obmc-shutdown-host.target when power off is requeste=
d.<br>
&gt;&gt;<br>
&gt;&gt; Thoughts/Comments?<br>
&gt;&gt; Andrew<br>
</blockquote></div></div>

--001a11440eb454f6c805494965a0--
