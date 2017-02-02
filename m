Return-Path: <joel.stan@gmail.com>
Received: from mail-ot0-x242.google.com (mail-ot0-x242.google.com
 [IPv6:2607:f8b0:4003:c0f::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDwxy01k7zDq6X
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 10:22:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="L0+M5PmN"; 
 dkim-atps=neutral
Received: by mail-ot0-x242.google.com with SMTP id 36so341614otx.3
 for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2017 15:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=M+QBmH8TcKN3oWEmRTp8kRrgC2rmHuCIO+k73OaRF7k=;
 b=L0+M5PmNMJ6XYoPcr1wQFU4Z5yKauJzuthDY3zDVvAg5yqtemTpadfe8a+ySm5J4Q0
 ulSPb5PuOINl9xYbvLPDq15ddr0r7nPPMom9ifilPoGUPxlGpaUXMwpu477Cy/K9RuSL
 cfa3kj9KMdzt9anrTlOlVttYPv8hYcmuz0T/nP0PJeL8hhz12zGElWtA1meIJwm+w/Vx
 YDEs0W4N9JbQ7o0e6z1oicDaHVhIM7YjXKrFQB4w4XofgvbRc3pv2MpD0gRfdvnyNUkf
 D9Mg9LnSvlaYp7RGnIb1jov519ndG73FdJZ4daoGTbFyWwDGPuQxyNoTMDTRKQlIMzqH
 FUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=M+QBmH8TcKN3oWEmRTp8kRrgC2rmHuCIO+k73OaRF7k=;
 b=l9DfpugJ5x+/e+0FhSQIZUzgamW9cjjoEzgD3TcLmR/VufrmeDZDEcbpP6wHSlJ+2G
 5/k8K6Ruw5QAhINJNFd0HxY/DjxYjTOe2k35irIF0fHfANIvzIwDRiMOZtA2ybqwY2wa
 eI3NkRTK5pugvEyHf1JGX2tFc0WC+1JR4QT8NBj7vaNk3W6976owqHsuvuAkIJXEno2B
 KsVKpEaKzYgsi+bsk+HNNUgQdleGkYvdlYRrvFGPE1m0ftw0Bf1y1ccwkVpyYYne8ufC
 DU4up1XT5mMQE4sf5/3eJhw5Llr75z2ncMJaVrYXUfTy/DaZWllb1SlZ1+uVsgnGuvVq
 ioeg==
X-Gm-Message-State: AIkVDXJrWPWXzokeZN8sJYt3MV0Y9mln4xh60Vfu8F3cbpjn+JO2zgBtF6w/BXVGXcGdO003ywpEU+SsLT0SCg==
X-Received: by 10.157.10.202 with SMTP id 68mr5014549otq.51.1486077730949;
 Thu, 02 Feb 2017 15:22:10 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Thu, 2 Feb 2017 15:21:50 -0800 (PST)
In-Reply-To: <CAPLgG=ko5MCHMewdz1LT7YZV6HOMXnaNknRH5U-hWyQq8nDtyw@mail.gmail.com>
References: <CACPK8Xdny6BHxpcWz2B=a+zELaYHW1aYt+_uR-E9rABNAjS5uQ@mail.gmail.com>
 <CAPLgG=ko5MCHMewdz1LT7YZV6HOMXnaNknRH5U-hWyQq8nDtyw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 3 Feb 2017 09:51:50 +1030
X-Google-Sender-Auth: 1rX8p_Whj5ehAB1s6AWvYCnMX_8
Message-ID: <CACPK8XerRt9v4QheLyN-xfgEtA7JEEgVUiXHBjHVcCqmta0u4A@mail.gmail.com>
Subject: Re: OpenBMC Kernel Development Process
To: Rick Altherr <raltherr@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 02 Feb 2017 23:22:15 -0000

On Fri, Feb 3, 2017 at 3:13 AM, Rick Altherr <raltherr@google.com> wrote:
> Thank you for putting this together.  I find it really helpful to have an
> explicit process to follow.  I do have a few questions:
> - What do we do about patches that require functionality that is not
> currently available upstream (for instance, a subsystem change is being
> reviewed by upstream but isn't yet merged).  Can that patch be sent to
> OpenBMC only or must we wait for upstream to decide on the dependent patch?

I couldn't grok what you're describing here.

If there's an upstream change under debate that your driver depends
on, we can pull it in.

> - OpenBMC and upstream will inevitably diverge between OpenBMC rebases.
> When upstream has changed in a significant way (say the recent hwmon API
> changes), what do we do?  Do we send a new patch of equivalent functionality
> to OpenBMC?  Do we ask for patches to be cherry-picked from upstream?

This is when a developer has created a driver against upstream, and
the APIs are not the same as present in the OpenBMC tree? We should
take the option that requires the least amount of work.

We should backport API changes when it doesn't break other drivers
(when APIs are being added). When APIs are being significantly
modified, it may be easier to backport the driver.

> - Which branch is the authoritative branch for basing patches on for
> OpenBMC?

I will publish this on the wiki. For the upcoming cycle, we will move
to a v4.9 based branch next week. I will call for patches to be sent
against this tree once it's published.

Thanks for taking a read and the questions. If you want more detail let me know.

Cheers,

Joel

>
> On Wed, Feb 1, 2017 at 9:14 PM, Joel Stanley <joel@jms.id.au> wrote:
>>
>> Hello OpenBMCers,
>>
>> Over the past few days I've been chatting with some of the people
>> involved in kernel development for this project. We've looked at ways
>> to make this a better experience for new developers, those overseeing
>> development, and folks wanting to ship products on deadlines.
>>
>> With Jeremy's help we've drafted a proposal that hopes to take
>> everyone's needs into account. Please have a read and reply  with your
>> feedback. The draft of the process is also on the OpenBMC wiki at
>> https://github.com/openbmc/linux/wiki/DevelopmentProcess
>>
>> ## Upstream is key
>>
>> In order to leverage the benefits of using the Linux kernel, OpenBMC
>> maintains a policy that all kernel code will be merged upstream.
>>
>> However, there are often cases where product requirements mean that
>> synchronising with an upstream schedule is not always possible. This
>> process aims to allow both goals (upstream inclusion and a useful
>> OpenBMC build) to occur in parallel.
>>
>> ## Pre-upstream inclusion plans
>>
>> The project has a process for including patches before they are merged
>> upstream in order to allow development and testing before the upstream
>> work is complete.
>>
>> Patches for pre-upstream inclusion in the OpenBMC kernel should at
>> least be of a level approximately ready to submit upstream. Although
>> this is somewhat subjective, this will almost always be indicated by:
>>
>>  - passing the 'checkpatch' utility without warnings
>>
>>  - the patch should not break the build for the kernel configurations
>> that are currently in use, nor should it introduce compiler warnings
>>
>>  - a kernel including the patch should be boot-tested in the qemu
>> environment
>>
>> Non-upstreamed patches will be carried in the OpenBMC kernel until the
>> upstream stable release that occurs 30 days after original patch
>> inclusion. With a rough maximum time of 14 days between stable
>> updates, this means that the changes will be carried for 30-44 days.
>>
>> However, work doesn't end here: during this time, the patch submitter
>> should keep interacting with the community to get the patch included
>> in the upstream kernel.
>>
>> After the 30-day cycle, the patch will typically be on its way through
>> the upstream process. It is the patch owner's responsibility to ensure
>> that this proceeds. Once the patch has been included in an upstream
>> tree, we will switch over to the upstreamed patch. The OpenBMC kernel
>> maintainers will take responsibility for carrying that patch until a
>> subsequent update moves to a base version that includes the upstream
>> change.
>>
>> However, if a patch is still not included by that time, it *may* be
>> resubmitted for inclusion in the next 30-day cycle. This is
>> conditional on at least one new revision being sent upstream for
>> further review, demonstrating that the owner is making progress on
>> upstream inclusion.  In order to indicate that the patch should be
>> carried over, the patch owner should re-submit it to the mailing list,
>> with details of upstream progression so far.
>>
>> At this point, the patch owner should be in contact with the OpenBMC
>> kernel maintainers via either the mailing list, or #openbmc IRC
>> channel, for assistance with the upstreaming process.
>>
>> In situations where the upstream acceptance is taking longer than
>> expected, we can repeat the cycle above, for a maximum of three
>> iterations (ie, three 30-day periods).
>>
>> After those three periods, the patch will be dropped from the tree.
>>
>> Note that this process is not a "free ticket" to 90 days of inclusion
>> in the tree. The kernel maintainer has the responsibility to ensure
>> that the code is of sufficient quality for the multiple consumers of
>> the OpenBMC kernel, and may reject submissions on serious grounds if
>> necessary (eg, security issues, major code review issues, copyright
>> concerns, adversely affecting other platforms). The intention here is
>> to facilitate collaboration on the kernel and scale development across
>> OpenBMC contributors.
>>
>> ## Platform scaling
>>
>> A consequence of the process above is that we will be including
>> patches that affect platforms that the OpenBMC kernel team does not
>> necessarily have access to, without outside code review. This means we
>> have no way to test those patches.
>>
>> To prevent failures from these carried patches, owners of the patches
>> will be added as code reviewers on the OpenBMC yocto updates.
>>
>> We expect these owners to test that the updated kernel still carries
>> the required functionality, and provide code review feedback if not.
>> This will prevent the OpenBMC system from being updated to a kernel
>> which breaks pre-upstream support for vendor-specific functions.
>>
>> If no feedback is provided with one week, is it assumed that the
>> update is OK to proceed. Regardless, a positive code review is still
>> useful, to provide quicker feedback.
>>
>> # Processes
>>
>> ## Patch submitters (wishing to have a change included through this
>> process)
>>
>>  - ensure that patches conform to base-level quality guidelines
>>    - no warnings from checkpatch
>>    - does not introduce errors or warnings, for specific defconfigs
>>       - aspeed_g4_defconfig
>>       - aspeed_g5_defconfig
>>    - boot test the kernel using the qemu simulation environment
>>       - At a minimum, the system should boot to a userspace prompt of
>> the OpenBMC userspace
>>  - submit upstream first
>>  - submit proposed patches to openbmc@lists.ozlabs.org
>>     - This version of hte patch should contain "[PATCH linux
>> <branch>]" in the subject, where <branch> is the name of the current
>> OpenBMC development tree
>>  - continue with upstream discusions, by promptly following-up with
>> code review feedback, and post new versions of code regularly
>>  - if the 30-day expiry date is approaching, re-send to
>> openbmc@lists.ozlabs.org, requesting re-inclusion in the tree, with
>> details of upstream work so far  (just a short sentence in the patch
>> email should be sufficient for this)
>>  - monitor gerrit review queue for test requests from OpenBMC kernel
>> maintainer
>>
>> ## OpenBMC kernel maintainer
>>
>>  - Review patches submitted to the openbmc list
>>  - Merge patches into the OpenBMC tree
>>  - Rebase the OpenBMC tree at the agreed interval (30 days)
>>    - Announce the merge window on the mailing list
>>    - Update to the latest stable upstream release
>>    - Apply patches from the list
>>    - Update the status documentation for pre-upstream patches
>> - Test kernel on available platforms
>>    - Palmetto, Witherspoon
>>    - Qemu Palmetto, Qemu Romulus
>> - Add relevant reviewers for gerrit openbmc yocto "kernel bump" changes
>>
>> ## All developers
>>
>>  - Review patches on the openbmc list
>>  - Exceed RDI of vegemite
>>
>> ## Project management
>>
>>  - regularly check the status page, to ensure that:
>>      - patches required for your project are not at risk of exipiring
>>      - upstreaming efforts are not falling behind schedule
>
>
