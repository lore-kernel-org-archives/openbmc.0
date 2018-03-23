Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="ZIzl05FB"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4073k71FjYzDrNC
 for <openbmc@lists.ozlabs.org>; Sat, 24 Mar 2018 00:07:58 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 056745396C;
 Fri, 23 Mar 2018 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1521810464; x=
 1523624865; bh=m4IYez7JXbqQFtlHieM6HFmqOFtv+nSu4iobzVop2AI=; b=Z
 Izl05FBy+djcWt7OhNU06pht93Y1FNZwldn4gXq/EPuPCTUi87y7+b0pmYckGwQW
 /Rdxu3csBk501y1jTBAhlpojlhLtIfA0Zb+m/Uz90F9tiwaVJEAajOoABx+9TfOW
 CfWsieaFg8Bc0wDHugsKJd3Yh5Q88MAKOomQqt7Eoo=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KwHxnM0o8wUi; Fri, 23 Mar 2018 16:07:44 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id A06D550C4E;
 Fri, 23 Mar 2018 16:07:44 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 23
 Mar 2018 16:07:44 +0300
Subject: Re: IPMI Set LAN Configuration Parameters
To: Emily Shaffer <emilyshaffer@google.com>
CC: <openbmc@lists.ozlabs.org>
References: <6de6bf00-ea77-a061-cd92-df255b2c0a7f@linux.intel.com>
 <CAO=notyuHzYmwxDre9-kTgPeYNSSrut32wJeRo46VWzrW6Q=xQ@mail.gmail.com>
 <7d9366d2-7816-227c-ac36-409faaa13d8b@linux.intel.com>
 <CAO=notzcgZxFthUY90V+2BgW=YnykrVsiVG4OdV0zR7kSTFoUA@mail.gmail.com>
 <20180214205327.GG113334@mauery>
 <f998fef8-0be3-8d1c-6856-768510a4cc9a@linux.vnet.ibm.com>
 <644096ed-6248-850c-832d-797624c379f7@yadro.com>
 <CAJoAoZmUgRv5LeDYXhNhdNtJqfew7aAqBP-v=Ss6mQRQcuDFHA@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <0778dc78-2704-8521-2256-58b16df5a30f@yadro.com>
Date: Fri, 23 Mar 2018 16:07:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAJoAoZmUgRv5LeDYXhNhdNtJqfew7aAqBP-v=Ss6mQRQcuDFHA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="F6nFrQIGLHQ8TAyX9LYwSnY5r8AACnQKb"
X-Originating-IP: [172.17.14.168]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
X-List-Received-Date: Fri, 23 Mar 2018 13:08:00 -0000

--F6nFrQIGLHQ8TAyX9LYwSnY5r8AACnQKb
Content-Type: multipart/mixed; boundary="64o6chH6oQYgIyLgZ3GJn2KlErkGFfIRb";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Emily Shaffer <emilyshaffer@google.com>
Cc: openbmc@lists.ozlabs.org
Message-ID: <0778dc78-2704-8521-2256-58b16df5a30f@yadro.com>
Subject: Re: IPMI Set LAN Configuration Parameters
References: <6de6bf00-ea77-a061-cd92-df255b2c0a7f@linux.intel.com>
 <CAO=notyuHzYmwxDre9-kTgPeYNSSrut32wJeRo46VWzrW6Q=xQ@mail.gmail.com>
 <7d9366d2-7816-227c-ac36-409faaa13d8b@linux.intel.com>
 <CAO=notzcgZxFthUY90V+2BgW=YnykrVsiVG4OdV0zR7kSTFoUA@mail.gmail.com>
 <20180214205327.GG113334@mauery>
 <f998fef8-0be3-8d1c-6856-768510a4cc9a@linux.vnet.ibm.com>
 <644096ed-6248-850c-832d-797624c379f7@yadro.com>
 <CAJoAoZmUgRv5LeDYXhNhdNtJqfew7aAqBP-v=Ss6mQRQcuDFHA@mail.gmail.com>
