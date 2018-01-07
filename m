Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zFDrS2F1WzF0SB
 for <openbmc@lists.ozlabs.org>; Mon,  8 Jan 2018 10:19:35 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.21) with SMTP id
 w07NJFYp098516
 for <openbmc@lists.ozlabs.org>; Sun, 7 Jan 2018 18:19:32 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fbed5qprd-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 07 Jan 2018 18:19:32 -0500
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Sun, 7 Jan 2018 18:19:31 -0500
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sun, 7 Jan 2018 18:19:29 -0500
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w07NJSZw49283214; Sun, 7 Jan 2018 23:19:28 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 965EFB2054;
 Sun,  7 Jan 2018 18:16:30 -0500 (EST)
Received: from birb.localdomain (unknown [9.81.217.148])
 by b01ledav003.gho.pok.ibm.com (Postfix) with SMTP id A339AB2046;
 Sun,  7 Jan 2018 18:16:29 -0500 (EST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 1CEFE4EC5DC; Mon,  8 Jan 2018 10:19:24 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Andrew Geissler <geissonator@gmail.com>,
 Dave Cobbley <david.j.cobbley@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Gerrit alternatives
In-Reply-To: <CALLMt=oqzKzhHYGhC02t6z7p1f+d+2oeq52HhPB6Wr0KWXtFGQ@mail.gmail.com>
References: <20912a5f-e956-13c3-3fd4-1ba1fe9f1759@linux.intel.com>
 <CALLMt=oqzKzhHYGhC02t6z7p1f+d+2oeq52HhPB6Wr0KWXtFGQ@mail.gmail.com>
Date: Mon, 08 Jan 2018 10:19:24 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18010723-2213-0000-0000-0000025649BE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008336; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000244; SDB=6.00971737; UDB=6.00492223; IPR=6.00751687; 
 BA=6.00005765; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018918; XFM=3.00000015;
 UTC=2018-01-07 23:19:31
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18010723-2214-0000-0000-000058ADC5BE
Message-Id: <87r2r1tfyb.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-07_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801070347
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
X-List-Received-Date: Sun, 07 Jan 2018 23:19:36 -0000

Andrew Geissler <geissonator@gmail.com> writes:
> On Tue, Dec 19, 2017 at 7:26 PM, Dave Cobbley
> <david.j.cobbley@linux.intel.com> wrote:
>> Hey all,
>>
>> I am curious to see peoples input on using github as a code review mechanism
>> over gerrit. I see github/openbmc is already used quite well for sprint
>> planning and issue tracking, I feel like it would make a lot of sense to use
>> it for doing code reviews. As far as I understand it has a mechanism to
>> reproduce a similar paradigm to what we currently use today - as far as
>> Code-Review, Ok-To-Test, and Verified.
>>
>> I can see github has made several improvements over the last few years that
>> make it much more use-able to teams like us:
>>
>> - The ability to have approved maintainers for each specific repository with
>> https://github.com/blog/2392-introducing-code-owners
>>
>> - It has the ability to do a rebase-merge, keeping the git tree nice and
>> tidy.
>>
>> - A strong API to tie in additional tools that we may need.
>>
>>
>> Additionally, it will reduce the point of failure from also hosting gerrit.
>>
>> What are peoples thoughts on using this?
>
> As the guy who ended up having to maintain the current gerrit server,
> I'm all for an alternative :)
>
> But my problem is I really like gerrit.  github has def made some
> improvements to the review process though.  I see it has per-line
> comment ability now.
>
> I have a pull request out here for a non-gerrit openbmc repo if
> someone wants to look around -
> https://github.com/openbmc/openbmc-tools/pull/5
>
> One thing I really like is how gerrit allows you to iterate over a
> commit.  Someone makes some comments, you respond, upload a new patch
> set.  My understanding with github is you basically just keep adding
> on new commits in a pull request to address comments.  A feature I use
> all the time in gerrit is to look at the diff between a patch set I
> last reviewed and the latest one.  Also, I don't see an obvious
> mechanism in github to provide the different score levels
> (-2,-1,+1,+2)?  The gerrit dashboard is also really nice, providing me
> a nice easy way to see what's on my review list and what the current
> size and scores of those reviews are (for all repos in openbmc).

Basically all those features is why I like review via email and
patchwork. You can review/comment as much as you like, anywhere, easily,
even offline. As a maintiner, patchwork is invaluable, and passes the
"somebody else maintains it" test, while still actually being open.

> We also base a lot of our current CI infrastructure off of gerrit
> events.  I think most of it can be switched over to using github, but
> it's not inconsequential.

Some of the CI integration in patchwork needs a bit of work though. We need to bribe
the grads with something in order to get snowpatch fixed up :)

-- 
Stewart Smith
OPAL Architect, IBM.
