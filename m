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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lPkd2dL9zDqgF
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 05:30:48 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 8E41F12995A;
 Tue,  7 Aug 2018 15:30:13 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Managing openbmc with subtree
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <9b967642-9c97-c7e5-7114-c024ada10a4f@linux.intel.com>
Date: Tue, 7 Aug 2018 15:30:13 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, prashanth.giri@dell.com,
 sachit_bakshi@dell.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <7B99FD60-9493-4A17-ABF0-D1315D86B1CB@fuzziesquirrel.com>
References: <00e6e0a4-027d-7a9c-ad49-363290e62c68@linux.intel.com>
 <A174348B-515D-48F9-8D41-DD8AD8260006@fuzziesquirrel.com>
 <54643fe1-d382-3df7-8630-bb5e01ea2edb@linux.intel.com>
 <8E5317F7-E0B1-4A2F-B047-52B77E1AD13F@fuzziesquirrel.com>
 <9b967642-9c97-c7e5-7114-c024ada10a4f@linux.intel.com>
To: Dave Cobbley <david.j.cobbley@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2018 19:30:50 -0000


> On Aug 7, 2018, at 1:16 PM, Dave Cobbley =
<david.j.cobbley@linux.intel.com> wrote:
>=20
> I do agree that we can find a scriptable solution to this, however, I =
feel using the OWNERS plugin provides a much easier workflow for all =
developers, i.e. nothing changes from their perspective.

Hrm, while I agree that the OWNERS plugin preserves the existing =
workflow
I=E2=80=99m not convinced that is the best path forward.

>> This gives us the same process for all subtrees, whether or not they =
are
>> openbmc hosted subtrees.  It also does not require people hacking on =
a
>> subtree to clone OpenBMC when it doesn=E2=80=99t make sense for them =
to do that,
>> such as someone just using the Aspeed BSP layer.


I still have these concerns.=
