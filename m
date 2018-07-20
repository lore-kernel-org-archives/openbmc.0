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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41XJJW4SGTzDq6t
 for <openbmc@lists.ozlabs.org>; Sat, 21 Jul 2018 03:48:10 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 7FFB9129943;
 Fri, 20 Jul 2018 13:47:36 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Managing openbmc with subtree
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <A174348B-515D-48F9-8D41-DD8AD8260006@fuzziesquirrel.com>
Date: Fri, 20 Jul 2018 13:47:36 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <51B2A6D9-CE6E-457B-BF77-09A9EFF139F9@fuzziesquirrel.com>
References: <00e6e0a4-027d-7a9c-ad49-363290e62c68@linux.intel.com>
 <A174348B-515D-48F9-8D41-DD8AD8260006@fuzziesquirrel.com>
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
X-List-Received-Date: Fri, 20 Jul 2018 17:48:12 -0000


> On Jul 20, 2018, at 1:43 PM, Brad Bishop <bradleyb@fuzziesquirrel.com> =
wrote:
>> On Jul 19, 2018, at 4:08 PM, Dave Cobbley =
<david.j.cobbley@linux.intel.com> wrote:
>>=20
>> However at this point, I end up with two commits in the parent repo, =
one with the squashed changes, and a merge commit.
>> I don't know how to do this operation without ending up with a merge =
commit, do you have any advice here?
>=20
> To avoid the merge you can skip the subtree pull (which does a merge) =
and
> instead generate a patch:
>=20
> git cherry-pick =E2=80=94strategy=3Dsubtree -Xsubtree=3Dpath/to/subtree =
<squash-commit>

Oops.  You=E2=80=99ll still have to do the pull and _then_ generate a =
patch and
discard the merge commit.  Have a look here:

=
https://github.com/openbmc/openbmc/blob/master/import-layers/HOWTO-update.=
md=
