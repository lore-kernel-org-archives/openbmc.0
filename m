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
 by lists.ozlabs.org (Postfix) with ESMTPS id 420GjS553vzDqC3
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 03:59:24 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 867ACEA050;
 Tue, 28 Aug 2018 13:59:21 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: 
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CBC60E0B5DD8E642ACEAB425D566671AAFEAFCEC@ORSMSX115.amr.corp.intel.com>
Date: Tue, 28 Aug 2018 13:59:21 -0400
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <01AB2862-40A3-4299-928E-9F39C701DD26@fuzziesquirrel.com>
References: <CBC60E0B5DD8E642ACEAB425D566671AAFEAFCEC@ORSMSX115.amr.corp.intel.com>
To: "Bills, Jason M" <jason.m.bills@intel.com>
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
X-List-Received-Date: Tue, 28 Aug 2018 17:59:25 -0000



> On Aug 28, 2018, at 1:34 PM, Bills, Jason M <jason.m.bills@intel.com> =
wrote:
>=20
> I just added a comment to a github discussion about the IPMI SEL and =
thought I should share it here as well:

Can you send a link to the issue?

>=20
> I have been working on a proof-of-concept to move the IPMI SEL entries =
out of D-Bus into journald instead.
>=20
> Since journald allows custom metadata for log entries, I've thought of =
having the SEL message logged to the journal and using metadata to store =
the necessary IPMI info associated with the entry. Here is an example of =
logging a type 0x02 system event entry to journald:
>=20
> sd_journal_send("MESSAGE=3D%s", message.c_str(),
>                            "PRIORITY=3D%i", selPriority,
>                            "MESSAGE_ID=3D%s", selMessageId,
>                            "IPMI_SEL_RECORD_ID=3D%d", recordId,
>                            "IPMI_SEL_RECORD_TYPE=3D%x", selSystemType,
>                            "IPMI_SEL_GENERATOR_ID=3D%x", genId,
>                            "IPMI_SEL_SENSOR_PATH=3D%s", path.c_str(),
>                            "IPMI_SEL_EVENT_DIR=3D%x", assert,
>                            "IPMI_SEL_DATA=3D%s", selDataStr,
>                            NULL);
> Using journald should allow for scaling to more SEL entries which =
should also enable us to support more generic IPMI behavior such as the =
Add SEL command.

A design point of OpenBMC from day one was to not design it around IPMI.
At a glance this feels counter to that goal.

I=E2=80=99m not immediately opposed to moving our error logs out of =
DBus, but can you provide
an extendible abstraction?  Not everyone uses SEL, or IPMI even.  At a =
minimum please
drop the letters =E2=80=98ipmi=E2=80=99 and =E2=80=98sel=E2=80=99 :-) =
from the base design, and save those for something
that translates to IPMI-speak.

As some background, our systems tend towards fewer =E2=80=98error =
logs=E2=80=99 with much more data per
log (4-16k), and yes I admit the current design is biased towards that =
and does not scale
when we approach 1000s of small SEL entries.

thx - brad

>=20
> -Jason