In-Reply-To: <CAJoAoZmUgRv5LeDYXhNhdNtJqfew7aAqBP-v=Ss6mQRQcuDFHA@mail.gmail.com>

--64o6chH6oQYgIyLgZ3GJn2KlErkGFfIRb
Content-Type: multipart/alternative;
 boundary="------------D7364589C1A17F1FA3A04A82"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D7364589C1A17F1FA3A04A82
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Emily, you at Google must have heavily refactored ipmitool to use it as
a library because 'as is' it is completely thread-unsafe, non-reentrant,
and overall... ehm... low quality. From my experience, OpenIPMI is much
more useful as a library.

Thanks for pointing to the openbmc ipmitool repo.

Alexander.

23.03.2018 00:57, Emily Shaffer wrote:
> FWIW - OpenBMC does seem to have a fork of ipmitool... I don't think
> we've done much to it.=C2=A0 https://github.com/openbmc/ipmitool
>
> However, that doesn't fix the problem you mention, that it's likely
> not the same version packaged with the host's image, and that that
> version is in burned-out-maintainer limbo.=C2=A0 That's why I'd prefer =
to
> do what we can to view ipmitool as immutable, to make it easier for
> someone to use OpenBMC with their system.
>
> To flip one last time, though, at Google we use ipmitool as a library
> and wrap it in another internal utility, and so we can make changes
> either to ipmitool itself or two how we call it really easily.=C2=A0 I
> wonder whether many other OpenBMC users who care about IPMI are doing
> something similar to us.
>
> On Wed, Mar 21, 2018 at 7:55 AM Alexander Amelkin <a.amelkin@yadro.com
> <mailto:a.amelkin@yadro.com>> wrote:
>
>     Just my 2 cents.
>
>     I did previously some commits to the ipmitool project, and can
>     tell that
>     fixing ipmitool upstream now doesn't seem feasible as the only acti=
ve
>     project maintainer (Zdenek Styblik) has called it quits about a yea=
r
>     ago. I've tried asking him to make me an admin of the project he
>     doesn't
>     want to maintain anymore, but he just stopped responding.
>
>     I'm thinking about forking off (actually did it to YADRO
>     organization on
>     github) and starting to maintain our own version of ipmitool. That
>     however doesn't solve the problem as the original ipmitool is a
>     part of
>     all the available Linux distros, and making their maintainers
>     switch to
>     our version I anticipate to be hell of a quest...
>
>     Applying the changes with a timeout after the set-complete looks
>     good to
>     me as it both follows the specification and allows for addressing t=
he
>     incorrect behavior of the original ipmitool.
>
>     Alexander.
>
>
>     13.03.2018 18:36, Tom Joseph wrote:
>     > Hello,
>     >
>     > There is a patch up for applying the network settings, with this
>     patch
>     > it would not require set channel access command to apply the
>     changes.
>     > A timer kicks in everytime set-complete happens, and the network
>     > settings are applied once the timer expires.
>     >
>     > https://gerrit.openbmc-project.xyz/#/q/topic:2932
>     >
>     > Regards,
>     > Tom
>     >
>     > On Thursday 15 February 2018 02:23 AM, Vernon Mauery wrote:
>     >> On 14-Feb-2018 12:32 PM, Patrick Venture wrote:
>     >>> I thought you had to explicitly set in_progress with the
>     ipmitool?=C2=A0 My
>     >>> own ipmitool utility is implemented as you described where it
>     doesn't
>     >>> assume anything about your intent, just follows the actions.
>     >>
>     >> Currently, ipmitool (incorrectly) sets the "set in progress"
>     bit for
>     >> every lan configuration parameter it sets. Given how the CLI
>     >> interface only allows the user to specify a single parameter at =
a
>     >> time, it might be smart to have ipmitool also expose controls
>     for the
>     >> "set in progress" bit. Alternately, providing a way to to specif=
y
>     >> multiple parameters in a single call would be good. Something li=
ke:
>     >>
>     >> ipmitool lan set 1 ipaddr 1.2.3.4 netmask 255.255.0.0 gateway
>     1.2.0.1
>     >> dns 1.2.1.1 ipmitool lan set 1 ipsrc dhcp
>     >>
>     >> and it would automatically set and use the set in progress bit
>     >> correctly.
>     >>
>     >> And ipmid could then take two actions, depending on how this bit=
 is
