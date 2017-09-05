Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xmkrS2WB8zDrKx
 for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2017 21:24:24 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v85BOKik075865
 for <openbmc@lists.ozlabs.org>; Tue, 5 Sep 2017 07:24:21 -0400
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2csq86wp93-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 05 Sep 2017 07:24:21 -0400
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Tue, 5 Sep 2017 21:24:07 +1000
Received: from d23relay10.au.ibm.com (202.81.31.229)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 5 Sep 2017 21:24:06 +1000
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v85BO60936110504
 for <openbmc@lists.ozlabs.org>; Tue, 5 Sep 2017 21:24:06 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v85BO7xF013450
 for <openbmc@lists.ozlabs.org>; Tue, 5 Sep 2017 21:24:07 +1000
Received: from Deepaks-MacBook-Pro.local ([9.77.91.219])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v85BO4UH013352
 for <openbmc@lists.ozlabs.org>; Tue, 5 Sep 2017 21:24:05 +1000
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RFC for event logging mechanism
Date: Tue, 5 Sep 2017 16:54:01 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:52.0)
 Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
x-cbid: 17090511-0044-0000-0000-00000284D4D9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17090511-0045-0000-0000-000007186C28
Message-Id: <066b3313-6516-2c05-6c67-4b8d26b50401@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-05_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709050174
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
X-List-Received-Date: Tue, 05 Sep 2017 11:24:24 -0000

Hello,

I'm working this sprint on designing an event logging mechanism 
(https://github.com/openbmc/openbmc/issues/1856). I have a couple 
proposals below along with some questions. Hoping to hear thoughts on 
which might be a better proposal. Any other feedback is welcome.

Potential requirements
1) Applications should be able to log events of interest. Events could 
be used for purposes such as telemetry, analytics, debug. Examples of 
events could be changes in the power/thermal domain, such as operating 
temps on a server, boot related, user account changes, etc.
2a) Users should be able to query events via REST.
2b) Users should also be able to query events of a certain category or type.
3) Users should also be able to "download" events in a format such as 
JSON (This comes for free today with the rest server running on OpenBMC).
4) It should be possible to specify event metadata, which may have use 
for a human as well as a program.
5) It should be possible to persist events up to a certain cap.



Proposal 1 - Leverage existing OpenBMC phosphor-logging

Phopshor-logging works as a supplement to journald - at a high level it 
makes it possible to log errors to the journal, as well as create d-bus 
objects representing the errors.

- Phosphor-logging uses the Entry interface [1] to describe an error. I 
have [2] as the proposed Event interface. It's mostly similar to [1] - 
differences being - I wasn't sure if we really need event severity and 
resolution, plus having an event Category would be handy for handling 
Requirement 2b).

- Phosphor-logging requires describing errors in yaml (error yaml and 
error metadata yaml), which are processed [3] by a script that generates 
an error log API, which clients can use. The API is part of a 
phosphor-logging client lib. The same yaml structure can be utilized for 
events, maybe with the yaml files themselves being named slightly 
differently to depict events and event metadata instead of errors. This 
means the client lib will have an event API, similar to the existing 
elog API [6]. Error yaml files are stored either in the 
phosphor-dbus-interfaces repo, or within an application's repo, based on 
whether the error corresponds to a d-bus interface failure or not. In 
case of events, I think the event yaml files can just be stored in the 
app that creates them.

- The event logging API, in addition to logging to journal, will call an 
internal phosphor-logging d-bus API, similar to [4], in order create a 
d-bus object depicting the event. Based on the event Category, the d-bus 
object will be placed in the right namespace, such as 
/xyz/openbmc_project/logging/events/boot/ or 
/xyz/openbmc_project/logging/events/thermal/. The phosphor-logging 
process, hence, will own these d-bus objects, do the id management (per 
category), etc.



Proposal 2 - Write d-bus interfaces to describe events

Couple of issues I see with Proposal 1 :

a) It's cumbersome for a BMC app to figure out that a specific event was 
reported, or to express interest in a certain category of events. The 
d-bus path namespace can help to a certain extent here though, but it's 
based on paths and properties and not interfaces being added.
b) Both the existing Entry interface [1] and the proposed Event 
interface [2] express metadata as strings, probably not the most elegant 
way for an interested program to deal with them.

Given this, it feels more natural to express an event in it's own d-bus 
interface, such as an Event.Boot or Event.Thermal interface. So, this 
proposal looks like :

- Define an Event log interface [5]. Note that this is mostly like [2], 
although it has an additional method to create the event d-bus object.

- For specific event types, define their own d-bus interfaces. I don't 
have examples for these at the moment, but like I mentioned above, we 
could have interfaces for Event.Boot and Event.Thermal to start with. 
These interfaces could be placed in the phosphor-dbus-interfaces repo. A 
phosphor-logging application will have the code to implement these 
well-known event interfaces, and to basically create d-bus objects. This 
app will also implement the "Notify" method defined in [5].

- An application interested in reporting an event will make a call to 
the "Notify" API defined in [5], stating the event category and the 
event metadata. The phosphor-logging application that implements 
"Notify", will create d-bus objects based on the event Category and 
metadata, and place them in appropriate d-bus path namespaces, similar 
to Proposal 1. It can also log the event information to the journal, 
though I am not sure why this would be required, aside from the having 
the need to have the journal as the repo of all events.



[1] 
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Logging/Entry.interface.yaml
[2] https://gerrit.openbmc-project.xyz/#/c/6405/1
[3] 
https://github.com/openbmc/phosphor-logging/blob/master/tools/elog-gen.py, 
error yaml example : 
https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Dump
[4] 
https://github.com/openbmc/phosphor-logging/blob/master/log_manager.cpp#L27
[5] https://gerrit.openbmc-project.xyz/#/c/6406/1
[6] 
https://github.com/openbmc/phosphor-logging/blob/master/phosphor-logging/elog.hpp#L126

Regards,
Deepak
