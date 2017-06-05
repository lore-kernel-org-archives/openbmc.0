Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3whQsc4lGszDqGr
 for <openbmc@lists.ozlabs.org>; Tue,  6 Jun 2017 06:10:12 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v55K8slq075905
 for <openbmc@lists.ozlabs.org>; Mon, 5 Jun 2017 16:10:09 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2awcwhjr5r-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 05 Jun 2017 16:10:09 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Mon, 5 Jun 2017 16:10:08 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 5 Jun 2017 16:10:05 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v55KA4DC62193856; Mon, 5 Jun 2017 20:10:05 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A37711205F;
 Mon,  5 Jun 2017 16:10:11 -0400 (EDT)
Received: from [9.10.99.11] (unknown [9.10.99.11])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id F3F13112034;
 Mon,  5 Jun 2017 16:10:10 -0400 (EDT)
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Subject: UCD registers for fault analysis
Date: Mon, 5 Jun 2017 15:10:05 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17060520-0052-0000-0000-00000217B98A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007178; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00870618; UDB=6.00432928; IPR=6.00650598; 
 BA=6.00005398; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015711; XFM=3.00000015;
 UTC=2017-06-05 20:10:06
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060520-0053-0000-0000-000050D901E3
Message-Id: <76e2515b-1cfe-4663-1676-20f1e27fb9ac@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-05_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706050382
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
X-List-Received-Date: Mon, 05 Jun 2017 20:10:13 -0000

Hi Joel,

I opened issue https://github.com/openbmc/openbmc/issues/1727 to 
describe some UCD90160 registers we need to be able to access in order 
to do power fault analysis.   Please take a look and see if its doable 
to add these to a driver.

They are:

* CLEAR_FAULTS - command 0x03
* Clear logged faults - write 0x00 to register 0xEA
* STATUS_WORD - 0x79
* STATUS_VOUT - 0x7A - all pages
* NUM_PAGES - 0xD6 - though maybe we can get the number of pages another way
* MFR_STATUS - 0xF3 - page 0 - for reading the GPI bits

Also:

Write, 0xFA 0x08
Read, 0xFB
Write, 0xFA 0x09
Read, 0xFB
Write, 0xFA 0x0A
Read, 0xFB
Write, 0xFA 0x0E
Read, 0xFB
Write, 0xFA 0x11
Read, 0xFB
Write, 0xFA 0x0B
Read, 0xFB

I also have a document I will send you offline.
