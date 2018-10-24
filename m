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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42g8GZ4tm7zDrL3
 for <openbmc@lists.ozlabs.org>; Wed, 24 Oct 2018 23:10:29 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 452886DC97;
 Wed, 24 Oct 2018 08:04:10 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.0 \(3445.100.39\))
Subject: Re: REST  / curl command to know which user currently logged in
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
X-Priority: 3 (Normal)
In-Reply-To: <OF515C5E8D.9972A4A3-ON0025832F.001D45F2-0025832F.001D84D6@notes.na.collabserv.com>
Date: Wed, 24 Oct 2018 08:04:09 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4D569175-C76C-434E-8508-701673556575@fuzziesquirrel.com>
References: <OF515C5E8D.9972A4A3-ON0025832F.001D45F2-0025832F.001D84D6@notes.na.collabserv.com>
To: Sivas Srr <sivas.srr@in.ibm.com>
X-Mailer: Apple Mail (2.3445.100.39)
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
X-List-Received-Date: Wed, 24 Oct 2018 12:10:31 -0000



> On Oct 23, 2018, at 1:22 AM, Sivas Srr <sivas.srr@in.ibm.com> wrote:
>=20
> Hi All,
> =20
> Is there a way to find out using REST / curl command to know which =
user currently logged in.

I don=E2=80=99t think so.  It would be a good feature to have though.

> =20
> If multiple login happens (say 2 user logged in root and another LDAP =
user),
> I am seeing the last login is the one taking the control.
> =20
> And also one logout it logs out both the users.

These sound like bugs to me.

> =20
> It will be helpful if we have command to find out which user currently =
logged in via curl / REST.
> If anyone knows / other method to find out, pls let know.
> =20
> Thank you in advance folks.
>=20
