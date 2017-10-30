Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQjTb1W3lzDrnn
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 05:20:49 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9UIFKJM131696
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 14:20:45 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dx94bgg77-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 14:20:45 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 30 Oct 2017 12:20:43 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 30 Oct 2017 12:20:40 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9UIKeME2425274; Mon, 30 Oct 2017 11:20:40 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A8746E03A;
 Mon, 30 Oct 2017 12:20:40 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.85.69.99])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id 120D86E03D;
 Mon, 30 Oct 2017 12:20:37 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10] fsi: core: Allow more BREAKs to recover a
 failing link
To: Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
References: <20171020173237.76535-1-cbostic@linux.vnet.ibm.com>
 <34b84ff0-4f65-5537-d6c7-272cf2e3c6b8@ozlabs.org>
 <1509336286.13477.21.camel@aj.id.au>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Mon, 30 Oct 2017 13:20:35 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1509336286.13477.21.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17103018-0024-0000-0000-0000176947F5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007982; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00938735; UDB=6.00473210; IPR=6.00718996; 
 BA=6.00005663; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017794; XFM=3.00000015;
 UTC=2017-10-30 18:20:42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17103018-0025-0000-0000-00004D4F94D5
Message-Id: <a592be38-a9af-8e84-78b9-c60202905510@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-30_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710300244
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Oct 2017 18:20:56 -0000



On 10/29/17 11:04 PM, Andrew Jeffery wrote:
> On Mon, 2017-10-23 at 10:57 +0800, Jeremy Kerr wrote:
>> Hi Chris,
>>
>>> Recovering a failing FSI link can require more than a single
>>> BREAK command to reset the FSI slave. Test results indicate
>>> that communications can be restored when a second or third
>>> BREAK is sent when the previous attempts fail.
>> This seems somewhat suspicious to me. Do we have any indication from the
>> CFAM documentation, or the folks responsible for the CFAM implentation,
>> that multiple breaks will actually cause any difference in behaviour
>> that a single one? Or is this based only on experimentation?
>>
>> I'm worried that we'd be papering-over the underlying issue here.
>>
> Chris, my understanding is we're abandoning the approach in this patch.
> Is that correct?

Yes that's correct.   Focus is now on finding cause for the bus 
contention instead of recovering from it.

Chris
>
> Andrew
