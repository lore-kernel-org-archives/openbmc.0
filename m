Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vyGjj2DNkzDq7c
 for <openbmc@lists.ozlabs.org>; Wed,  5 Apr 2017 03:51:04 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v34HmmKr041667
 for <openbmc@lists.ozlabs.org>; Tue, 4 Apr 2017 13:50:56 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29m4e5wkp6-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2017 13:50:56 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 4 Apr 2017 11:50:56 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 4 Apr 2017 11:50:53 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v34Hor8412452314
 for <openbmc@lists.ozlabs.org>; Tue, 4 Apr 2017 10:50:53 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46886BE03A
 for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2017 11:50:53 -0600 (MDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.83.7.2])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 51A23BE03B
 for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2017 11:50:51 -0600 (MDT)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: Note to anyone who accesses the OpenFSI driver 'raw' file in their
 code
Date: Tue, 4 Apr 2017 12:50:49 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17040417-0016-0000-0000-0000067F8E7F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006882; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00843054; UDB=6.00415343; IPR=6.00621229; 
 BA=6.00005266; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014908; XFM=3.00000013;
 UTC=2017-04-04 17:50:54
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17040417-0017-0000-0000-000038B58A8B
Message-Id: <cf028f94-e624-e94e-c12e-a75d2e765add@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-04_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1704040153
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
X-List-Received-Date: Tue, 04 Apr 2017 17:51:06 -0000

To anyone who reads or writes to the OpenFSI device driver 'raw' file(s) 
on BMC please note that data for both reads and writes is changing to 
native bus endian format.  This is effective with the release of the 
OpenBMC 4.10 kernel.  Note that 4.7 is not impacted by this.

Adjustments you will need to make:

Any 32 bit data must be byte swapped prior to writing to the 'raw' 
file.  i.e.: instead of writing <byte 3, byte 2, byte 1, byte 0 > as was 
done before you will instead write <byte 0, byte 1, byte 2, byte 3>.  
Conversely all data read out of the 'raw' file must be byte swapped 
before acting on it.

Please let me know if you have any questions,

Chris
