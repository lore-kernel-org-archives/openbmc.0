Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zQjph6jNRzDr1B
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jan 2018 20:35:55 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0N9ZIQP041894
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jan 2018 04:35:53 -0500
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fnwuaa7fy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jan 2018 04:35:52 -0500
Received: from localhost
 by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Tue, 23 Jan 2018 09:35:50 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 23 Jan 2018 09:35:48 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0N9Zl6355967894; Tue, 23 Jan 2018 09:35:47 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42E6C5204D;
 Tue, 23 Jan 2018 08:28:11 +0000 (GMT)
Received: from [9.193.103.195] (unknown [9.193.103.195])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 8A1EF5204E;
 Tue, 23 Jan 2018 08:28:10 +0000 (GMT)
Subject: Re: Technical Debt vs. Precedence vs. Velocity
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: openBMC <openbmc@lists.ozlabs.org>
References: <20180119163028.GX113334@mauery>
 <25ABDBB6-AFCC-4CC8-AB58-2C3FF5EF7832@fuzziesquirrel.com>
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Date: Tue, 23 Jan 2018 15:05:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <25ABDBB6-AFCC-4CC8-AB58-2C3FF5EF7832@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18012309-0016-0000-0000-0000051ACDE3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18012309-0017-0000-0000-000028575309
Message-Id: <d5216f73-e651-60e1-14c9-e5bcb01f5a7f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-23_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801230133
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jan 2018 09:35:57 -0000



On Tuesday 23 January 2018 06:58 AM, Brad Bishop wrote:
>> On Jan 19, 2018, at 11:30 AM, Vernon Mauery <vernon.mauery@linux.intel.com> wrote:
>>
>> Overall, the openbmc project has done a great job of keeping common things in common repositories and machine or OEM specific things in separate repositories. But there are a few (because it happens) places where technical debt has accrued. I want to support getting this sort of stuff fixed so we can have a shiny project, but at what expense? Velocity. Reality calls and I was not scoped to fix old code, only to write a new feature. I am not the only one running into this issue, so I thought it best to start a discussion.
>>
>> Things like:
>> 1) Incorrect coding style (whitespace, braces, upper/lower/snake/camel)
>> 2) Use of sdbus instead of sdbusplus
>> 3) OEM code in common libraries
>> 4) Lack of proper error handling
>> 5) Use of insecure functions without proper range checking (memcpy, strcpy, etc.)
>> 6) Use of printf/fprintf instead of log<>
>>
> Use (your maintainer) discretion, but I think precedence would _rarely_ be
> a valid justification for new technical debt.
>
> Our coding style, frameworks, guidelines, etc are all going to change over
> time.  The codebase will never be up to date in terms of the current mode
> of thinking.  So I would advocate for mixing code that does meet the current
> guidelines with code that does not, otherwise it will just get progressively
> worse.
I agree with Brad's suggestion that mixing code with different style is 
fine. I have come across this debate a number of times in code reviews.
Developers would be put in a dilemma if they have to switch styles with 
code in the current file. Its time to have a consensus on this aspect
at project level.

>
>> I am sure there are many other classes of technical debt that I did not list here. But the point is that the code base does have places where this sort of stuff exists and has not yet been fixed. What should the official stance be? To me, mixing coding styles in a single file is worse than having the same wrong coding style in a file. But the best is if the whole project matches.
>>
>> If someone contributes and claims that their newly added technical debt is okay
> Maybe just write down the rules you want, and put them in a README in the
> project repos you maintain.  Then you can simply point at this when these
> come up in review.  Just make sure your README files get a good review
> as well.
>
> I suspect some will want things like this documented at an OpenBMC wide level
> and not a per repository basis.  I’m not sure if I like that or not.  Maintaining
> is hard, and we all have our different things that make it less hard for us to
> maintain.
>
>> because of precedence, we don't really have a way to hold them to coming back and fixing the problem.
>>
>> One way to fix this is to have contributors that want to claim precedence go and clean up the file FIRST and then come back with a new clean commit. But that does make for a higher bar for entry in some cases and possibly slows down velocity.
> I think this is OK as long as the patch submitter has another option - adding
> code that meets the current guidelines without requiring the fix-up.  If they
> have a personal issue with mixed styles, they can make the fix-up prior to
> their edits.
>
>> What say the community members on this?
>>
>> --Vernon
