Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x22e.google.com (mail-it0-x22e.google.com
 [IPv6:2607:f8b0:4001:c0b::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7fpr4XfPzDvJB
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 05:27:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=GXGzsZhV; 
 dkim-atps=neutral
Received: by mail-it0-x22e.google.com with SMTP id e187so46210219itc.0
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 11:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=a8nqdxGJD8rrTi+W7xZ7djnY/gv6jygDjG7EdM8Pmwk=;
 b=GXGzsZhVow4osLh1nULJdcIH7YZzxRGRgABJ0VGmdbLrOgQG+PbT3qdbZ4VJ3wm9ni
 RuQiLeQj+ORhfDDAvhUet/2EGID0V/g5Un0Gp+P1h5Iq2GjdEckdp43RZui14NgVt9d3
 W+t1xdYH+JY1jiCx7g8hcO8K9WidadA4JWIdQ/InILwMNwd27Z6ECGz4lqodEeCLuxr3
 DJ5gTuLyElaMGQs0GyTkSHhwxVnSZTicVZG9vIfv2DVWld9xrThYzQlsTKl6of3DuHZs
 QLUf1I375IfJZM7a1E5U3a+GMTzMuzhwz+t5jSoo1XsaHn6rAFnMp1GqQxZaQ1D6Fn5k
 CQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=a8nqdxGJD8rrTi+W7xZ7djnY/gv6jygDjG7EdM8Pmwk=;
 b=kCpbHjeLp0j58yOQwUPFsBMf/WwAkwo7lWPcMeadl2jpxFHpzzozpSN/pqKFtc+vB1
 bDpdstKuYwqi5yB7AxMSLDOqCshHqMZTl0QQWyXYcqN5FQd5mT5eqmdBbj9eOXnmR+xK
 buc4Y6ZXm//30pIV7HBhLH3YnG9BzRND/mDeAN2cKKgNVICk5/pBg1MPR+4vpKAqWiJq
 3xXZhKN3uNG0dwSm+/83WsUzY9JxNaKa98B4qh4gt6F0/ikDjDaSToPPp/LD8/ajspKs
 z4Uan30MU8i6of0b9c9Lz25ScWWk73V4OwfVYvbcpF/+n/HmWKCwHs1uMk0GsHFz0xba
 pmAw==
X-Gm-Message-State: ABUngvfVZRi+YSLFUWUmGumjNUiWJnx17al4/SEBtKIqb0roVsrE5IOjuDqow0XWINTugqKiG9Y9R1mMxiR9xw==
X-Received: by 10.107.3.223 with SMTP id e92mr174904ioi.113.1478024797529;
 Tue, 01 Nov 2016 11:26:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.164.83 with HTTP; Tue, 1 Nov 2016 11:26:37 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 1 Nov 2016 13:26:37 -0500
Message-ID: <CALLMt=r4DVo266RcWMX+TYqnyxaeT9oLNra==N9wvPmL79hT4g@mail.gmail.com>
Subject: Hardware Continuous Integration
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, cphofer@us.ibm.com
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
X-List-Received-Date: Tue, 01 Nov 2016 18:27:33 -0000

Team,

We've had a fairly regular cadence of commit's getting merged into
master that then break our integration testing on our different
openbmc platforms.  Sometimes the system will no longer boot,
sometimes we can't get to BMC_READY, and other times we completely
corrupt things so bad we have to pull the flash chip and reprogram it.

The solution to preventing this is to ensure these commits don't get
merged (i.e. finding the issue beforehand).  Yes we'll still find the
issue but at least it's only on one system and the change does not
make it out to the broader audience.

We've tried for months within IBM to get some systems in a lab network
configuration that would allow us to expose them to the outside world
(openpower.xyz, docker.com, ...) but we're really not setup to handle
this currently in our lab.  We're going to continue working it but
we'd like to propose an interim solution.

1) We'll have a jenkins master running internally to IBM start
triggering off of gerrit commit's that have passed the initial build
and QEMU run (https://openpower.xyz/job/openbmc-build-gerrit-trigger-multi/)

2) This job will extract the image from openpower.xyz and run it
through a basic hardware CI (code update, verify it boots to
petitboot, verify the basic REST API's) - Note we can add on as needed
later to this test bucket

3) If the job succeeds, we give an additional HW CI +1 Verified to the
gerrit record

4) If it fails, we push the jenkins artifacts (console log, robot test
output) out to a new github repo and put a link to that data in the
gerrit commit.  We do this because the jenkins job will not be
accessible to people outside of IBM.

For the artifact storage, we considered using a dropbox or something
but using github to store the artifacts seems the easiest since it
will just be text files and such.  We can make a cron that
periodically cleans up the older data.

Initially, a failed HW CI would not prevent a merge, it would just be
a hint for people to look at.  We do this because of the current state
of master.  Once we get things more stable, we can discuss making it
mandatory.

Thoughts/Comments?
Andrew
