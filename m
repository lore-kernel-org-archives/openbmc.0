Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C9AF31A078B
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 15:58:45 +1100 (AEDT)
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 2 Dec 2015 23:58:42 -0500
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 2 Dec 2015 23:58:39 -0500
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 54FD96E803F
 for <openbmc@lists.ozlabs.org>; Wed,  2 Dec 2015 23:46:48 -0500 (EST)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tB34wcgL22216802
 for <openbmc@lists.ozlabs.org>; Thu, 3 Dec 2015 04:58:38 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tB34wcca015271
 for <openbmc@lists.ozlabs.org>; Wed, 2 Dec 2015 23:58:38 -0500
Received: from birb.localdomain ([9.81.201.11])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 tB34wQxs014712; Wed, 2 Dec 2015 23:58:37 -0500
Received: by birb.localdomain (Postfix, from userid 1000)
 id A916A224DCAD; Thu,  3 Dec 2015 15:58:24 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org
Subject: Re: Testing
In-Reply-To: <20151202105059.1ebcc4dc@camb691>
References: <20151202105059.1ebcc4dc@camb691>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Thu, 03 Dec 2015 15:58:24 +1100
Message-ID: <87k2owgmbz.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15120304-0041-0000-0000-00000296C7E9
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
X-List-Received-Date: Thu, 03 Dec 2015 04:58:46 -0000

Cyril Bur <cyrilbur@gmail.com> writes:
> I'd like to open some discussion about testing. I honestly haven't given that
> much thought to big picture testing but I can describe what I'm doing to
> btbridged to at least have something. I'm sure everyone has ideas as to which
> direction the testing should be going and what we should be doing and this is
> the conversation I would like to start.

There's a number of different levels of things too. I know Chris has
been fairly involved in testing the end user REST API with robotest and
the like, although what you're mostly talking about here is unit tests
and other such smaller box tests.

> At the moment it is almost impossible to test btbridged, short of actually
> booting a real openbmc and making the host to something and through observation
> try to see that all went well there really isn't a way of knowing if changes
> work.

funnily enough, we have that problem with skiboot too. Especially for
hardware that doesn't physically exist yet.

> Joel kindly added a .travis.yml (travis-ci.org can automate) file to the
> project to at least have compile checks, which is a great start. I'm currently
> expanding on it so include a 'fake' bt-host and a trivial ipmi client. I don't
> expect these tests to get too fancy but I do hope they'll be able to catch
> broken commits. Future direction might be to have everything done in qemu so
> that the 'fake' environment is closer to the real thing, doing so in qemu would
> also allow us to test the bt-host driver in linux.

Good idea.

btw, if you adopted autotools, you could get parallel test running for
free :)
