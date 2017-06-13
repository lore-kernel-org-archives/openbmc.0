Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wnHrP6fXjzDqLB
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2017 04:11:01 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5DI9ll3024708
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jun 2017 14:10:57 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2b2mqr91uh-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jun 2017 14:10:57 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Tue, 13 Jun 2017 12:10:56 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 13 Jun 2017 12:10:55 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5DIAtDl18612348
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jun 2017 11:10:55 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7AA26E04A
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jun 2017 12:10:54 -0600 (MDT)
Received: from adriana-mbp.austin.ibm.com (unknown [9.53.179.218])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS id D21A16E045
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jun 2017 12:10:54 -0600 (MDT)
Subject: Re: OpenBMC Image Management
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/html; charset=us-ascii
X-Apple-Auto-Saved: 1
X-Apple-Mail-Remote-Attachments: YES
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
X-Apple-Base-Url: x-msg://3/
In-Reply-To: <CAPLgG=nY-_A6HvVmY45U5U=wrz4iRK5P=R0e_0NPVs=B--CLdw@mail.gmail.com>
X-Apple-Windows-Friendly: 1
Date: Tue, 13 Jun 2017 13:10:40 -0500
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <OF3E869A3E.DB3E43DE-ON862580B3.008284D7-862580B3.0082FDDB@notes.na.collabserv.com>
 <20170127030706.GB5504@heinlein.lan> <87o9ypw13y.fsf@linux.vnet.ibm.com>
 <20170131181641.k3jnv73ha5v2kjsh@asimov>
 <CAPLgG=nY-_A6HvVmY45U5U=wrz4iRK5P=R0e_0NPVs=B--CLdw@mail.gmail.com>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3273)
X-TM-AS-GCONF: 00
x-cbid: 17061318-0008-0000-0000-00000802D727
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007226; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00874280; UDB=6.00435175; IPR=6.00654368; 
 BA=6.00005420; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015808; XFM=3.00000015;
 UTC=2017-06-13 18:10:56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17061318-0009-0000-0000-00004299E7CD
Message-Id: <2DA4883E-3015-4FDF-92FC-F6761436585D@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-13_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706130312
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
X-List-Received-Date: Tue, 13 Jun 2017 18:11:03 -0000

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;"><div =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space;" class=3D"">In the next coming =
days, the changes to the host bios update procedure will be available =
for use.<div class=3D""><br class=3D""></div><div class=3D"">Notable =
changes are using a squashfs image that includes individual pnor =
partition files instead of the ffs (.pnor) image, formatting the pnor =
chip as ubi to store these files (allowing for the storage of more than =
one image), and mailbox daemon updates to support these changes (new =
phosphor-mboxd repo).</div><div class=3D""><br class=3D""></div><div =
class=3D"">Regarding the mailbox daemon, the mboxbridge repository is =
staying as a reference implementation and has been cloned into =
phosphor-mboxd. Any system using mailbox and running with a flashed ffs =
pnor image (instead of updating to the ubi layout) would still need the =
reference mboxbridge implementation. The openbmc build is being updated =
to build phosphor-mboxd as the default.</div><div class=3D""><br =
class=3D""></div><div class=3D"">A system can be updated transparently =
from running with an ffs pnor image to the squashfs image via the =
Software dbus interfaces. In a similar way, a system with a =
ubi-formatted pnor can be flashed with an ffs pnor image using =
pflash.</div><div class=3D""><br class=3D""></div><div class=3D"">The =
first round of documentation updates are here:&nbsp;<a =
href=3D"https://gerrit.openbmc-project.xyz/#/c/4756/" =
class=3D"">https://gerrit.openbmc-project.xyz/#/c/4756/</a></div><div =
class=3D"">Reviewers welcome :)</div></div></body></html>=
