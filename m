Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wTqRq3nPPzDqbx
 for <openbmc@lists.ozlabs.org>; Fri, 19 May 2017 23:59:34 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4JDxLjb099906
 for <openbmc@lists.ozlabs.org>; Fri, 19 May 2017 09:59:28 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ahw45x00m-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 19 May 2017 09:59:24 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Fri, 19 May 2017 07:59:16 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 19 May 2017 07:59:13 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4JDxDCe14549302; Fri, 19 May 2017 06:59:13 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 479047803F;
 Fri, 19 May 2017 07:59:13 -0600 (MDT)
Received: from [9.85.137.207] (unknown [9.85.137.207])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS id 4156278038;
 Fri, 19 May 2017 07:59:12 -0600 (MDT)
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_4B95C6DD-5805-43EE-B8A8-A941616E6C4B"
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH linux dev-4.7] arm: configs: aspeed: Disable
 CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
Date: Fri, 19 May 2017 08:57:05 -0500
In-Reply-To: <EF112150-A566-4731-AF33-E4E356FF7C95@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?utf-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
To: Lei YU <mine260309@gmail.com>, andrew@aj.id.au
References: <1493913487-7482-1-git-send-email-anoo@linux.vnet.ibm.com>
 <14B306E8-EFC9-4BD5-B2DD-D892CB459439@linux.vnet.ibm.com>
 <CACPK8XeNtDWLmx2qeHshd=Bg4JCNLd45CriVYLuNmGOMb-qqdg@mail.gmail.com>
 <f47cd08e-5ceb-5d41-4975-d689d2ebba3b@kaod.org>
 <7B0513B8-3B71-42AD-B9D5-2F05E7B000C2@linux.vnet.ibm.com>
 <3a8ba892-7560-a028-2441-61fe546792ed@kaod.org>
 <D4C24912-6520-4ECB-B80C-B13D1D3515AB@linux.vnet.ibm.com>
 <7de4ad45-f675-b691-f3de-b7c02c5e5bfd@kaod.org>
 <CAARXrt=zd2H+4Xq+EwsqF=22RJsY3XpCP3pGeYpao3XkakFCQw@mail.gmail.com>
 <EF112150-A566-4731-AF33-E4E356FF7C95@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3273)
X-TM-AS-GCONF: 00
x-cbid: 17051913-0016-0000-0000-000006C6B08F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007084; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00862616; UDB=6.00428019; IPR=6.00642365; 
 BA=6.00005358; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015510; XFM=3.00000015;
 UTC=2017-05-19 13:59:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17051913-0017-0000-0000-000039B720B6
Message-Id: <016BF3B0-FB50-4AC8-B4AB-86EB2234AE8D@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-19_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705190088
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
X-List-Received-Date: Fri, 19 May 2017 13:59:36 -0000


