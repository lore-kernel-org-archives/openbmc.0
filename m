Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wx2bL1GlbzDr1k
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 18:41:34 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5Q8d5VF129248
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 04:41:31 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bassfb5em-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 04:41:31 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 26 Jun 2017 04:41:29 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 26 Jun 2017 04:41:25 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5Q8fP1M55115892; Mon, 26 Jun 2017 08:41:25 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AE13AE03B;
 Mon, 26 Jun 2017 04:41:27 -0400 (EDT)
Received: from birb.localdomain (unknown [9.185.16.200])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 7E3A5AE043;
 Mon, 26 Jun 2017 04:41:26 -0400 (EDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 43E9D4EC5FE; Mon, 26 Jun 2017 18:41:21 +1000 (AEST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Cyril Bur <cyrilbur@gmail.com>, Michael Tritz <mtritz@us.ibm.com>,
 skiboot@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Sam Mendoza-Jonas <sam@mendozajonas.com>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Subject: Re: [Skiboot] [PATCH v4] pflash option to retrieve PNOR partition
 flags
In-Reply-To: <1498089208.1181.3.camel@gmail.com>
References: <20170621034957.2504-1-mtritz@us.ibm.com>
 <1498089208.1181.3.camel@gmail.com>
Date: Mon, 26 Jun 2017 18:41:21 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17062608-2213-0000-0000-000001E80751
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007280; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00878879; UDB=6.00437974; IPR=6.00659031; 
 BA=6.00005438; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015947; XFM=3.00000015;
 UTC=2017-06-26 08:41:27
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17062608-2214-0000-0000-000056A56A01
Message-Id: <87fuenw37y.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-26_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706260146
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
X-List-Received-Date: Mon, 26 Jun 2017 08:41:34 -0000

Cyril Bur <cyrilbur@gmail.com> writes:

> On Tue, 2017-06-20 at 22:49 -0500, Michael Tritz wrote:
>> This commit extends pflash with an option to retrieve and print
>> information for a particular partition, including the content from
>> "pflash -i" and a verbose list of set miscellaneous flags. -i option
>> is also updated to print a short list of flags in addition to the
>> ECC flag, with one character per flag. A test of the new option is
>> included in libflash/test.
>
> I wonder if we should bikeshed the layout of print_partition_detail(),
> I'm absolutely not the person to review that kind of thing.
>
> I think it makes more sense for the changes to the libffs interface to
> be a separate patch.

I don't have a problem taking it as one patch, at least then we merge in
a user at the same time

-- 
Stewart Smith
OPAL Architect, IBM.
