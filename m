Return-Path: <raltherr@google.com>
Received: from mail-it0-x22a.google.com (mail-it0-x22a.google.com
 [IPv6:2607:f8b0:4001:c0b::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDm6M6LgxzDq5Y
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 03:43:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="or4P9PXX"; 
 dkim-atps=neutral
Received: by mail-it0-x22a.google.com with SMTP id 203so43393031ith.0
 for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2017 08:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=D6KRnRYrtoLRpXK+6gYOP+pVK5FuSckgCnKTltMtk/Y=;
 b=or4P9PXX3vpnbfL1T2p8TTjrC/W203sIGpv8W2Pw0IMTYw5lw/I76tNIQb3PoefiGy
 qxwQ3PpoAxtekzTlRthP/nK9zXgS619G2p/eESKyns54jMablcl/t0/l/8tcA9D0a6Ta
 6ir9tYRnvbp7p+VkTKAoDmzy1DQthKhNMxovg4h9tD6C/xn6sBJJ0lH9HXJ+p8Womsgl
 5Z6eMrWG1z1QYSnkMDTEWJI2WaeZUKSjxJlvrx4KVAQgbPGfsdg7e/iCSsBtljOZE6z/
 oQmZZ417xW3zROxbIvoHkoIK9JxWYRsU5isqBu6xdIGyscU6Us6P4ImMpanG35Nb6eaq
 m9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=D6KRnRYrtoLRpXK+6gYOP+pVK5FuSckgCnKTltMtk/Y=;
 b=hntuHIWGZI9sru5M42FxumX7G4OdsNKuj5Nzy2E2vAOhjdh59NiOdd83g9XoZCNZ/h
 91biUCiBxLppgoQx6+SraIeyIgepGYQelwPVURVXyYq3eVKvrSKvv2DLbj2PcNZgRAHP
 nuWbyJAAznn52aoS734TFklp3NTcjcQCVgcqGfoH+rypORzHgiaR1aH58+MYRlEXMXlW
 UeVJl64gLmsbebmhv/MhDHiYshG9VEA03D53vtW6Jff1V7QZmCUsGfmnr0AaVSw3xOAb
 bx8UETW3qAp7ENx4mnIJxSDLdIrtK7IJnCAg7coCnHlmzLCizXdOmnMGV5B/YJP02rf6
 8i6A==
X-Gm-Message-State: AIkVDXIUTEj9LWAEwrs1bYJgalTa3u06MBSJFxr2oknicuKp83z1mUdqdw3H7hGKeQ72Sq7pbGs1hqewbaB3fSHR
X-Received: by 10.36.53.210 with SMTP id k201mr6754358ita.21.1486053833103;
 Thu, 02 Feb 2017 08:43:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Thu, 2 Feb 2017 08:43:52 -0800 (PST)
In-Reply-To: <CACPK8Xdny6BHxpcWz2B=a+zELaYHW1aYt+_uR-E9rABNAjS5uQ@mail.gmail.com>
References: <CACPK8Xdny6BHxpcWz2B=a+zELaYHW1aYt+_uR-E9rABNAjS5uQ@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 2 Feb 2017 08:43:52 -0800
Message-ID: <CAPLgG=ko5MCHMewdz1LT7YZV6HOMXnaNknRH5U-hWyQq8nDtyw@mail.gmail.com>
Subject: Re: OpenBMC Kernel Development Process
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114a8ac4d739aa05478ededa
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
X-List-Received-Date: Thu, 02 Feb 2017 16:43:57 -0000

--001a114a8ac4d739aa05478ededa
Content-Type: text/plain; charset=UTF-8

Thank you for putting this together.  I find it really helpful to have an
explicit process to follow.  I do have a few questions:
- What do we do about patches that require functionality that is not
currently available upstream (for instance, a subsystem change is being
reviewed by upstream but isn't yet merged).  Can that patch be sent to
OpenBMC only or must we wait for upstream to decide on the dependent patch?
- OpenBMC and upstream will inevitably diverge between OpenBMC rebases.
When upstream has changed in a significant way (say the recent hwmon API
changes), what do we do?  Do we send a new patch of equivalent
functionality to OpenBMC?  Do we ask for patches to be cherry-picked from
upstream?
- Which branch is the authoritative branch for basing patches on for
OpenBMC?

On Wed, Feb 1, 2017 at 9:14 PM, Joel Stanley <joel@jms.id.au> wrote:

> Hello OpenBMCers,
>
> Over the past few days I've been chatting with some of the people
> involved in kernel development for this project. We've looked at ways
> to make this a better experience for new developers, those overseeing
> development, and folks wanting to ship products on deadlines.
>
> With Jeremy's help we've drafted a proposal that hopes to take
> everyone's needs into account. Please have a read and reply  with your
> feedback. The draft of the process is also on the OpenBMC wiki at
> https://github.com/openbmc/linux/wiki/DevelopmentProcess
>
> ## Upstream is key
>
> In order to leverage the benefits of using the Linux kernel, OpenBMC
> maintains a policy that all kernel code will be merged upstream.
>
> However, there are often cases where product requirements mean that
> synchronising with an upstream schedule is not always possible. This
> process aims to allow both goals (upstream inclusion and a useful
> OpenBMC build) to occur in parallel.
>
> ## Pre-upstream inclusion plans
>
> The project has a process for including patches before they are merged
> upstream in order to allow development and testing before the upstream
> work is complete.
>
> Patches for pre-upstream inclusion in the OpenBMC kernel should at
> least be of a level approximately ready to submit upstream. Although
> this is somewhat subjective, this will almost always be indicated by:
>
>  - passing the 'checkpatch' utility without warnings
>
>  - the patch should not break the build for the kernel configurations
> that are currently in use, nor should it introduce compiler warnings
>
>  - a kernel including the patch should be boot-tested in the qemu
> environment
>
> Non-upstreamed patches will be carried in the OpenBMC kernel until the
> upstream stable release that occurs 30 days after original patch
> inclusion. With a rough maximum time of 14 days between stable
> updates, this means that the changes will be carried for 30-44 days.
>
> However, work doesn't end here: during this time, the patch submitter
> should keep interacting with the community to get the patch included
> in the upstream kernel.
>
> After the 30-day cycle, the patch will typically be on its way through
> the upstream process. It is the patch owner's responsibility to ensure
> that this proceeds. Once the patch has been included in an upstream
> tree, we will switch over to the upstreamed patch. The OpenBMC kernel
> maintainers will take responsibility for carrying that patch until a
> subsequent update moves to a base version that includes the upstream
> change.
>
> However, if a patch is still not included by that time, it *may* be
> resubmitted for inclusion in the next 30-day cycle. This is
> conditional on at least one new revision being sent upstream for
> further review, demonstrating that the owner is making progress on
> upstream inclusion.  In order to indicate that the patch should be
> carried over, the patch owner should re-submit it to the mailing list,
> with details of upstream progression so far.
>
> At this point, the patch owner should be in contact with the OpenBMC
> kernel maintainers via either the mailing list, or #openbmc IRC
> channel, for assistance with the upstreaming process.
>
> In situations where the upstream acceptance is taking longer than
> expected, we can repeat the cycle above, for a maximum of three
> iterations (ie, three 30-day periods).
>
> After those three periods, the patch will be dropped from the tree.
>
> Note that this process is not a "free ticket" to 90 days of inclusion
> in the tree. The kernel maintainer has the responsibility to ensure
> that the code is of sufficient quality for the multiple consumers of
> the OpenBMC kernel, and may reject submissions on serious grounds if
> necessary (eg, security issues, major code review issues, copyright
> concerns, adversely affecting other platforms). The intention here is
> to facilitate collaboration on the kernel and scale development across
> OpenBMC contributors.
>
> ## Platform scaling
>
> A consequence of the process above is that we will be including
> patches that affect platforms that the OpenBMC kernel team does not
> necessarily have access to, without outside code review. This means we
> have no way to test those patches.
>
> To prevent failures from these carried patches, owners of the patches
> will be added as code reviewers on the OpenBMC yocto updates.
>
> We expect these owners to test that the updated kernel still carries
> the required functionality, and provide code review feedback if not.
> This will prevent the OpenBMC system from being updated to a kernel
> which breaks pre-upstream support for vendor-specific functions.
>
> If no feedback is provided with one week, is it assumed that the
> update is OK to proceed. Regardless, a positive code review is still
> useful, to provide quicker feedback.
>
> # Processes
>
> ## Patch submitters (wishing to have a change included through this
> process)
>
>  - ensure that patches conform to base-level quality guidelines
>    - no warnings from checkpatch
>    - does not introduce errors or warnings, for specific defconfigs
>       - aspeed_g4_defconfig
>       - aspeed_g5_defconfig
>    - boot test the kernel using the qemu simulation environment
>       - At a minimum, the system should boot to a userspace prompt of
> the OpenBMC userspace
>  - submit upstream first
>  - submit proposed patches to openbmc@lists.ozlabs.org
>     - This version of hte patch should contain "[PATCH linux
> <branch>]" in the subject, where <branch> is the name of the current
> OpenBMC development tree
>  - continue with upstream discusions, by promptly following-up with
> code review feedback, and post new versions of code regularly
>  - if the 30-day expiry date is approaching, re-send to
> openbmc@lists.ozlabs.org, requesting re-inclusion in the tree, with
> details of upstream work so far  (just a short sentence in the patch
> email should be sufficient for this)
>  - monitor gerrit review queue for test requests from OpenBMC kernel
> maintainer
>
> ## OpenBMC kernel maintainer
>
>  - Review patches submitted to the openbmc list
>  - Merge patches into the OpenBMC tree
>  - Rebase the OpenBMC tree at the agreed interval (30 days)
>    - Announce the merge window on the mailing list
>    - Update to the latest stable upstream release
>    - Apply patches from the list
>    - Update the status documentation for pre-upstream patches
> - Test kernel on available platforms
>    - Palmetto, Witherspoon
>    - Qemu Palmetto, Qemu Romulus
> - Add relevant reviewers for gerrit openbmc yocto "kernel bump" changes
>
> ## All developers
>
>  - Review patches on the openbmc list
>  - Exceed RDI of vegemite
>
> ## Project management
>
>  - regularly check the status page, to ensure that:
>      - patches required for your project are not at risk of exipiring
>      - upstreaming efforts are not falling behind schedule
>

--001a114a8ac4d739aa05478ededa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for putting this together.=C2=A0 I find it reall=
y helpful to have an explicit process to follow.=C2=A0 I do have a few ques=
tions:<div>- What do we do about patches that require functionality that is=
 not currently available upstream (for instance, a subsystem change is bein=
g reviewed by upstream but isn&#39;t yet merged).=C2=A0 Can that patch be s=
ent to OpenBMC only or must we wait for upstream to decide on the dependent=
 patch?</div><div>- OpenBMC and upstream will inevitably diverge between Op=
enBMC rebases.=C2=A0 When upstream has changed in a significant way (say th=
e recent hwmon API changes), what do we do?=C2=A0 Do we send a new patch of=
 equivalent functionality to OpenBMC?=C2=A0 Do we ask for patches to be che=
rry-picked from upstream?</div><div>- Which branch is the authoritative bra=
nch for basing patches on for OpenBMC?</div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Wed, Feb 1, 2017 at 9:14 PM, Joel Stanl=
ey <span dir=3D"ltr">&lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_blank=
">joel@jms.id.au</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">He=
llo OpenBMCers,<br>
<br>
Over the past few days I&#39;ve been chatting with some of the people<br>
involved in kernel development for this project. We&#39;ve looked at ways<b=
r>
to make this a better experience for new developers, those overseeing<br>
development, and folks wanting to ship products on deadlines.<br>
<br>
With Jeremy&#39;s help we&#39;ve drafted a proposal that hopes to take<br>
everyone&#39;s needs into account. Please have a read and reply=C2=A0 with =
your<br>
feedback. The draft of the process is also on the OpenBMC wiki at<br>
<a href=3D"https://github.com/openbmc/linux/wiki/DevelopmentProcess" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/openbmc/<wbr>linux/wiki/D=
evelopmentProcess</a><br>
<br>
## Upstream is key<br>
<br>
In order to leverage the benefits of using the Linux kernel, OpenBMC<br>
maintains a policy that all kernel code will be merged upstream.<br>
<br>
However, there are often cases where product requirements mean that<br>
synchronising with an upstream schedule is not always possible. This<br>
process aims to allow both goals (upstream inclusion and a useful<br>
OpenBMC build) to occur in parallel.<br>
<br>
## Pre-upstream inclusion plans<br>
<br>
The project has a process for including patches before they are merged<br>
upstream in order to allow development and testing before the upstream<br>
work is complete.<br>
<br>
Patches for pre-upstream inclusion in the OpenBMC kernel should at<br>
least be of a level approximately ready to submit upstream. Although<br>
this is somewhat subjective, this will almost always be indicated by:<br>
<br>
=C2=A0- passing the &#39;checkpatch&#39; utility without warnings<br>
<br>
=C2=A0- the patch should not break the build for the kernel configurations<=
br>
that are currently in use, nor should it introduce compiler warnings<br>
<br>
=C2=A0- a kernel including the patch should be boot-tested in the qemu envi=
ronment<br>
<br>
Non-upstreamed patches will be carried in the OpenBMC kernel until the<br>
upstream stable release that occurs 30 days after original patch<br>
inclusion. With a rough maximum time of 14 days between stable<br>
updates, this means that the changes will be carried for 30-44 days.<br>
<br>
However, work doesn&#39;t end here: during this time, the patch submitter<b=
r>
should keep interacting with the community to get the patch included<br>
in the upstream kernel.<br>
<br>
After the 30-day cycle, the patch will typically be on its way through<br>
the upstream process. It is the patch owner&#39;s responsibility to ensure<=
br>
that this proceeds. Once the patch has been included in an upstream<br>
tree, we will switch over to the upstreamed patch. The OpenBMC kernel<br>
maintainers will take responsibility for carrying that patch until a<br>
subsequent update moves to a base version that includes the upstream<br>
change.<br>
<br>
However, if a patch is still not included by that time, it *may* be<br>
resubmitted for inclusion in the next 30-day cycle. This is<br>
conditional on at least one new revision being sent upstream for<br>
further review, demonstrating that the owner is making progress on<br>
upstream inclusion.=C2=A0 In order to indicate that the patch should be<br>
carried over, the patch owner should re-submit it to the mailing list,<br>
with details of upstream progression so far.<br>
<br>
At this point, the patch owner should be in contact with the OpenBMC<br>
kernel maintainers via either the mailing list, or #openbmc IRC<br>
channel, for assistance with the upstreaming process.<br>
<br>
In situations where the upstream acceptance is taking longer than<br>
expected, we can repeat the cycle above, for a maximum of three<br>
iterations (ie, three 30-day periods).<br>
<br>
After those three periods, the patch will be dropped from the tree.<br>
<br>
Note that this process is not a &quot;free ticket&quot; to 90 days of inclu=
sion<br>
in the tree. The kernel maintainer has the responsibility to ensure<br>
that the code is of sufficient quality for the multiple consumers of<br>
the OpenBMC kernel, and may reject submissions on serious grounds if<br>
necessary (eg, security issues, major code review issues, copyright<br>
concerns, adversely affecting other platforms). The intention here is<br>
to facilitate collaboration on the kernel and scale development across<br>
OpenBMC contributors.<br>
<br>
## Platform scaling<br>
<br>
A consequence of the process above is that we will be including<br>
patches that affect platforms that the OpenBMC kernel team does not<br>
necessarily have access to, without outside code review. This means we<br>
have no way to test those patches.<br>
<br>
To prevent failures from these carried patches, owners of the patches<br>
will be added as code reviewers on the OpenBMC yocto updates.<br>
<br>
We expect these owners to test that the updated kernel still carries<br>
the required functionality, and provide code review feedback if not.<br>
This will prevent the OpenBMC system from being updated to a kernel<br>
which breaks pre-upstream support for vendor-specific functions.<br>
<br>
If no feedback is provided with one week, is it assumed that the<br>
update is OK to proceed. Regardless, a positive code review is still<br>
useful, to provide quicker feedback.<br>
<br>
# Processes<br>
<br>
## Patch submitters (wishing to have a change included through this process=
)<br>
<br>
=C2=A0- ensure that patches conform to base-level quality guidelines<br>
=C2=A0 =C2=A0- no warnings from checkpatch<br>
=C2=A0 =C2=A0- does not introduce errors or warnings, for specific defconfi=
gs<br>
=C2=A0 =C2=A0 =C2=A0 - aspeed_g4_defconfig<br>
=C2=A0 =C2=A0 =C2=A0 - aspeed_g5_defconfig<br>
=C2=A0 =C2=A0- boot test the kernel using the qemu simulation environment<b=
r>
=C2=A0 =C2=A0 =C2=A0 - At a minimum, the system should boot to a userspace =
prompt of<br>
the OpenBMC userspace<br>
=C2=A0- submit upstream first<br>
=C2=A0- submit proposed patches to <a href=3D"mailto:openbmc@lists.ozlabs.o=
rg">openbmc@lists.ozlabs.org</a><br>
=C2=A0 =C2=A0 - This version of hte patch should contain &quot;[PATCH linux=
<br>
&lt;branch&gt;]&quot; in the subject, where &lt;branch&gt; is the name of t=
he current<br>
OpenBMC development tree<br>
=C2=A0- continue with upstream discusions, by promptly following-up with<br=
>
code review feedback, and post new versions of code regularly<br>
=C2=A0- if the 30-day expiry date is approaching, re-send to<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>, r=
equesting re-inclusion in the tree, with<br>
details of upstream work so far=C2=A0 (just a short sentence in the patch<b=
r>
email should be sufficient for this)<br>
=C2=A0- monitor gerrit review queue for test requests from OpenBMC kernel m=
aintainer<br>
<br>
## OpenBMC kernel maintainer<br>
<br>
=C2=A0- Review patches submitted to the openbmc list<br>
=C2=A0- Merge patches into the OpenBMC tree<br>
=C2=A0- Rebase the OpenBMC tree at the agreed interval (30 days)<br>
=C2=A0 =C2=A0- Announce the merge window on the mailing list<br>
=C2=A0 =C2=A0- Update to the latest stable upstream release<br>
=C2=A0 =C2=A0- Apply patches from the list<br>
=C2=A0 =C2=A0- Update the status documentation for pre-upstream patches<br>
- Test kernel on available platforms<br>
=C2=A0 =C2=A0- Palmetto, Witherspoon<br>
=C2=A0 =C2=A0- Qemu Palmetto, Qemu Romulus<br>
- Add relevant reviewers for gerrit openbmc yocto &quot;kernel bump&quot; c=
hanges<br>
<br>
## All developers<br>
<br>
=C2=A0- Review patches on the openbmc list<br>
=C2=A0- Exceed RDI of vegemite<br>
<br>
## Project management<br>
<br>
=C2=A0- regularly check the status page, to ensure that:<br>
=C2=A0 =C2=A0 =C2=A0- patches required for your project are not at risk of =
exipiring<br>
=C2=A0 =C2=A0 =C2=A0- upstreaming efforts are not falling behind schedule<b=
r>
</blockquote></div><br></div>

--001a114a8ac4d739aa05478ededa--
