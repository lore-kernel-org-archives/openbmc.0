Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vmy4V03FtzDq5g
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 00:50:01 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2KDn9jE097350
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 09:49:50 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 298wsgk5s7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 09:49:49 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 20 Mar 2017 07:49:48 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 20 Mar 2017 07:49:46 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2KDngQI11665782; Mon, 20 Mar 2017 06:49:45 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D33E78051;
 Mon, 20 Mar 2017 07:49:45 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.83.0.205])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id AFBB878037;
 Mon, 20 Mar 2017 07:49:43 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.7 v2] drivers/fsi: Add delay before sampling
 input on SDA
To: Jeremy Kerr <jk@ozlabs.org>, joel@jms.id.au
References: <20170317211836.63576-1-cbostic@linux.vnet.ibm.com>
 <5abc5b5b-d431-94c1-00f3-42d2d595b278@ozlabs.org>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Mon, 20 Mar 2017 08:49:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <5abc5b5b-d431-94c1-00f3-42d2d595b278@ozlabs.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17032013-0020-0000-0000-00000B9AEF76
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006816; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00836366; UDB=6.00411049; IPR=6.00614135; 
 BA=6.00005224; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014726; XFM=3.00000013;
 UTC=2017-03-20 13:49:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17032013-0021-0000-0000-00005B00A101
Message-Id: <f3991ff8-7584-23c3-488d-17bdd4efb1ae@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-20_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703200121
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
X-List-Received-Date: Mon, 20 Mar 2017 13:50:02 -0000



On 3/20/17 12:33 AM, Jeremy Kerr wrote:
> Hi Chris,
>
>> During high cpu loads the SDA in line can shift relative to the
>> clock signal which can corrupt the received input data.  Slow
>> down the time to sample input to account for this.
> This looks much better than the previous patch, but do you know why high
> CPU loads affect this? All of the GPIO interactions are performed with
> the single spinlock held, so CPU load should have no bearing on the
> timing of the bit-banging - the driver has exclusive use of the CPU
> during a FSI transaction.
> Can you elaborate on the symptoms of this?
Hi Jeremy,

Yes that's true, cpu load shouldn't be a factor in this case then. The 
failure mode is during the sampling of input data during the slave 
response phase of the command.  CRC received does not match the CRC 
calculated due to bit flips
related to sampling/clocking timing issues.  This problem only appears 
when hostboot is accessing the BMC.  Increasing delay does correct the 
issue.  I don't have a good explanation for why this timing behavior 
occurs given its not cpu load related.
> One thing that looks a little suspicious to me is that you're running
> the clock during the echo delay time, so you're potentially feeding
> random data to the slave...
>
> Cheers,
The echo delay in the driver clocks '1's on the line so as long as the 
echo_delay() utility is used there is no risk of random data in this 
phase.   Clocking during this phase also gives the slave more clocks to 
process the newly sent command so the entire time for processing a 
single command and generating a response takes less follow on clocks.

Thanks,
Chris
>
> Jeremy
>
