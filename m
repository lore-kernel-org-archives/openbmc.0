Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3znYv70Q7jzF1lh
 for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2018 12:45:06 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1N1j3PU104397
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 20:45:04 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ga63u6h1p-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 20:45:03 -0500
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 22 Feb 2018 20:44:25 -0500
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 22 Feb 2018 20:44:22 -0500
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1N1iLqO45744328; Fri, 23 Feb 2018 01:44:21 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1FA6B2046;
 Thu, 22 Feb 2018 21:46:39 -0500 (EST)
Received: from birb.localdomain (unknown [9.185.142.38])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 233DDB204D;
 Thu, 22 Feb 2018 21:46:39 -0500 (EST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 1909C4E09A8; Fri, 23 Feb 2018 12:44:16 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Yugi Mani <yupalani@microsoft.com>,
 Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 "openbmc\@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: BMC Image Signing Proposal
In-Reply-To: <MWHPR21MB086454F2C875043A3B7FCBF9D6F10@MWHPR21MB0864.namprd21.prod.outlook.com>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
 <1517207425.21006.27.camel@aj.id.au> <87shaoymux.fsf@linux.vnet.ibm.com>
 <CACPK8XcLF+hw_gRM76fgJ9tPNZYr3_RiN=euOzw8KLOJ11ibXA@mail.gmail.com>
 <87lggezywe.fsf@linux.vnet.ibm.com>
 <3d38bc878a5b36f9091588d1fb842c1e@linux.vnet.ibm.com>
 <8172868d02b4f54ceaa101ba1c99fa5b@linux.vnet.ibm.com>
 <MWHPR21MB086454F2C875043A3B7FCBF9D6F10@MWHPR21MB0864.namprd21.prod.outlook.com>
Date: Fri, 23 Feb 2018 12:44:16 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 18022301-0044-0000-0000-000003E8D228
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008579; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00993691; UDB=6.00504943; IPR=6.00773031; 
 MB=3.00019698; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-23 01:44:23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18022301-0045-0000-0000-00000818D925
Message-Id: <877er4pjin.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-22_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802230017
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Feb 2018 01:45:07 -0000

Yugi Mani <yupalani@microsoft.com> writes:
> We should consider both of these requirements for image signing:
> 1. Update verification
> 2. Boot Verification
>
> Appending signature to image meets verification during firmware update. T=
o do verification on every boot, we need something like FIT.=20=20
> https://chromium.googlesource.com/chromiumos/third_party/u-boot-next/+/ch=
romeos-v2013.06/doc/uImage.FIT
>
> As far as actual signing is concerned, we don't have access to private ke=
y for security reasons. We should support two models:
> Model 1:
> Source code has private key and signing is part of build process ("bitbak=
e obmc-phosphor-image")
>
> Model 2:
> Source code does not have private key, Signing is done externally and
> some post-processing is done to add hash to image.  (maybe a new task,
> "bitbake obmc-phosphor-image -c add_hash")

For reference, for OpenPOWER host firmware, we support three models:

Local mode (a.k.a. development mode) =E2=80=94 Build the container and sign
using locally available private keys. Signatures are generated using
simple openssl operations. Because the private keys are exposed on the
local system (the build machine), this mode should be used only for
development signing, or when the user is confident that the build
machine is secure against unauthorized access.

Independent mode =E2=80=94 Generate the signing requests locally and export=
 the
requests for signing externally. External signing is by user's method of
choice: any method capable of generating a ECDSA p521 signature (the
built-in support uses openssl). Resulting signatures are re-imported to
the container build process, to create the completed container. No
private or privileged information is exposed at the build machine.

Production mode =E2=80=94 Build the container locally and interface with the
remote signframework to retrieve signatures and (public) keys as
needed. Signing is done remotely on a secure signing server using a
hardware security module (HSM). Private keys are stored securely in the
HSM and never exposed. Completed signatures are returned by the
signframework and integrated into the container.

(gratuitously copy&pasted from Nick's great docs up at
https://github.com/open-power/sb-signing-utils/wiki )

--=20
Stewart Smith
OPAL Architect, IBM.
