Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:400c:c0c::22d; helo=mail-wr0-x22d.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Qk0ic2l9"; 
 dkim-atps=neutral
Received: from mail-wr0-x22d.google.com (mail-wr0-x22d.google.com
 [IPv6:2a00:1450:400c:c0c::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 406gXL2cq9zF1ts
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 08:58:09 +1100 (AEDT)
Received: by mail-wr0-x22d.google.com with SMTP id l49so1074886wrl.4
 for <openbmc@lists.ozlabs.org>; Thu, 22 Mar 2018 14:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RfcGXYsI8Btk1l4vn8CjMxyYYZriXPmtQyZls2oP6AE=;
 b=Qk0ic2l97IwSvJX/MJPYVOHq7EncdTLSYiVT+LO2sNg5iMU6d5rqeNL3d6SfaiiD5S
 jHRXE3BRdvlVYXgR1tolKiJKK0U4mpIB26M7WJQ1iZr/BtyL2I7ZsITdxKMKeZIdHMf1
 N0BSk9Mj5Jj46KnW19eVxH3vpsoRsimO7lF+Bw+zXX4TyQvhmbSFqx93nAhmCt9xTq4A
 wvQBDjmrDUm0VVo0vjk49sYPnOvkRW0ehn4n0sykQ1tO14w8hRgldAeGRuGT1qgJ8d1m
 9x+EE3JnCSLv+bu6Ouhkl4dC2swYbOd4NquE1oKGQqJJ9G9qYTf7XfMOcz/mRxQzNpmj
 c8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RfcGXYsI8Btk1l4vn8CjMxyYYZriXPmtQyZls2oP6AE=;
 b=MhqU565nCqyGiXNzJdjvtZdKWEXvU+Ig/uah439+yoc+qh2q0D3iYWlCq1JaQGaKAR
 oHXfWYovaH7X7zNbPJW7fnk7gbdEOfd8sRSfH0faHvVH28/EAzEGwMo68R8JsGrtrxVR
 soPNwkjHzmUgMq7JNbKENieuivQe/DMhx63Xo/8TO9rCJ/1v6Vf+8rOSrUFnez+qfI5h
 79xBAw1iFMUQwRwUgB2FXtgwpp0ebZeoL3RwwwlsgCZBA36CTsHa+RbxmjML5jo0JG0a
 Fb7l9jYfNIQKOn7Gd2pdHYQl42/qzpozhk3rIAXKTKB647hto9GDtFXAR8jE+zu8YEm7
 IKjA==
X-Gm-Message-State: AElRT7EKzS0UMH/ZvNosppNr3e5anNr+GCX7yoNJzWIDnMklNXhBtpmd
 j8UuVFkO1C9VoyLY9NDuRiFCAOiS8NJEPLXtP9AkX4Yx
X-Google-Smtp-Source: AG47ELtNaZtgxOHnmmYQ23Mck06KAgDH2iAt4e/flU9Vnu55gX56n0zYuYfBDRfl5BY1ehunfcBuu0qU6iatJlr/B3Q=
X-Received: by 10.223.200.138 with SMTP id k10mr18166660wrh.282.1521755885394; 
 Thu, 22 Mar 2018 14:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <6de6bf00-ea77-a061-cd92-df255b2c0a7f@linux.intel.com>
 <CAO=notyuHzYmwxDre9-kTgPeYNSSrut32wJeRo46VWzrW6Q=xQ@mail.gmail.com>
 <7d9366d2-7816-227c-ac36-409faaa13d8b@linux.intel.com>
 <CAO=notzcgZxFthUY90V+2BgW=YnykrVsiVG4OdV0zR7kSTFoUA@mail.gmail.com>
 <20180214205327.GG113334@mauery>
 <f998fef8-0be3-8d1c-6856-768510a4cc9a@linux.vnet.ibm.com>
 <644096ed-6248-850c-832d-797624c379f7@yadro.com>
In-Reply-To: <644096ed-6248-850c-832d-797624c379f7@yadro.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Thu, 22 Mar 2018 21:57:54 +0000
Message-ID: <CAJoAoZmUgRv5LeDYXhNhdNtJqfew7aAqBP-v=Ss6mQRQcuDFHA@mail.gmail.com>
Subject: Re: IPMI Set LAN Configuration Parameters
To: Alexander Amelkin <a.amelkin@yadro.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="089e082f6b9cfc54710568076676"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2018 21:58:11 -0000

--089e082f6b9cfc54710568076676
Content-Type: text/plain; charset="UTF-8"

FWIW - OpenBMC does seem to have a fork of ipmitool... I don't think we've
done much to it.  https://github.com/openbmc/ipmitool

However, that doesn't fix the problem you mention, that it's likely not the
same version packaged with the host's image, and that that version is in
burned-out-maintainer limbo.  That's why I'd prefer to do what we can to
view ipmitool as immutable, to make it easier for someone to use OpenBMC
with their system.

To flip one last time, though, at Google we use ipmitool as a library and
wrap it in another internal utility, and so we can make changes either to
ipmitool itself or two how we call it really easily.  I wonder whether many
other OpenBMC users who care about IPMI are doing something similar to us.

On Wed, Mar 21, 2018 at 7:55 AM Alexander Amelkin <a.amelkin@yadro.com>
wrote:

> Just my 2 cents.
>
> I did previously some commits to the ipmitool project, and can tell that
> fixing ipmitool upstream now doesn't seem feasible as the only active
> project maintainer (Zdenek Styblik) has called it quits about a year
> ago. I've tried asking him to make me an admin of the project he doesn't
> want to maintain anymore, but he just stopped responding.
>
> I'm thinking about forking off (actually did it to YADRO organization on
> github) and starting to maintain our own version of ipmitool. That
> however doesn't solve the problem as the original ipmitool is a part of
> all the available Linux distros, and making their maintainers switch to
> our version I anticipate to be hell of a quest...
>
> Applying the changes with a timeout after the set-complete looks good to
> me as it both follows the specification and allows for addressing the
> incorrect behavior of the original ipmitool.
>
> Alexander.
>
>
> 13.03.2018 18:36, Tom Joseph wrote:
> > Hello,
> >
> > There is a patch up for applying the network settings, with this patch
> > it would not require set channel access command to apply the changes.
> > A timer kicks in everytime set-complete happens, and the network
> > settings are applied once the timer expires.
> >
> > https://gerrit.openbmc-project.xyz/#/q/topic:2932
> >
> > Regards,
> > Tom
> >
> > On Thursday 15 February 2018 02:23 AM, Vernon Mauery wrote:
> >> On 14-Feb-2018 12:32 PM, Patrick Venture wrote:
> >>> I thought you had to explicitly set in_progress with the ipmitool?  My
> >>> own ipmitool utility is implemented as you described where it doesn't
> >>> assume anything about your intent, just follows the actions.
> >>
> >> Currently, ipmitool (incorrectly) sets the "set in progress" bit for
> >> every lan configuration parameter it sets. Given how the CLI
> >> interface only allows the user to specify a single parameter at a
> >> time, it might be smart to have ipmitool also expose controls for the
> >> "set in progress" bit. Alternately, providing a way to to specify
> >> multiple parameters in a single call would be good. Something like:
> >>
> >> ipmitool lan set 1 ipaddr 1.2.3.4 netmask 255.255.0.0 gateway 1.2.0.1
> >> dns 1.2.1.1 ipmitool lan set 1 ipsrc dhcp
> >>
> >> and it would automatically set and use the set in progress bit
> >> correctly.
> >>
> >> And ipmid could then take two actions, depending on how this bit is
> >> (ab)used:
> >> 1) if only a single command is wrapped up in the
> >> set-in-progress/set-complete, then employ a timeout so that after
> >> some amount of time, all the queued commands get applied.
> >> 2) if multiple commands get wrapped up in the
> >> set-in-progress/set-complete, then apply the command set when the
> >> set-complete is received.
> >>
> >> Getting ipmitool changed to have correct behavior will take some
> >> doing, so we will need to be able to deal with its incorrect behavior
> >> for now. But also responding to correct behavior can make tools that
> >> employ that behavior work even better (with no timeout delays).
> >>
> >> Just my $0.02.
> >>
> >> --Vernon
> >>
> >>> There's definitely the possibility of thrashing.
> >>>
> >>> On Wed, Feb 14, 2018 at 11:16 AM, Dave Cobbley
> >>> <david.j.cobbley@linux.intel.com> wrote:
> >>>> Do you have any concerns about ipmitool constantly flushing the
> >>>> network as
> >>>> it sets & unsets the complete bit inbetween parameters,
> >>>> i.e. if you are setting 4 different parameters from a script?
> >>>>
> >>>> I'm not sure if this brings a lot of thrashing to the to the ipmi
> >>>> network
> >>>> stack or network manager.
> >>>>
> >>>> Seems like it would be prudent to fix ipmitool upstream to allow
> >>>> you to set
> >>>> multiple parameters, in addition to the ipmi stack.
> >>>>
> >>>>
> >>>>> I personally have found this non-standard implementation a bit
> >>>>> unpleasant, as it requires using a different command to basically
> >>>>> flush it.  I am planning to implement it such that setting in
> >>>>> progress
> >>>>> before and complete after is how it all gets flushed instead of a
> >>>>> timeout, since that approach reads more correct given the
> >>>>> specification.  And really it's just about literally calling a
> >>>>> subroutine to flush everything when the in_progress bit is set to
> >>>>> completed, and removing the code from "access on"
> >>>>>
> >>>>> If you're interested to do what I've just described, I don't think
> >>>>> you'll get any push-back.
> >>>>>
> >>>>> Patrick
> >>>>>
> >>>>> On Wed, Feb 14, 2018 at 9:14 AM, Dave Cobbley
> >>>>> <david.j.cobbley@linux.intel.com> wrote:
> >>>>>>
> >>>>>> I noticed that when using ipmitool lan set <channel> <parameter>,
> >>>>>> the
> >>>>>> openbmc stack does not apply the settings. This seems like a
> >>>>>> non-standard
> >>>>>> implementation. While using ipmitool as the standard is not quite
> >>>>>> correct,
> >>>>>> customers do expect it to work.
> >>>>>>
> >>>>>> After sending any sort of lan set command with ipmitool, the changes
> >>>>>> don't
> >>>>>> appear to stick and this message shows up in the journal:
> >>>>>>      "Use Set Channel Access command to apply"
> >>>>>>
> >>>>>> I know IPMI 2.0 is a little ambiguous about implementation
> >>>>>> specifics, but
> >>>>>> I
> >>>>>> believe the intention was to utilize the "Set In Progress" bit
> >>>>>> (Parameter
> >>>>>> 0)
> >>>>>> while doing work, and use "Set Complete" when you are finished to
> >>>>>> flush
> >>>>>> the
> >>>>>> changes.
> >>>>>>
> >>>>>> To work around ipmitool constantly setting and unsetting the "Set In
> >>>>>> Progress" bit in between every parameter applied, some BMC stacks
> >>>>>> accumulate
> >>>>>> network changes over a period of time and apply after a timeout -
> >>>>>> this is
> >>>>>> also compatible with ipmitool's non-standard use of the "Set In
> >>>>>> Progress"
> >>>>>> bit.
> >>>>>>
> >>>>>>
> >>>>>> Is there a plan to circle back and change this functionality to
> >>>>>> work with
> >>>>>> ipmitool in the future?
> >>>>>>
> >>>>>> Thanks,
> >>>>>> -Dave Cobbley
> >>>>>>
> >>>>
> >>
> >
>
>
>

