Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wx2jg6T1pzDr1g
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 18:47:03 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5Q8iWr9121907
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 04:47:02 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bawqsuxu9-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 04:47:01 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 26 Jun 2017 02:47:01 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 26 Jun 2017 02:46:58 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5Q8kvjF21102698; Mon, 26 Jun 2017 01:46:57 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAF4E136044;
 Mon, 26 Jun 2017 02:46:57 -0600 (MDT)
Received: from birb.localdomain (unknown [9.185.16.200])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 4EB4F13603C;
 Mon, 26 Jun 2017 02:46:57 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id DA3C74EC5FE; Mon, 26 Jun 2017 18:46:55 +1000 (AEST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Michael Tritz <mtritz@us.ibm.com>, skiboot@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Cc: Michael Tritz <mtritz@us.ibm.com>, cyrilbur@gmail.com
Subject: Re: [Skiboot] [PATCH v4] pflash option to retrieve PNOR partition
 flags
In-Reply-To: <20170621034957.2504-1-mtritz@us.ibm.com>
References: <20170621034957.2504-1-mtritz@us.ibm.com>
Date: Mon, 26 Jun 2017 18:46:55 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17062608-0016-0000-0000-0000070ADB5A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007280; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00878879; UDB=6.00437974; IPR=6.00659031; 
 BA=6.00005438; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015947; XFM=3.00000015;
 UTC=2017-06-26 08:46:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17062608-0017-0000-0000-00003A4A5877
Message-Id: <87d19rw2yo.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-26_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706260147
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
X-List-Received-Date: Mon, 26 Jun 2017 08:47:04 -0000

Michael Tritz <mtritz@us.ibm.com> writes:
> This commit extends pflash with an option to retrieve and print
> information for a particular partition, including the content from
> "pflash -i" and a verbose list of set miscellaneous flags. -i option
> is also updated to print a short list of flags in addition to the
> ECC flag, with one character per flag. A test of the new option is
> included in libflash/test.
>
> Change-Id: Iebb8a6d34c537cecd2eb44ddf41271c8fbe25258
> Signed-off-by: Michael Tritz <mtritz@us.ibm.com>
> ---
>  external/pflash/pflash.c          | 134 ++++++++++++++++++++++++++++++++++----
>  libflash/libffs.c                 |  19 +++---
>  libflash/libffs.h                 |   8 ++-
>  libflash/test/test-miscprint.pnor | 103 +++++++++++++++++++++++++++++
>  libflash/test/test-miscprint.sh   |  25 +++++++
>  5 files changed, 269 insertions(+), 20 deletions(-)
>  create mode 100644 libflash/test/test-miscprint.pnor
>  create mode 100644 libflash/test/test-miscprint.sh

I think this looks mostly good (a few comments below), one thing is taht
the test-miscprint test isn't run by the 'make libflash-check' target,
so it'll have to be added to libflash/test/Makefile.check so that we can run it
automatically.

Although... there's libflash versus pflash tests too... I know Cyril has
been working on some pflash tests, but the libflash ones just need to
call the API to do the tests.

> @@ -103,25 +106,40 @@ static void print_ffs_info(uint32_t toc_offset)
>  		return;
>  	}
>  
> -	for (i = 0;; i++) {
> +	for (i = 0; rc == 0; i++) {
>  		uint32_t start, size, act, end;
> -		bool ecc;
> -		char *name;
> +		char *name = NULL, *flags;
> +		int l;
>  
> -		rc = ffs_part_info(ffs_handle, i, &name, &start, &size, &act, &ecc);
> +		rc = ffs_part_info(ffs_handle, i, &name, &start, &size, &act, NULL);
>  		if (rc == FFS_ERR_PART_NOT_FOUND)
>  			break;
> -		if (rc) {
> -			fprintf(stderr, "Error %d scanning partitions\n", rc);
> -			break;
> +
> +        ent = ffs_entry_get(ffs_handle, i);

Your indenting here is off.


-- 
Stewart Smith
OPAL Architect, IBM.
