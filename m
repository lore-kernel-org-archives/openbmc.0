Return-Path: <brad@bwbmail.net>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0FE3C1A0B21
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2015 11:45:55 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [PATCH openbmc 7/9] Add recipe for host IPMI DBUS to BT
From: Brad Bishop <brad@bwbmail.net>
In-Reply-To: <20151019230157.GJ13316@asimov.austin.ibm.com>
Date: Mon, 19 Oct 2015 20:45:49 -0400
Cc: OpenBMC Patches <patches@stwcx.xyz>,
 openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <DCEAC560-E2AB-4E40-95A2-4B555ECFBACC@bwbmail.net>
References: <1445259405-10312-1-git-send-email-patches@stwcx.xyz>
 <1445259405-10312-8-git-send-email-patches@stwcx.xyz>
 <20151019230157.GJ13316@asimov.austin.ibm.com>
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
X-List-Received-Date: Tue, 20 Oct 2015 00:45:56 -0000

Yes.  I think its just a matter of adding Wants=3Dfoo.service.

I also just noticed that there is a service type that can be set to =
dbus.  It probably makes sense to use that (along with BusName).

> On Oct 19, 2015, at 7:01 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Mon, Oct 19, 2015 at 07:56:43AM -0500, OpenBMC Patches wrote:
>> From: Brad Bishop <bradleyb@us.ibm.com>
>>=20
>> ---
>> .../common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb  | 17 =
+++++++++++++++++
>> .../host-ipmid/host-ipmi-bt/host-ipmi-bt.service        |  8 ++++++++
>> 2 files changed, 25 insertions(+)
>> create mode 100644 =
meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb
>> create mode 100644 =
meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt/host-ipmi-bt=
.service
>>=20
>> diff --git =
a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb =
b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb
>> new file mode 100644
>> index 0000000..830f754
>> --- /dev/null
>> +++ =
b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb
>> @@ -0,0 +1,17 @@
>> +SUMMARY =3D "Phosphor OpenBMC BT to DBUS"
>> +DESCRIPTION =3D "Phosphor OpenBMC BT to DBUS."
>> +PR =3D "r1"
>> +
>> +RDEPENDS_${PN} +=3D "python-subprocess"
>> +
>> +SYSTEMD_SERVICE_${PN} =3D "host-ipmi-bt.service"
>> +
>> +inherit obmc-phosphor-pydbus-service
>> +inherit obmc-phosphor-host-ipmi-hw
>> +
>> +S =3D "${WORKDIR}/git"
>> +SRC_URI +=3D =
"git://github.com/openbmc/skeleton.git;subpath=3Dbin;destsuffix=3Dgit"
>> +SRCREV=3D"${AUTOREV}"
>> +
>> +SCRIPT_NAME =3D "ipmid.py"
>> +INSTALL_NAME =3D "host-ipmi-bt"
>> diff --git =
a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt/host-ipmi-=
bt.service =
b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt/host-ipmi-=
bt.service
>> new file mode 100644
>> index 0000000..dfc0416
>> --- /dev/null
>> +++ =
b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt/host-ipmi-=
bt.service
>> @@ -0,0 +1,8 @@
>> +[Unit]
>> +Description=3DPhosphor OpenBMC BT to DBUS=20
>> +
>> +[Service]
>> +ExecStart=3D/usr/sbin/host-ipmi-bt
>> +
>> +[Install]
>> +WantedBy=3Dmulti-user.target
>> --=20
>> 2.6.0
>>=20
>>=20
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
>=20
> Do we need to start specifying the dbus object provide / require
> statements in the systemd service files?  The two IPMI processes are
> tied together by the objects being provided and I don't think there is
> anything here to show that dependency relationship.
>=20
> --=20
> Patrick Williams
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
