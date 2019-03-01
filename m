Return-Path: <jrey@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44B2JN5LskzDq7W
 for <openbmc@lists.ozlabs.org>; Sat,  2 Mar 2019 08:15:31 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x21L4V8d116082
 for <openbmc@lists.ozlabs.org>; Fri, 1 Mar 2019 16:15:27 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qyas8c7q9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 01 Mar 2019 16:15:26 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Fri, 1 Mar 2019 21:15:26 -0000
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 1 Mar 2019 21:15:24 -0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x21LFNrf27852838
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Mar 2019 21:15:23 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D4BB78079;
 Fri,  1 Mar 2019 21:15:23 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40FE578081;
 Fri,  1 Mar 2019 21:15:23 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  1 Mar 2019 21:15:23 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 01 Mar 2019 15:22:51 -0600
From: Joseph Reynolds <jrey@linux.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org, openbmc
 <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>
Subject: Re: [Proposal] End-user impacts and change log + details
X-Sender: jrey@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19030121-0036-0000-0000-00000A93267A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010687; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01168224; UDB=6.00610369; IPR=6.00948840; 
 MB=3.00025799; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-01 21:15:25
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19030121-0037-0000-0000-00004AE4A592
Message-Id: <8b23543286a12cfa90186efe08039f8c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-01_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903010143
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
X-List-Received-Date: Fri, 01 Mar 2019 21:15:33 -0000

