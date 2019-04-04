Return-Path: <jrey@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZqDl3lVzzDqFZ
 for <openbmc@lists.ozlabs.org>; Fri,  5 Apr 2019 04:09:27 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x34GiY1E057990
 for <openbmc@lists.ozlabs.org>; Thu, 4 Apr 2019 13:09:23 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2rnmksckes-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 04 Apr 2019 13:09:22 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Thu, 4 Apr 2019 18:09:22 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 4 Apr 2019 18:09:19 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x34H9IUO21561590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Apr 2019 17:09:18 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF98728060;
 Thu,  4 Apr 2019 17:09:18 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 696BE2805C;
 Thu,  4 Apr 2019 17:09:18 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  4 Apr 2019 17:09:18 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 04 Apr 2019 12:10:05 -0500
From: Joseph Reynolds <jrey@linux.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org, openbmc
 <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>
Subject: Re: [Proposal] End-user impacts and change log + details
In-Reply-To: <8b23543286a12cfa90186efe08039f8c@linux.vnet.ibm.com>
References: <8b23543286a12cfa90186efe08039f8c@linux.vnet.ibm.com>
X-Sender: jrey@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19040417-0072-0000-0000-000004159131
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010873; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01184289; UDB=6.00620085; IPR=6.00965043; 
 MB=3.00026298; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-04 17:09:20
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040417-0073-0000-0000-00004BB5F958
Message-Id: <6c85b58ebad62f17ee67071e173904ee@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-04_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904040106
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2019 17:09:28 -0000

On 2019-03-01 15:22, Joseph Reynolds wrote:
> On 2019-02-27 17:10, Andrew Jeffery wrote:
>> On Wed, 27 Feb 2019, at 01:52, Joseph Reynolds wrote:
>>> This is a proposal to improve OpenBMC communication and get better
>>> release notes.
>>> 
>>> ** Preamble **
>>> 
>>> Teams that use OpenBMC in other projects will not know OpenBMC as 
>>> well
>>> as the development community, and they will not know what is in each
>>> release.  The main way for them to find out is by reading the release
>>> notes.  They will make decisions based on its contents.  That makes 
>>> the
>>> release notes an important communication between the development
>>> community and its end-users.
>>> 
>>> We need to get better at communicating new and changed OpenBMC
>>> functions.  Doing so gives many benefits, including better release 
>>> notes
>>> [1].
>>> 
>>> ** The proposal **
>>> 
>>> 1. Adopt a new practice to provide end-user impact statements when 
>>> and
>>> where it make sense to do so.
>>> 2. Begin a project level change log to summarize user impacts.
>>> 
>>> ** Details **
>>> 

...snip...

I am no longer pursuing end-user impacts statements in each issue at 
this time. Instead I create a work-in-progress wiki.  I'll start a 
separate email thread to announce that.

>>> 
>>> 2. Create a change log from end-user impact statements.
>>> 
>>> Groups who care about end-user impacts include testers, security 
>>> folks,
>>> release managers, and others.  They can scan the issues, read the 
>>> impact
>>> statements, and use them to curate a change log [2] which lists all
>>> changes that might be interesting to users.  Each change log entry
>>> should have a brief description of the impact (from the user's point 
>>> of
>>> view) with links back to the issue.  The change log could be an 
>>> openbmc
>>> wiki page.  (And yes, some people's job includes curating change 
>>> logs.)
>>> 
>>> We should have a project-wide change log which captures all impacts.
>>> (It is easy to ignore entries you don't care about.)  Anyone who 
>>> cares
>>> about a user impact can add items to the change log.
>>> 
>>> How is the change log useful?  Testers will use the change log to 
>>> help
>>> ensure test coverage and add facts about where the test cases are 
>>> stored
>>> and whether the tests passed.  Release managers will use it to gauge
>>> progress toward goals.  Security folks will cover security changes.
>>> Technical writers, etc.  Each will contribute significant facts about
>>> their part of the process, and the log is a place to organize links 
>>> to
>>> demos, etc.
>>> 
>>> 3. Use the change log to make release notes.

...snip...

> 
> Here is the next level of detail:
> 
> 1. Add the "change log process" to the CONTRIBUTING doc [101].
>  - Motivate the need to document end-user impacts and for a change log,
>    and show how these flow into the release notes.
>  - Provide guidance for the content of user impact statements.
>    Give examples of impacts, non-impacts, and end-users.
>  - Say where to document impacts (in github.com/openbmc/REPO/issues).

...snip...

> 4. Create the Change Log wiki here:
> https://github.com/openbmc/openbmc/wiki/changelog
> and begin to populate it with user impact.

This is done.  I'll start a new email thread to announce it.

- Joseph

> I am interested in this a way to track the software development
> process.  Specifically, I would create user impact statements and
> changelog entries for:
>  - Release 2.7 work items as they complete, tracked here: [103].
>  - Functions being tracked by the test work group [104].
>  - Security impacts [105].
> 
> - Joseph
> 
> [101]: https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md
> [102]: https://help.github.com/en/articles/mentions-on-github-pages
> [103]: https://github.com/openbmc/openbmc/labels/Release2.7
> [104]: https://github.com/openbmc/openbmc/wiki/Test-work-group
> [105]:
> https://github.com/openbmc/openbmc/wiki/Security-working-group#current-development-work-with-security-impact
> 
>> Andrew
>> 
>>> 
>>> - Joseph Reynolds
>>> 
>>> [1]: https://en.m.wikipedia.org/wiki/Release_notes
>>> [2]: https://en.m.wikipedia.org/wiki/Changelog
>>> [3]: https://github.com/openbmc/openbmc/wiki/Release-Planning
>>> [4]:
>>> https://github.com/openbmc/docs/blob/master/release/release-notes.md
>>> [5]: https://en.wikipedia.org/wiki/Software_security_assurance
>>> [6]: https://github.com/openbmc/openbmc/wiki/Test-work-group
>>> [7]: https://github.com/openbmc/openbmc/wiki/Security-working-group
>>> [8]: https://help.github.com/en/articles/about-labels
>>> [9]: https://github.com/openbmc/openbmc/labels
>>> 
>>> 
