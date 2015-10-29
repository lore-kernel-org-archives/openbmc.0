Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 16A231A0AB1
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 06:57:21 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [PATCH openbmc v3 0/3] rest/mapper recipes
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20151029194329.GF31364@asimov.austin.ibm.com>
Date: Thu, 29 Oct 2015 15:57:14 -0400
Cc: OpenBMC Patches <patches@stwcx.xyz>,
 openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B71F29EF-6771-4338-9EE5-12E841C1A7DA@fuzziesquirrel.com>
References: <1446140725-11766-1-git-send-email-patches@stwcx.xyz>
 <20151029194329.GF31364@asimov.austin.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Oct 2015 19:57:22 -0000

I already updated them.  My latest mapper pull-req was merged though so =
I=E2=80=99ll bump that.

> On Oct 29, 2015, at 3:43 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> Patch-set looks fine.  Will merge after SRCREV updates.
>=20
> On Thu, Oct 29, 2015 at 12:45:22PM -0500, OpenBMC Patches wrote:
>> These aren't being included in the image at the moment.  They can be =
merged without causing any problems.
>>=20
>> Once my mapper/rest source code pulls have been merged I will follow =
up with another pull here to add it to the image and set the SRCREV in =
these recipes.
>>=20
>> https://github.com/openbmc/openbmc/pull/40
>>=20
>> Brad Bishop (3):
>>  Add object manager recipe
>>  Add REST server recipe
>>  Add rest server and mapper to image
>>=20
>> .../common/recipes-phosphor/dbus/obmc-mapper.bb    | 25 =
++++++++++++++++++++++
>> .../dbus/obmc-mapper/obmc-mapper.service           | 10 +++++++++
>> .../dbus/obmc-mapper/org.openbmc.ObjectMapper.conf |  8 +++++++
>> .../common/recipes-phosphor/dbus/obmc-rest.bb      | 24 =
+++++++++++++++++++++
>> .../dbus/obmc-rest/obmc-rest.service               | 10 +++++++++
>> .../packagegroup-obmc-phosphor-apps.bb             |  1 +
>> 6 files changed, 78 insertions(+)
>> create mode 100644 =
meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb
>> create mode 100644 =
meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/obmc-mapper.service=

>> create mode 100644 =
meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper/org.openbmc.ObjectM=
apper.conf
>> create mode 100644 =
meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
>> create mode 100644 =
meta-phosphor/common/recipes-phosphor/dbus/obmc-rest/obmc-rest.service
>>=20
>> --=20
>> 2.6.0
>>=20
>>=20
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
>=20
> --=20
> Patrick Williams
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
