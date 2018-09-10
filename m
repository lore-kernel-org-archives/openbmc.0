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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4287Cg4pC6zF2QL
 for <openbmc@lists.ozlabs.org>; Mon, 10 Sep 2018 22:49:19 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 42D83EA0E0;
 Mon, 10 Sep 2018 08:49:16 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: phosphor-ipmi-blobs
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=noty5q98Vzhi-cCdf0DtdMFiCrQv8HUor6G8kjDinovrRUg@mail.gmail.com>
Date: Mon, 10 Sep 2018 08:49:15 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EBD6A54B-2862-4DF8-9E03-5343C29349DF@fuzziesquirrel.com>
References: <CAO=noty5q98Vzhi-cCdf0DtdMFiCrQv8HUor6G8kjDinovrRUg@mail.gmail.com>
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
X-List-Received-Date: Mon, 10 Sep 2018 12:49:20 -0000



> On Sep 7, 2018, at 7:51 PM, Patrick Venture <venture@google.com> =
wrote:
>=20
> If there is a phosphor-ipmi-blobs repository, I can push what code =
base in one
> patchset along with the design in markdown.

Sure.  I=E2=80=99ll wait a couple days for anyone with any objections to =
speak up.  Please
remind me if I forget :-)=
