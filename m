Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x64hN37jfzDqBn
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2017 11:47:15 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6B1hufM020193
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jul 2017 21:47:12 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bmahcf0mx-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jul 2017 21:47:12 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Mon, 10 Jul 2017 19:47:11 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 10 Jul 2017 19:47:10 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6B1lAtA1900806; Mon, 10 Jul 2017 18:47:10 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32FD6C6047;
 Mon, 10 Jul 2017 19:47:10 -0600 (MDT)
Received: from [9.80.215.18] (unknown [9.80.215.18])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS id 95F42C6042;
 Mon, 10 Jul 2017 19:47:09 -0600 (MDT)
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_779A331D-7623-4B9C-9B4B-E40BFCEF86F7"
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: OpenBMC Image Management
Date: Mon, 10 Jul 2017 20:47:08 -0500
In-Reply-To: <87wp8528xc.fsf@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
To: Stewart Smith <stewart@linux.vnet.ibm.com>
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <OF3E869A3E.DB3E43DE-ON862580B3.008284D7-862580B3.0082FDDB@notes.na.collabserv.com>
 <20170127030706.GB5504@heinlein.lan> <87o9ypw13y.fsf@linux.vnet.ibm.com>
 <20170131181641.k3jnv73ha5v2kjsh@asimov>
 <CAPLgG=nY-_A6HvVmY45U5U=wrz4iRK5P=R0e_0NPVs=B--CLdw@mail.gmail.com>
 <2DA4883E-3015-4FDF-92FC-F6761436585D@linux.vnet.ibm.com>
 <87y3sv8str.fsf@linux.vnet.ibm.com>
 <DF60C6B0-BEF2-4CBA-B5D8-6B85EF0F158A@linux.vnet.ibm.com>
 <87mv945y5r.fsf@linux.vnet.ibm.com>
 <C82D2909-D48E-4F2E-9C84-C0AAAB763AFA@linux.vnet.ibm.com>
 <87wp8528xc.fsf@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3273)
X-TM-AS-GCONF: 00
x-cbid: 17071101-0016-0000-0000-0000072571A9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007346; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00885795; UDB=6.00442095; IPR=6.00665944; 
 BA=6.00005465; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016168; XFM=3.00000015;
 UTC=2017-07-11 01:47:11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17071101-0017-0000-0000-00003A84BFA4
Message-Id: <ED39C0D3-EE2E-4D03-9B70-D6F0AD0F3AC7@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-11_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707110025
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
X-List-Received-Date: Tue, 11 Jul 2017 01:47:16 -0000


--Apple-Mail=_779A331D-7623-4B9C-9B4B-E40BFCEF86F7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 21, 2017, at 12:42 AM, Stewart Smith =
<stewart@linux.vnet.ibm.com> wrote:
>=20
> Adriana Kobylak <anoo@linux.vnet.ibm.com =
<mailto:anoo@linux.vnet.ibm.com>> writes:
>>> On Jun 19, 2017, at 12:44 AM, Stewart Smith =
<stewart@linux.vnet.ibm.com> wrote:
>>>=20
>>> Adriana Kobylak <anoo@linux.vnet.ibm.com> writes:
>>>>> Why is there mboxbridge separate from phosphor-mboxd?
>>>>=20
>>>> Because the mboxbridge is being used by other companies as a =
reference
>>>> to be able to implement the mailbox daemon in their own BMC =
firmware
>>>> stack for other openpower systems, we didn=E2=80=99t want to =
=E2=80=9Cpollute=E2=80=9D the
>>>> repository with openbmc-specific and c++ implementation that could
>>>> confuse them.
>>>=20
>>> Why are there OpenBMC specific things in mboxd?
>>>=20
>>> Why can't the reference implementation be used? What's deficient in =
it?
>>=20
>> For OpenBMC, we=E2=80=99re having the PNOR chip with a filesystem, so =
mboxd
>> would read/write files instead of looking for the data at an offset =
in
>> the chip. Nothing deficient with it, just a different implementation
>> that needs to be handled.
>=20
> Why not have an MBOX protocol that supports partitions/files natively
> then? Why not develop this upstream? Surely this is something others
> could be interested in.
>=20
It=E2=80=99d be available in the openbmc/phosphor-mboxd repo for anybody =
that wants to use it. Or what do you mean by develop it upstream?
=20
> It seems really backwards having a bunch of things convert to/from FFS
> for no reason.

