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
 by lists.ozlabs.org (Postfix) with ESMTPS id 429VYb0S7xzF3HN
 for <openbmc@lists.ozlabs.org>; Thu, 13 Sep 2018 04:24:33 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 19CAD6DBA3;
 Wed, 12 Sep 2018 14:24:30 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: New Library SOP
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notyNQDxqa_DZtfLJxO2NE04gqgpzZGi0Q_HHgCKkRDVSgw@mail.gmail.com>
Date: Wed, 12 Sep 2018 14:24:29 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6E182BAD-47B8-4290-8754-2DA4E843145F@fuzziesquirrel.com>
References: <CAO=notyNQDxqa_DZtfLJxO2NE04gqgpzZGi0Q_HHgCKkRDVSgw@mail.gmail.com>
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
X-List-Received-Date: Wed, 12 Sep 2018 18:24:35 -0000



> On Sep 11, 2018, at 8:41 PM, Patrick Venture <venture@google.com> =
wrote:
>=20
> Brad;
>=20
> William contributed two libraries by building them as a repo under his
> personal work account first, and then presumably you mirrored from
> them.  Is this the process you prefer?  I'm looking to do some
> cleanup-by-library and wanted to take off in the right direction.

I don=E2=80=99t think I have a preferred process.  The one you have =
described should
work fine.  Otherwise I can just create a new repo.  I suppose it is a =
bit
easier for people to leave feedback that way?=
