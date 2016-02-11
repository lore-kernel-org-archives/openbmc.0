Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 26BCE1A0038
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 08:15:45 +1100 (AEDT)
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 11 Feb 2016 14:15:43 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 11 Feb 2016 14:15:42 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 5FF811FF0027
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 14:03:51 -0700 (MST)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1BLFfsX27197440
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 14:15:41 -0700
Received: from d03av02.boulder.ibm.com (localhost [127.0.0.1])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1BLFfEe032588
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 14:15:41 -0700
Received: from birb.localdomain ([9.83.0.6])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u1BLFVrI031244; Thu, 11 Feb 2016 14:15:39 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id 4087E2286E20; Fri, 12 Feb 2016 08:15:28 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Chris Austen <austenc@us.ibm.com>
Cc: andrew@aj.id.au, openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid v2] IPMI Get IP Support
In-Reply-To: <201602110544.u1B5ilIu004589@d03av01.boulder.ibm.com>
References: <87io1vq04t.fsf@linux.vnet.ibm.com>
 <1455140430-32605-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455140430-32605-2-git-send-email-openbmc-patches@stwcx.xyz>
 <1455152677.3153.81.camel@aj.id.au>
 <201602110544.u1B5ilIu004589@d03av01.boulder.ibm.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Fri, 12 Feb 2016 08:15:28 +1100
Message-ID: <87vb5vne33.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16021121-0017-0000-0000-0000120BFB6C
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
X-List-Received-Date: Thu, 11 Feb 2016 21:15:46 -0000

Chris Austen <austenc@us.ibm.com> writes:
> Open an issue to migrate to inet_pton.

Fixing such things in code review is a much better approach.

For the submitter, it helps get quick feedback on tehir code, and
promotes a culture of examining your own code closely for things before
submitting it.

For maintainers and those who hare going to have to debug the systems,
it means that it's *very* quick and cheap (in time) to point out odd
things.

Opening issues is approximately an order of magnitude slower.

I can hit reply, type ten words and hit send in maybe a few seconds. For
an issue, you're adding a couple of seconds in network round trip to
browse to the project, go to issues, click create issue, then type a
whole description of the problem because you don't have the context of
what you're trying to reply to, and then manage the issue by adding
tags, target releases, closing it when something is finally merged (and
having the submitter have to open another pull request and keep track of
it)... Urgh.

Good code review provides a positive feedback loop of improvement to
code with a positive reinforcement at the end of "patch merged!"
Contrast this to the negative re-inforcement of filing bugs, of which
there is little to no direct motivation for the code author to go and fix.

-- 
Stewart Smith
OPAL Architect, IBM.
