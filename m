Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zNTGP2V5CzDqhc
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jan 2018 05:03:40 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0JI3ZfO041022
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jan 2018 13:03:38 -0500
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fkkj0536x-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jan 2018 13:03:38 -0500
Received: from localhost
 by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Fri, 19 Jan 2018 18:03:34 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 19 Jan 2018 18:03:32 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0JI3Vck57081950
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jan 2018 18:03:31 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAB8711C04C
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jan 2018 17:57:13 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21D8311C04A
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jan 2018 17:57:13 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.77.210.224])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jan 2018 17:57:12 +0000 (GMT)
Subject: Re: Technical Debt vs. Precedence vs. Velocity
To: openbmc@lists.ozlabs.org
References: <20180119163028.GX113334@mauery>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Fri, 19 Jan 2018 23:33:28 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:52.0)
 Gecko/20100101 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180119163028.GX113334@mauery>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18011918-0016-0000-0000-00000519B8E5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18011918-0017-0000-0000-000028563719
Message-Id: <a9415d1a-05c6-de03-f148-48ba83f34e26@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-19_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801190234
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
X-List-Received-Date: Fri, 19 Jan 2018 18:03:41 -0000

On 19/01/18 10:00 pm, Vernon Mauery wrote:
> Overall, the openbmc project has done a great job of keeping common 
> things in common repositories and machine or OEM specific things in 
> separate repositories. But there are a few (because it happens) places 
> where technical debt has accrued. I want to support getting this sort of 
> stuff fixed so we can have a shiny project, but at what expense? 
> Velocity. Reality calls and I was not scoped to fix old code, only to 
> write a new feature. I am not the only one running into this issue, so I 
> thought it best to start a discussion.
> 
> Things like:
> 1) Incorrect coding style (whitespace, braces, upper/lower/snake/camel)
> 2) Use of sdbus instead of sdbusplus
> 3) OEM code in common libraries
> 4) Lack of proper error handling
> 5) Use of insecure functions without proper range checking (memcpy, 
> strcpy, etc.)
> 6) Use of printf/fprintf instead of log<>
> 
> I am sure there are many other classes of technical debt that I did not 
> list here. But the point is that the code base does have places where 
> this sort of stuff exists and has not yet been fixed. What should the 
> official stance be? To me, mixing coding styles in a single file is 
> worse than having the same wrong coding style in a file. But the best is 
> if the whole project matches.
> 
> If someone contributes and claims that their newly added technical debt 
> is okay because of precedence, we don't really have a way to hold them 
> to coming back and fixing the problem.
> 
> One way to fix this is to have contributors that want to claim 
> precedence go and clean up the file FIRST and then come back with a new 
> clean commit. But that does make for a higher bar for entry in some 
> cases and possibly slows down velocity.
> 
> What say the community members on this?
> 
> --Vernon
> 

I suppose this problem is more pronounced with the ipmi repos, and I 
think the reason is most of that code was written much before the 
current set of coding practices and guidelines have been established.

While in some instances I've posted comments asking the author to rework 
their commits based on the current standards, it's most of the times not 
feasible because of the mixing coding guidelines problem you brought 
out, which I agree is odd to do. At the same time, I'm not sure how apt 
it is to ask a contributor to clean up the file in question first, if 
that's even possible to do at a file level, when their commit is 
intended to solve a specific problem and it does that job.

Sorry I don't have any answers for this right away, the one thing I can 
think of is planned effort to refactor the ipmi code base to meet our 
standards. I kind of feel that might lead to better results than 
cleaning up/refactoring on the go.

Thanks,
Deepak
