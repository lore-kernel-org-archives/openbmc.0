Return-Path: <raltherr@google.com>
Received: from mail-it0-x22f.google.com (mail-it0-x22f.google.com
 [IPv6:2607:f8b0:4001:c0b::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDxwX3782zDq6X
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 11:06:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="nhdLGYsA"; 
 dkim-atps=neutral
Received: by mail-it0-x22f.google.com with SMTP id c7so1430716itd.1
 for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2017 16:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=D2vqssUVjTulxpOuNi/330BVg+LNhE65fAddx/ogY44=;
 b=nhdLGYsAVagmkHTgT5P4DrkH75bd/xLab8WFnMiVmUjNXVA/7Pno62jWtQhmIr8YQ/
 gHpHKr9AXAA3Cettvbc6epaKwXVtZNjiNZuD1ADoTl9r7JwcbFzSBbpSEDvFwhMVxpsf
 ss1ZAzY2qGAyWTMET1W5mq+NDy5nnpJG4a36ljPieaNG1R1fXGfr4fgrgFWCDOkWSe9u
 7ISIzWwOBbPV2lluvr9qioO6eZKUsl+4OFKJEGKycCAL7SJ8ZVrRKwjjFacDqgcoIwZ2
 dCZOdNlpcnSMc1s5UI0PeM4ukyMttXJTiSQUR9bqX0+Fe1+QNN7IPIMdnSrNjFPRM/aI
 MDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=D2vqssUVjTulxpOuNi/330BVg+LNhE65fAddx/ogY44=;
 b=pL3qEcBJo89NheOB9AyKsoHc5R3jNGIsf2EjuMvxdFWqhn2kM/N6UllDP0KzH4SBwi
 M6dpjql1e2KipAIiqRLwk9wFHiJOdMfc0R03nYjo/Or3HG9hxOXo5NEp6On0VC8GX+rd
 NkLBBO1CIux5A0eG1xmOLEuU7xhKuG2kBKQWhoEN7B7Mbz8ARDFSEzUxnsetnJ7g+c2W
 DzpcISCNjRsa04Oc+VDnXZZ9nXks98bbzHLKJMSf51/2M+36eVDV7stHCQc4WHvxwY2d
 rJnFXFcAVF0VoIbPU8KUlBusu3p9KPWN1iqetpglC+ruwkXH8nc+Tyv1kNrdcPNAxwfe
 8McQ==
X-Gm-Message-State: AIkVDXJJuawZmUmTgmf2vpauFZ8ckgMOrGnh593aIhUGjuW6/B1lwdrCw0g9GEr+GLAvAa7yW5lHMuM6iVjZkrKT
X-Received: by 10.36.64.70 with SMTP id n67mr156833ita.21.1486080361383; Thu,
 02 Feb 2017 16:06:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Thu, 2 Feb 2017 16:06:00 -0800 (PST)
In-Reply-To: <CACPK8XerRt9v4QheLyN-xfgEtA7JEEgVUiXHBjHVcCqmta0u4A@mail.gmail.com>
References: <CACPK8Xdny6BHxpcWz2B=a+zELaYHW1aYt+_uR-E9rABNAjS5uQ@mail.gmail.com>
 <CAPLgG=ko5MCHMewdz1LT7YZV6HOMXnaNknRH5U-hWyQq8nDtyw@mail.gmail.com>
 <CACPK8XerRt9v4QheLyN-xfgEtA7JEEgVUiXHBjHVcCqmta0u4A@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 2 Feb 2017 16:06:00 -0800
Message-ID: <CAPLgG=mbAyO_7PxM42FWuCnAXz8im1pte3vkTrDjWdVnAZnHaQ@mail.gmail.com>
Subject: Re: OpenBMC Kernel Development Process
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a1135a57a0c99260547950c2a
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
X-List-Received-Date: Fri, 03 Feb 2017 00:06:05 -0000

--001a1135a57a0c99260547950c2a
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 2, 2017 at 3:21 PM, Joel Stanley <joel@jms.id.au> wrote:

> On Fri, Feb 3, 2017 at 3:13 AM, Rick Altherr <raltherr@google.com> wrote:
> > Thank you for putting this together.  I find it really helpful to have an
> > explicit process to follow.  I do have a few questions:
> > - What do we do about patches that require functionality that is not
> > currently available upstream (for instance, a subsystem change is being
> > reviewed by upstream but isn't yet merged).  Can that patch be sent to
> > OpenBMC only or must we wait for upstream to decide on the dependent
> patch?
>
> I couldn't grok what you're describing here.
>
> If there's an upstream change under debate that your driver depends
> on, we can pull it in.
>
>
That's what I was asking.  Thank you for clarifying.


> > - OpenBMC and upstream will inevitably diverge between OpenBMC rebases.
> > When upstream has changed in a significant way (say the recent hwmon API
> > changes), what do we do?  Do we send a new patch of equivalent
> functionality
> > to OpenBMC?  Do we ask for patches to be cherry-picked from upstream?
>
> This is when a developer has created a driver against upstream, and
> the APIs are not the same as present in the OpenBMC tree? We should
> take the option that requires the least amount of work.
>
> We should backport API changes when it doesn't break other drivers
> (when APIs are being added). When APIs are being significantly
> modified, it may be easier to backport the driver.
>
>
SGTM.


> > - Which branch is the authoritative branch for basing patches on for
> > OpenBMC?
>
> I will publish this on the wiki. For the upcoming cycle, we will move
> to a v4.9 based branch next week. I will call for patches to be sent
> against this tree once it's published.
>
>
I'll wait for that to happen before sending my ADC driver.


> Thanks for taking a read and the questions. If you want more detail let me
> know.
>
> Cheers,
>
> Joel
>
> >
> > On Wed, Feb 1, 2017 at 9:14 PM, Joel Stanley <joel@jms.id.au> wrote:
> >>
> >> Hello OpenBMCers,
> >>
> >> Over the past few days I've been chatting with some of the people
> >> involved in kernel development for this project. We've looked at ways
> >> to make this a better experience for new developers, those overseeing
> >> development, and folks wanting to ship products on deadlines.
> >>
> >> With Jeremy's help we've drafted a proposal that hopes to take
> >> everyone's needs into account. Please have a read and reply  with your
> >> feedback. The draft of the process is also on the OpenBMC wiki at
> >> https://github.com/openbmc/linux/wiki/DevelopmentProcess
> >>
> >> ## Upstream is key
> >>
> >> In order to leverage the benefits of using the Linux kernel, OpenBMC
> >> maintains a policy that all kernel code will be merged upstream.
> >>
> >> However, there are often cases where product requirements mean that
> >> synchronising with an upstream schedule is not always possible. This
> >> process aims to allow both goals (upstream inclusion and a useful
> >> OpenBMC build) to occur in parallel.
> >>
> >> ## Pre-upstream inclusion plans
> >>
> >> The project has a process for including patches before they are merged
> >> upstream in order to allow development and testing before the upstream
> >> work is complete.
> >>
> >> Patches for pre-upstream inclusion in the OpenBMC kernel should at
> >> least be of a level approximately ready to submit upstream. Although
> >> this is somewhat subjective, this will almost always be indicated by:
> >>
> >>  - passing the 'checkpatch' utility without warnings
> >>
> >>  - the patch should not break the build for the kernel configurations
> >> that are currently in use, nor should it introduce compiler warnings
> >>
> >>  - a kernel including the patch should be boot-tested in the qemu
> >> environment
> >>
> >> Non-upstreamed patches will be carried in the OpenBMC kernel until the
> >> upstream stable release that occurs 30 days after original patch
> >> inclusion. With a rough maximum time of 14 days between stable
> >> updates, this means that the changes will be carried for 30-44 days.
> >>
> >> However, work doesn't end here: during this time, the patch submitter
> >> should keep interacting with the community to get the patch included
> >> in the upstream kernel.
> >>
> >> After the 30-day cycle, the patch will typically be on its way through
> >> the upstream process. It is the patch owner's responsibility to ensure
> >> that this proceeds. Once the patch has been included in an upstream
> >> tree, we will switch over to the upstreamed patch. The OpenBMC kernel
> >> maintainers will take responsibility for carrying that patch until a
> >> subsequent update moves to a base version that includes the upstream
> >> change.
> >>
> >> However, if a patch is still not included by that time, it *may* be
> >> resubmitted for inclusion in the next 30-day cycle. This is
> >> conditional on at least one new revision being sent upstream for
> >> further review, demonstrating that the owner is making progress on
> >> upstream inclusion.  In order to indicate that the patch should be
> >> carried over, the patch owner should re-submit it to the mailing list,
> >> with details of upstream progression so far.
> >>
> >> At this point, the patch owner should be in contact with the OpenBMC
> >> kernel maintainers via either the mailing list, or #openbmc IRC
> >> channel, for assistance with the upstreaming process.
> >>
> >> In situations where the upstream acceptance is taking longer than
> >> expected, we can repeat the cycle above, for a maximum of three
> >> iterations (ie, three 30-day periods).
> >>
> >> After those three periods, the patch will be dropped from the tree.
> >>
> >> Note that this process is not a "free ticket" to 90 days of inclusion
> >> in the tree. The kernel maintainer has the responsibility to ensure
> >> that the code is of sufficient quality for the multiple consumers of
> >> the OpenBMC kernel, and may reject submissions on serious grounds if
> >> necessary (eg, security issues, major code review issues, copyright
> >> concerns, adversely affecting other platforms). The intention here is
> >> to facilitate collaboration on the kernel and scale development across
> >> OpenBMC contributors.
> >>
> >> ## Platform scaling
> >>
> >> A consequence of the process above is that we will be including
> >> patches that affect platforms that the OpenBMC kernel team does not
> >> necessarily have access to, without outside code review. This means we
> >> have no way to test those patches.
> >>
> >> To prevent failures from these carried patches, owners of the patches
> >> will be added as code reviewers on the OpenBMC yocto updates.
> >>
> >> We expect these owners to test that the updated kernel still carries
> >> the required functionality, and provide code review feedback if not.
> >> This will prevent the OpenBMC system from being updated to a kernel
> >> which breaks pre-upstream support for vendor-specific functions.
> >>
> >> If no feedback is provided with one week, is it assumed that the
> >> update is OK to proceed. Regardless, a positive code review is still
> >> useful, to provide quicker feedback.
> >>
> >> # Processes
> >>
> >> ## Patch submitters (wishing to have a change included through this
> >> process)
> >>
> >>  - ensure that patches conform to base-level quality guidelines
> >>    - no warnings from checkpatch
> >>    - does not introduce errors or warnings, for specific defconfigs
> >>       - aspeed_g4_defconfig
> >>       - aspeed_g5_defconfig
> >>    - boot test the kernel using the qemu simulation environment
> >>       - At a minimum, the system should boot to a userspace prompt of
> >> the OpenBMC userspace
> >>  - submit upstream first
> >>  - submit proposed patches to openbmc@lists.ozlabs.org
> >>     - This version of hte patch should contain "[PATCH linux
> >> <branch>]" in the subject, where <branch> is the name of the current
> >> OpenBMC development tree
> >>  - continue with upstream discusions, by promptly following-up with
> >> code review feedback, and post new versions of code regularly
> >>  - if the 30-day expiry date is approaching, re-send to
> >> openbmc@lists.ozlabs.org, requesting re-inclusion in the tree, with
> >> details of upstream work so far  (just a short sentence in the patch
> >> email should be sufficient for this)
> >>  - monitor gerrit review queue for test requests from OpenBMC kernel
> >> maintainer
> >>
> >> ## OpenBMC kernel maintainer
> >>
> >>  - Review patches submitted to the openbmc list
> >>  - Merge patches into the OpenBMC tree
> >>  - Rebase the OpenBMC tree at the agreed interval (30 days)
> >>    - Announce the merge window on the mailing list
> >>    - Update to the latest stable upstream release
> >>    - Apply patches from the list
> >>    - Update the status documentation for pre-upstream patches
> >> - Test kernel on available platforms
> >>    - Palmetto, Witherspoon
> >>    - Qemu Palmetto, Qemu Romulus
> >> - Add relevant reviewers for gerrit openbmc yocto "kernel bump" changes
> >>
> >> ## All developers
> >>
> >>  - Review patches on the openbmc list
> >>  - Exceed RDI of vegemite
> >>
> >> ## Project management
> >>
> >>  - regularly check the status page, to ensure that:
> >>      - patches required for your project are not at risk of exipiring
> >>      - upstreaming efforts are not falling behind schedule
> >
> >
>

--001a1135a57a0c99260547950c2a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Feb 2, 2017 at 3:21 PM, Joel Stanley <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Fri, Feb 3,=
 2017 at 3:13 AM, Rick Altherr &lt;<a href=3D"mailto:raltherr@google.com">r=
altherr@google.com</a>&gt; wrote:<br>
&gt; Thank you for putting this together.=C2=A0 I find it really helpful to=
 have an<br>
&gt; explicit process to follow.=C2=A0 I do have a few questions:<br>
&gt; - What do we do about patches that require functionality that is not<b=
r>
&gt; currently available upstream (for instance, a subsystem change is bein=
g<br>
&gt; reviewed by upstream but isn&#39;t yet merged).=C2=A0 Can that patch b=
e sent to<br>
&gt; OpenBMC only or must we wait for upstream to decide on the dependent p=
atch?<br>
<br>
</span>I couldn&#39;t grok what you&#39;re describing here.<br>
<br>
If there&#39;s an upstream change under debate that your driver depends<br>
on, we can pull it in.<br>
<span class=3D""><br></span></blockquote><div><br></div><div>That&#39;s wha=
t I was asking.=C2=A0 Thank you for clarifying.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><span class=3D"">
&gt; - OpenBMC and upstream will inevitably diverge between OpenBMC rebases=
.<br>
&gt; When upstream has changed in a significant way (say the recent hwmon A=
PI<br>
&gt; changes), what do we do?=C2=A0 Do we send a new patch of equivalent fu=
nctionality<br>
&gt; to OpenBMC?=C2=A0 Do we ask for patches to be cherry-picked from upstr=
eam?<br>
<br>
</span>This is when a developer has created a driver against upstream, and<=
br>
the APIs are not the same as present in the OpenBMC tree? We should<br>
take the option that requires the least amount of work.<br>
<br>
We should backport API changes when it doesn&#39;t break other drivers<br>
(when APIs are being added). When APIs are being significantly<br>
modified, it may be easier to backport the driver.<br>
<span class=3D""><br></span></blockquote><div><br></div><div>SGTM.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">
&gt; - Which branch is the authoritative branch for basing patches on for<b=
r>
&gt; OpenBMC?<br>
<br>
</span>I will publish this on the wiki. For the upcoming cycle, we will mov=
e<br>
to a v4.9 based branch next week. I will call for patches to be sent<br>
against this tree once it&#39;s published.<br>
<br></blockquote><div><br></div><div>I&#39;ll wait for that to happen befor=
e sending my ADC driver.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
Thanks for taking a read and the questions. If you want more detail let me =
know.<br>
<br>
Cheers,<br>
<br>
Joel<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; On Wed, Feb 1, 2017 at 9:14 PM, Joel Stanley &lt;<a href=3D"mailto:joe=
l@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hello OpenBMCers,<br>
&gt;&gt;<br>
&gt;&gt; Over the past few days I&#39;ve been chatting with some of the peo=
ple<br>
&gt;&gt; involved in kernel development for this project. We&#39;ve looked =
at ways<br>
&gt;&gt; to make this a better experience for new developers, those oversee=
ing<br>
&gt;&gt; development, and folks wanting to ship products on deadlines.<br>
&gt;&gt;<br>
&gt;&gt; With Jeremy&#39;s help we&#39;ve drafted a proposal that hopes to =
take<br>
&gt;&gt; everyone&#39;s needs into account. Please have a read and reply=C2=
=A0 with your<br>
&gt;&gt; feedback. The draft of the process is also on the OpenBMC wiki at<=
br>
&gt;&gt; <a href=3D"https://github.com/openbmc/linux/wiki/DevelopmentProces=
s" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/<wbr>lin=
ux/wiki/DevelopmentProcess</a><br>
&gt;&gt;<br>
&gt;&gt; ## Upstream is key<br>
&gt;&gt;<br>
&gt;&gt; In order to leverage the benefits of using the Linux kernel, OpenB=
MC<br>
&gt;&gt; maintains a policy that all kernel code will be merged upstream.<b=
r>
&gt;&gt;<br>
&gt;&gt; However, there are often cases where product requirements mean tha=
t<br>
&gt;&gt; synchronising with an upstream schedule is not always possible. Th=
is<br>
&gt;&gt; process aims to allow both goals (upstream inclusion and a useful<=
br>
&gt;&gt; OpenBMC build) to occur in parallel.<br>
&gt;&gt;<br>
&gt;&gt; ## Pre-upstream inclusion plans<br>
&gt;&gt;<br>
&gt;&gt; The project has a process for including patches before they are me=
rged<br>
&gt;&gt; upstream in order to allow development and testing before the upst=
ream<br>
&gt;&gt; work is complete.<br>
&gt;&gt;<br>
&gt;&gt; Patches for pre-upstream inclusion in the OpenBMC kernel should at=
<br>
&gt;&gt; least be of a level approximately ready to submit upstream. Althou=
gh<br>
&gt;&gt; this is somewhat subjective, this will almost always be indicated =
by:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 - passing the &#39;checkpatch&#39; utility without warnings<=
br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 - the patch should not break the build for the kernel config=
urations<br>
&gt;&gt; that are currently in use, nor should it introduce compiler warnin=
gs<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 - a kernel including the patch should be boot-tested in the =
qemu<br>
&gt;&gt; environment<br>
&gt;&gt;<br>
&gt;&gt; Non-upstreamed patches will be carried in the OpenBMC kernel until=
 the<br>
&gt;&gt; upstream stable release that occurs 30 days after original patch<b=
r>
&gt;&gt; inclusion. With a rough maximum time of 14 days between stable<br>
&gt;&gt; updates, this means that the changes will be carried for 30-44 day=
s.<br>
&gt;&gt;<br>
&gt;&gt; However, work doesn&#39;t end here: during this time, the patch su=
bmitter<br>
&gt;&gt; should keep interacting with the community to get the patch includ=
ed<br>
&gt;&gt; in the upstream kernel.<br>
&gt;&gt;<br>
&gt;&gt; After the 30-day cycle, the patch will typically be on its way thr=
ough<br>
&gt;&gt; the upstream process. It is the patch owner&#39;s responsibility t=
o ensure<br>
&gt;&gt; that this proceeds. Once the patch has been included in an upstrea=
m<br>
&gt;&gt; tree, we will switch over to the upstreamed patch. The OpenBMC ker=
nel<br>
&gt;&gt; maintainers will take responsibility for carrying that patch until=
 a<br>
&gt;&gt; subsequent update moves to a base version that includes the upstre=
am<br>
&gt;&gt; change.<br>
&gt;&gt;<br>
&gt;&gt; However, if a patch is still not included by that time, it *may* b=
e<br>
&gt;&gt; resubmitted for inclusion in the next 30-day cycle. This is<br>
&gt;&gt; conditional on at least one new revision being sent upstream for<b=
r>
&gt;&gt; further review, demonstrating that the owner is making progress on=
<br>
&gt;&gt; upstream inclusion.=C2=A0 In order to indicate that the patch shou=
ld be<br>
&gt;&gt; carried over, the patch owner should re-submit it to the mailing l=
ist,<br>
&gt;&gt; with details of upstream progression so far.<br>
&gt;&gt;<br>
&gt;&gt; At this point, the patch owner should be in contact with the OpenB=
MC<br>
&gt;&gt; kernel maintainers via either the mailing list, or #openbmc IRC<br=
>
&gt;&gt; channel, for assistance with the upstreaming process.<br>
&gt;&gt;<br>
&gt;&gt; In situations where the upstream acceptance is taking longer than<=
br>
&gt;&gt; expected, we can repeat the cycle above, for a maximum of three<br=
>
&gt;&gt; iterations (ie, three 30-day periods).<br>
&gt;&gt;<br>
&gt;&gt; After those three periods, the patch will be dropped from the tree=
.<br>
&gt;&gt;<br>
&gt;&gt; Note that this process is not a &quot;free ticket&quot; to 90 days=
 of inclusion<br>
&gt;&gt; in the tree. The kernel maintainer has the responsibility to ensur=
e<br>
&gt;&gt; that the code is of sufficient quality for the multiple consumers =
of<br>
&gt;&gt; the OpenBMC kernel, and may reject submissions on serious grounds =
if<br>
&gt;&gt; necessary (eg, security issues, major code review issues, copyrigh=
t<br>
&gt;&gt; concerns, adversely affecting other platforms). The intention here=
 is<br>
&gt;&gt; to facilitate collaboration on the kernel and scale development ac=
ross<br>
&gt;&gt; OpenBMC contributors.<br>
&gt;&gt;<br>
&gt;&gt; ## Platform scaling<br>
&gt;&gt;<br>
&gt;&gt; A consequence of the process above is that we will be including<br=
>
&gt;&gt; patches that affect platforms that the OpenBMC kernel team does no=
t<br>
&gt;&gt; necessarily have access to, without outside code review. This mean=
s we<br>
&gt;&gt; have no way to test those patches.<br>
&gt;&gt;<br>
&gt;&gt; To prevent failures from these carried patches, owners of the patc=
hes<br>
&gt;&gt; will be added as code reviewers on the OpenBMC yocto updates.<br>
&gt;&gt;<br>
&gt;&gt; We expect these owners to test that the updated kernel still carri=
es<br>
&gt;&gt; the required functionality, and provide code review feedback if no=
t.<br>
&gt;&gt; This will prevent the OpenBMC system from being updated to a kerne=
l<br>
&gt;&gt; which breaks pre-upstream support for vendor-specific functions.<b=
r>
&gt;&gt;<br>
&gt;&gt; If no feedback is provided with one week, is it assumed that the<b=
r>
&gt;&gt; update is OK to proceed. Regardless, a positive code review is sti=
ll<br>
&gt;&gt; useful, to provide quicker feedback.<br>
&gt;&gt;<br>
&gt;&gt; # Processes<br>
&gt;&gt;<br>
&gt;&gt; ## Patch submitters (wishing to have a change included through thi=
s<br>
&gt;&gt; process)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 - ensure that patches conform to base-level quality guidelin=
es<br>
&gt;&gt;=C2=A0 =C2=A0 - no warnings from checkpatch<br>
&gt;&gt;=C2=A0 =C2=A0 - does not introduce errors or warnings, for specific=
 defconfigs<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- aspeed_g4_defconfig<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- aspeed_g5_defconfig<br>
&gt;&gt;=C2=A0 =C2=A0 - boot test the kernel using the qemu simulation envi=
ronment<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- At a minimum, the system should boot t=
o a userspace prompt of<br>
&gt;&gt; the OpenBMC userspace<br>
&gt;&gt;=C2=A0 - submit upstream first<br>
&gt;&gt;=C2=A0 - submit proposed patches to <a href=3D"mailto:openbmc@lists=
.ozlabs.org">openbmc@lists.ozlabs.org</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0- This version of hte patch should contain &quo=
t;[PATCH linux<br>
&gt;&gt; &lt;branch&gt;]&quot; in the subject, where &lt;branch&gt; is the =
name of the current<br>
&gt;&gt; OpenBMC development tree<br>
&gt;&gt;=C2=A0 - continue with upstream discusions, by promptly following-u=
p with<br>
&gt;&gt; code review feedback, and post new versions of code regularly<br>
&gt;&gt;=C2=A0 - if the 30-day expiry date is approaching, re-send to<br>
&gt;&gt; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.o=
rg</a>, requesting re-inclusion in the tree, with<br>
&gt;&gt; details of upstream work so far=C2=A0 (just a short sentence in th=
e patch<br>
&gt;&gt; email should be sufficient for this)<br>
&gt;&gt;=C2=A0 - monitor gerrit review queue for test requests from OpenBMC=
 kernel<br>
&gt;&gt; maintainer<br>
&gt;&gt;<br>
&gt;&gt; ## OpenBMC kernel maintainer<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 - Review patches submitted to the openbmc list<br>
&gt;&gt;=C2=A0 - Merge patches into the OpenBMC tree<br>
&gt;&gt;=C2=A0 - Rebase the OpenBMC tree at the agreed interval (30 days)<b=
r>
&gt;&gt;=C2=A0 =C2=A0 - Announce the merge window on the mailing list<br>
&gt;&gt;=C2=A0 =C2=A0 - Update to the latest stable upstream release<br>
&gt;&gt;=C2=A0 =C2=A0 - Apply patches from the list<br>
&gt;&gt;=C2=A0 =C2=A0 - Update the status documentation for pre-upstream pa=
tches<br>
&gt;&gt; - Test kernel on available platforms<br>
&gt;&gt;=C2=A0 =C2=A0 - Palmetto, Witherspoon<br>
&gt;&gt;=C2=A0 =C2=A0 - Qemu Palmetto, Qemu Romulus<br>
&gt;&gt; - Add relevant reviewers for gerrit openbmc yocto &quot;kernel bum=
p&quot; changes<br>
&gt;&gt;<br>
&gt;&gt; ## All developers<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 - Review patches on the openbmc list<br>
&gt;&gt;=C2=A0 - Exceed RDI of vegemite<br>
&gt;&gt;<br>
&gt;&gt; ## Project management<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 - regularly check the status page, to ensure that:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 - patches required for your project are not at=
 risk of exipiring<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 - upstreaming efforts are not falling behind s=
chedule<br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--001a1135a57a0c99260547950c2a--
