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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4482bG4G84zDqFt
 for <openbmc@lists.ozlabs.org>; Wed, 27 Feb 2019 02:21:29 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1QFBIFk046473
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 10:21:25 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qw6ksp28r-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 10:21:25 -0500
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Tue, 26 Feb 2019 15:21:24 -0000
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 26 Feb 2019 15:21:22 -0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1QFLLT962914788
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 15:21:21 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F9DC136051
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 15:21:21 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62F1E136059
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 15:21:21 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 15:21:21 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 26 Feb 2019 09:28:41 -0600
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [Proposal] End-user impacts and change log
X-Sender: jrey@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19022615-0016-0000-0000-00000989464F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010668; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01166678; UDB=6.00609435; IPR=6.00947284; 
 MB=3.00025748; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-26 15:21:23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19022615-0017-0000-0000-000042473404
Message-Id: <4e9738f7d20fba142dddd4825ec7651a@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-26_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902260110
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
X-List-Received-Date: Tue, 26 Feb 2019 15:21:31 -0000

This is a proposal to improve OpenBMC communication and get better 
release notes.

** Preamble **

Teams that use OpenBMC in other projects will not know OpenBMC as well 
as the development community, and they will not know what is in each 
release.  The main way for them to find out is by reading the release 
notes.  They will make decisions based on its contents.  That makes the 
release notes an important communication between the development 
community and its end-users.

We need to get better at communicating new and changed OpenBMC 
functions.  Doing so gives many benefits, including better release notes 
[1].

** The proposal **

1. Adopt a new practice to provide end-user impact statements when and 
where it make sense to do so.
2. Begin a project level change log to summarize user impacts.

** Details **

How do these changes help connect the folks who contribute to OpenBMC 
with the folks who use it?  The main points are:
1. Contributors write an "end-user impact" statement to notify users 
that something they might care about has changed.
2. Community members use end-user impact statements to create a change 
log which summarizes changes they consider significant.
3. Release planning summarizes the change log as an input to the release 
notes.

Items in detail:

1. Create end-user impact statements.

An "end-user impact" statement summarizes each change from the point of 
view of someone familiar with using the external interfaces.  It tells 
them what they need to know about what changed from their point of view, 
so they know what to test, how to adapt, etc.

When there is an impact, it should have details like:
- Is there an end-user impact (y/n)?
- Is this a new feature or function (where are the docs)?
- Is this a bug fix?
- What does the end-user need to know (one liner)?
These statements don't have to be perfect.  Any inkling you can provide 
that there is a user impact is helpful to the community.  The impact 
might change during the release as the design evolves.  Different 
contributors will see different impacts.  That's all normal and okay.

Are the following end-user impacts?
- Change to phosphor-webui that affects the browser display?  Answer 
"no" if it doesn't affect usage, or "Yes" if the user will likely notice 
or care.
- Bug fix in fan control? Answer depends.  Answer "yes" if the bug might 
start a fire.
- Refactor code?  No
- New Redfish API?  Yes; new features are positive user impacts.
- Adding new documentation?  No; although helpful, docs don't affect the 
end-user's use of the external interfaces
- BMCWeb retires old and accepts new TLS encryption algorithms?  Yes, it 
affects how you can connect to the BMC
- Changes to phosphor-rest or to D-Bus APIs?  No, despite their 
importance, these interfaces are technically internal to the BMC.  We 
might want to document user-impacts to these as well.
- Security fix?  Yes, probably, given today's climate
Feel free to come up with your own criteria, based on your estimation of 
an end-user.

Writing an "end-user impact" statement bridges two worlds.  Folks who 
work on the code may prefer to leave documentation for others or may not 
fully understand the impact of their change on BMC operations.  And 
nobody else may understand the change.  So who should write the end-user 
impact statement?  Anyone who understands the change and how it impacts 
end-users.  That could be developers, testers, or project managers. 
Multiple people can contribute over time.  And it should be okay to 
document an end-user impact in someone else's change.

It is important that all of the end-user impact statements be 
"findable".  Adding them as comments on selected GitHub issues is an 
obvious solution, and I suggest using the issue associated with the code 
change that caused the user impact. (We could use GitHub labels [8][9] 
to mark issues which have user impact.)

2. Create a change log from end-user impact statements.

Groups who care about end-user impacts include testers, security folks, 
release managers, and others.  They can scan the issues, read the impact 
statements, and use them to curate a change log [2] which lists all 
changes that might be interesting to users.  Each change log entry 
should have a brief description of the impact (from the user's point of 
view) with links back to the issue.  The change log could be an openbmc 
wiki page.  (And yes, some people's job includes curating change logs.)

We should have a project-wide change log which captures all impacts.  
(It is easy to ignore entries you don't care about.)  Anyone who cares 
about a user impact can add items to the change log.

How is the change log useful?  Testers will use the change log to help 
ensure test coverage and add facts about where the test cases are stored 
and whether the tests passed.  Release managers will use it to gauge 
progress toward goals.  Security folks will cover security changes.  
Technical writers, etc.  Each will contribute significant facts about 
their part of the process, and the log is a place to organize links to 
demos, etc.

3. Use the change log to make release notes.

The Release Planning work group [3] can refer to the change log as an 
input to the Release Notes [1][4].  For example, multiple changes can be 
merged, minor changes can be omitted, important changes can be 
highlighted, etc.  Having good release notes is a hallmark of a mature 
development process.

Let's be clear about this: Most users will ignore the release notes or 
use it only to answer specific questions about bugs or features.  Only a 
few will use it to learn more about new functions, changed functions 
they have to adapt to, how to review test efforts, what security fixes 
are included, etc.  They will make decisions based on its content.  For 
example, some groups may use it as part of a software security assurance 
process [5].

** Conclusion **

That's the proposal ... create end-user impact statements ... summarize 
them in a change log ... and massage that into release notes.  The real 
trick is to actually write end-user impact statements as the work is 
being done.  We have the test team [6] and the security work group [7] 
to help with that, along with pressure from groups who use OpenBMC in 
their projects.

- Joseph Reynolds

[1]: https://en.m.wikipedia.org/wiki/Release_notes
[2]: https://en.m.wikipedia.org/wiki/Changelog
[3]: https://github.com/openbmc/openbmc/wiki/Release-Planning
[4]: 
https://github.com/openbmc/docs/blob/master/release/release-notes.md
[5]: https://en.wikipedia.org/wiki/Software_security_assurance
[6]: https://github.com/openbmc/openbmc/wiki/Test-work-group
[7]: https://github.com/openbmc/openbmc/wiki/Security-working-group
[8]: https://help.github.com/en/articles/about-labels
[9]: https://github.com/openbmc/openbmc/labels
