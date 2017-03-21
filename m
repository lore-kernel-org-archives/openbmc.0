Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnfZM4dxFzDq7c
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 04:14:51 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2LHDfae123902
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 13:14:45 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29b532b7ux-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 13:14:44 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 21 Mar 2017 13:14:43 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 21 Mar 2017 13:14:41 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2LHEc7D40435760; Tue, 21 Mar 2017 17:14:40 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A56BAE051;
 Tue, 21 Mar 2017 13:14:33 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.83.0.205])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 29AC9AE03C;
 Tue, 21 Mar 2017 13:14:30 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.7 v2] drivers/fsi: Add delay before sampling
 input on SDA
To: Jeremy Kerr <jk@ozlabs.org>, joel@jms.id.au
References: <20170317211836.63576-1-cbostic@linux.vnet.ibm.com>
 <5abc5b5b-d431-94c1-00f3-42d2d595b278@ozlabs.org>
 <f3991ff8-7584-23c3-488d-17bdd4efb1ae@linux.vnet.ibm.com>
 <fa128d63-338c-84c3-ed54-ce0bc3107556@ozlabs.org>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Tue, 21 Mar 2017 12:14:35 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <fa128d63-338c-84c3-ed54-ce0bc3107556@ozlabs.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17032117-0040-0000-0000-000002F0A60C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006823; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00836913; UDB=6.00411379; IPR=6.00614680; 
 BA=6.00005227; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014745; XFM=3.00000013;
 UTC=2017-03-21 17:14:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17032117-0041-0000-0000-000006E4AB83
Message-Id: <fdb520e7-e8c3-dec9-feff-9f0f46347973@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-21_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703210148
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
X-List-Received-Date: Tue, 21 Mar 2017 17:14:52 -0000



On 3/20/17 7:57 PM, Jeremy Kerr wrote:
> Hi Chris,
>
>> The echo delay in the driver clocks '1's on the line so as long as the
>> echo_delay() utility is used there is no risk of random data in this
>> phase.
> Ah, I'd missed the set_sda_output(1), there. That should be fine then.
>
>> Yes that's true, cpu load shouldn't be a factor in this case then. The
>> failure mode is during the sampling of input data during the slave
>> response phase of the command.  CRC received does not match the CRC
>> calculated due to bit flips
>> related to sampling/clocking timing issues.  This problem only appears
>> when hostboot is accessing the BMC.  Increasing delay does correct the
>> issue.  I don't have a good explanation for why this timing behavior
>> occurs given its not cpu load related.
> My concern here is that with such a dramatic change in timing there
> (200x), and not knowing what the underlying problem is, we're just
> making the issue less likely to occur, rather than fixing it.
Hi Jeremy,

I understand your concern here.  I agree we need to understand the
root cause.  I'll open up an issue to track this.
>
> Do you know if we have access to HW folks to scope the data & clock? We
> could set a GPIO when we see a CRC error, to use as an external
> trigger...
I'll ask around and see what can be done.  Taking a snap shot at time
of recreate should be enough to see what's going on in clock and
data timing when we fail, seems to be fairly consistent under some
hostboot access of PNOR conditions.

Thanks,
Chris
>
> Cheers,
>
>
> Jeremy
>