>     >> (ab)used:
>     >> 1) if only a single command is wrapped up in the
>     >> set-in-progress/set-complete, then employ a timeout so that afte=
r
>     >> some amount of time, all the queued commands get applied.
>     >> 2) if multiple commands get wrapped up in the
>     >> set-in-progress/set-complete, then apply the command set when th=
e
>     >> set-complete is received.
>     >>
>     >> Getting ipmitool changed to have correct behavior will take some=

>     >> doing, so we will need to be able to deal with its incorrect
>     behavior
>     >> for now. But also responding to correct behavior can make tools
>     that
>     >> employ that behavior work even better (with no timeout delays).
>     >>
>     >> Just my $0.02.
>     >>
>     >> --Vernon
>     >>
>     >>> There's definitely the possibility of thrashing.
>     >>>
>     >>> On Wed, Feb 14, 2018 at 11:16 AM, Dave Cobbley
>     >>> <david.j.cobbley@linux.intel.com
>     <mailto:david.j.cobbley@linux.intel.com>> wrote:
>     >>>> Do you have any concerns about ipmitool constantly flushing th=
e
>     >>>> network as
>     >>>> it sets & unsets the complete bit inbetween parameters,
>     >>>> i.e. if you are setting 4 different parameters from a script?
>     >>>>
>     >>>> I'm not sure if this brings a lot of thrashing to the to the i=
pmi
>     >>>> network
>     >>>> stack or network manager.
>     >>>>
>     >>>> Seems like it would be prudent to fix ipmitool upstream to all=
ow
>     >>>> you to set
>     >>>> multiple parameters, in addition to the ipmi stack.
>     >>>>
>     >>>>
>     >>>>> I personally have found this non-standard implementation a bi=
t
>     >>>>> unpleasant, as it requires using a different command to
>     basically
>     >>>>> flush it.=C2=A0 I am planning to implement it such that setti=
ng in
>     >>>>> progress
>     >>>>> before and complete after is how it all gets flushed instead
>     of a
>     >>>>> timeout, since that approach reads more correct given the
>     >>>>> specification.=C2=A0 And really it's just about literally cal=
ling a
>     >>>>> subroutine to flush everything when the in_progress bit is
>     set to
>     >>>>> completed, and removing the code from "access on"
>     >>>>>
>     >>>>> If you're interested to do what I've just described, I don't
>     think
>     >>>>> you'll get any push-back.
>     >>>>>
>     >>>>> Patrick
>     >>>>>
>     >>>>> On Wed, Feb 14, 2018 at 9:14 AM, Dave Cobbley
>     >>>>> <david.j.cobbley@linux.intel.com
>     <mailto:david.j.cobbley@linux.intel.com>> wrote:
>     >>>>>>
>     >>>>>> I noticed that when using ipmitool lan set <channel>
>     <parameter>,
>     >>>>>> the
>     >>>>>> openbmc stack does not apply the settings. This seems like a=

