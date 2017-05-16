Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wRz035shRzDqbr
 for <openbmc@lists.ozlabs.org>; Tue, 16 May 2017 23:32:35 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4GDTrKU069185
 for <openbmc@lists.ozlabs.org>; Tue, 16 May 2017 09:32:30 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ag1dyb4jm-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 16 May 2017 09:32:30 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Tue, 16 May 2017 07:32:27 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 16 May 2017 07:32:22 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4GDWLdF11862452; Tue, 16 May 2017 06:32:21 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7954136055;
 Tue, 16 May 2017 07:32:21 -0600 (MDT)
Received: from adriana-mbp.austin.ibm.com (unknown [9.53.179.218])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS id 74115136044;
 Tue, 16 May 2017 07:32:21 -0600 (MDT)
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_28D04CCD-E4FF-486B-A0D7-F248B9B8389C"
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH linux dev-4.7] arm: configs: aspeed: Disable
 CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
Date: Tue, 16 May 2017 08:30:08 -0500
In-Reply-To: <3a8ba892-7560-a028-2441-61fe546792ed@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
To: =?utf-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
References: <1493913487-7482-1-git-send-email-anoo@linux.vnet.ibm.com>
 <14B306E8-EFC9-4BD5-B2DD-D892CB459439@linux.vnet.ibm.com>
 <CACPK8XeNtDWLmx2qeHshd=Bg4JCNLd45CriVYLuNmGOMb-qqdg@mail.gmail.com>
 <f47cd08e-5ceb-5d41-4975-d689d2ebba3b@kaod.org>
 <7B0513B8-3B71-42AD-B9D5-2F05E7B000C2@linux.vnet.ibm.com>
 <3a8ba892-7560-a028-2441-61fe546792ed@kaod.org>
X-Mailer: Apple Mail (2.3273)
X-TM-AS-GCONF: 00
x-cbid: 17051613-8235-0000-0000-00000B81813F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007071; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00861275; UDB=6.00427162; IPR=6.00640938; 
 BA=6.00005351; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015480; XFM=3.00000015;
 UTC=2017-05-16 13:32:26
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17051613-8236-0000-0000-00003BD46A72
Message-Id: <D4C24912-6520-4ECB-B80C-B13D1D3515AB@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705160111
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
X-List-Received-Date: Tue, 16 May 2017 13:32:36 -0000


--Apple-Mail=_28D04CCD-E4FF-486B-A0D7-F248B9B8389C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 16, 2017, at 1:01 AM, C=C3=A9dric Le Goater <clg@kaod.org> =
wrote:
>=20
> On 05/15/2017 02:41 AM, Adriana Kobylak wrote:
>>=20
>>> On May 13, 2017, at 3:49 PM, C=C3=A9dric Le Goater <clg@kaod.org> =
wrote:
>>>=20
>>> On 05/11/2017 02:12 PM, Joel Stanley wrote:
>>>> On Thu, May 11, 2017 at 7:31 AM, Adriana Kobylak
>>>> <anoo@linux.vnet.ibm.com> wrote:
>>>>> Milton stopped by and mentioned that you had tried to modify the =
4K erase
>>>>> sector previously for a perhaps bmc chip and saw some flash =
corruption when
>>>>> moving to an image that changed it?
>>>>>=20
>>>>> Just wanted to add that this change only changes the pnor setting =
and I
>>>>> didn=E2=80=99t see any issues powering on a system after updating =
the BMC with an
>>>>> image with this change. Then I updated the pnor with an image that =
had the
>>>>> mbox enabled. Also checked with AndrewJ and the hostboot team and =
there=E2=80=99s no
>>>>> hard-coded assumptions in their side about the erase size.
>>>>>=20
>>>>> With all this info let me know if you have any thoughts or =
concerns.
>>>>=20
>>>> I recall issues relating to this option. I didn't record what they =
were=20
>>>> though.
>>>=20
>>> We tried to activate 4K erase on some chips, which supported it,=20
>>> and that the OpenPOWER systems use. That was because the PNOR=20
>>> sections were not aligned with the erase size and that caused=20
>>> some issues in pflash. But it breaks the compatibility with=20
>>> previously created jffs2 filesystems. jffs2 stores the erase=20
>>> size. So we stepped back.
>>>=20
>>>> Cedric, can you remind me what the issues are with the 4K kconfig =
option?
>>>=20
>>> CONFIG_MTD_SPI_NOR_USE_4K_SECTORS enables the 4K erase commands,=20
>>> and without it, the driver will use the sector erase command, most
>>> likely 64K. I suppose we could have the same problem as described=20
>>> above, as it can change the default erase size of a chip. to be
>>> checked.
>>>=20
>> Thanks Cedric for the info. It appears there are no issues when=20
>> disabling the 4K sectors for the pnor chip (yes, the erase size=20
>> is then 64K), probably because the pnor is not formatted with=20
>> a jffs2 filesystem. We might need to clear the pnor chip anyways
>> to be able to format it as a UBI volume. So would you say we=E2=80=99re=
=20
>> ok with this patch?
>=20
> Well, what if the BMC is using a flash module with a 4K erase size ?=20=


All the mtd devices except PNOR in the P8 and P9 systems running openbmc =
have already an erase size of 64K.

Ex witherspoon:
root@witherspoon:~# cat /proc/mtd=20
dev:    size   erasesize  name
mtd0: 02000000 00010000 "bmc"
mtd1: 00060000 00010000 "u-boot"
mtd2: 00020000 00010000 "u-boot-env"
mtd3: 00440000 00010000 "kernel"
mtd4: 01740000 00010000 "rofs"
mtd5: 00400000 00010000 "rwfs"
mtd6: 02000000 00010000 "alt"
mtd7: 08000000 00001000 =E2=80=9Cpnor=E2=80=9D