We=E2=80=99re not converting back and forth, if the pnor is blank, =
we=E2=80=99ll attach ubi to it, and if the pnor is formatted as ffs =
it=E2=80=99ll be reformatted once to ubi.

>=20
> The host already has such abstractions as we have it for FSP systems.
>=20
> --=20
> Stewart Smith
> OPAL Architect, IBM.


--Apple-Mail=_779A331D-7623-4B9C-9B4B-E40BFCEF86F7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jun 21, 2017, at 12:42 AM, Stewart Smith &lt;<a =
href=3D"mailto:stewart@linux.vnet.ibm.com" =
class=3D"">stewart@linux.vnet.ibm.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">Adriana Kobylak =
&lt;</span><a href=3D"mailto:anoo@linux.vnet.ibm.com" =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">anoo@linux.vnet.ibm.com</a><span style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">&gt; writes:</span><br =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D""><blockquote type=3D"cite" =
class=3D"">On Jun 19, 2017, at 12:44 AM, Stewart Smith &lt;<a =
href=3D"mailto:stewart@linux.vnet.ibm.com" =
class=3D"">stewart@linux.vnet.ibm.com</a>&gt; wrote:<br class=3D""><br =
class=3D"">Adriana Kobylak &lt;<a href=3D"mailto:anoo@linux.vnet.ibm.com" =
class=3D"">anoo@linux.vnet.ibm.com</a>&gt; writes:<br =
class=3D""><blockquote type=3D"cite" class=3D""><blockquote type=3D"cite" =
class=3D"">Why is there mboxbridge separate from phosphor-mboxd?<br =
class=3D""></blockquote><br class=3D"">Because the mboxbridge is being =
used by other companies as a reference<br class=3D"">to be able to =
implement the mailbox daemon in their own BMC firmware<br class=3D"">stack=
 for other openpower systems, we didn=E2=80=99t want to =E2=80=9Cpollute=E2=
=80=9D the<br class=3D"">repository with openbmc-specific and c++ =
implementation that could<br class=3D"">confuse them.<br =
class=3D""></blockquote><br class=3D"">Why are there OpenBMC specific =
things in mboxd?<br class=3D""><br class=3D"">Why can't the reference =
implementation be used? What's deficient in it?<br =
class=3D""></blockquote><br class=3D"">For OpenBMC, we=E2=80=99re having =
the PNOR chip with a filesystem, so mboxd<br class=3D"">would read/write =
files instead of looking for the data at an offset in<br class=3D"">the =
chip. Nothing deficient with it, just a different implementation<br =
class=3D"">that needs to be handled.<br class=3D""></blockquote><br =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: ArialUnicodeMS; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Why not have an MBOX protocol that supports =
partitions/files natively</span><br style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">then? Why not =
develop this upstream? Surely this is something others</span><br =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: ArialUnicodeMS; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">could be interested in.</span><br =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><br style=3D"font-family: ArialUnicodeMS; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""></div></blockquote>It=E2=80=99=
d be available in the openbmc/phosphor-mboxd repo for anybody that wants =
to use it. Or what do you mean by develop it =
upstream?</div><div>&nbsp;<br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><span style=3D"font-family: ArialUnicodeMS; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">It seems really backwards having a bunch =
of things convert to/from FFS</span><br style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">for no =
reason.</span></div></blockquote><div><br class=3D""></div>We=E2=80=99re =
not converting back and forth, if the pnor is blank, we=E2=80=99ll =
attach ubi to it, and if the pnor is formatted as ffs it=E2=80=99ll be =
reformatted once to ubi.</div><div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><br style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">The host already =
has such abstractions as we have it for FSP systems.</span><br =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><br style=3D"font-family: ArialUnicodeMS; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" class=3D"">--<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: ArialUnicodeMS; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Stewart Smith</span><br style=3D"font-family: =
ArialUnicodeMS; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: ArialUnicodeMS; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">OPAL Architect, =
IBM.</span></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_779A331D-7623-4B9C-9B4B-E40BFCEF86F7--
