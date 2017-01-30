Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vBdhD2KTGzDq9s
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2017 16:47:24 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v0U5e9o1008146
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2017 00:47:22 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2890j8vhs1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2017 00:47:21 -0500
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 30 Jan 2017 00:47:20 -0500
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 30 Jan 2017 00:47:19 -0500
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id A17F16E801D;
 Mon, 30 Jan 2017 00:46:50 -0500 (EST)
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0U5lImF11993474; Mon, 30 Jan 2017 05:47:18 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E405124044;
 Mon, 30 Jan 2017 00:47:18 -0500 (EST)
Received: from birb.localdomain (unknown [9.185.16.210])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 7FDFA124037;
 Mon, 30 Jan 2017 00:47:17 -0500 (EST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 23278229DB26; Mon, 30 Jan 2017 16:47:13 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>, Chris Austen <austenc@us.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: OpenBMC Image Management
In-Reply-To: <20170127030706.GB5504@heinlein.lan>
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <OF3E869A3E.DB3E43DE-ON862580B3.008284D7-862580B3.0082FDDB@notes.na.collabserv.com>
 <20170127030706.GB5504@heinlein.lan>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/25.1.1
 (x86_64-redhat-linux-gnu)
Date: Mon, 30 Jan 2017 16:47:13 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17013005-0056-0000-0000-0000029B61F9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006523; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00814587; UDB=6.00397585; IPR=6.00592028; 
 BA=6.00005097; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014100; XFM=3.00000011;
 UTC=2017-01-30 05:47:20
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17013005-0057-0000-0000-000006D066ED
Message-Id: <87o9ypw13y.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-30_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701300062
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
X-List-Received-Date: Mon, 30 Jan 2017 05:47:24 -0000

Patrick Williams <patrick@stwcx.xyz> writes:
> On Wed, Jan 25, 2017 at 05:50:46PM -0600, Chris Austen wrote:
>> "openbmc" <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org> wrote on
>> 01/25/2017 04:15:27 PM:
>> 
>> Are there any security goals that need to be considered?
>> 
>
> There are a few different aspects to security that I can think of:
>
> 1. Is there a way to identify and reject an invalid image (Define
> "invalid") before it is applied onto the system?
>
> 2. Is there a way to identify an applied image has been tampered with?
>
> 3. Is there a way for an image to expose a security flaw in the code
> itself (such as by "fuzzing") to cause unintended effects?

I think the biggest opportunity for fuzzing and security analysis will
be in BMC<->HOST interfaces.

It'd be great if every BMC<->HOST interface could be fuzzed in sim or in
userspace.


> A few statements to answer your question:
>
>     * If there is a fundamental flaw in any of these regards with our design,
>       we would like to know about it and will fix it.
>
>     * #1 is typically solved through image signing and a one-time 
>       verification at the time an image is applied.  Issue
>       openbmc/openbmc#356 is meant to implement this and would be a
>       later feature on top of Adriana's proposed work.
>
>     * #2 is typically solved through "Secureboot" or similar
>       functionality.  
>         * The Power9 processor can implement Secureboot itself, so the IBM
>           team currently has no plans to implement additional per-use
>           verification of the Host firmware contents [in PNOR] by the BMC.
>         * IBM also does not currently plan to include BMC Secureboot for
>           the Witherspoon machine's initial delivery.

dm-verity (a device-mapper target taht cryptographically verifies each
filesystem block) could be a way to very easily get most of what's
needed here.

https://lwn.net/Articles/459420/

https://source.android.com/security/verifiedboot/


>         * Rick Altherr from Google has been contributing support for
>           U-Boot "FIT" images, which provide something like Secureboot
>           verification for the kernel and initramfs images.

Combined with dm-verity, we'd be a long way towards a remotely
trustworthy BMC (well, trust-worthy in the way that it's running a
*known* set of vulnerabilities :)

-- 
Stewart Smith
OPAL Architect, IBM.
