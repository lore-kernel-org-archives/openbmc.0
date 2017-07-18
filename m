Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xBY3d6jnnzDrFj
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 18:19:25 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6I8J6De122457
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 04:19:21 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bsbm2fs9e-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 04:19:21 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 18 Jul 2017 02:19:20 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 18 Jul 2017 02:19:18 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6I8JEGZ4194664; Tue, 18 Jul 2017 01:19:18 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 654A26E03F;
 Tue, 18 Jul 2017 02:19:18 -0600 (MDT)
Received: from birb.localdomain (unknown [9.81.211.57])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with SMTP id 67DED6E03A;
 Tue, 18 Jul 2017 02:19:17 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id BA6FB4EC746; Tue, 18 Jul 2017 18:19:13 +1000 (AEST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Michael Tritz <mtritz@us.ibm.com>, skiboot@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Cc: Michael Tritz <mtritz@us.ibm.com>, cyrilbur@gmail.com
Subject: Re: [PATCH v8] pflash option to retrieve PNOR partition flags
In-Reply-To: <20170712203149.12123-1-mtritz@us.ibm.com>
References: <20170712203149.12123-1-mtritz@us.ibm.com>
Date: Tue, 18 Jul 2017 18:19:13 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17071808-0008-0000-0000-00000840D0DA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007380; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00889238; UDB=6.00444158; IPR=6.00669411; 
 BA=6.00005478; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016258; XFM=3.00000015;
 UTC=2017-07-18 08:19:20
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17071808-0009-0000-0000-000043238307
Message-Id: <874luacg3i.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-18_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707180138
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
X-List-Received-Date: Tue, 18 Jul 2017 08:19:26 -0000

Michael Tritz <mtritz@us.ibm.com> writes:
> This commit extends pflash with an option to retrieve and print
> information for a particular partition, including the content from
> "pflash -i" and a verbose list of set miscellaneous flags. -i option
> is also updated to print a short list of flags in addition to the
> ECC flag, with one character per flag. A test of the new option is
> included in libflash/test.
>
> V8: Make check target now depends on having built pflash. Updated 
>     the path to pflash in the test script. Test script runs now.
> V7: Fixed whitespace error and changed permissions on test script
> V6: Reverted change to has_ecc() to avoid breaking libffs
>
> Change-Id: Iebb8a6d34c537cecd2eb44ddf41271c8fbe25258
> Signed-off-by: Michael Tritz <mtritz@us.ibm.com>

Thanks! I made a few minor changes to how the test was run (including
going and fixing up some of our code coverage infrasturcture) and merged
to master as of 360d0a394d8ce8f2f4cd0573cd51c56784f6faa4.

-- 
Stewart Smith
OPAL Architect, IBM.
