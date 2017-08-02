Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xN1Nw2GmQzDqgP
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 04:07:12 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v72I4QZL058387
 for <openbmc@lists.ozlabs.org>; Wed, 2 Aug 2017 14:07:10 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c3e4vtfyc-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 02 Aug 2017 14:07:09 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Wed, 2 Aug 2017 12:07:09 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 2 Aug 2017 12:07:06 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v72I76Pj10092878; Wed, 2 Aug 2017 11:07:06 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F30678047;
 Wed,  2 Aug 2017 12:07:06 -0600 (MDT)
Received: from adriana-mbp.austin.ibm.com (unknown [9.41.250.82])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS id D87A878066;
 Wed,  2 Aug 2017 12:07:05 -0600 (MDT)
Subject: Re: OpenBMC Image Management
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/html; charset=utf-8
X-Apple-Auto-Saved: 1
X-Apple-Mail-Remote-Attachments: YES
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
X-Apple-Base-Url: x-msg://9/
In-Reply-To: <87a84abq8p.fsf@linux.vnet.ibm.com>
X-Apple-Windows-Friendly: 1
Date: Wed, 2 Aug 2017 13:04:32 -0500
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
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
 <ED39C0D3-EE2E-4D03-9B70-D6F0AD0F3AC7@linux.vnet.ibm.com>
 <87a84abq8p.fsf@linux.vnet.ibm.com>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Stewart Smith <stewart@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3273)
X-TM-AS-GCONF: 00
x-cbid: 17080218-0004-0000-0000-000012B0F0F0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007472; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000216; SDB=6.00896586; UDB=6.00448535; IPR=6.00676773; 
 BA=6.00005506; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016500; XFM=3.00000015;
 UTC=2017-08-02 18:07:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080218-0005-0000-0000-000080847F9D
Message-Id: <1316C865-0BBD-42CD-B4AE-0315DE8929DD@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-02_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708020293
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
X-List-Received-Date: Wed, 02 Aug 2017 18:07:13 -0000

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;"><div =
class=3D"ApplePlainTextBody"><br><blockquote type=3D"cite">On Jul 11, =
2017, at 4:47 PM, Stewart Smith &lt;stewart@linux.vnet.ibm.com&gt; =
wrote:<br><br>Adriana Kobylak &lt;anoo@linux.vnet.ibm.com&gt; =
writes:<br><blockquote type=3D"cite"><blockquote type=3D"cite">On Jun =
21, 2017, at 12:42 AM, Stewart Smith &lt;stewart@linux.vnet.ibm.com&gt; =
wrote:<br><br>Adriana Kobylak &lt;anoo@linux.vnet.ibm.com =
&lt;mailto:anoo@linux.vnet.ibm.com&gt;&gt; writes:<br><blockquote =
type=3D"cite"><blockquote type=3D"cite">On Jun 19, 2017, at 12:44 AM, =
Stewart Smith &lt;stewart@linux.vnet.ibm.com&gt; wrote:<br><br>Adriana =
Kobylak &lt;anoo@linux.vnet.ibm.com&gt; writes:<br><blockquote =
type=3D"cite"><blockquote type=3D"cite">Why is there mboxbridge separate =
from phosphor-mboxd?<br></blockquote><br>Because the mboxbridge is being =
used by other companies as a reference<br>to be able to implement the =
mailbox daemon in their own BMC firmware<br>stack for other openpower =
systems, we didn=E2=80=99t want to =E2=80=9Cpollute=E2=80=9D =
the<br>repository with openbmc-specific and c++ implementation that =
could<br>confuse them.<br></blockquote><br>Why are there OpenBMC =
specific things in mboxd?<br><br>Why can't the reference implementation =
be used? What's deficient in it?<br></blockquote><br>For OpenBMC, =
we=E2=80=99re having the PNOR chip with a filesystem, so mboxd<br>would =
read/write files instead of looking for the data at an offset in<br>the =
chip. Nothing deficient with it, just a different implementation<br>that =
needs to be handled.<br></blockquote><br>Why not have an MBOX protocol =
that supports partitions/files natively<br>then? Why not develop this =
upstream? Surely this is something others<br>could be interested =
in.<br><br></blockquote>It=E2=80=99d be available in the =
openbmc/phosphor-mboxd repo for anybody that<br>wants to use it. Or what =
do you mean by develop it upstream?<br></blockquote><br>I mean in =
https://github.com/openbmc/mboxbridge - the =
reference<br>implementation.<br></blockquote>It was decided with =
AndrewJ=E2=80=99s feedback to not have the reference implementation =
handle multiple formats, and just leave it for ffs.<br><blockquote =
type=3D"cite"><br><blockquote type=3D"cite"><blockquote type=3D"cite">It =
seems really backwards having a bunch of things convert to/from =
FFS<br>for no reason.<br></blockquote><br>We=E2=80=99re not converting =
back and forth, if the pnor is blank, we=E2=80=99ll<br>attach ubi to it, =
and if the pnor is formatted as ffs it=E2=80=99ll be<br>reformatted once =
to ubi.<br></blockquote><br>I mean that I don't see any patches changing =
how we build things in<br>op-build, so there has to be some unpacking of =
the content going on<br>there.<br></blockquote>There are no changes =
needed in op-build since this is an openbmc implementation, there=E2=80=99=
s a script in openbmc that unpacks the pnor file from op-build into =
partition files, I=E2=80=99ll send the link to the documentation details =
for it.<br><blockquote type=3D"cite"><br>-- <br>Stewart Smith<br>OPAL =
Architect, IBM.<br></blockquote><br></div></body></html>=
