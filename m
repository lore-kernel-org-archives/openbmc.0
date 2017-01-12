Return-Path: <dkodihal@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzgnD1m5rzDqhT
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 20:43:44 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 v0C9hfir144606
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 04:43:41 -0500
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 by mx0b-001b2d01.pphosted.com with ESMTP id 27wrw6pwtj-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 04:43:35 -0500
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Thu, 12 Jan 2017 19:43:33 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 12 Jan 2017 19:43:31 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id E3B792BB0045
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 20:43:30 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0C9hVFc51249328
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 20:43:31 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v0C9hUeF001241
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 20:43:30 +1100
Received: from Deepaks-MacBook-Pro.local ([9.193.119.48])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v0C9hTpb001197
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 20:43:30 +1100
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: Callout definitions in phosphor-logging : RFC
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 12 Jan 2017 15:13:28 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:45.0)
 Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011209-0016-0000-0000-0000020C077A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011209-0017-0000-0000-000006398D0C
Message-Id: <82ebc370-99c2-a44e-bf89-68d90acff3ae@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-12_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701120134
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
X-List-Received-Date: Thu, 12 Jan 2017 09:43:44 -0000

Hello,

This sprint I've been working on defining how an openbmc error having a 
"callout" should be defined. Traditionally IBM servers have this concept 
of a callout, which is basically an indication of a faulty hardware 
component in the server. Such a component is typically a "field 
replaceable unit" or a FRU. Hence the callout is usually a FRU callout. 
The callout has additional information, which helps determine how the 
FRU could be serviced or replaced. The callout is included in an error log.

While what necessitates a callout is a failed hardware access operation, 
for example a failed IIC write, what gets called out depends a lot on 
the system topology and various policies. The callout design needs to be 
generic, keeping system specific logic out of the application code. 
Keeping this in mind, we need to have a set of basic design principles 
on how a callout should be implemented in openbmc. I've outlined these 
below. Please provide your feedback. If you don't like the term 
"callout", please suggest alternatives.

1) An application running into an error and wanting to do a callout will 
express the callout in terminologies most familiar to the application, 
rather than system terminology. As an example, say an application 
programs the system reference clock via an IIC interface; in case of a 
failed IIC write, the application will express the callout as an IIC 
callout, adding information such as the IIC bus and device address. It 
will not bother about details such as, the FRU in question is the 
system's reference clock, or maybe that the clock is not a FRU on this 
system, and the entire system planar may need to be called out for 
replacement. Such decisions will have to be made by the error logging 
component, via use of system specific policy files.

2) Based on the above, we've defined some "callout interfaces" which 
applications may want to use. These interfaces are based on the 
phosphor-logging's openbmc error definition, so they are expressed in 
YAML. A callout interface would have metadata specific to that callout. 
For eg an IIC callout, such as xyz.openbmc_project.Error.Callout.IIC 
(may the term "callout" isn't needed here, since it's just another 
error?), would need the device address and the bus information. We have 
callouts for IIC, GPIO, IPMI sensor to start with. This is up for review 
in Gerrit [1]. The reasoning behind having a callout defined as an 
openbmc error is it lets you validate the metadata that an application 
needs to add to the error log for that callout. This is in-line with the 
existing phosphor-logging design.

3) To actually add a callout to an error, that error needs to be defined 
such that it inherits the callout event. There is an example for this in 
[1]. With this, a callout will essentially be like any other openbmc 
error, but there will be metadata, specific to that callout, required to 
log that error. When an application logs such an error, the metadata 
pertaining to the callout should be supplied by the application, and 
this gets to the systemd journal just like a regular error's metadata. 
The callout metadata will enable the phosphor error log server (work in 
progress) to be able to identify the callout, and then apply system 
policies to convert that to a FRU callout.

4) The error log server, upon identifying a callout, will with the help 
of the callout metadata, the system's MRW and various system policies, 
identify one or more FRUs that need to be called out. It will fetch 
appropriate FRU inventory objects from the phosphor-inventory-manager, 
and create associations between the error object and these inventory 
objects, in order to represent the callouts.

[1] https://gerrit.openbmc-project.xyz/#/c/1752

Thanks,
Deepak
