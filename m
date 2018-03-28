Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40B8yF6rTzzF2Hb
 for <openbmc@lists.ozlabs.org>; Thu, 29 Mar 2018 01:14:12 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 5A6768B28D;
 Wed, 28 Mar 2018 10:14:09 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: IPMI Maintainer Call 3/27/2018
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAJoAoZ=gPx28hiWf-07pVczcBCVuroTRSP1OdK+mT4ooY0Nk7A@mail.gmail.com>
Date: Wed, 28 Mar 2018 10:14:09 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1CE89249-4268-45D7-827A-F59A6154A269@fuzziesquirrel.com>
References: <CAJoAoZ=gPx28hiWf-07pVczcBCVuroTRSP1OdK+mT4ooY0Nk7A@mail.gmail.com>
To: Emily Shaffer <emilyshaffer@google.com>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2018 14:14:15 -0000


> On Mar 28, 2018, at 1:22 AM, Emily Shaffer <emilyshaffer@google.com> =
wrote:
> 		=E2=80=A2 Possible for IBM to only apply as downstream =
patch?  (+1 from Vernon & Emily)
> 	=E2=80=A2 What about change to add username (-U) to use ipmitool =
over network?
> 		=E2=80=A2 Vernon: would prefer username was required =
(security concern). RAKP includes username as part of keygen

I would just advise careful consideration here.  If you don=E2=80=99t =
provide people
a path to upstreaming what they want to do, it will lead to forks and
fragmentation.  It doesn=E2=80=99t have to be easy, just possible.

This isn=E2=80=99t a threat - please don=E2=80=99t take it as one.  =
I=E2=80=99m not close enough
to the problem at hand to have a stance on once side or the other.  =
I=E2=80=99m just
pointing out that this is an aspect you should consider when weighing =
the
pros and cons of allowing something to be upstreamed.

I realize my past behavior may not match what I=E2=80=99m saying but in =
the
last year this is a lesson I=E2=80=99ve definitely learned and taken to =
heart.

Maybe to start an in depth outline of what the sticking points are could
be shared and we can all weigh in?