--089e082f6b9cfc54710568076676
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW - OpenBMC does seem to have a fork of ipmitool... I d=
on&#39;t think we&#39;ve done much to it.=C2=A0 <a href=3D"https://github.c=
om/openbmc/ipmitool">https://github.com/openbmc/ipmitool</a><div><br></div>=
<div>However, that doesn&#39;t fix the problem you mention, that it&#39;s l=
ikely not the same version packaged with the host&#39;s image, and that tha=
t version is in burned-out-maintainer limbo.=C2=A0 That&#39;s why I&#39;d p=
refer to do what we can to view ipmitool as immutable, to make it easier fo=
r someone to use OpenBMC with their system.</div><div><br></div><div>To fli=
p one last time, though, at Google we use ipmitool as a library and wrap it=
 in another internal utility, and so we can make changes either to ipmitool=
 itself or two how we call it really easily.=C2=A0 I wonder whether many ot=
her OpenBMC users who care about IPMI are doing something similar to us.</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Mar 21, 20=
18 at 7:55 AM Alexander Amelkin &lt;<a href=3D"mailto:a.amelkin@yadro.com">=
a.amelkin@yadro.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
Just my 2 cents.<br>
<br>
I did previously some commits to the ipmitool project, and can tell that<br=
>
fixing ipmitool upstream now doesn&#39;t seem feasible as the only active<b=
r>
project maintainer (Zdenek Styblik) has called it quits about a year<br>
ago. I&#39;ve tried asking him to make me an admin of the project he doesn&=
#39;t<br>
want to maintain anymore, but he just stopped responding.<br>
<br>
I&#39;m thinking about forking off (actually did it to YADRO organization o=
n<br>
github) and starting to maintain our own version of ipmitool. That<br>
however doesn&#39;t solve the problem as the original ipmitool is a part of=
<br>
all the available Linux distros, and making their maintainers switch to<br>
our version I anticipate to be hell of a quest...<br>
<br>
Applying the changes with a timeout after the set-complete looks good to<br=
>
me as it both follows the specification and allows for addressing the<br>
incorrect behavior of the original ipmitool.<br>
<br>
Alexander.<br>
<br>
<br>
13.03.2018 18:36, Tom Joseph wrote:<br>
&gt; Hello,<br>
&gt;<br>
&gt; There is a patch up for applying the network settings, with this patch=
<br>
&gt; it would not require set channel access command to apply the changes.<=
br>
&gt; A timer kicks in everytime set-complete happens, and the network<br>
&gt; settings are applied once the timer expires.<br>
&gt;<br>
&gt; <a href=3D"https://gerrit.openbmc-project.xyz/#/q/topic:2932" rel=3D"n=
oreferrer" target=3D"_blank">https://gerrit.openbmc-project.xyz/#/q/topic:2=
932</a><br>
&gt;<br>
&gt; Regards,<br>
&gt; Tom<br>
&gt;<br>
&gt; On Thursday 15 February 2018 02:23 AM, Vernon Mauery wrote:<br>
&gt;&gt; On 14-Feb-2018 12:32 PM, Patrick Venture wrote:<br>
&gt;&gt;&gt; I thought you had to explicitly set in_progress with the ipmit=
ool?=C2=A0 My<br>
&gt;&gt;&gt; own ipmitool utility is implemented as you described where it =
doesn&#39;t<br>
&gt;&gt;&gt; assume anything about your intent, just follows the actions.<b=
r>
&gt;&gt;<br>
&gt;&gt; Currently, ipmitool (incorrectly) sets the &quot;set in progress&q=
uot; bit for<br>
&gt;&gt; every lan configuration parameter it sets. Given how the CLI<br>
&gt;&gt; interface only allows the user to specify a single parameter at a<=
br>
&gt;&gt; time, it might be smart to have ipmitool also expose controls for =
the<br>
&gt;&gt; &quot;set in progress&quot; bit. Alternately, providing a way to t=
o specify<br>
&gt;&gt; multiple parameters in a single call would be good. Something like=
:<br>
&gt;&gt;<br>
&gt;&gt; ipmitool lan set 1 ipaddr 1.2.3.4 netmask 255.255.0.0 gateway 1.2.=
0.1<br>
&gt;&gt; dns 1.2.1.1 ipmitool lan set 1 ipsrc dhcp<br>
&gt;&gt;<br>
&gt;&gt; and it would automatically set and use the set in progress bit<br>
&gt;&gt; correctly.<br>
&gt;&gt;<br>
&gt;&gt; And ipmid could then take two actions, depending on how this bit i=
s<br>
&gt;&gt; (ab)used:<br>
&gt;&gt; 1) if only a single command is wrapped up in the<br>
&gt;&gt; set-in-progress/set-complete, then employ a timeout so that after<=
br>
&gt;&gt; some amount of time, all the queued commands get applied.<br>
&gt;&gt; 2) if multiple commands get wrapped up in the<br>
&gt;&gt; set-in-progress/set-complete, then apply the command set when the<=
br>
&gt;&gt; set-complete is received.<br>
&gt;&gt;<br>
&gt;&gt; Getting ipmitool changed to have correct behavior will take some<b=
r>
&gt;&gt; doing, so we will need to be able to deal with its incorrect behav=
ior<br>
&gt;&gt; for now. But also responding to correct behavior can make tools th=
at<br>
&gt;&gt; employ that behavior work even better (with no timeout delays).<br=
>
&gt;&gt;<br>
&gt;&gt; Just my $0.02.<br>
&gt;&gt;<br>
&gt;&gt; --Vernon<br>
&gt;&gt;<br>
&gt;&gt;&gt; There&#39;s definitely the possibility of thrashing.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Wed, Feb 14, 2018 at 11:16 AM, Dave Cobbley<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:david.j.cobbley@linux.intel.com" target=
=3D"_blank">david.j.cobbley@linux.intel.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt; Do you have any concerns about ipmitool constantly flushin=
g the<br>
&gt;&gt;&gt;&gt; network as<br>
&gt;&gt;&gt;&gt; it sets &amp; unsets the complete bit inbetween parameters=
,<br>
&gt;&gt;&gt;&gt; i.e. if you are setting 4 different parameters from a scri=
pt?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I&#39;m not sure if this brings a lot of thrashing to the =
to the ipmi<br>
&gt;&gt;&gt;&gt; network<br>
&gt;&gt;&gt;&gt; stack or network manager.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Seems like it would be prudent to fix ipmitool upstream to=
 allow<br>
