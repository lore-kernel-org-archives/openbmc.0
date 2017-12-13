Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yxksW4r3vzDrcp
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 04:56:47 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <1513187799.30455.14.camel@fuzziesquirrel.com>
Subject: OpenBMC 12/11 community telecon - Minutes
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 13 Dec 2017 12:56:39 -0500
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 13 Dec 2017 17:56:49 -0000

As always, If there are any errors or omissions please just reply with
a correction.

Thx - brad

OpenBMC Community Teleconference 12/11 Minutes
--------------------------------
Brad B
James M
Adriana K
Vernon M
Ratan G
Shivani S
Nancy Y
James F
Jeremey K

Apologies - I know there is at least one person whose name I did not
catch.  Feel free to reply with an addition or correction.

--------

Topics discussed:
 - user management - Vernon M
 - power management - James M
 - Yocto subtrees - James F
 - Kernel update - Nancy Y
 - Meeting next week - Brad B

User management:
 - Vernon continued to lead a discussion around the user management
implementation proposal.
 - https://lists.ozlabs.org/pipermail/openbmc/2017-December/010060.html
 - Three key aspects: dbus API, IPMI PAM module and build abstraction
for package roles.
 - The time to offer feedback is _now_.
 - Brad to respond to proposal with feedback.

Power management:
 - James would like to work on power control.
 - Brief overview on the existing systemd based framework for that.
 - Discussed possibility of a new framework for managing chassis/host
state.
 - Community is open to hearing about alternative state management
frameworks.
 - Brad to provide a dependency graph for the existing framework.

Yocto subtrees:
 - Discussed the longer term direction for making OE updates.
 - Discussed dropping support for openbmc/openbmc with subtrees.

Kernel update:
 - Why was 4.13 chosen?
 - It was the most recent kernel at the point work started.

Next weeks meeting:
 - Do we want a call next week?
 - Yes.
