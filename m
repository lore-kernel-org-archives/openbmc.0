Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wR1zw20jnzDqLh
 for <openbmc@lists.ozlabs.org>; Mon, 15 May 2017 10:44:12 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4F0hj3l081969
 for <openbmc@lists.ozlabs.org>; Sun, 14 May 2017 20:44:06 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2aedxmgqx8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 14 May 2017 20:44:06 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Sun, 14 May 2017 20:44:05 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sun, 14 May 2017 20:44:03 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4F0i2jS11010392; Mon, 15 May 2017 00:44:02 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E232124047;
 Sun, 14 May 2017 20:43:57 -0400 (EDT)
Received: from [9.85.164.62] (unknown [9.85.164.62])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS id C636A12403F;
 Sun, 14 May 2017 20:43:56 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH linux dev-4.7] arm: configs: aspeed: Disable
 CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
In-Reply-To: <f47cd08e-5ceb-5d41-4975-d689d2ebba3b@kaod.org>
Date: Sun, 14 May 2017 19:41:39 -0500
Cc: Joel Stanley <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
References: <1493913487-7482-1-git-send-email-anoo@linux.vnet.ibm.com>
 <14B306E8-EFC9-4BD5-B2DD-D892CB459439@linux.vnet.ibm.com>
 <CACPK8XeNtDWLmx2qeHshd=Bg4JCNLd45CriVYLuNmGOMb-qqdg@mail.gmail.com>
 <f47cd08e-5ceb-5d41-4975-d689d2ebba3b@kaod.org>
To: =?utf-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
X-Mailer: Apple Mail (2.3273)
X-TM-AS-GCONF: 00
x-cbid: 17051500-0048-0000-0000-00000181E4CF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007062; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000211; SDB=6.00860541; UDB=6.00426723; IPR=6.00640213; 
 BA=6.00005347; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015455; XFM=3.00000015;
 UTC=2017-05-15 00:44:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17051500-0049-0000-0000-00004120BCA4
Message-Id: <7B0513B8-3B71-42AD-B9D5-2F05E7B000C2@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-14_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705150007
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 15 May 2017 00:44:12 -0000


> On May 13, 2017, at 3:49 PM, C=C3=A9dric Le Goater <clg@kaod.org> =
wrote:
>=20
> On 05/11/2017 02:12 PM, Joel Stanley wrote:
>> On Thu, May 11, 2017 at 7:31 AM, Adriana Kobylak
>> <anoo@linux.vnet.ibm.com> wrote:
>>> Milton stopped by and mentioned that you had tried to modify the 4K =
erase
>>> sector previously for a perhaps bmc chip and saw some flash =
corruption when
>>> moving to an image that changed it?
>>>=20
>>> Just wanted to add that this change only changes the pnor setting =
and I
>>> didn=E2=80=99t see any issues powering on a system after updating =
the BMC with an
>>> image with this change. Then I updated the pnor with an image that =
had the
>>> mbox enabled. Also checked with AndrewJ and the hostboot team and =
there=E2=80=99s no
>>> hard-coded assumptions in their side about the erase size.
>>>=20
>>> With all this info let me know if you have any thoughts or concerns.
>>=20
>> I recall issues relating to this option. I didn't record what they =
were=20
>> though.
>=20
> We tried to activate 4K erase on some chips, which supported it,=20
> and that the OpenPOWER systems use. That was because the PNOR=20
> sections were not aligned with the erase size and that caused=20
> some issues in pflash. But it breaks the compatibility with=20
> previously created jffs2 filesystems. jffs2 stores the erase=20
> size. So we stepped back.
>=20
>> Cedric, can you remind me what the issues are with the 4K kconfig =
option?
>=20
> CONFIG_MTD_SPI_NOR_USE_4K_SECTORS enables the 4K erase commands,=20
> and without it, the driver will use the sector erase command, most
> likely 64K. I suppose we could have the same problem as described=20
> above, as it can change the default erase size of a chip. to be
> checked.
>=20
Thanks Cedric for the info. It appears there are no issues when =
disabling the 4K sectors for the pnor chip (yes, the erase size is then =
64K), probably because the pnor is not formatted with a jffs2 =
filesystem. We might need to clear the pnor chip anyways to be able to =
format it as a UBI volume. So would you say we=E2=80=99re ok with this =
patch?

> Cheers,
>=20
> C.=20
>=20