On 2019-02-27 17:10, Andrew Jeffery wrote:
> On Wed, 27 Feb 2019, at 01:52, Joseph Reynolds wrote:
>> This is a proposal to improve OpenBMC communication and get better
>> release notes.
>> 
>> ** Preamble **
>> 
>> Teams that use OpenBMC in other projects will not know OpenBMC as well
>> as the development community, and they will not know what is in each
>> release.  The main way for them to find out is by reading the release
>> notes.  They will make decisions based on its contents.  That makes 
>> the
>> release notes an important communication between the development
>> community and its end-users.
>> 
>> We need to get better at communicating new and changed OpenBMC
>> functions.  Doing so gives many benefits, including better release 
>> notes
>> [1].
>> 
>> ** The proposal **
>> 
>> 1. Adopt a new practice to provide end-user impact statements when and
>> where it make sense to do so.
>> 2. Begin a project level change log to summarize user impacts.
>> 
>> ** Details **
>> 
>> How do these changes help connect the folks who contribute to OpenBMC
>> with the folks who use it?  The main points are:
>> 1. Contributors write an "end-user impact" statement to notify users
>> that something they might care about has changed.
>> 2. Community members use end-user impact statements to create a change
>> log which summarizes changes they consider significant.
>> 3. Release planning summarizes the change log as an input to the 
>> release
>> notes.
>> 
>> Items in detail:
>> 
>> 1. Create end-user impact statements.
>> 
>> An "end-user impact" statement summarizes each change from the point 
>> of
>> view of someone familiar with using the external interfaces.  It tells
>> them what they need to know about what changed from their point of 
>> view,
>> so they know what to test, how to adapt, etc.
>> 
>> When there is an impact, it should have details like:
>> - Is there an end-user impact (y/n)?
>> - Is this a new feature or function (where are the docs)?
>> - Is this a bug fix?
>> - What does the end-user need to know (one liner)?
>> These statements don't have to be perfect.  Any inkling you can 
>> provide
>> that there is a user impact is helpful to the community.  The impact
>> might change during the release as the design evolves.  Different
>> contributors will see different impacts.  That's all normal and okay.
>> 
>> Are the following end-user impacts?
>> - Change to phosphor-webui that affects the browser display?  Answer
>> "no" if it doesn't affect usage, or "Yes" if the user will likely 
>> notice
>> or care.
>> - Bug fix in fan control? Answer depends.  Answer "yes" if the bug 
>> might
>> start a fire.
>> - Refactor code?  No
>> - New Redfish API?  Yes; new features are positive user impacts.
>> - Adding new documentation?  No; although helpful, docs don't affect 
>> the
>> end-user's use of the external interfaces
>> - BMCWeb retires old and accepts new TLS encryption algorithms?  Yes, 
>> it
>> affects how you can connect to the BMC
>> - Changes to phosphor-rest or to D-Bus APIs?  No, despite their
>> importance, these interfaces are technically internal to the BMC.  We
>> might want to document user-impacts to these as well.
>> - Security fix?  Yes, probably, given today's climate
>> Feel free to come up with your own criteria, based on your estimation 
>> of
>> an end-user.
>> 
>> Writing an "end-user impact" statement bridges two worlds.  Folks who
>> work on the code may prefer to leave documentation for others or may 
>> not
>> fully understand the impact of their change on BMC operations.  And
>> nobody else may understand the change.  So who should write the 
>> end-user
>> impact statement?  Anyone who understands the change and how it 
>> impacts
>> end-users.  That could be developers, testers, or project managers.
>> Multiple people can contribute over time.  And it should be okay to
>> document an end-user impact in someone else's change.
>> 
>> It is important that all of the end-user impact statements be
>> "findable".  Adding them as comments on selected GitHub issues is an
>> obvious solution, and I suggest using the issue associated with the 
>> code
>> change that caused the user impact. (We could use GitHub labels [8][9]
>> to mark issues which have user impact.)
>> 
>> 2. Create a change log from end-user impact statements.
>> 
>> Groups who care about end-user impacts include testers, security 
>> folks,
>> release managers, and others.  They can scan the issues, read the 
>> impact
>> statements, and use them to curate a change log [2] which lists all
>> changes that might be interesting to users.  Each change log entry
>> should have a brief description of the impact (from the user's point 
>> of
>> view) with links back to the issue.  The change log could be an 
>> openbmc
>> wiki page.  (And yes, some people's job includes curating change 
>> logs.)
>> 
>> We should have a project-wide change log which captures all impacts.
>> (It is easy to ignore entries you don't care about.)  Anyone who cares
>> about a user impact can add items to the change log.
>> 
>> How is the change log useful?  Testers will use the change log to help
>> ensure test coverage and add facts about where the test cases are 
>> stored
>> and whether the tests passed.  Release managers will use it to gauge
>> progress toward goals.  Security folks will cover security changes.
>> Technical writers, etc.  Each will contribute significant facts about
>> their part of the process, and the log is a place to organize links to
>> demos, etc.
>> 
>> 3. Use the change log to make release notes.
>> 
>> The Release Planning work group [3] can refer to the change log as an
>> input to the Release Notes [1][4].  For example, multiple changes can 
>> be
>> merged, minor changes can be omitted, important changes can be
>> highlighted, etc.  Having good release notes is a hallmark of a mature
>> development process.
>> 
>> Let's be clear about this: Most users will ignore the release notes or
>> use it only to answer specific questions about bugs or features.  Only 
>> a
>> few will use it to learn more about new functions, changed functions
>> they have to adapt to, how to review test efforts, what security fixes
>> are included, etc.  They will make decisions based on its content.  
>> For
>> example, some groups may use it as part of a software security 
>> assurance
>> process [5].
>> 
>> ** Conclusion **
>> 
>> That's the proposal ... create end-user impact statements ... 
>> summarize
>> them in a change log ... and massage that into release notes.  The 
>> real
>> trick is to actually write end-user impact statements as the work is
>> being done.  We have the test team [6] and the security work group [7]
>> to help with that, along with pressure from groups who use OpenBMC in
>> their projects.
> 
> So, I think it's a reasonable proposal, however, I think there needs to 
> be
> more concrete description of how I as a contributor go about this. 
> There's
> a sort-of throw-away suggestion above that the user impact descriptions
> should go in "the github issue associated with the change" - I guess I 
> want
> to see some agreement that this is how we're going to go about it. You
> probably also want to start hassling developers to actually write the 
> impact
> statement; while I don't expect anyone will be opposed to the idea, 
> getting
> them to take it up is a separate problem (there may also be a problem 
> of
> having a github issue associated with the change to start with).

Thank you!

Here is the next level of detail:

1. Add the "change log process" to the CONTRIBUTING doc [101].
  - Motivate the need to document end-user impacts and for a change log,
    and show how these flow into the release notes.
  - Provide guidance for the content of user impact statements.
    Give examples of impacts, non-impacts, and end-users.
  - Say where to document impacts (in github.com/openbmc/REPO/issues).

2. Agree to use issues to document user impact statements.  Understand 
that any indication there is a user impact is helpful.  Agree it is okay 
to write a terse impact statement.  Agree that mentioning @changelog 
with no other explanation means you want someone else to write the 
impact statement.  Agree it is okay for someone other than the developer 
to write impact statements.  Agree that if you write @changelog and 
nobody takes any action, then nobody cares about your change, and that's 
okay.

3. Create a GitHub openbmc user called "changelog".  Then contributors 
can @mention [102] @changelog in the issue that describes the user 
impacts,
and all issues that describe user impacts can be found.  I had thought 
to create a new label [8][9] called "User impact" for this purpose, but 
GitHub permissions do not allow most users to add labels.

4. Create the Change Log wiki here: 
https://github.com/openbmc/openbmc/wiki/changelog
and begin to populate it with user impact.

I am interested in this a way to track the software development process. 
  Specifically, I would create user impact statements and changelog 
entries for:
  - Release 2.7 work items as they complete, tracked here: [103].
  - Functions being tracked by the test work group [104].
  - Security impacts [105].

- Joseph

[101]: https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md
[102]: https://help.github.com/en/articles/mentions-on-github-pages
[103]: https://github.com/openbmc/openbmc/labels/Release2.7
[104]: https://github.com/openbmc/openbmc/wiki/Test-work-group
[105]: 
https://github.com/openbmc/openbmc/wiki/Security-working-group#current-development-work-with-security-impact

> Andrew
> 
>> 
>> - Joseph Reynolds
>> 
>> [1]: https://en.m.wikipedia.org/wiki/Release_notes
>> [2]: https://en.m.wikipedia.org/wiki/Changelog
>> [3]: https://github.com/openbmc/openbmc/wiki/Release-Planning
>> [4]:
>> https://github.com/openbmc/docs/blob/master/release/release-notes.md
>> [5]: https://en.wikipedia.org/wiki/Software_security_assurance
>> [6]: https://github.com/openbmc/openbmc/wiki/Test-work-group
>> [7]: https://github.com/openbmc/openbmc/wiki/Security-working-group
>> [8]: https://help.github.com/en/articles/about-labels
>> [9]: https://github.com/openbmc/openbmc/labels
>> 
>> 
