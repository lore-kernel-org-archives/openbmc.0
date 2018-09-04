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
 by lists.ozlabs.org (Postfix) with ESMTPS id 424hVG1cwSzF37H
 for <openbmc@lists.ozlabs.org>; Wed,  5 Sep 2018 08:35:01 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 554CA6DD32;
 Tue,  4 Sep 2018 18:34:56 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: 
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <39203846-e055-d307-e1ee-8d2948166bac@intel.com>
Date: Tue, 4 Sep 2018 18:34:56 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <434D87DA-9381-4803-94E9-749E442A0C1B@fuzziesquirrel.com>
References: <CBC60E0B5DD8E642ACEAB425D566671AAFEAFCEC@ORSMSX115.amr.corp.intel.com>
 <01AB2862-40A3-4299-928E-9F39C701DD26@fuzziesquirrel.com>
 <CBC60E0B5DD8E642ACEAB425D566671AAFEAFE8D@ORSMSX115.amr.corp.intel.com>
 <A20568DE-A4DD-4CAF-99F9-C2A69CE1AFEC@fuzziesquirrel.com>
 <39203846-e055-d307-e1ee-8d2948166bac@intel.com>
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
X-List-Received-Date: Tue, 04 Sep 2018 22:35:03 -0000



> On Sep 4, 2018, at 5:28 PM, Ed Tanous <ed.tanous@intel.com> wrote:
>=20
> On 09/04/2018 01:46 PM, Brad Bishop wrote:
>> But it seems like you are proposing that every application that wants =
to make
>> a log needs to have the logic to translate its internal data model to =
IPMI speak,
>> so it can make a journal call with all the IPMI metadata populated.  =
Am I
>> understanding correctly?  That doesn=E2=80=99t seem aligned with =
keeping IPMI isolated.
>=20
> I think a key here is that not all logs will be implicitly converted =
to IPMI logs.  Having them be identical was the design that we started =
with, and abandoned because IPMI has some requirements that don't =
cleanly map from a standard syslog/text style to IPMI.
>=20
>=20
>> A concrete example - phosphor-hwmon.  How do you intend to figure out =
something
>> like IPMI_SEL_SENSOR_PATH in the phosphor-hwmon application?  =
Actually it would
>> help quite a bit to understand how each of the fields in your sample =
below would
>> be determined by an arbitrary dbus application (like phosphor-hwmon).
>=20
> I'm not really understanding the root of the question.  If =
phosphor-hwmon is generating a threshold crossing log that stemmed from =
the /xyz/openbmc_project/sensors/my_super_awesome_temp_sensor, then it =
would simply fill that path into the IPMI_SEL_SENSOR_PATH field. =20

ok, then this is my ignorance of IPMI showing.  I thought =
IPMI_SEL_SENSOR_PATH was
an IPMI construct...

If this is the case then why not just call it SENSOR_PATH?  Then other =
logging formats
could use that metadata key without it being weird that it has =
=E2=80=98ipmi_sel=E2=80=99 in the name
of it.  And can we apply the same logic to the other keys or do some of =
the other keys
have more complicated translation logic (than none at all as in the case =
of the sensor
path) ?

> This is the same kind of mapping that the associations produce today, =
but captured in journald instead of the mapper.
>=20
> Our thinking was that we could build either a static library, or a =
dbus daemon to simplify producing IPMI logs.  Because of the IPMI =
requirements around unique record ids, right now we're leaning toward =
the dbus interface with a single daemon responsible for IPMI SEL =
creation.

Thats great!  This is similar to how the phosphor-logging daemon creates =
dbus error
objects today.

Would you mind elaborating on this daemon and its dbus API?  I=E2=80=99m =
guessing it would probably
clear up any concerns I have.

> While technically it could be a part of phosphor-logging,

That isn=E2=80=99t what I was going for.  If you plan to implement a =
(separate) daemon that acts on
the journald metadata I think that is right approach too.

> we really want it to be easily removable for future platforms that =
have no need for IPMI, so the thought at this time it to keep it =
separate.

Agreed.

>=20
>> Further, if you expand this approach to further log formats other =
than SEL,
>> won=E2=80=99t the applications become a mess of translation logic =
from the applications
>> data mode <-> log format in use?
>=20
> I'm not really following this question.  Are there other binary log =
formats that we expect to come in the future that aren't text based, and =
could just be a journald translation?

Yes.  We have a binary format called PEL.  I doubt anyone would be =
interested in using
it but we need a foundation in OpenBMC that enables us to use it...

>  So far as I know, IPMI SEL is the only one on my road map that has =
weird requirements, and needs some translation.

Where is the translation happening?  In the new ipmi-sel daemon?  Or =
somewhere else?

>  I don't expect it to be a mess, and I'm running under the assumption =
that _most_ daemons won't care about or support IPMI given its =
limitations.

Well _all_ daemons already support IPMI SEL today.  The problem is just =
that the
implementation doesn=E2=80=99t scale.  I=E2=80=99m confused by _most_ =
daemons wouldn=E2=80=99t support
IPMI?

> You're right, this isn't intended to be a general solution for all =
binary logging formats, it's intended to be a short term hack while the =
industry transitions away from IPMI and toward something easier to =
generate arbitrarily.
>=20
>> I=E2=80=99d rather have a single approach that works for everyone; =
although, I=E2=80=99m
>> not sure how that would look.
> The single approach is where we started, and weren't able to come up =
with anything that even came close to working in a production sense.  If =
you have ideas here on how this could be built that are cleaner than =
what we're proposing, we're very much interested.

I=E2=80=99m still trying to understand what is being proposed.

>=20
>> This is called top posting, please try to avoid when using the =
mail-list.
>> It makes threaded conversation hard to follow and respond to.  thx.
>=20
> (Ed beats Jason with very big stick)
