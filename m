Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ycg5c0xHnzDqpF
 for <openbmc@lists.ozlabs.org>; Thu, 16 Nov 2017 10:08:02 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 85B83975BD
 for <openbmc@lists.ozlabs.org>; Wed, 15 Nov 2017 18:07:55 -0500 (EST)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: OpenBMC 11/15 community telecon - Minutes
Message-Id: <A562B1E0-8E53-4150-9C4D-DFE87797C39E@fuzziesquirrel.com>
Date: Wed, 15 Nov 2017 18:07:55 -0500
To: OpenBMC <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 15 Nov 2017 23:08:04 -0000

Thx to the individual that provided me with these comprehensive minutes!

As always, If there are any errors or omissions please just reply with
a correction

Thx - brad


OpenBMC Community Teleconference 11/6 Minutes
--------------------------------
New attendees, so introductions:

Brad, Jeremy.
Andrew and Joel
James from Intel joining for first time.
Anoop from Intel joining for first time.
Brad
Joel - IBM - kernel
Jeremy - IBM - kernel
Adriana - IBM - userspace
Chris Bostic - IBM - mostly kernel stuff
Eddie - IBM - pretty much same thing as Chris...some userspace
Andrew Jeffery - IBM - kernel
Ed - tech lead at Intel
Anoop - Intel - OpenBMC manager
James M... BMC firmware team lead ... work with Ed and Anoop at Intel
Brandon - IBM - userspace
Anyone else out there that wants to say hi?
Milton - IBM - kernel
Nancy - Google

Topics:

1 - Joel go first - New kernel.

Please get any patches not upstream...cherry-pick them back.
2 months ago - plan to get updated. :-P
Nancy - still trying move to 4.10 and get stable. =20
some regressions...need to track that down
Patrick been doing a lot of that work ...

2 - Nancy - testing.

Plans to put anymore tests...
Brad - 1/2 application repos have a Jenkins script ... runs ... make =
check,
downloads dependencies, as described in configure.ac.
environment setup
builds in x86 context
runs test
A number of tests use gtest. as well as gmock.
Jenkins should be leaving notes in there ... CI ... if not seeing =
messages, then that repository probably
doesn't have one.
Ones that don't have it would by something like python, or any =
non-autotools based repositories.
Nancy - like to get a better idea of what kind of code coverage we have.
...
Brad - there is an integration test suite out there ... not sure how =
suitable it is ...
Joel - something about bare metal testing, host side ... corner cases =
...
[@arj pointer to https://github.com/open-power/op-test-framework]
Jeremy - get George on next time? ...
Nancy - Is there any problem with making those test results public?
Robot tests did not seem very comprehensive...
Brad - ...will get George on next time ... make results publicly =
available...
We are going to need a distributed test model anyway.
Ed - ...has any one looked at lava server?
....
Nancy - Anoop, do we have a test plan that we can publish for OpenBMC?
....
Anoop not, as of now.  Will see what can be made available.

Brad - Nancy sharing a plan, George coming next week on what IBM does.
Brad - I don't think there is ... we are going to bring an IBM guy to =
the next call.=20
How IBM tests internally=E2=80=A6.will ask if anything written down that =
we can make available.
Anything else on testing?

3 - Brendan - host ipmid maintainer

Brendan - Not able to maintain Host IPMID.
Brad - Bummer
Brad - Still looking for lots of maintainers.

4 - Adriana - inland update
Adriana - firmware update, next phase is in-band...send an image from =
the host to the BMC.
...what should we use for a protocol...send from host over to the BMC...
mailbox version 3 protocol...
reference board, ... or some other protocol?
....
IPMI spec does not define how to do updates...
HPM?
client side of ...
[
https://en.wikipedia.org/wiki/HPM.1
https://www.picmg.org/openstandards/hardware-platform-management/
]
....
Ed - ... PCIe enabled, how long does the image update take?
Nancy - less than 2 minutes...? I can get back to you on that, post it =
on IRC....
Brad - out of time here ... minute or two to wrap up.=20
Adriana, sounds like ah, lets work with Joel and Nancy...from there we =
go to some kind of proposal out on the list.
...
Adriana - Yeah, that works.

Wrap up

Brad - ...not certain on the status of next weeks call...IRC, send out a =
note....
Nancy - ... December ...=20
Brad - ...a ton of people on this call will be on vacation ... probably =
keep them going in=20
December...lower turn out ...=20
Adriana - ...no topics, cancel...
Brad - any last words?
Nancy - It would be useful to have the phone number in the call for =
topics.
Nancy - No calendar invite ...
Brad - ... IBM having for over a year ... did not send calendar invites =
to everybody...
if want to maintain list of calendar invites...=20
Nancy - ...I keep losing the number ....
Brad - ...Milton had suggested putting in the notes I send out ...
...its completely open....
I will start sending out the call out information on any note ...
alright...have a good night.