--Apple-Mail=_4B95C6DD-5805-43EE-B8A8-A941616E6C4B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 17, 2017, at 10:43 AM, Adriana Kobylak =
<anoo@linux.vnet.ibm.com> wrote:
>=20
>>=20
>> On May 16, 2017, at 8:48 PM, Lei YU <mine260309@gmail.com =
<mailto:mine260309@gmail.com>> wrote:
>>=20
>> On Tue, May 16, 2017 at 9:59 PM, C=C3=A9dric Le Goater <clg@kaod.org =
<mailto:clg@kaod.org>> wrote:
>>> On 05/16/2017 03:30 PM, Adriana Kobylak wrote:
>>>>=20
>>>>> On May 16, 2017, at 1:01 AM, C=C3=A9dric Le Goater <clg@kaod.org =
<mailto:clg@kaod.org> <mailto:clg@kaod.org <mailto:clg@kaod.org>>> =
wrote:
>>>>>=20
>>>>> On 05/15/2017 02:41 AM, Adriana Kobylak wrote:
>>>>>>=20
>>>>>>> On May 13, 2017, at 3:49 PM, C=C3=A9dric Le Goater <clg@kaod.org =
<mailto:clg@kaod.org> <mailto:clg@kaod.org <mailto:clg@kaod.org>>> =
wrote:
>>>>>>>=20
>>>>>>> On 05/11/2017 02:12 PM, Joel Stanley wrote:
>>>>>>>> On Thu, May 11, 2017 at 7:31 AM, Adriana Kobylak
>>>>>>>> <anoo@linux.vnet.ibm.com <mailto:anoo@linux.vnet.ibm.com> =
<mailto:anoo@linux.vnet.ibm.com <mailto:anoo@linux.vnet.ibm.com>>> =
wrote:
>>>>>>>>> Milton stopped by and mentioned that you had tried to modify =
the 4K erase
>>>>>>>>> sector previously for a perhaps bmc chip and saw some flash =
corruption when
>>>>>>>>> moving to an image that changed it?
>>>>>>>>>=20
>>>>>>>>> Just wanted to add that this change only changes the pnor =
setting and I
>>>>>>>>> didn=E2=80=99t see any issues powering on a system after =
updating the BMC with an
>>>>>>>>> image with this change. Then I updated the pnor with an image =
that had the
>>>>>>>>> mbox enabled. Also checked with AndrewJ and the hostboot team =
and there=E2=80=99s no
>>>>>>>>> hard-coded assumptions in their side about the erase size.
>>>>>>>>>=20
>>>>>>>>> With all this info let me know if you have any thoughts or =
concerns.
>>>>>>>>=20
>>>>>>>> I recall issues relating to this option. I didn't record what =
they were
>>>>>>>> though.
>>>>>>>=20
>>>>>>> We tried to activate 4K erase on some chips, which supported it,
>>>>>>> and that the OpenPOWER systems use. That was because the PNOR
>>>>>>> sections were not aligned with the erase size and that caused
>>>>>>> some issues in pflash. But it breaks the compatibility with
>>>>>>> previously created jffs2 filesystems. jffs2 stores the erase
>>>>>>> size. So we stepped back.
>>>>>>>=20
>>>>>>>> Cedric, can you remind me what the issues are with the 4K =
kconfig option?
>>>>>>>=20
>>>>>>> CONFIG_MTD_SPI_NOR_USE_4K_SECTORS enables the 4K erase commands,
>>>>>>> and without it, the driver will use the sector erase command, =
most
>>>>>>> likely 64K. I suppose we could have the same problem as =
described
>>>>>>> above, as it can change the default erase size of a chip. to be
>>>>>>> checked.
>>=20
>> The same question as Cedric, PNOR has sections that are not 64K
>> aligned but 4K aligned,
>> e.g. HBEL, GARD:
>> ID=3D02            HBEL 000a0000..000c4000 (actual=3D00024000) [ECC]
>> ID=3D03           GUARD 000d0000..000d5000 (actual=3D00005000) [ECC]
>>=20
>> When using gard tool to clear GARD partition, it will fail if erasing
>> size is 64K.
>>=20
>> Do we have a plan to support this case?

Maybe Andrew can comment? It=E2=80=99s my understanding that the mbox =
daemon v2 would support any erase size, but if there=E2=80=99s an issue =
with alignment when using something other than 4k, maybe the daemon =
would need to abstract the chip erase size and set to 4k as the v1 does.