>     >>>>>> non-standard
>     >>>>>> implementation. While using ipmitool as the standard is not
>     quite
>     >>>>>> correct,
>     >>>>>> customers do expect it to work.
>     >>>>>>
>     >>>>>> After sending any sort of lan set command with ipmitool,
>     the changes
>     >>>>>> don't
>     >>>>>> appear to stick and this message shows up in the journal:
>     >>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 "Use Set Channel Access command to =
apply"
>     >>>>>>
>     >>>>>> I know IPMI 2.0 is a little ambiguous about implementation
>     >>>>>> specifics, but
>     >>>>>> I
>     >>>>>> believe the intention was to utilize the "Set In Progress" b=
it
>     >>>>>> (Parameter
>     >>>>>> 0)
>     >>>>>> while doing work, and use "Set Complete" when you are
>     finished to
>     >>>>>> flush
>     >>>>>> the
>     >>>>>> changes.
>     >>>>>>
>     >>>>>> To work around ipmitool constantly setting and unsetting
>     the "Set In
>     >>>>>> Progress" bit in between every parameter applied, some BMC
>     stacks
>     >>>>>> accumulate
>     >>>>>> network changes over a period of time and apply after a
>     timeout -
>     >>>>>> this is
>     >>>>>> also compatible with ipmitool's non-standard use of the "Set=
 In
>     >>>>>> Progress"
>     >>>>>> bit.
>     >>>>>>
>     >>>>>>
>     >>>>>> Is there a plan to circle back and change this functionality=
 to
>     >>>>>> work with
>     >>>>>> ipmitool in the future?
>     >>>>>>
>     >>>>>> Thanks,
>     >>>>>> -Dave Cobbley
>     >>>>>>
>     >>>>
>     >>
>     >
>
>


--------------D7364589C1A17F1FA3A04A82
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>Emily, you at Google must have heavily refactored ipmitool to use
      it as a library because 'as is' it is completely thread-unsafe,
      non-reentrant, and overall... ehm... low quality. From my
      experience, OpenIPMI is much more useful as a library.</p>
    <p>Thanks for pointing to the openbmc ipmitool repo.<br>
    </p>
    <p>Alexander.<br>
    </p>
    23.03.2018 00:57, Emily Shaffer wrote:<br>
    <blockquote type=3D"cite"
cite=3D"mid:CAJoAoZmUgRv5LeDYXhNhdNtJqfew7aAqBP-v=3DSs6mQRQcuDFHA@mail.gm=
ail.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Du=
tf-8">
      <div dir=3D"ltr">FWIW - OpenBMC does seem to have a fork of
        ipmitool... I don't think we've done much to it.=C2=A0 <a
          href=3D"https://github.com/openbmc/ipmitool"
          moz-do-not-send=3D"true">https://github.com/openbmc/ipmitool</a=
>
        <div><br>
        </div>
        <div>However, that doesn't fix the problem you mention, that
          it's likely not the same version packaged with the host's
          image, and that that version is in burned-out-maintainer
          limbo.=C2=A0 That's why I'd prefer to do what we can to view
          ipmitool as immutable, to make it easier for someone to use
          OpenBMC with their system.</div>
        <div><br>
        </div>
        <div>To flip one last time, though, at Google we use ipmitool as
          a library and wrap it in another internal utility, and so we
          can make changes either to ipmitool itself or two how we call
          it really easily.=C2=A0 I wonder whether many other OpenBMC use=
rs
          who care about IPMI are doing something similar to us.</div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr">On Wed, Mar 21, 2018 at 7:55 AM Alexander Amelki=
n
          &lt;<a href=3D"mailto:a.amelkin@yadro.com"
            moz-do-not-send=3D"true">a.amelkin@yadro.com</a>&gt; wrote:<b=
