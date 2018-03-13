Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 400yTK3cb2zDrJ4
 for <openbmc@lists.ozlabs.org>; Wed, 14 Mar 2018 01:50:44 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2DEn9Zh084682
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 10:50:41 -0400
Received: from e06smtp10.uk.ibm.com (e06smtp10.uk.ibm.com [195.75.94.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gpg38t9pp-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 10:50:40 -0400
Received: from localhost
 by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Tue, 13 Mar 2018 14:50:38 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 13 Mar 2018 14:50:35 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2DEoYhM57147592; Tue, 13 Mar 2018 14:50:34 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 519134C040;
 Tue, 13 Mar 2018 14:43:51 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B4784C046;
 Tue, 13 Mar 2018 14:43:50 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.203.113])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 13 Mar 2018 14:43:50 +0000 (GMT)
Subject: Re: RFC for Telemetry data collection
To: Kurt Taylor <kurt.r.taylor@gmail.com>, rosedahl@us.ibm.com
References: <59B163B0.6060804@linux.vnet.ibm.com>
 <a8cae0b0-9652-adfe-e262-c07d86198e94@linux.vnet.ibm.com>
 <CAG5OiwiTyzJwkc4ZET9Bc0dchU_13h2ixfmYp-hZwKDWbKVNyw@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Tue, 13 Mar 2018 20:20:33 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:52.0)
 Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAG5OiwiTyzJwkc4ZET9Bc0dchU_13h2ixfmYp-hZwKDWbKVNyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18031314-0040-0000-0000-0000041F0E57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031314-0041-0000-0000-0000262239DD
Message-Id: <2a9e08bc-e767-2840-974e-a3c194f0f09c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-13_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803130175
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Mar 2018 14:50:46 -0000

On 13/03/18 7:53 pm, Kurt Taylor wrote:

>     Hi,
> 
>     I'd like to bump this topic and add some more details. I'd like to
>     discuss design proposals/directions for a couple things :
> 
>     1) A short/mid term proposal for telemetry requirements specific to
>     IBM labs (which need to be implemented in a relatively short span of
>     time, so there may not be the bandwidth to write an entirely new
>     application not based on D-Bus or the OpenBMC REST API).
>     2) Industry standard methods for storing and retrieving telemetry
>     data - thoughts on how to get here.
> 
> 
>     1) Telemetry requirements specific to IBM labs
>     Here are the requirements and a design proposal.
> 
>     a) Instantaneous readings, such as temperatures, currents, errors,
>     events etc. Let's call this Layer 0.
> 
>     Proposal:
>     - The D-Bus model is the source for instantaneous readings. This
>     means there would be D-Bus objects representing this data, and hence
>     an OpenBMC REST API around it.
>     - These D-Bus objects would not necessarily implement the same D-Bus
>     interfaces.
>     - Interested clients can read these D-Bus objects via the OpenBMC
>     REST API.
>     - If clients are interested in being notified about "changes" to the
>     readings, that's possible via the existing event notification over
>     WebSockets mechanism.
> 
> 
> This would also map well into an OBMC MIB extension for example.
> 
> 
> 
>     b) Instantaneous aggregations - this would mostly apply to, but may
>     not be limited to, readings such as temperatures and currents. Let's
>     call this Layer 1. This basically is to solve, for eg, "what is the
>     min/max/average over the last X seconds?". We have a requirement to
>     do such aggregations on the BMC.
> 
> 
> I would be interested in why aggregations (and historical - level 3) are 
> a requirement and not just handled by the monitoring/event management 
> app as done in network management.If this work is to be done in the 
> BMC, it needs to be user definable and able to be turned off for 
> resource-critical situations.

Right, it should be possible to turn off the layer 2 and 3 aggregation 
apps, and not have them in the BMC image at all.

Why the aggregations are required to be done on the BMC - I think that's 
the expectation of some of the IBM monitoring tools. I'm sure Todd 
Rosedahl would have a better answer here.

