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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40BS9X3VKbzDqGZ
 for <openbmc@lists.ozlabs.org>; Thu, 29 Mar 2018 12:39:59 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 66EF68B27B;
 Wed, 28 Mar 2018 21:39:54 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Sdbusplus-based Shared Library
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notyvGn_nO1KgffBgukXy7hFt1VHnop26HpgJjJELeJMnow@mail.gmail.com>
Date: Wed, 28 Mar 2018 21:39:54 -0400
Cc: Ratan Gupta <ratagupt@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>, Ratan K Gupta <ratagupt@in.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Tanous, Ed" <ed.tanous@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <ED94F738-2C50-416D-826B-82BE0D1B0E94@fuzziesquirrel.com>
References: <CAO=notwXV+EaWJqV61qkZaDSA3mxMhpXbq3iWUqRp2Qg52wMGA@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E82169932F66E12E@ORSMSX114.amr.corp.intel.com>
 <CAO=notwojtUMU920tTuG0-OyhTFGSZc0gAk21D+xSr=Kq1Tjiw@mail.gmail.com>
 <1522129666.717269.1317238976.0CC07922@webmail.messagingengine.com>
 <55311786-8102-56c1-4c95-a5ede5502277@linux.vnet.ibm.com>
 <CAO=notyvGn_nO1KgffBgukXy7hFt1VHnop26HpgJjJELeJMnow@mail.gmail.com>
To: Patrick Venture <venture@google.com>
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
X-List-Received-Date: Thu, 29 Mar 2018 01:40:01 -0000


> On Mar 27, 2018, at 11:43 AM, Patrick Venture <venture@google.com> =
wrote:
>=20
> Brad,
>=20
> If you create a repository - phosphor-sdbus-utils or
> phosphor-sdbusplus-utils or something like that, I'll put together a
> starter pack on this and submit for review.

May I suggest

https://github.com/openbmc/phosphor-dbus-monitor/tree/master/src/sdevent

as a possibility for drawing ideas?  :-)

>=20
> Patrick

Thanks Patrick! will do but I=E2=80=99d like to get a bit more =
clarity/discussion
on what the content of this new repo will be.

So today we have sdbusplus built around the sd-bus folder in libsystemd.

Do we envision something like separate repos for:

sdeventplus - wrappers for the sd-event folder in libsystemd
sddeviceplus - wrappers for the sd-device folder in libsystemd
=E2=80=A6etc

Or should we just try and have a single c++ wrapper repository for all =
of
libsystemd?  In that case should we simply rename sdbusplus to =
libsystemdpp
and start putting more code in it?

-brad=