r>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">Just my 2
          cents.<br>
          <br>
          I did previously some commits to the ipmitool project, and can
          tell that<br>
          fixing ipmitool upstream now doesn't seem feasible as the only
          active<br>
          project maintainer (Zdenek Styblik) has called it quits about
          a year<br>
          ago. I've tried asking him to make me an admin of the project
          he doesn't<br>
          want to maintain anymore, but he just stopped responding.<br>
          <br>
          I'm thinking about forking off (actually did it to YADRO
          organization on<br>
          github) and starting to maintain our own version of ipmitool.
          That<br>
          however doesn't solve the problem as the original ipmitool is
          a part of<br>
          all the available Linux distros, and making their maintainers
          switch to<br>
          our version I anticipate to be hell of a quest...<br>
          <br>
          Applying the changes with a timeout after the set-complete
          looks good to<br>
          me as it both follows the specification and allows for
          addressing the<br>
          incorrect behavior of the original ipmitool.<br>
          <br>
          Alexander.<br>
          <br>
          <br>
          13.03.2018 18:36, Tom Joseph wrote:<br>
          &gt; Hello,<br>
          &gt;<br>
          &gt; There is a patch up for applying the network settings,
          with this patch<br>
          &gt; it would not require set channel access command to apply
          the changes.<br>
          &gt; A timer kicks in everytime set-complete happens, and the
          network<br>
          &gt; settings are applied once the timer expires.<br>
          &gt;<br>
          &gt; <a
            href=3D"https://gerrit.openbmc-project.xyz/#/q/topic:2932"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>https://gerrit.openbmc-project.xyz/#/q/topic:2932</a><br>
          &gt;<br>
          &gt; Regards,<br>
          &gt; Tom<br>
          &gt;<br>
          &gt; On Thursday 15 February 2018 02:23 AM, Vernon Mauery
          wrote:<br>
          &gt;&gt; On 14-Feb-2018 12:32 PM, Patrick Venture wrote:<br>
          &gt;&gt;&gt; I thought you had to explicitly set in_progress
          with the ipmitool?=C2=A0 My<br>
          &gt;&gt;&gt; own ipmitool utility is implemented as you
          described where it doesn't<br>
          &gt;&gt;&gt; assume anything about your intent, just follows
          the actions.<br>
          &gt;&gt;<br>
          &gt;&gt; Currently, ipmitool (incorrectly) sets the "set in
          progress" bit for<br>
          &gt;&gt; every lan configuration parameter it sets. Given how
          the CLI<br>
          &gt;&gt; interface only allows the user to specify a single
          parameter at a<br>
          &gt;&gt; time, it might be smart to have ipmitool also expose
          controls for the<br>
          &gt;&gt; "set in progress" bit. Alternately, providing a way
          to to specify<br>
          &gt;&gt; multiple parameters in a single call would be good.
          Something like:<br>
          &gt;&gt;<br>
          &gt;&gt; ipmitool lan set 1 ipaddr 1.2.3.4 netmask 255.255.0.0
          gateway 1.2.0.1<br>
          &gt;&gt; dns 1.2.1.1 ipmitool lan set 1 ipsrc dhcp<br>
          &gt;&gt;<br>
          &gt;&gt; and it would automatically set and use the set in
          progress bit<br>
          &gt;&gt; correctly.<br>
          &gt;&gt;<br>
          &gt;&gt; And ipmid could then take two actions, depending on
          how this bit is<br>
          &gt;&gt; (ab)used:<br>
          &gt;&gt; 1) if only a single command is wrapped up in the<br>
          &gt;&gt; set-in-progress/set-complete, then employ a timeout
          so that after<br>
          &gt;&gt; some amount of time, all the queued commands get
          applied.<br>
          &gt;&gt; 2) if multiple commands get wrapped up in the<br>
          &gt;&gt; set-in-progress/set-complete, then apply the command
          set when the<br>
          &gt;&gt; set-complete is received.<br>
          &gt;&gt;<br>
          &gt;&gt; Getting ipmitool changed to have correct behavior
          will take some<br>
          &gt;&gt; doing, so we will need to be able to deal with its
          incorrect behavior<br>
          &gt;&gt; for now. But also responding to correct behavior can
          make tools that<br>
          &gt;&gt; employ that behavior work even better (with no
          timeout delays).<br>
          &gt;&gt;<br>
          &gt;&gt; Just my $0.02.<br>
          &gt;&gt;<br>
          &gt;&gt; --Vernon<br>
          &gt;&gt;<br>
          &gt;&gt;&gt; There's definitely the possibility of thrashing.<b=