> 
>     Proposal:
>     - Aggregations are represented as D-Bus objects, created by a
>     telemetry app. For eg if we need to know the min/max/avg ambient
>     temp for the last 5 minutes, and say the the ambient temp is usually
>     at temps/ambient, the aggregation could be at
>     temps/aggregations/ambient.
>     - Implement D-Bus interfaces to denote aggregations, for eg the
>     temps/aggregation/ambient object could implement a D-Bus interface
>     describing min/max/avg properties.
>     - Aggregation objects will have the values as described in the D-Bus
>     interface (such as min/max/avg), and a timestamp, as properties.
>     - Enable a config (eg JSON) to let the telemetry app know things
>     like : What (supported) aggregations should be performed
>     (min/max/avg)? What D-Bus objects should be aggregated? How
>     frequently should they be aggregated? What should be the paths of
>     the aggregations? Potentially add a REST API to allow changing the
>     (JSON) config at run-time.
>     - It will be possible to read all aggregation objects, or
>     aggregation objects of a specific type via one REST call.
> 
> 
>     c) Historical aggregations or snapshot. Let's call this Layer 2.
>     This is to solve, for eg, "Need a reading corresponding to every X
>     minutes in a period of Y hours". This can be a snapshot of Layer 1
>     or Layer 0 D-Bus objects. We have a requirement to store this
>     snapshot on the BMC.
> 
>     Proposal:
>     - The snapshot will be represented as a set of D-Bus objects. For eg
>     if one needs an hourly reading for a period of 24 hours, the objects
>     could be at temps/aggregations/ambient/per-hour/{1..24}.
>     - Enable a config to let a telemetry app to know things like : What
>     D-Bus objects should I keep a history of? What is the duration of
>     the snapshot? At what frequency should entries be added into the
>     snapshot? Once the snapshot is full, should the entries roll, or
>     should we restart? Potentially add a REST API to allow changing the
>     (JSON) config at run-time.
>     - The historical aggregations can be read via one REST call. It
>     should be one D-Bus call as well most likely for the REST server, if
>     there's an object manager at temps/aggregations/ambient/per-hour for eg.
>     - These objects in the snapshot will implement the same interfaces
>     as Layer 1 objects, so they will have the same properties (eg
>     min/max/avg, timestamp).
> 
> 
>     d) Some notes
>     - With the proposal above, the API to retrieve the telemetry data is
>     via the current OpenBMC REST API, so it may not readily work with
>     telemetry tools relying on industry-standard API (see point 2
>     below), but it seems to be the feasible option to rely on to
>     implement IBM's requirements in the expected timelines.
>     - Layer 1 and Layer 2 telemetry apps would be different processes,
>     and can function independent of each other.
> 
> 
> 
>     2) Industry standard methods for storing and retrieving telemetry data
> 
>     - With the proposal above, the instantaneous readings are D-Bus
>     objects, the instantaneous and historical aggregations are D-Bus
>     objects as well. The API is the OpenBMC REST API.
>     - Typically, aggregations may not have to happen on the BMC, in
>     which case one can turn off layers 1 and 2.
>     - This is regarding how the telemetry data is presented, and how
>     we'd eventually not use the current OpenBMC REST API in production.
>     I've heard (mostly from people on the To: list) of the following
>     industry-standard ways to represent/retrieve telemetry data. This
>     would mean transforming layer 0 D-Bus objects into these :
>              - Via Redfish (events) API
>              - Via IPMI events/PEF
> 
> 
> Meh. I'd stick with Redfish/OBMC REST API over this one.
> 
>              - Via SNMP traps
> 
> 
> If there is interest here, I have experience designing MIB extensions 
> and sub-agents to support them.
> 
>              - Via an sqlite db, and have something like Logstash parse it
> 
> 
> Seems very heavy for BMC.

I tend to agree.

> Kurt Taylor (krtaylor)
> 

Regards,
Deepak
