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
 by lists.ozlabs.org (Postfix) with ESMTPS id 424jzz30RlzF376
 for <openbmc@lists.ozlabs.org>; Wed,  5 Sep 2018 09:42:22 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 0D6396DD32;
 Tue,  4 Sep 2018 19:42:19 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: 
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <7188732f-d2be-ecf9-9a1d-d27593383b14@intel.com>
Date: Tue, 4 Sep 2018 19:42:18 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7DC09EE6-2475-47F4-B43D-34B7FEB94DFE@fuzziesquirrel.com>
References: <CBC60E0B5DD8E642ACEAB425D566671AAFEAFCEC@ORSMSX115.amr.corp.intel.com>
 <01AB2862-40A3-4299-928E-9F39C701DD26@fuzziesquirrel.com>
 <CBC60E0B5DD8E642ACEAB425D566671AAFEAFE8D@ORSMSX115.amr.corp.intel.com>
 <A20568DE-A4DD-4CAF-99F9-C2A69CE1AFEC@fuzziesquirrel.com>
 <39203846-e055-d307-e1ee-8d2948166bac@intel.com>
 <434D87DA-9381-4803-94E9-749E442A0C1B@fuzziesquirrel.com>
 <7188732f-d2be-ecf9-9a1d-d27593383b14@intel.com>
To: Ed Tanous <ed.tanous@intel.com>
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
X-List-Received-Date: Tue, 04 Sep 2018 23:42:24 -0000



> On Sep 4, 2018, at 7:18 PM, Ed Tanous <ed.tanous@intel.com> wrote:
>=20
> On 09/04/2018 03:34 PM, Brad Bishop wrote:
>> ok, then this is my ignorance of IPMI showing.  I thought =
IPMI_SEL_SENSOR_PATH was
>> an IPMI construct...
>> If this is the case then why not just call it SENSOR_PATH?  Then =
other logging formats
>> could use that metadata key without it being weird that it has =
=E2=80=98ipmi_sel=E2=80=99 in the name
>> of it.  And can we apply the same logic to the other keys or do some =
of the other keys
>> have more complicated translation logic (than none at all as in the =
case of the sensor
>> path) ?
>=20
> The thinking was that we would namespace all the parameters using =
IPMI_SEL to make it clear that was the only place they were used, and to =
avoid someone else using it inadvertently. =20
> With that said, I could understand how it could be confusing.  Jason, =
any objections to un-namespacing the parameters?

Thanks for being flexible on this but lets wait until we are on the same =
page before
changing anything.  Why would you want to discourage it from being used =
in another
context?

>=20
>> Thats great!  This is similar to how the phosphor-logging daemon =
creates dbus error
>> objects today.
>> Would you mind elaborating on this daemon and its dbus API?  I=E2=80=99=
m guessing it would probably
>> clear up any concerns I have.
>=20
> Patches to phosphor-dbus-interfaces for a suggested interface are =
being put together as we speak.  Hopefully that will clarify it a little =
bit.

Great, thank you.

>=20
>>> While technically it could be a part of phosphor-logging,
>> That isn=E2=80=99t what I was going for.  If you plan to implement a =
(separate) daemon that acts on
>> the journald metadata I think that is right approach too.
> Agreed.
>=20
>>> we really want it to be easily removable for future platforms that =
have no need for IPMI, so the thought at this time it to keep it =
separate.
>> Agreed.
>>>=20
>>>> Further, if you expand this approach to further log formats other =
than SEL,
>>>> won=E2=80=99t the applications become a mess of translation logic =
from the applications
>>>> data mode <-> log format in use?
>>>=20
>>> I'm not really following this question.  Are there other binary log =
formats that we expect to come in the future that aren't text based, and =
could just be a journald translation?
>> Yes.  We have a binary format called PEL.  I doubt anyone would be =
interested in using
>> it but we need a foundation in OpenBMC that enables us to use it...
>=20
> That makes more sense now.  A quick google on PEL makes it look like =
it could follow a similar model to what we're doing with IPMI by adding =
the extra metadata to journald when needed, while still producing the =
string versions for the basic cases.  By foundation do you mean shared =
code?  A quick skim of the implementation makes me suspect that there =
isn't going to be a lot of shared code, although they could share a =
similar design with a different implementation.

By foundation I simply mean we need a way to support multiple logging =
formats that doesn=E2=80=99t
require every OpenBMC application to know how to translate from its =
internal data model
(usually dbus) to N logging formats.

>=20
>>>  So far as I know, IPMI SEL is the only one on my road map that has =
weird requirements, and needs some translation.
>> Where is the translation happening?  In the new ipmi-sel daemon?  Or =
somewhere else?
>=20
> The translation would happen on the "addSel" IPMI command that gets =
used in-band by most BIOS implementations.  The ipmi-sel daemon will =
translate the raw bytes to a string, to be used in most modern loggers, =
along with the IPMI metadata, to be used in IPMI to source the various =
"get" SEL entry commands.

That all sounds fine.  But what about applications on the BMC creating =
SELs for their
own errors?  Do you want to do that?  How will that work?

>=20
>>>  I don't expect it to be a mess, and I'm running under the =
assumption that _most_ daemons won't care about or support IPMI given =
its limitations.
>> Well _all_ daemons already support IPMI SEL today.  The problem is =
just that the
>> implementation doesn=E2=80=99t scale.  I=E2=80=99m confused by _most_ =
daemons wouldn=E2=80=99t support
>> IPMI?
>=20
> That should've clarified that most daemons won't care about IPMI =
_SEL_, given the extra calls and metadata that needs to be provided to =
implement it correctly.  My teams intention was to support the minimum =
subset of SEL that we can for backward compatibility, while providing =
the advanced logging (journald/syslog/redfish LogService) for a greater =
level of detail and capability.
> If this assumption turns out to not be true, and we end up adding IPMI =
SEL logging to all the daemons, so be it, I think it will still scale, =
but I really hope that's not the path we go down.

Oh.  Does this mean you intend for code like Jason originally proposed =
to _only_ appear in
the ipmi-sel daemon?  And not in applications like phosphor-hwmon?=
