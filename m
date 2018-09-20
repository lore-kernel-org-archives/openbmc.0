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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42GGxm27RzzF3L5
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 22:58:35 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 9D072E9F93;
 Thu, 20 Sep 2018 08:58:31 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: subtree patches
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notzGm3D-ug6OdeFiFTv8RFpoSWRVMusFBSrELe8RHRa2ag@mail.gmail.com>
Date: Thu, 20 Sep 2018 08:58:31 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F6D94198-16AA-4744-A888-8243D2EADE2D@fuzziesquirrel.com>
References: <CAO=notzGm3D-ug6OdeFiFTv8RFpoSWRVMusFBSrELe8RHRa2ag@mail.gmail.com>
To: Patrick Venture <venture@google.com>
X-Mailer: Apple Mail (2.3445.9.1)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Sep 2018 12:58:36 -0000



> On Sep 19, 2018, at 8:55 PM, Patrick Venture <venture@google.com> =
wrote:
>=20
> Brad;
>=20
> Did you want us to generate the patches

I don=E2=80=99t think so - at the moment I think it would be a bit error =
prone
to have multiple people generating these patches.

> to openbmc/openbmc when we update a subtree or do you have an =
automated
> process to pick up the changes?

I don=E2=80=99t have an automated process either.  I _do_ have a =
process, and
on my todo list is:

1 - Document it (so others can do it when I=E2=80=99m not around)
2 - Automate it (so it takes less of my time to maintain)

Is this satisfactory?=
