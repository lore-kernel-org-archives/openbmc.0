Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ylwyN4fM9zDqyC
 for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2017 05:56:59 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 19336EA08E
 for <openbmc@lists.ozlabs.org>; Mon, 27 Nov 2017 13:56:54 -0500 (EST)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: OpenBMC 11/20 community telecon - Minutes 
Message-Id: <F3FA5114-3E00-4751-B061-F2085DEDF70D@fuzziesquirrel.com>
Date: Mon, 27 Nov 2017 13:56:53 -0500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Nov 2017 18:57:02 -0000

As always, If there are any errors or omissions please just reply with
a correction.

Thx - brad

OpenBMC Community Teleconference 11/20 Minutes
--------------------------------

Brad B
Andrew J
Joel S
James M
Jeremy K
George K
kurt T
Andrew G
Sai D
Milton M
Nancy Y
Brendan H
Ed T

=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
George - test suite, robot framework.  you can take a look
pick up openbmc upstream images built and do CI test, ci test does code =
update, power on, check user interfaces.
test repository to report automation issues
open bugs if issues are found

Ed - do you do any end 2 end testing comparing results of different test =
cases
  didn=E2=80=99t see any end to ends tests
brad - whats an end to end test
Ed - push power, test leds, check
Ed - george, can you send a link to a test that powers on with ipmi and =
checks rest?

Andrew G - gave overview of repo CI.
	=E2=80=A2 recipe bumps, bitbake build - runs hw CI (subset)

Ed - do you do ac cycle testing?
Andrew G, yes.  george - yes, have robot tests but not fully automated.
Andrew G - issue 2635 - general cleanup
	=E2=80=A2 Ed, phosphor-logging turned off
	=E2=80=A2 Nancy - phosphor-logging is used
	=E2=80=A2 arch could be revisited
	=E2=80=A2 utility improvements - Nancy - we use it during =
bringup

Andrew G - issue 2635 - devops flow
	=E2=80=A2 looking for ways to improve
	=E2=80=A2 Ed - how does the permissions work for server?  Andrew =
- Jenkins slave, ssh key
	=E2=80=A2 Ed - might be able to get some time on a Kubernetes =
cluster.
	=E2=80=A2 Andrew - Qemu - get qemu going again
	=E2=80=A2 Andrew - hardware failures - data in the gerrit link - =
place to put failure data.=20

Andrew - how do we test on other hardware?
	=E2=80=A2 run it internally behind firewall, push failure data =
out to github
	=E2=80=A2 or on the network
	=E2=80=A2 Kurt - open stack does it the first way, talked =
details

Brad - lets do on the list
Andrew - whats the priority
Nancy - test design posted on IRC
Brendan - why docker?  why not OE sdk?
joel - other tools don=E2=80=99t use sdk
Brendan - would be useful to build and test locally

=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
Ed - code review velocity
	=E2=80=A2 patch merged in 14hrs.  question of whats the norm.=20
	=E2=80=A2 brad went over the process

Ed - wants a more stable master branch.  delayed approach to merging =
patches
	=E2=80=A2 either through testing or review, how to keep the =
master branch more stable

Nancy - have you experienced instability?
Ed - User daemon was swapped out
Joel - hard to keep out of tree code stable
Nancy - have similar concerns.
Andrew - how does code sitting in review help?
Ed - testing probably trumps everything?

Brad - how does this work for the kernel?
Jeremy - external ABI - never breaks
	=E2=80=A2 internal API - in tree/out of tree
Joel - little bit different - we have runtime interfaces
Milton - OpenStack does pregate testing, on Linux, two opportunities to =
complain - linux-next, 6-8 weeks of stabilzation
Brad - merge window?
Milton - need more tests though
Nancy - merge window good idea, but personally won=E2=80=99t have test =
infrastructure up for a bit.
Brendan - automated upstream tests sort of invalidates the need for a =
merge window.  could be useful until we get more upstream testing?
Jeremy - can CI infrastructure we handle the bursty nature of a merge =
window?
Andrew - probably.  it might just take awhile to get through.
Brad - send a note to the list about a merge window.

Ed - secure coding guidelines
what are everyones experience with these?  (memcpy vs memcpy_s) ?
brad - what about busybox - ed - exception process, run static analysis =
tools
