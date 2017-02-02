Return-Path: <joel.stan@gmail.com>
Received: from mail-ot0-x242.google.com (mail-ot0-x242.google.com
 [IPv6:2607:f8b0:4003:c0f::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDSqW4c16zDqFH
 for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2017 16:15:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="X+Vs9XlP"; 
 dkim-atps=neutral
Received: by mail-ot0-x242.google.com with SMTP id 36so636336otx.3
 for <openbmc@lists.ozlabs.org>; Wed, 01 Feb 2017 21:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=qiCy05Se6+BejDL4lvAhUqJQjR+eU+aS7f2aBQSPtOI=;
 b=X+Vs9XlPAOuXncnP1fxtrfnMJxHwiuvHQtrq4pCxitrg4RoTSMri94+klcany3gWR4
 uhc5x3vtyQV43ZshbgqiATNH8rVnNN5FFSyHOufyp1YoNb2uyWnpiS5qfip23glar+J7
 RidtZDyqf2mzO61/fARqONjiV7RUTbpyjWtqzr0JZC74xY/Ya1Hk3WFgVkB8xVKv/bSO
 FiNsicSPkvPabQiry9h2g6sAcEnhcOs8T1e6V85BeyNqB8JuWszLQMLIUQKTIfhOGQJg
 gJk+KYTeQ8F+q5M1OihezYflmKM86CkEY5sfMTWRWet5OyE4wDt9h4B0JAFAPTN9ANEf
 R9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=qiCy05Se6+BejDL4lvAhUqJQjR+eU+aS7f2aBQSPtOI=;
 b=VxkIeY0ysf8EqpGebl98ZgTLBe80cjWGWIDSrEcUkP5pUgvkdDYqRq/Hx2LD6ZXmQW
 TW0Wn7/Yp/AbcFzf6P74ysig8YVn4wvvGJmqaZ/WB5ThfM+i35guTmdYqstDmk/iXm3s
 uTKBP18rGcBTyTNhwoPFiQZGBatqCOOCAUzEnKdpOJJR403/ms+CfIYI4mXQTNYu4rQp
 jLNZUgYtoVV67s0+gra46H8z2sGj42kctzk0qKqK5UDe9nktvauZAh9dFs1IaycTxMdn
 4ytYlKbgTDwozi19wtqXE6U/hsZU4Ezca1IVoGBJvycjqSvthZCPCYmevf/fQKWe5b78
 H97g==
X-Gm-Message-State: AIkVDXJmcEofYGPxSjt8iR2vvrh0mdlUOLjJTmpvpyObBrzh8+x7PpF1KyuZ0l2cbaf2E6gMq24DOd2I0OpF1Q==
X-Received: by 10.157.25.140 with SMTP id k12mr3706521otk.174.1486012501512;
 Wed, 01 Feb 2017 21:15:01 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Wed, 1 Feb 2017 21:14:41 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Feb 2017 15:44:41 +1030
X-Google-Sender-Auth: s1yG2voA9vHwjOubUbWVZ1E1QP4
Message-ID: <CACPK8Xdny6BHxpcWz2B=a+zELaYHW1aYt+_uR-E9rABNAjS5uQ@mail.gmail.com>
Subject: OpenBMC Kernel Development Process
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 02 Feb 2017 05:15:04 -0000

Hello OpenBMCers,

Over the past few days I've been chatting with some of the people
involved in kernel development for this project. We've looked at ways
to make this a better experience for new developers, those overseeing
development, and folks wanting to ship products on deadlines.

With Jeremy's help we've drafted a proposal that hopes to take
everyone's needs into account. Please have a read and reply  with your
feedback. The draft of the process is also on the OpenBMC wiki at
https://github.com/openbmc/linux/wiki/DevelopmentProcess

## Upstream is key

In order to leverage the benefits of using the Linux kernel, OpenBMC
maintains a policy that all kernel code will be merged upstream.

However, there are often cases where product requirements mean that
synchronising with an upstream schedule is not always possible. This
process aims to allow both goals (upstream inclusion and a useful
OpenBMC build) to occur in parallel.

## Pre-upstream inclusion plans

The project has a process for including patches before they are merged
upstream in order to allow development and testing before the upstream
work is complete.

Patches for pre-upstream inclusion in the OpenBMC kernel should at
least be of a level approximately ready to submit upstream. Although
this is somewhat subjective, this will almost always be indicated by:

 - passing the 'checkpatch' utility without warnings

 - the patch should not break the build for the kernel configurations
that are currently in use, nor should it introduce compiler warnings

 - a kernel including the patch should be boot-tested in the qemu environment

Non-upstreamed patches will be carried in the OpenBMC kernel until the
upstream stable release that occurs 30 days after original patch
inclusion. With a rough maximum time of 14 days between stable
updates, this means that the changes will be carried for 30-44 days.

However, work doesn't end here: during this time, the patch submitter
should keep interacting with the community to get the patch included
in the upstream kernel.

After the 30-day cycle, the patch will typically be on its way through
the upstream process. It is the patch owner's responsibility to ensure
that this proceeds. Once the patch has been included in an upstream
tree, we will switch over to the upstreamed patch. The OpenBMC kernel
maintainers will take responsibility for carrying that patch until a
subsequent update moves to a base version that includes the upstream
change.

However, if a patch is still not included by that time, it *may* be
resubmitted for inclusion in the next 30-day cycle. This is
conditional on at least one new revision being sent upstream for
further review, demonstrating that the owner is making progress on
upstream inclusion.  In order to indicate that the patch should be
carried over, the patch owner should re-submit it to the mailing list,
with details of upstream progression so far.

At this point, the patch owner should be in contact with the OpenBMC
kernel maintainers via either the mailing list, or #openbmc IRC
channel, for assistance with the upstreaming process.

In situations where the upstream acceptance is taking longer than
expected, we can repeat the cycle above, for a maximum of three
iterations (ie, three 30-day periods).

After those three periods, the patch will be dropped from the tree.

Note that this process is not a "free ticket" to 90 days of inclusion
in the tree. The kernel maintainer has the responsibility to ensure
that the code is of sufficient quality for the multiple consumers of
the OpenBMC kernel, and may reject submissions on serious grounds if
necessary (eg, security issues, major code review issues, copyright
concerns, adversely affecting other platforms). The intention here is
to facilitate collaboration on the kernel and scale development across
OpenBMC contributors.

## Platform scaling

A consequence of the process above is that we will be including
patches that affect platforms that the OpenBMC kernel team does not
necessarily have access to, without outside code review. This means we
have no way to test those patches.

To prevent failures from these carried patches, owners of the patches
will be added as code reviewers on the OpenBMC yocto updates.

We expect these owners to test that the updated kernel still carries
the required functionality, and provide code review feedback if not.
This will prevent the OpenBMC system from being updated to a kernel
which breaks pre-upstream support for vendor-specific functions.

If no feedback is provided with one week, is it assumed that the
update is OK to proceed. Regardless, a positive code review is still
useful, to provide quicker feedback.

# Processes

## Patch submitters (wishing to have a change included through this process)

 - ensure that patches conform to base-level quality guidelines
   - no warnings from checkpatch
   - does not introduce errors or warnings, for specific defconfigs
      - aspeed_g4_defconfig
      - aspeed_g5_defconfig
   - boot test the kernel using the qemu simulation environment
      - At a minimum, the system should boot to a userspace prompt of
the OpenBMC userspace
 - submit upstream first
 - submit proposed patches to openbmc@lists.ozlabs.org
    - This version of hte patch should contain "[PATCH linux
<branch>]" in the subject, where <branch> is the name of the current
OpenBMC development tree
 - continue with upstream discusions, by promptly following-up with
code review feedback, and post new versions of code regularly
 - if the 30-day expiry date is approaching, re-send to
openbmc@lists.ozlabs.org, requesting re-inclusion in the tree, with
details of upstream work so far  (just a short sentence in the patch
email should be sufficient for this)
 - monitor gerrit review queue for test requests from OpenBMC kernel maintainer

## OpenBMC kernel maintainer

 - Review patches submitted to the openbmc list
 - Merge patches into the OpenBMC tree
 - Rebase the OpenBMC tree at the agreed interval (30 days)
   - Announce the merge window on the mailing list
   - Update to the latest stable upstream release
   - Apply patches from the list
   - Update the status documentation for pre-upstream patches
- Test kernel on available platforms
   - Palmetto, Witherspoon
   - Qemu Palmetto, Qemu Romulus
- Add relevant reviewers for gerrit openbmc yocto "kernel bump" changes

## All developers

 - Review patches on the openbmc list
 - Exceed RDI of vegemite

## Project management

 - regularly check the status page, to ensure that:
     - patches required for your project are not at risk of exipiring
     - upstreaming efforts are not falling behind schedule