r>
          &gt;&gt;&gt;<br>
          &gt;&gt;&gt; On Wed, Feb 14, 2018 at 11:16 AM, Dave Cobbley<br>=

          &gt;&gt;&gt; &lt;<a
            href=3D"mailto:david.j.cobbley@linux.intel.com"
            target=3D"_blank" moz-do-not-send=3D"true">david.j.cobbley@li=
nux.intel.com</a>&gt;
          wrote:<br>
          &gt;&gt;&gt;&gt; Do you have any concerns about ipmitool
          constantly flushing the<br>
          &gt;&gt;&gt;&gt; network as<br>
          &gt;&gt;&gt;&gt; it sets &amp; unsets the complete bit
          inbetween parameters,<br>
          &gt;&gt;&gt;&gt; i.e. if you are setting 4 different
          parameters from a script?<br>
          &gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt; I'm not sure if this brings a lot of
          thrashing to the to the ipmi<br>
          &gt;&gt;&gt;&gt; network<br>
          &gt;&gt;&gt;&gt; stack or network manager.<br>
          &gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt; Seems like it would be prudent to fix
          ipmitool upstream to allow<br>
          &gt;&gt;&gt;&gt; you to set<br>
          &gt;&gt;&gt;&gt; multiple parameters, in addition to the ipmi
          stack.<br>
          &gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt; I personally have found this non-standard
          implementation a bit<br>
          &gt;&gt;&gt;&gt;&gt; unpleasant, as it requires using a
          different command to basically<br>
          &gt;&gt;&gt;&gt;&gt; flush it.=C2=A0 I am planning to implement=
 it
          such that setting in<br>
          &gt;&gt;&gt;&gt;&gt; progress<br>
          &gt;&gt;&gt;&gt;&gt; before and complete after is how it all
          gets flushed instead of a<br>
          &gt;&gt;&gt;&gt;&gt; timeout, since that approach reads more
          correct given the<br>
          &gt;&gt;&gt;&gt;&gt; specification.=C2=A0 And really it's just
          about literally calling a<br>
          &gt;&gt;&gt;&gt;&gt; subroutine to flush everything when the
          in_progress bit is set to<br>
          &gt;&gt;&gt;&gt;&gt; completed, and removing the code from
          "access on"<br>
          &gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt; If you're interested to do what I've just
          described, I don't think<br>
          &gt;&gt;&gt;&gt;&gt; you'll get any push-back.<br>
          &gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt; Patrick<br>
          &gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt; On Wed, Feb 14, 2018 at 9:14 AM, Dave
          Cobbley<br>
          &gt;&gt;&gt;&gt;&gt; &lt;<a
            href=3D"mailto:david.j.cobbley@linux.intel.com"
            target=3D"_blank" moz-do-not-send=3D"true">david.j.cobbley@li=
nux.intel.com</a>&gt;
          wrote:<br>
          &gt;&gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt;&gt; I noticed that when using ipmitool
          lan set &lt;channel&gt; &lt;parameter&gt;,<br>
          &gt;&gt;&gt;&gt;&gt;&gt; the<br>
          &gt;&gt;&gt;&gt;&gt;&gt; openbmc stack does not apply the
          settings. This seems like a<br>
          &gt;&gt;&gt;&gt;&gt;&gt; non-standard<br>
          &gt;&gt;&gt;&gt;&gt;&gt; implementation. While using ipmitool
          as the standard is not quite<br>
          &gt;&gt;&gt;&gt;&gt;&gt; correct,<br>
          &gt;&gt;&gt;&gt;&gt;&gt; customers do expect it to work.<br>
          &gt;&gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt;&gt; After sending any sort of lan set
          command with ipmitool, the changes<br>
          &gt;&gt;&gt;&gt;&gt;&gt; don't<br>
          &gt;&gt;&gt;&gt;&gt;&gt; appear to stick and this message
          shows up in the journal:<br>
          &gt;&gt;&gt;&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 "Use Set Chan=