&gt;&gt;&gt;&gt; you to set<br>
&gt;&gt;&gt;&gt; multiple parameters, in addition to the ipmi stack.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; I personally have found this non-standard implementati=
on a bit<br>
&gt;&gt;&gt;&gt;&gt; unpleasant, as it requires using a different command t=
o basically<br>
&gt;&gt;&gt;&gt;&gt; flush it.=C2=A0 I am planning to implement it such tha=
t setting in<br>
&gt;&gt;&gt;&gt;&gt; progress<br>
&gt;&gt;&gt;&gt;&gt; before and complete after is how it all gets flushed i=
nstead of a<br>
&gt;&gt;&gt;&gt;&gt; timeout, since that approach reads more correct given =
the<br>
&gt;&gt;&gt;&gt;&gt; specification.=C2=A0 And really it&#39;s just about li=
terally calling a<br>
&gt;&gt;&gt;&gt;&gt; subroutine to flush everything when the in_progress bi=
t is set to<br>
&gt;&gt;&gt;&gt;&gt; completed, and removing the code from &quot;access on&=
quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; If you&#39;re interested to do what I&#39;ve just desc=
ribed, I don&#39;t think<br>
&gt;&gt;&gt;&gt;&gt; you&#39;ll get any push-back.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Patrick<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On Wed, Feb 14, 2018 at 9:14 AM, Dave Cobbley<br>
&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:david.j.cobbley@linux.intel.com"=
 target=3D"_blank">david.j.cobbley@linux.intel.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; I noticed that when using ipmitool lan set &lt;cha=
