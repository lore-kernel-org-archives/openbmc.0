Return-Path: <msbarth@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w3BWw39jpzDq9H
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 03:59:40 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3CHwhd5139942
 for <openbmc@lists.ozlabs.org>; Wed, 12 Apr 2017 13:59:26 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29srxsreku-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 12 Apr 2017 13:59:25 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.vnet.ibm.com>;
 Wed, 12 Apr 2017 13:59:24 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 12 Apr 2017 13:59:23 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3CHxMKc43581614; Wed, 12 Apr 2017 17:59:22 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66A93AC03F;
 Wed, 12 Apr 2017 13:59:12 -0400 (EDT)
Received: from [9.10.255.46] (unknown [9.10.255.46])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 47DF5AC041;
 Wed, 12 Apr 2017 13:59:12 -0400 (EDT)
Subject: Re: Running tests
To: Maxim Sloyko <maxims@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAFR_W8po-K8Jjfd=qHzA=hO88stnQQDWEbNz2htm6b2DBqyHAg@mail.gmail.com>
From: Matthew Barth <msbarth@linux.vnet.ibm.com>
Date: Wed, 12 Apr 2017 12:59:22 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAFR_W8po-K8Jjfd=qHzA=hO88stnQQDWEbNz2htm6b2DBqyHAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17041217-0024-0000-0000-0000024435A7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006924; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00846610; UDB=6.00417612; IPR=6.00625047; 
 BA=6.00005286; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015023; XFM=3.00000013;
 UTC=2017-04-12 17:59:24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17041217-0025-0000-0000-00004350F012
Message-Id: <57675cff-8d30-e550-0b45-d810f3c64426@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-12_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1704120148
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
X-List-Received-Date: Wed, 12 Apr 2017 17:59:41 -0000

On 04/12/17 12:22 PM, Maxim Sloyko wrote:
> Hi all,
>
> I'm looking into ways to automate test execution for ... well ... as
> many things as possible. I see that some repos, like
> openbmc/phosphor-event for example, have tests in them, but the
> problem is, I can't build and run that project individually, because
> of missing dependencies (my libsystemd is too old).
You can use bitbake to populate and install a x86_64 SDK environment 
that you
would be able to source into allowing you to build the project and run 
the tests.
There is a configure flag (--enable-oe-sdk) that must be given to the 
configure script
to setup some additional environment variables within the x86_64 SDK
environment. Here's a link with info on deploying an SDK:

https://github.com/openbmc/docs/blob/master/cheatsheet.md

Matt
> So, my question is, is there a way to build and run those tests from
> bitbake, so that they would use the version of systemd from yocto,
> rather than the one installed on my machine?
>
> Hope this question makes some sense.
>
> Thank you!
>