nel Access command
          to apply"<br>
          &gt;&gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt;&gt; I know IPMI 2.0 is a little ambiguous
          about implementation<br>
          &gt;&gt;&gt;&gt;&gt;&gt; specifics, but<br>
          &gt;&gt;&gt;&gt;&gt;&gt; I<br>
          &gt;&gt;&gt;&gt;&gt;&gt; believe the intention was to utilize
          the "Set In Progress" bit<br>
          &gt;&gt;&gt;&gt;&gt;&gt; (Parameter<br>
          &gt;&gt;&gt;&gt;&gt;&gt; 0)<br>
          &gt;&gt;&gt;&gt;&gt;&gt; while doing work, and use "Set
          Complete" when you are finished to<br>
          &gt;&gt;&gt;&gt;&gt;&gt; flush<br>
          &gt;&gt;&gt;&gt;&gt;&gt; the<br>
          &gt;&gt;&gt;&gt;&gt;&gt; changes.<br>
          &gt;&gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt;&gt; To work around ipmitool constantly
          setting and unsetting the "Set In<br>
          &gt;&gt;&gt;&gt;&gt;&gt; Progress" bit in between every
          parameter applied, some BMC stacks<br>
          &gt;&gt;&gt;&gt;&gt;&gt; accumulate<br>
          &gt;&gt;&gt;&gt;&gt;&gt; network changes over a period of time
          and apply after a timeout -<br>
          &gt;&gt;&gt;&gt;&gt;&gt; this is<br>
          &gt;&gt;&gt;&gt;&gt;&gt; also compatible with ipmitool's
          non-standard use of the "Set In<br>
          &gt;&gt;&gt;&gt;&gt;&gt; Progress"<br>
          &gt;&gt;&gt;&gt;&gt;&gt; bit.<br>
          &gt;&gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt;&gt;<br>
          &gt;&gt;&gt;&gt;&gt;&gt; Is there a plan to circle back and
          change this functionality to<br>
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
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------D7364589C1A17F1FA3A04A82--

--64o6chH6oQYgIyLgZ3GJn2KlErkGFfIRb--

--F6nFrQIGLHQ8TAyX9LYwSnY5r8AACnQKb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJatPwfAAoJEOiTWHtbdBeN9gUQALbN+QhQOJOA5AdIlSB0ZBwc
8kb1Js361PxcTe5NlxkjMZuyu6KSYieYDmCcxgNPCMvVRtHqsyFj+YrMpl2XjiHP
mwQZbdE8GkA7R17GevDMsAG3Uu8V8j4cjfdRZl2idjUXKe20i4l5+mhBX4XgrXyV
o4ZydIAeflaWAmXMdqOP2/6kp1HYdgRjHzRzUXU/UuEPi+OZOStw70opEBck3api
JpxihkUsUf9IH0AHzes5OOgTUGlnuODMrzkoqb/TkFzAirW6pG5OA6QIrNgewODr
e+a4yXEsRCUWtOG1MLNS+pgrKppHDifxHCqtd2b8ul3fuhJnxGw5IqKV1eS7SfbP
Z1xY4hDZ9bBDkcGg+yBgO5cVLaGW7iy5W43SfMOf7hhDwV8RrfxA6uWbDIhvdpag
6C6Mv/5/gBjzSeD+/ULILDdtXGhGsATNBnc2+DXalqtygCqzQSS42Ru/Tm2Q1ARv
3b11H01xXo/FX3LCKicp7ReBDEQodPWQsZvloEEPAeu8jmkAOlAxkbilQrLXX5zG
xkqjoV2045HZXN1m7T4XxrmfqjRvO8EaWHaUItudPrZ+EEQ3EVEwfDBffHt6SLBO
xuExuFl+Hfus/3QD6LbQQ2aAkyRbrXMzARbGGrt7gWlbIw49Os1iDNTMByaObEAn
I+WyznLw0FyYcRLARGVT
=rN6I
-----END PGP SIGNATURE-----

--F6nFrQIGLHQ8TAyX9LYwSnY5r8AACnQKb--