nnel&gt; &lt;parameter&gt;,<br>
&gt;&gt;&gt;&gt;&gt;&gt; the<br>
&gt;&gt;&gt;&gt;&gt;&gt; openbmc stack does not apply the settings. This se=
ems like a<br>
&gt;&gt;&gt;&gt;&gt;&gt; non-standard<br>
&gt;&gt;&gt;&gt;&gt;&gt; implementation. While using ipmitool as the standa=
rd is not quite<br>
&gt;&gt;&gt;&gt;&gt;&gt; correct,<br>
&gt;&gt;&gt;&gt;&gt;&gt; customers do expect it to work.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; After sending any sort of lan set command with ipm=
itool, the changes<br>
&gt;&gt;&gt;&gt;&gt;&gt; don&#39;t<br>
&gt;&gt;&gt;&gt;&gt;&gt; appear to stick and this message shows up in the j=
ournal:<br>
&gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &quot;Use Set Channel Acc=
ess command to apply&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; I know IPMI 2.0 is a little ambiguous about implem=
entation<br>
&gt;&gt;&gt;&gt;&gt;&gt; specifics, but<br>
&gt;&gt;&gt;&gt;&gt;&gt; I<br>
&gt;&gt;&gt;&gt;&gt;&gt; believe the intention was to utilize the &quot;Set=
 In Progress&quot; bit<br>
