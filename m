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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4287TB2mpwzF37b
 for <openbmc@lists.ozlabs.org>; Mon, 10 Sep 2018 23:01:02 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id A9A3DEA0E0;
 Mon, 10 Sep 2018 09:00:58 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: C++17 support?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAARXrtk8AMsdTfAszZQozpsMUU-JckZmx6Pa7cvYnyD5cgLzVw@mail.gmail.com>
Date: Mon, 10 Sep 2018 09:00:58 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5BCE42E5-A136-480D-846D-7E201AC7734D@fuzziesquirrel.com>
References: <CAARXrtk8AMsdTfAszZQozpsMUU-JckZmx6Pa7cvYnyD5cgLzVw@mail.gmail.com>
To: Lei YU <mine260309@gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
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
X-List-Received-Date: Mon, 10 Sep 2018 13:01:02 -0000



> On Sep 10, 2018, at 3:06 AM, Lei YU <mine260309@gmail.com> wrote:
>=20
> Now we are using GCC 7.3 and it has full C++17 support, although it is
> [experimental][1]
>=20
> Is it suitable for a product to use C++17 instead of C++14 in repos?

It depends on your tolerance for risk and support structure.  So likely
the answer depends on who you ask.

> So I would like to use C++17 in this repo, which then does not require =
any
> code change to enable LinkTimeOptimization.

I don=E2=80=99t have any problem with this.  In fact I much prefer we =
are at the
bleeding edge.  I know that makes it hard for our users (system =
integrators)
to be confident but soon-ish we=E2=80=99ll have a stable release for =
those with lower
risk tolerance.=
