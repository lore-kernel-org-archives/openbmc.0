Return-Path: <hegdevasant@linux.vnet.ibm.com>
X-Greylist: delayed 5109 seconds by postgrey-1.35 at bilbo;
 Sat, 21 May 2016 05:51:59 AEST
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rBJVR3h9ZzDqDv
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2016 05:51:59 +1000 (AEST)
Received: from pps.filterd (m0048817.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u4KINlm8048254
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2016 14:26:47 -0400
Message-Id: <201605201826.u4KINlm8048254@mx0a-001b2d01.pphosted.com>
Received: from e28smtp04.in.ibm.com (e28smtp04.in.ibm.com [125.16.236.4])
 by mx0a-001b2d01.pphosted.com with ESMTP id 231n7w1u37-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2016 14:26:47 -0400
Received: from localhost
 by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <hegdevasant@linux.vnet.ibm.com>;
 Fri, 20 May 2016 23:56:43 +0530
Received: from d28dlp01.in.ibm.com (9.184.220.126)
 by e28smtp04.in.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 20 May 2016 23:56:42 +0530
X-IBM-Helo: d28dlp01.in.ibm.com
X-IBM-MailFrom: hegdevasant@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
 by d28dlp01.in.ibm.com (Postfix) with ESMTP id B768EE005F
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2016 23:59:53 +0530 (IST)
Received: from d28av03.in.ibm.com (d28av03.in.ibm.com [9.184.220.65])
 by d28relay03.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4KIQdeD262506
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2016 23:56:39 +0530
Received: from d28av03.in.ibm.com (localhost [127.0.0.1])
 by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4KIQbvr007784
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2016 23:56:38 +0530
Received: from [9.80.69.205] ([9.80.69.205])
 by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4KIQajp007750; Fri, 20 May 2016 23:56:37 +0530
Subject: Re: Event Log parser
To: openbmc@lists.ozlabs.org
References: <201603220522.u2M5Mn0f014732@d01av04.pok.ibm.com>
 <8760wfytha.fsf@birb.au.ibm.com>
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>,
 Ananth N Mavinakayanahalli <ananth@in.ibm.com>
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Date: Fri, 20 May 2016 23:56:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <8760wfytha.fsf@birb.au.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16052018-0012-0000-0000-0000027D7774
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16052018-0013-0000-0000-00000CB51C07
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-05-20_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_policy_notspam
 policy=outbound_spam_policy score=0
 spamscore=0 suspectscore=12 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1604210000 definitions=main-1605200226
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 20 May 2016 19:52:00 -0000

On 03/22/2016 10:55 AM, Stewart Smith wrote:
> Chris Austen <austenc@us.ibm.com> writes:
>> Here's a first pass at the event log parser. It has the stuff for the
>> BMC viewer, the eSEL for (not sure really) and the Debug Data is a
>> good old fashion PEL. Thoughts?
>
> Using opal-elog-parse to parse the PEL?
>

Today I've merged Russel's patch to parse eSEL logs to ppc64-diag package [1].
With this patch opal-elog-parse command can parse both PEL and eSEL logs.

[1] 
https://sourceforge.net/p/linux-diag/ppc64-diag/ci/8ed317c447eee65363e6dec7e4e2bf284c8b78ac/


-Vasant
