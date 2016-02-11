Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 71EE31A003C
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 19:44:36 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 452BD14090B
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 19:44:36 +1100 (AEDT)
To: openbmc@lists.ozlabs.org
From: Jeremy Kerr <jk@ozlabs.org>
Subject: Code review and deadlines around initial OpenBMC prototypes
X-Enigmail-Draft-Status: N1110
Message-ID: <56BC49F3.8070809@ozlabs.org>
Date: Thu, 11 Feb 2016 16:44:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Feb 2016 08:44:36 -0000

Hi all,

The IBMers working on OpenBMC are sprinting for a first internal
prototype of the code, with a few functional components still in
development.

Because of this, here's a lot of churn happening at the moment (to get
this prototype launched), but we don't want to let code quality be left
aside as a result.

So, a request to contributors: please take note of any review to your
patch. If you can rework your change in response, please make it a
priority to do so. To save time, most of the folks conducting review are
also available on our IRC channel, #openbmc on irc.freenode.net.

If you see a review for your code *after it has been committed*, and/or
you do not have bandwidth to address the feedback, please file an issue
on the relevant github project. I have created the "code-review" label
on the main openbmc project; please use this for such issues. If you
need it for other github repos, send me a private mail and I'll create one.

During the next few weeks, it'll be especially important to do this, as
we don't want reviews to remain unaddressed after this prototyping work
is complete. Provided we address the issues raised, I don't foresee us
having to continue the issue-filing long-term.

Another note: we have the contribution guidelines available:

  https://github.com/openbmc/docs/blob/master/contributing.md

if you haven't already, please take the time to read this, and follow
the when contributing.

Regards,


Jeremy
