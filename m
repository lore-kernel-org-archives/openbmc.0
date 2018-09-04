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
 by lists.ozlabs.org (Postfix) with ESMTPS id 424f5S0TLtzF37H
 for <openbmc@lists.ozlabs.org>; Wed,  5 Sep 2018 06:46:51 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 0731F6DD32;
 Tue,  4 Sep 2018 16:46:47 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: 
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CBC60E0B5DD8E642ACEAB425D566671AAFEAFE8D@ORSMSX115.amr.corp.intel.com>
Date: Tue, 4 Sep 2018 16:46:47 -0400
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A20568DE-A4DD-4CAF-99F9-C2A69CE1AFEC@fuzziesquirrel.com>
References: <CBC60E0B5DD8E642ACEAB425D566671AAFEAFCEC@ORSMSX115.amr.corp.intel.com>
 <01AB2862-40A3-4299-928E-9F39C701DD26@fuzziesquirrel.com>
 <CBC60E0B5DD8E642ACEAB425D566671AAFEAFE8D@ORSMSX115.amr.corp.intel.com>
To: "Bills, Jason M" <jason.m.bills@intel.com>,
 Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 04 Sep 2018 20:46:52 -0000

> On Aug 28, 2018, at 7:26 PM, Bills, Jason M <jason.m.bills@intel.com> =
wrote:
>=20
> Here is a link to the issue: =
https://github.com/openbmc/openbmc/issues/3283#issuecomment-414361325.
>=20
> The main things that started this proof-of-concept are that we have =
requirements to be fully IPMI compliant and to support 4000+ SEL =
entries.  Our attempts to scale the D-Bus logs to that level were not =
successful, so we started considering directly accessing journald as an =
alternative.
>=20
> So far, I've been focused only on IPMI SEL, so I hadn't considered =
extending the change to non-IPMI error logs; however, these IPMI SEL =
entries should still fit in well as a subset of all other error logs =
which could also be moved to the journal.
>=20
> My goal is to align with the OpenBMC design and keep anything =
IPMI-related isolated only to things that care about IPMI. =20

But it seems like you are proposing that every application that wants to =
make
a log needs to have the logic to translate its internal data model to =
IPMI speak,
so it can make a journal call with all the IPMI metadata populated.  Am =
I
understanding correctly?  That doesn=E2=80=99t seem aligned with keeping =
IPMI isolated.

A concrete example - phosphor-hwmon.  How do you intend to figure out =
something
like IPMI_SEL_SENSOR_PATH in the phosphor-hwmon application?  Actually =
it would
help quite a bit to understand how each of the fields in your sample =
below would
be determined by an arbitrary dbus application (like phosphor-hwmon).

Further, if you expand this approach to further log formats other than =
SEL,
won=E2=80=99t the applications become a mess of translation logic from =
the applications
data mode <-> log format in use?

> My thinking was that the metadata is a bit like background info, so it =
is a good place to hide data that only matters to the minority, such as =
the IPMI-specific data.  With this, the IPMI SEL logs can be included =
among all the existing error logs but still have the metadata for =
additional IPMI stuff that doesn't matter for anyone else.
>=20
> So, for writing logs:
> A. non-IPMI error logs can be written as normal
> B. IPMI SEL entries are written with the IPMI-specific metadata =
populated
>=20
> For reading logs:
> A. non-IPMI readers see IPMI SEL entries as normal text logs
> B. IPMI readers dump just the IPMI SEL entries and get the associated =
IPMI-specific info from the metadata

I=E2=80=99d rather have a single approach that works for everyone; =
although, I=E2=80=99m
not sure how that would look.

>=20
> Thanks,
> -Jason

This is called top posting, please try to avoid when using the =
mail-list.
It makes threaded conversation hard to follow and respond to.  thx.

>=20
> -----Original Message-----
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>=20
> Sent: Tuesday, August 28, 2018 10:59 AM
> To: Bills, Jason M <jason.m.bills@intel.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re:=20
>=20
>=20
>=20
>> On Aug 28, 2018, at 1:34 PM, Bills, Jason M <jason.m.bills@intel.com> =
wrote:
>>=20
>> I just added a comment to a github discussion about the IPMI SEL and =
thought I should share it here as well:
>=20
> Can you send a link to the issue?
>=20
>>=20
>> I have been working on a proof-of-concept to move the IPMI SEL =
entries out of D-Bus into journald instead.
>>=20
>> Since journald allows custom metadata for log entries, I've thought =
of having the SEL message logged to the journal and using metadata to =
store the necessary IPMI info associated with the entry. Here is an =
example of logging a type 0x02 system event entry to journald:
>>=20
>> sd_journal_send("MESSAGE=3D%s", message.c_str(),
>>                           "PRIORITY=3D%i", selPriority,
>>                           "MESSAGE_ID=3D%s", selMessageId,
>>                           "IPMI_SEL_RECORD_ID=3D%d", recordId,
>>                           "IPMI_SEL_RECORD_TYPE=3D%x", selSystemType,
>>                           "IPMI_SEL_GENERATOR_ID=3D%x", genId,
>>                           "IPMI_SEL_SENSOR_PATH=3D%s", path.c_str(),
>>                           "IPMI_SEL_EVENT_DIR=3D%x", assert,
>>                           "IPMI_SEL_DATA=3D%s", selDataStr,
>>                           NULL);
>> Using journald should allow for scaling to more SEL entries which =
should also enable us to support more generic IPMI behavior such as the =
Add SEL command.
>=20
> A design point of OpenBMC from day one was to not design it around =
IPMI.
> At a glance this feels counter to that goal.
>=20
> I=E2=80=99m not immediately opposed to moving our error logs out of =
DBus, but can you provide an extendible abstraction?  Not everyone uses =
SEL, or IPMI even.  At a minimum please drop the letters =E2=80=98ipmi=E2=80=
=99 and =E2=80=98sel=E2=80=99 :-) from the base design, and save those =
for something that translates to IPMI-speak.
>=20
> As some background, our systems tend towards fewer =E2=80=98error =
logs=E2=80=99 with much more data per log (4-16k), and yes I admit the =
current design is biased towards that and does not scale when we =
approach 1000s of small SEL entries.
>=20
> thx - brad
>=20
>>=20
>> -Jason