Ex barreleye:
root@barreleye:~# cat /proc/mtd=20
dev:    size   erasesize  name
mtd0: 02000000 00010000 "bmc"
mtd1: 00060000 00010000 "u-boot"
mtd2: 00020000 00010000 "u-boot-env"
mtd3: 00440000 00010000 "kernel"
mtd4: 01740000 00010000 "rofs"
mtd5: 00400000 00010000 "rwfs"
mtd6: 04000000 00001000 "pnor"

>=20
> C.


--Apple-Mail=_28D04CCD-E4FF-486B-A0D7-F248B9B8389C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On May 16, 2017, at 1:01 AM, C=C3=A9dric Le Goater &lt;<a =
href=3D"mailto:clg@kaod.org" class=3D"">clg@kaod.org</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">On 05/15/2017 02:41 =
AM, Adriana Kobylak wrote:</span><br style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><blockquote=
 type=3D"cite" style=3D"font-family: ArialUnicodeMS; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D""><br class=3D""><blockquote =
type=3D"cite" class=3D"">On May 13, 2017, at 3:49 PM, C=C3=A9dric Le =
Goater &lt;<a href=3D"mailto:clg@kaod.org" class=3D"">clg@kaod.org</a>&gt;=
 wrote:<br class=3D""><br class=3D"">On 05/11/2017 02:12 PM, Joel =
Stanley wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">On =
Thu, May 11, 2017 at 7:31 AM, Adriana Kobylak<br class=3D"">&lt;<a =
href=3D"mailto:anoo@linux.vnet.ibm.com" =
class=3D"">anoo@linux.vnet.ibm.com</a>&gt; wrote:<br =
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
option. I didn't record what they were<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">though.<br =
class=3D""></blockquote><br class=3D"">We tried to activate 4K erase on =
some chips, which supported it,<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">and that the =
OpenPOWER systems use. That was because the PNOR<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">sections =
were not aligned with the erase size and that caused<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">some issues =
in pflash. But it breaks the compatibility with<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">previously =
created jffs2 filesystems. jffs2 stores the erase<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">size. So we =
stepped back.<br class=3D""><br class=3D""><blockquote type=3D"cite" =
class=3D"">Cedric, can you remind me what the issues are with the 4K =
kconfig option?<br class=3D""></blockquote><br =
class=3D"">CONFIG_MTD_SPI_NOR_USE_4K_SECTORS enables the 4K erase =
commands,<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">and without it, the driver will use the sector erase command, =
most<br class=3D"">likely 64K. I suppose we could have the same problem =
as described<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">above, as it can change the default erase size of a chip. to =
be<br class=3D"">checked.<br class=3D""><br class=3D""></blockquote>Thanks=
 Cedric for the info. It appears there are no issues when<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">disabling =
the 4K sectors for the pnor chip (yes, the erase size<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">is then =
64K), probably because the pnor is not formatted with<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">a jffs2 =
filesystem. We might need to clear the pnor chip anyways<br class=3D"">to =
be able to format it as a UBI volume. So would you say we=E2=80=99re<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">ok with this =
patch?<br class=3D""></blockquote><br style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">Well, what if the =
BMC is using a flash module with a 4K erase size ?<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote><div><br class=3D""></div>All the mtd =
devices except PNOR in the P8 and P9 systems running openbmc have =
already an erase size of 64K.</div><div><br class=3D""></div><div>Ex =
witherspoon:</div><div><div><font face=3D"Courier" =
class=3D"">root@witherspoon:~# cat =
/proc/mtd&nbsp;</font></div><div><font face=3D"Courier" class=3D"">dev: =
&nbsp; &nbsp;size &nbsp; erasesize &nbsp;name</font></div><div><font =
face=3D"Courier" class=3D"">mtd0: 02000000 00010000 =
"bmc"</font></div><div><font face=3D"Courier" class=3D"">mtd1: 00060000 =
00010000 "u-boot"</font></div><div><font face=3D"Courier" class=3D"">mtd2:=
 00020000 00010000 "u-boot-env"</font></div><div><font face=3D"Courier" =
class=3D"">mtd3: 00440000 00010000 "kernel"</font></div><div><font =
face=3D"Courier" class=3D"">mtd4: 01740000 00010000 =
"rofs"</font></div><div><font face=3D"Courier" class=3D"">mtd5: 00400000 =
00010000 "rwfs"</font></div><div><font face=3D"Courier" class=3D"">mtd6: =
02000000 00010000 "alt"</font></div><div><font face=3D"Courier" =
class=3D"">mtd7: 08000000 00001000 =E2=80=9Cpnor=E2=80=9D</font></div><div=
><font face=3D"Courier" class=3D""><br class=3D""></font></div><div>Ex =
barreleye:</div><div><font face=3D"Courier" =
class=3D""><div>root@barreleye:~# cat /proc/mtd&nbsp;</div><div>dev: =
&nbsp; &nbsp;size &nbsp; erasesize &nbsp;name</div><div>mtd0: 02000000 =
00010000 "bmc"</div><div>mtd1: 00060000 00010000 =
"u-boot"</div><div>mtd2: 00020000 00010000 "u-boot-env"</div><div>mtd3: =
00440000 00010000 "kernel"</div><div>mtd4: 01740000 00010000 =
"rofs"</div><div>mtd5: 00400000 00010000 "rwfs"</div><div>mtd6: 04000000 =
00001000 "pnor"</div></font></div><div><br class=3D""></div><blockquote =
type=3D"cite" class=3D""><div class=3D""><br style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" =
class=3D"">C.</span></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_28D04CCD-E4FF-486B-A0D7-F248B9B8389C--
