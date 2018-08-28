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
 by lists.ozlabs.org (Postfix) with ESMTPS id 420G5q6w8rzDrdf
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 03:31:58 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id B0E85E9DC6;
 Tue, 28 Aug 2018 13:31:55 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: meta-google subtree repo
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notyOhkCDeTOJ57edK8z61_6HKDtWahahx-U_fk8JukBctw@mail.gmail.com>
Date: Tue, 28 Aug 2018 13:31:55 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6F027861-92AD-46AC-83AE-61D7C7E0A794@fuzziesquirrel.com>
References: <CAO=notyOhkCDeTOJ57edK8z61_6HKDtWahahx-U_fk8JukBctw@mail.gmail.com>
To: Patrick Venture <venture@google.com>
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
X-List-Received-Date: Tue, 28 Aug 2018 17:32:00 -0000



> On Aug 28, 2018, at 12:19 PM, Patrick Venture <venture@google.com> =
wrote:
>=20
> Brad,
>=20
> I'm looking to send some more OEM IPMI code upstream, and since we're
> using subtrees, perhaps it makes sense to have their recipes live
> under meta-google under openbmc/openbmc instead of meta-phosphor.
>=20
> If you think sure, then please create a meta-google layer repository.
>=20

Done.  Once you have merged an initial patch please let me know and =
I=E2=80=99ll
add it to the combo-layer config I have setup for assembling =
openbmc/openbmc.

-brad

> Patrick
