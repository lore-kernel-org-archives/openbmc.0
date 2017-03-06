Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vc2Vs0zS4zDqFh
 for <openbmc@lists.ozlabs.org>; Mon,  6 Mar 2017 12:38:28 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v261T31C098760
 for <openbmc@lists.ozlabs.org>; Sun, 5 Mar 2017 20:38:16 -0500
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28yuy19tju-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 05 Mar 2017 20:38:16 -0500
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Sun, 5 Mar 2017 18:38:16 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sun, 5 Mar 2017 18:38:13 -0700
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 4A9633E40030;
 Sun,  5 Mar 2017 18:38:13 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v261cD0I12517862; Sun, 5 Mar 2017 18:38:13 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 196A06A03B;
 Sun,  5 Mar 2017 18:38:13 -0700 (MST)
Received: from birb.localdomain (unknown [9.185.16.50])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 9FE266A03F;
 Sun,  5 Mar 2017 18:38:12 -0700 (MST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 9FF1F229DB26; Mon,  6 Mar 2017 12:38:08 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Venkatesh Sainath <vsainath@linux.vnet.ibm.com>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: Re: sbefifo userspace api
In-Reply-To: <653FA956-68B2-41B4-8233-4A31C57E1E67@fuzziesquirrel.com>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <63a66b91-f17c-2501-5f96-cd8b03a0b3cb@linux.vnet.ibm.com>
 <B3299ABE-85F1-4062-B15B-3C530C5651EF@fuzziesquirrel.com>
 <2536438.YnoCRmC1BK@new-mexico> <20170221214916.365zogt3siz2ybi2@asimov>
 <653FA956-68B2-41B4-8233-4A31C57E1E67@fuzziesquirrel.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/25.1.1
 (x86_64-redhat-linux-gnu)
Date: Mon, 06 Mar 2017 12:38:08 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17030601-0028-0000-0000-0000073506C3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006730; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00830516; UDB=6.00407384; IPR=6.00608116; 
 BA=6.00005188; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014522; XFM=3.00000012;
 UTC=2017-03-06 01:38:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17030601-0029-0000-0000-00003419DEE5
Message-Id: <877f4389rz.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-06_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703060011
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
X-List-Received-Date: Mon, 06 Mar 2017 01:38:29 -0000

Brad Bishop <bradleyb@fuzziesquirrel.com> writes:
>> On Feb 21, 2017, at 4:49 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
>> 
>> On Tue, Feb 21, 2017 at 02:34:18AM +1100, Alistair Popple wrote:
>>> I would also be interested in the answer to the inverse - why put them
>>> in the kernel? There's the OCC hwmon driver - what chip-ops does that
>>> need? Just get/putscom? If that's the case I thought we were already
>>> exposing scom chip-op operations via an OpenFSI master?
>> 
>> When the P9 chip has security enabled, you cannot even issue SCOM
>> operations without going through the SBE FIFO.  The SBE provides a
>> white-list filtering system that prevents the majority of the SCOM space
>> from being accessed.  We will need a "SCOM over FIFO" driver on top of
>> FSI.
>
> Well, we need a way to do scoms over sbe.  Not sure that equals being
> a device driver.  As it stands if it were a driver, it would just be
> very thin wrapper around the sbefifo driver.

it'd be nice if getscom/putscom userspace could be the same on BMC and
host though.

-- 
Stewart Smith
OPAL Architect, IBM.
