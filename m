Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x234.google.com (mail-it0-x234.google.com
 [IPv6:2607:f8b0:4001:c0b::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vXlK257dnzDqHq
 for <openbmc@lists.ozlabs.org>; Wed,  1 Mar 2017 04:03:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="s5fVK0d2"; 
 dkim-atps=neutral
Received: by mail-it0-x234.google.com with SMTP id 203so82393417ith.0
 for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2017 09:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=rozx7NdD7mn1Pw7Erx+SUTqr351ykxLofW8OJ44VwA8=;
 b=s5fVK0d2x8dnuHErvSAIIWKdSxnNJ2z3De4AookrYK62X3PeRcHChkZyepP5hdosyt
 SX0JcPIsAUNCc6ipH4A/zrB29nDDIgXtSzFaDWHkYVdXGJAjlIG70nPYZboJCa3aeDiG
 yF88U7WXFhKrsHexY9x2/l20/oK8l0rFEAzytfYELxW5YZKMV2IlFQkQhmJSmwhKMJHW
 wHGqxgei3WA64t0ztFUJfwgJhM/qF3fzkfVKjPC0fCR1utPjEMbYWoQwwzAHh8kHUqZe
 sLv2L0sa+WX6BJL4ggoZfHEiEZzD2l/FtR2YWJwESX6rjeyV0lSF+kWvekEdY4mOmDXp
 N1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=rozx7NdD7mn1Pw7Erx+SUTqr351ykxLofW8OJ44VwA8=;
 b=rSQVvKipn9SbwXiUtLL98TwqkA8pLL0UqOv8QS1c1WPKI5NmC8U6oL7UO3bTcqAqQ9
 fBScXgdHP1bM8joZjxRJ4JSsAJ4BgJL4n4zQ2QYufd9jLy5men41QVaPKY4EsXRBzjLU
 R4geExMREEbw1EzkWzT57Nbq7ojrj8zWxBAhdbfaCEDLVCTWIPLb/8s+09u8PSNXjX1b
 gGvoQeGg5TiGcW6VYwjA52gRBSPYDW4T7pb7fpdtfuWCY2f7c1ey9D0TbdojDjR6B9dN
 RdKa88lfmUTm+1oCPG/kQ81pt41DNpLDDYk1+yaPJ5Mzo8WVTVsiG4ExyXSQM+OQ2zxo
 yB0w==
X-Gm-Message-State: AMke39ljdZrzMKZjyW/BGG9BeZKu2ZCjyp0UXIyaO6EndMQe2Z2qMDxALof9VYnuFusx0C4l+1bdgBn2lIAbyw==
X-Received: by 10.36.116.7 with SMTP id o7mr21613336itc.31.1488301409982; Tue,
 28 Feb 2017 09:03:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.53.91 with HTTP; Tue, 28 Feb 2017 09:03:29 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 28 Feb 2017 11:03:29 -0600
Message-ID: <CALLMt=pFzj+_RWoTo52Q_U+Ca5sH2FsSLOC1aRnJHOek2aZrQQ@mail.gmail.com>
Subject: Handling BMC Reboots when Host is Running
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 28 Feb 2017 17:03:36 -0000

My story this sprint, https://github.com/openbmc/openbmc/issues/1094,
is to allow the BMC to be rebooted while the host is up and running.
After the BMC reboot, we need to keep the host running and also get to
the appropriate systemd target states to represent this.   The
challenge here is that if we just re-ran the existing targets and
services, we would do things like run P9 vcs workarounds, bit bang the
FSI bus, and even potentially toggle pgood.  We obviously need to
avoid this in order to keep the host up and running.  This divides our
services started during a obmc-host-start.target into 2 categories,
services required to boot the system, and services which are required
to support the host running.  We only want to run the latter in a
situation where the BMC is reset while the host is up and running.

Requirements:

- The applications should have no knowledge of Host state
  - i.e. the service starting or not starting is where we control what runs

- Must handle being able to start and not start any arbitrary service
within the host power on targets
  - Lots of services have dependencies on each other and
synchronization targets, this design has to handle starting services
that depend on other services or targets that may not be required when
the host is running

- The obmc-host-start.target needs to get to the running state when
the host is already running after a BMC reset
  - This will ensure that any re-starts of this target do not harm the
system and that the power off targets will work as expected

Proposal:

Use the ConditionPathExists=3D systemd unit feature.

From the man page: "Before starting a unit, verify that the specified
condition is true. If it is not true, the starting of the unit will be
(mostly silently) skipped, however all ordering dependencies of it are
still respected. A failing condition will not result in the unit being
moved into a failure state. The condition is checked at the time the
queued start job is to be executed. Use condition expressions in order
to silently skip units that do not apply to the local running system,
for example because the kernel or runtime environment doesn't require
its functionality. "

This will be put in the service files that we do not want to run in
this reset scenario (services required to boot the system).  The first
service we will run on a power on, is a service that detects whether
the host is already running.  If the host is running, then this
service will create a file which will then be used to determine
whether the boot services are run or not.

The nice part about ConditionPathExists=3D is that it doesn=E2=80=99t execu=
te
the application in the services, but it allows dependencies on that
service to be satisfied so systemd will still start the dependent
services and reach the dependent synchronization targets.

This proposal has not gone off as well as I would have hoped
internally here :)  There=E2=80=99s definitely a desire to not have this at
the service level, but rather at the target level.  I have not found a
solution in this area though that satisfies the above requirements.
Thoughts/ideas are definitely appreciated.

Andrew