>=20
> Thanks Lei for providing this info. For the proposed openbmc =
implementation, it=E2=80=99d work since the pnor sections (or =
partitions) would be files located in a ubi volume, and their data =
loaded into memory (virtual pnor) for the host to access, so erasing =
GUARD for example would underneath the covers modify the GUARD.bin file =
and not a specific offset in the physical pnor chip.
>=20
> But that raises the question about openpower systems that are not =
running openbmc. Should disabling 4k be an openbmc only patch?
>=20
>>=20
>>>>>>>=20
>>>>>> Thanks Cedric for the info. It appears there are no issues when
>>>>>> disabling the 4K sectors for the pnor chip (yes, the erase size
>>>>>> is then 64K), probably because the pnor is not formatted with
>>>>>> a jffs2 filesystem. We might need to clear the pnor chip anyways
>>>>>> to be able to format it as a UBI volume. So would you say we=E2=80=99=
re
>>>>>> ok with this patch?
>>>>>=20
>>>>> Well, what if the BMC is using a flash module with a 4K erase size =
?
>>>>=20
>>>> All the mtd devices except PNOR in the P8 and P9 systems running =
openbmc
>>>> have already an erase size of 64K.
>>>=20
>>> So everything is fine for these.
>>>=20
>>> Cheers,
>>>=20
>>> C.
>>>=20
>>>=20
>>>> Ex witherspoon:
>>>> root@witherspoon:~# cat /proc/mtd
>>>> dev:    size   erasesize  name
>>>> mtd0: 02000000 00010000 "bmc"
>>>> mtd1: 00060000 00010000 "u-boot"
>>>> mtd2: 00020000 00010000 "u-boot-env"
>>>> mtd3: 00440000 00010000 "kernel"
>>>> mtd4: 01740000 00010000 "rofs"
>>>> mtd5: 00400000 00010000 "rwfs"
>>>> mtd6: 02000000 00010000 "alt"
>>>> mtd7: 08000000 00001000 =E2=80=9Cpnor=E2=80=9D
>>>>=20
>>>> Ex barreleye:
>>>> root@barreleye:~# cat /proc/mtd
>>>> dev:    size   erasesize  name
>>>> mtd0: 02000000 00010000 "bmc"
>>>> mtd1: 00060000 00010000 "u-boot"
>>>> mtd2: 00020000 00010000 "u-boot-env"
>>>> mtd3: 00440000 00010000 "kernel"
>>>> mtd4: 01740000 00010000 "rofs"
>>>> mtd5: 00400000 00010000 "rwfs"
>>>> mtd6: 04000000 00001000 "pnor"
>>>>=20
>>>>>=20
>>>>> C.


--Apple-Mail=_4B95C6DD-5805-43EE-B8A8-A941616E6C4B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On May 17, 2017, at 10:43 AM, Adriana Kobylak &lt;<a =
href=3D"mailto:anoo@linux.vnet.ibm.com" =
class=3D"">anoo@linux.vnet.ibm.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><br =
class=3D"Apple-interchange-newline">On May 16, 2017, at 8:48 PM, Lei YU =
&lt;<a href=3D"mailto:mine260309@gmail.com" =
class=3D"">mine260309@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span class=3D"" =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;">On Tue, May 16, 2017 at 9:59 =
PM, C=C3=A9dric Le Goater &lt;</span><a href=3D"mailto:clg@kaod.org" =
class=3D"" style=3D"font-family: ArialUnicodeMS; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;">clg@kaod.org</a><span class=3D"" =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;">&gt; wrote:</span><br class=3D""=
 style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px;"><blockquote type=3D"cite" class=3D"" style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;">On 05/16/2017 03:30 =
