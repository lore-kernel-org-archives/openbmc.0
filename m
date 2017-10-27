Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yNj143M3yzDqfh
 for <openbmc@lists.ozlabs.org>; Fri, 27 Oct 2017 22:52:39 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9RBnTV7182317
 for <openbmc@lists.ozlabs.org>; Fri, 27 Oct 2017 07:52:37 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2dv2xq3vrv-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 27 Oct 2017 07:52:36 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Fri, 27 Oct 2017 07:52:36 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 27 Oct 2017 07:52:33 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9RBqXYj53608556; Fri, 27 Oct 2017 11:52:33 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BEE0AC043;
 Fri, 27 Oct 2017 07:53:18 -0400 (EDT)
Received: from [9.124.124.105] (unknown [9.124.124.105])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 3D88BAC03F;
 Fri, 27 Oct 2017 07:53:17 -0400 (EDT)
Subject: Re: IPMI - get device ID
To: Dave Cobbley <david.j.cobbley@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <e1f79a27-ea39-90d5-3cb9-c55f8e1d68ec@linux.intel.com>
Cc: chinari@us.ibm.com, Brad Bishop <bradleyb@fuzziesquirrel.com>
From: tomjose <tomjose@linux.vnet.ibm.com>
Date: Fri, 27 Oct 2017 17:22:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <e1f79a27-ea39-90d5-3cb9-c55f8e1d68ec@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 17102711-0052-0000-0000-000002789143
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007961; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00937189; UDB=6.00472337; IPR=6.00717451; 
 BA=6.00005660; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017742; XFM=3.00000015;
 UTC=2017-10-27 11:52:34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17102711-0053-0000-0000-00005272B06B
Message-Id: <59F31DFE.50809@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-27_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710270159
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
X-List-Received-Date: Fri, 27 Oct 2017 11:52:41 -0000

Hello Dave,

https://github.com/openbmc/openbmc/issues/495

We had this issue open to fix the hardcoded Product ID, Manufacturing 
ID..etc. Since these fields are IPMI specific, we do not plan to create 
D-Bus properties for that.

The solution we have in mind is to have these values specified in a yaml 
in the openbmc machine specific layer. This gives the advantage that we 
have these values as machine specific and can be taken care at compile 
time. We would add code in phosphor-host-ipmid, to generate code out of 
this yaml file and serve the Get Device ID command.

Dinesh is working on this and he would share the code on gerrit to 
solicit your feedback. Let me know your thoughts.

Regards,
Tom

On Thursday 26 October 2017 10:29 PM, Dave Cobbley wrote:
> I noticed a bit of the get-device-id information in 
> phosphor-ipmi-host/apphandler is hard coded.
>
> Much of this info should be determined at compile time - would the 
> inventory manager be the appropriate place that all platforms under 
> the OpenBMC umbrella would like to store this information?
>
> •   Device ID
> •   Device Revision
> •   IANA
> •   Product ID
> •   Auxiliary
>
> Thanks,
>
> -Dave Cobbley
>
