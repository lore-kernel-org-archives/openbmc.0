Return-Path: <brad@bwbmail.net>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id AE0D21A0165
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2015 11:13:56 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [PATCH openbmc 4/9] Start host-ipmid on boot
From: Brad Bishop <brad@bwbmail.net>
In-Reply-To: <20151019230005.GI13316@asimov.austin.ibm.com>
Date: Mon, 19 Oct 2015 20:13:50 -0400
Cc: OpenBMC Patches <patches@stwcx.xyz>,
 openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <52A2F832-D5FA-4418-8937-6A071F3304D0@bwbmail.net>
References: <1445259405-10312-1-git-send-email-patches@stwcx.xyz>
 <1445259405-10312-5-git-send-email-patches@stwcx.xyz>
 <20151019230005.GI13316@asimov.austin.ibm.com>
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
X-List-Received-Date: Tue, 20 Oct 2015 00:14:01 -0000

Yep - it still works.

> On Oct 19, 2015, at 7:00 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> Brad, I already did something similar to this.  Can you confirm this
> patch set will still work?
>=20
> On Mon, Oct 19, 2015 at 07:56:40AM -0500, OpenBMC Patches wrote:
>> From: Brad Bishop <bradleyb@us.ibm.com>
>>=20
>> Recipe was not picking up c-daemon which hooks into systemd.
>> Removed quotes from description.
>> ---
>> meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb       =
| 5 ++---
>> .../common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.service =
| 2 +-
>> 2 files changed, 3 insertions(+), 4 deletions(-)
>>=20
>> diff --git =
a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb =
b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
>> index 5e7ad64..5f38eb3 100644
>> --- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
>> +++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
>> @@ -5,17 +5,16 @@ PR =3D "r1"
>>=20
>> inherit obmc-phosphor-license
>> inherit obmc-phosphor-sdbus-service
>> +inherit obmc-phosphor-c-daemon
>>=20
>> SRC_URI +=3D "git://github.com/openbmc/phosphor-host-ipmid"
>>=20
>> SRCREV =3D "98900a99254cd177c8308b63c341f793d2ac119d"
>>=20
>> S =3D "${WORKDIR}/git"
>> +INSTALL_NAME =3D "ipmid"
>>=20
>> do_install() {
>> -        install -m 0755 -d ${D}${sbindir}
>> -        install -m 0755 ${S}/ipmid ${D}${sbindir}/
>> -
>>         install -m 0755 -d ${D}${libdir}/host-ipmid
>>         install -m 0755 ${S}/*.so ${D}${libdir}/host-ipmid/
>>=20
>> diff --git =
a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.s=
ervice =
b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.s=
ervice
>> index 0636f12..ee9ce1a 100644
>> --- =
a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.s=
ervice
>> +++ =
b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.s=
ervice
>> @@ -1,5 +1,5 @@
>> [Unit]
>> -Description=3D"Phosphor OpenBMC IPMI daemon"
>> +Description=3DPhosphor OpenBMC IPMI daemon
>>=20
>> [Service]
>> ExecStart=3D/usr/sbin/ipmid
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