PM, Adriana Kobylak wrote:<br class=3D""><blockquote type=3D"cite" =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D"">On May =
16, 2017, at 1:01 AM, C=C3=A9dric Le Goater &lt;<a =
href=3D"mailto:clg@kaod.org" class=3D"">clg@kaod.org</a><span =
class=3D"Apple-converted-space">&nbsp;</span>&lt;<a =
href=3D"mailto:clg@kaod.org" class=3D"">mailto:clg@kaod.org</a>&gt;&gt; =
wrote:<br class=3D""><br class=3D"">On 05/15/2017 02:41 AM, Adriana =
Kobylak wrote:<br class=3D""><blockquote type=3D"cite" class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D"">On May 13, 2017, at 3:49 =
PM, C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org" =
class=3D"">clg@kaod.org</a><span =
class=3D"Apple-converted-space">&nbsp;</span>&lt;<a =
href=3D"mailto:clg@kaod.org" class=3D"">mailto:clg@kaod.org</a>&gt;&gt; =
wrote:<br class=3D""><br class=3D"">On 05/11/2017 02:12 PM, Joel Stanley =
wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">On Thu, May =
11, 2017 at 7:31 AM, Adriana Kobylak<br class=3D"">&lt;<a =
href=3D"mailto:anoo@linux.vnet.ibm.com" =
class=3D"">anoo@linux.vnet.ibm.com</a><span =
class=3D"Apple-converted-space">&nbsp;</span>&lt;<a =
href=3D"mailto:anoo@linux.vnet.ibm.com" =
class=3D"">mailto:anoo@linux.vnet.ibm.com</a>&gt;&gt; wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">Milton stopped by and =
mentioned that you had tried to modify the 4K erase<br class=3D"">sector =
previously for a perhaps bmc chip and saw some flash corruption when<br =
class=3D"">moving to an image that changed it?<br class=3D""><br =
class=3D"">Just wanted to add that this change only changes the pnor =
setting and I<br class=3D"">didn=E2=80=99t see any issues powering on a =
system after updating the BMC with an<br class=3D"">image with this =
change. Then I updated the pnor with an image that had the<br =
class=3D"">mbox enabled. Also checked with AndrewJ and the hostboot team =
and there=E2=80=99s no<br class=3D"">hard-coded assumptions in their =
side about the erase size.<br class=3D""><br class=3D"">With all this =
info let me know if you have any thoughts or concerns.<br =
class=3D""></blockquote><br class=3D"">I recall issues relating to this =
option. I didn't record what they were<br class=3D"">though.<br =
class=3D""></blockquote><br class=3D"">We tried to activate 4K erase on =
some chips, which supported it,<br class=3D"">and that the OpenPOWER =
systems use. That was because the PNOR<br class=3D"">sections were not =
aligned with the erase size and that caused<br class=3D"">some issues in =
pflash. But it breaks the compatibility with<br class=3D"">previously =
created jffs2 filesystems. jffs2 stores the erase<br class=3D"">size. So =
we stepped back.<br class=3D""><br class=3D""><blockquote type=3D"cite" =
class=3D"">Cedric, can you remind me what the issues are with the 4K =
kconfig option?<br class=3D""></blockquote><br =
class=3D"">CONFIG_MTD_SPI_NOR_USE_4K_SECTORS enables the 4K erase =
commands,<br class=3D"">and without it, the driver will use the sector =
erase command, most<br class=3D"">likely 64K. I suppose we could have =
the same problem as described<br class=3D"">above, as it can change the =
default erase size of a chip. to be<br class=3D"">checked.<br =
class=3D""></blockquote></blockquote></blockquote></blockquote></blockquot=
e><br class=3D"" style=3D"font-family: ArialUnicodeMS; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;"><span class=3D"" style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;">The same question as Cedric, PNOR has sections that =
are not 64K</span><br class=3D"" style=3D"font-family: ArialUnicodeMS; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span class=3D"" =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;">aligned but 4K =
aligned,</span><br class=3D"" style=3D"font-family: ArialUnicodeMS; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span class=3D"" =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;">e.g. HBEL, GARD:</span><br =
class=3D"" style=3D"font-family: ArialUnicodeMS; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;"><span class=3D"" style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;">ID=3D02 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HBEL =
000a0000..000c4000 (actual=3D00024000) [ECC]</span><br class=3D"" =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px;"><span class=3D"" style=3D"font-family: ArialUnicodeMS; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;">ID=3D03 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GUARD =
000d0000..000d5000 (actual=3D00005000) [ECC]</span><br class=3D"" =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px;"><br class=3D"" style=3D"font-family: ArialUnicodeMS; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;"><span class=3D"" style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;">When using gard tool to clear GARD partition, it =
will fail if erasing</span><br class=3D"" style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span class=3D"" =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;">size is 64K.</span><br =
class=3D"" style=3D"font-family: ArialUnicodeMS; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;"><br class=3D"" style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span class=3D"" =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;">Do we have a plan to support =
this case?</span><br class=3D"" style=3D"font-family: ArialUnicodeMS; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: =
0px;"></div></blockquote></div></div></blockquote><div><br =
class=3D""></div>Maybe Andrew can comment? It=E2=80=99s my understanding =
that the mbox daemon v2 would support any erase size, but if there=E2=80=99=
s an issue with alignment when using something other than 4k, maybe the =
daemon would need to abstract the chip erase size and set to 4k as the =
v1 does.</div><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div style=3D"font-family: ArialUnicodeMS; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><div =
class=3D""><br class=3D""></div>Thanks Lei for providing this info. For =
the proposed openbmc implementation, it=E2=80=99d work since the pnor =
sections (or partitions) would be files located in a ubi volume, and =
their data loaded into memory (virtual pnor) for the host to access, so =
erasing GUARD for example would underneath the covers modify the =
GUARD.bin file and not a specific offset in the physical pnor =
chip.</div><div style=3D"font-family: ArialUnicodeMS; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><br class=3D""></div><div =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D"">But that raises the question about openpower systems that are =
not running openbmc. Should disabling 4k be an openbmc only =
patch?</div><div style=3D"font-family: ArialUnicodeMS; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><br class=3D"" =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px;"><blockquote type=3D"cite" class=3D"" style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;"><blockquote =
type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><blockquote =
type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><br =
class=3D""></blockquote>Thanks Cedric for the info. It appears there are =
no issues when<br class=3D"">disabling the 4K sectors for the pnor chip =
(yes, the erase size<br class=3D"">is then 64K), probably because the =
pnor is not formatted with<br class=3D"">a jffs2 filesystem. We might =
need to clear the pnor chip anyways<br class=3D"">to be able to format =
it as a UBI volume. So would you say we=E2=80=99re<br class=3D"">ok with =
this patch?<br class=3D""></blockquote><br class=3D"">Well, what if the =
BMC is using a flash module with a 4K erase size ?<br =
class=3D""></blockquote><br class=3D"">All the mtd devices except PNOR =
in the P8 and P9 systems running openbmc<br class=3D"">have already an =
erase size of 64K.<br class=3D""></blockquote><br class=3D"">So =
everything is fine for these.<br class=3D""><br class=3D"">Cheers,<br =
class=3D""><br class=3D"">C.<br class=3D""><br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D"">Ex witherspoon:<br =
class=3D"">root@witherspoon:~# cat /proc/mtd<br class=3D"">dev: =
&nbsp;&nbsp;&nbsp;size &nbsp;&nbsp;erasesize &nbsp;name<br =
class=3D"">mtd0: 02000000 00010000 "bmc"<br class=3D"">mtd1: 00060000 =
00010000 "u-boot"<br class=3D"">mtd2: 00020000 00010000 "u-boot-env"<br =
class=3D"">mtd3: 00440000 00010000 "kernel"<br class=3D"">mtd4: 01740000 =
00010000 "rofs"<br class=3D"">mtd5: 00400000 00010000 "rwfs"<br =
class=3D"">mtd6: 02000000 00010000 "alt"<br class=3D"">mtd7: 08000000 =
00001000 =E2=80=9Cpnor=E2=80=9D<br class=3D""><br class=3D"">Ex =
barreleye:<br class=3D"">root@barreleye:~# cat /proc/mtd<br =
class=3D"">dev: &nbsp;&nbsp;&nbsp;size &nbsp;&nbsp;erasesize =
&nbsp;name<br class=3D"">mtd0: 02000000 00010000 "bmc"<br class=3D"">mtd1:=
 00060000 00010000 "u-boot"<br class=3D"">mtd2: 00020000 00010000 =
"u-boot-env"<br class=3D"">mtd3: 00440000 00010000 "kernel"<br =
class=3D"">mtd4: 01740000 00010000 "rofs"<br class=3D"">mtd5: 00400000 =
00010000 "rwfs"<br class=3D"">mtd6: 04000000 00001000 "pnor"<br =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D""><br =
class=3D"">C.</blockquote></blockquote></blockquote></div></blockquote></d=
iv></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_4B95C6DD-5805-43EE-B8A8-A941616E6C4B--