&gt;&gt;&gt;&gt;&gt;&gt; (Parameter<br>
&gt;&gt;&gt;&gt;&gt;&gt; 0)<br>
&gt;&gt;&gt;&gt;&gt;&gt; while doing work, and use &quot;Set Complete&quot;=
 when you are finished to<br>
&gt;&gt;&gt;&gt;&gt;&gt; flush<br>
&gt;&gt;&gt;&gt;&gt;&gt; the<br>
&gt;&gt;&gt;&gt;&gt;&gt; changes.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; To work around ipmitool constantly setting and uns=
etting the &quot;Set In<br>
&gt;&gt;&gt;&gt;&gt;&gt; Progress&quot; bit in between every parameter appl=
ied, some BMC stacks<br>
&gt;&gt;&gt;&gt;&gt;&gt; accumulate<br>
&gt;&gt;&gt;&gt;&gt;&gt; network changes over a period of time and apply af=
ter a timeout -<br>
&gt;&gt;&gt;&gt;&gt;&gt; this is<br>
&gt;&gt;&gt;&gt;&gt;&gt; also compatible with ipmitool&#39;s non-standard u=
se of the &quot;Set In<br>
&gt;&gt;&gt;&gt;&gt;&gt; Progress&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt; bit.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Is there a plan to circle back and change this fun=
ctionality to<br>
&gt;&gt;&gt;&gt;&gt;&gt; work with<br>
&gt;&gt;&gt;&gt;&gt;&gt; ipmitool in the future?<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt;&gt;&gt;&gt; -Dave Cobbley<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
<br>
<br>
</blockquote></div>

--089e082f6b9cfc54710568076676--
