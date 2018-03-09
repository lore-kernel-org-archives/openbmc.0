Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zyT9x5nx7zF1rq
 for <openbmc@lists.ozlabs.org>; Sat, 10 Mar 2018 00:43:45 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w29Ddplv092996
 for <openbmc@lists.ozlabs.org>; Fri, 9 Mar 2018 08:43:42 -0500
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2gku98ra90-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Mar 2018 08:43:42 -0500
Received: from localhost
 by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Fri, 9 Mar 2018 13:43:40 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 9 Mar 2018 13:43:36 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w29Dhant58982452; Fri, 9 Mar 2018 13:43:36 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A12B2A4040;
 Fri,  9 Mar 2018 13:36:30 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D010BA4053;
 Fri,  9 Mar 2018 13:36:28 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.77.192.109])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  9 Mar 2018 13:36:28 +0000 (GMT)
Subject: Re: RFC for Telemetry data collection
References: <59B163B0.6060804@linux.vnet.ibm.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
To: jk@ozlabs.org, joel@jms.id.au, bradleyb@fuzziesquirrel.com,
 venture@google.com, tomjose@linux.vnet.ibm.com, rosedahl@us.ibm.com,
 vernon.mauery@linux.intel.com, openbmc@lists.ozlabs.org
Date: Fri, 9 Mar 2018 19:13:33 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:52.0)
 Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <59B163B0.6060804@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18030913-0020-0000-0000-00000400C2F9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18030913-0021-0000-0000-000042950C24
Message-Id: <a8cae0b0-9652-adfe-e262-c07d86198e94@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-09_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803090174
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
X-List-Received-Date: Fri, 09 Mar 2018 13:43:50 -0000

On 07/09/17 8:50 pm, tomjose wrote:
> Hello,
> 
> I am working on the issue 
> (https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_openbmc_openbmc_issues_1957&d=DwICaQ&c=jf_iaSHvJObTbx-siA1ZOg&r=LzkOghL3x_3V_EkHiUQJUJ0xrq_s3_wwfssFT35AQXw&m=Gk0KnGVKy2iC82jVgpSqjzR2K_EYRlsFBqs34EjyKys&s=nQguk1LTD_q7dPNEn6dV2p4vsKaMu1vYZs5_Vh0BiNc&e= 
> ) to design a telemetry application for the OpenBMC. I would be 
> explaining a rough idea of how we plan to go about. Please share your 
> thoughts and feedback on this proposal. This issue would depend on the 
> design evolving out of following issues, since this app would utilize 
> the capabilities provided. 
> (https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_openbmc_openbmc_issues_1856&d=DwICaQ&c=jf_iaSHvJObTbx-siA1ZOg&r=LzkOghL3x_3V_EkHiUQJUJ0xrq_s3_wwfssFT35AQXw&m=Gk0KnGVKy2iC82jVgpSqjzR2K_EYRlsFBqs34EjyKys&s=2B_nLYU03S0QgMnCrMr8YawangOxRXmXGBqPF9593DY&e= 
> , 
> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_openbmc_openbmc_issues_2102&d=DwICaQ&c=jf_iaSHvJObTbx-siA1ZOg&r=LzkOghL3x_3V_EkHiUQJUJ0xrq_s3_wwfssFT35AQXw&m=Gk0KnGVKy2iC82jVgpSqjzR2K_EYRlsFBqs34EjyKys&s=U6M9vpoDDmNbTJJH5I6M6lPBGFzS1nuqYEEGwXjAviY&e= 
> ).
> 
> Summary of the requirements that we came across relevant to this 
> discussion.
> 
> 
> 1) BMC telemetry data (example VRM rail voltages) where the data is 
> collected at different rates depending on the data and aggregated by the 
> BMC app  (minimum, maximum
>      and average). Based on the collection timing request(frequency) the 
> metrics are logged, so that the user can fetch it for analytics.
> 
> 2)  Users should be able to set thresholds for the temperature limits, 
> and receive alerts. This would allow user to plan the cooling needs.
> 
> 3)  BMC would act as route for the OCC metrics to be send to the user. 
> The OCC would send down telemetric data to the BMC and BMC should figure 
> out a way to
>       alert the user to consume this data.
> 
> 
> We would keep the focus of the discussion on the requirement no 1.
> This proposal presupposes that all the resources( example VRM rail 
> voltages, ambient temperature) that the telemetry app is interested in, 
> should be populated as dbus objects, which can
> be queried to read the instantaneous values. phosphor-hwmon application 
> exposes many of the interested resources.
> 
> The idea is to have a yaml based approach, where the policy of the 
> telemetry app will be expressed. The application would be able to 
> consume the yaml and initiate the telemetry
> data collection. The yaml would express the following:
> 
> a) Dbus Info (object, interface, property) associated with the resource.
> b) Units associated with the value (celsius) and the associated scaling 
> factor).
> c) Granularity - the time between two measures.
> d) Aggregation methods - min,max,avg..etc.
> e) Logging policy - frequency for creating an event and alerting the user.
> 
> The application would operate based on the policy and log the telemetry 
> data. The details of logging would evolve as we progress on the related 
> issue.
> 
> Regards,
> Tom

Hi,

I'd like to bump this topic and add some more details. I'd like to 
discuss design proposals/directions for a couple things :

1) A short/mid term proposal for telemetry requirements specific to IBM 
labs (which need to be implemented in a relatively short span of time, 
so there may not be the bandwidth to write an entirely new application 
not based on D-Bus or the OpenBMC REST API).
2) Industry standard methods for storing and retrieving telemetry data - 
thoughts on how to get here.



1) Telemetry requirements specific to IBM labs
Here are the requirements and a design proposal.

a) Instantaneous readings, such as temperatures, currents, errors, 
events etc. Let's call this Layer 0.

Proposal:
- The D-Bus model is the source for instantaneous readings. This means 
there would be D-Bus objects representing this data, and hence an 
OpenBMC REST API around it.
- These D-Bus objects would not necessarily implement the same D-Bus 
interfaces.
- Interested clients can read these D-Bus objects via the OpenBMC REST API.
- If clients are interested in being notified about "changes" to the 
readings, that's possible via the existing event notification over 
WebSockets mechanism.


b) Instantaneous aggregations - this would mostly apply to, but may not 
be limited to, readings such as temperatures and currents. Let's call 
this Layer 1. This basically is to solve, for eg, "what is the 
min/max/average over the last X seconds?". We have a requirement to do 
such aggregations on the BMC.

Proposal:
- Aggregations are represented as D-Bus objects, created by a telemetry 
app. For eg if we need to know the min/max/avg ambient temp for the last 
5 minutes, and say the the ambient temp is usually at temps/ambient, the 
aggregation could be at temps/aggregations/ambient.
- Implement D-Bus interfaces to denote aggregations, for eg the 
temps/aggregation/ambient object could implement a D-Bus interface 
describing min/max/avg properties.
- Aggregation objects will have the values as described in the D-Bus 
interface (such as min/max/avg), and a timestamp, as properties.
- Enable a config (eg JSON) to let the telemetry app know things like : 
What (supported) aggregations should be performed (min/max/avg)? What 
D-Bus objects should be aggregated? How frequently should they be 
aggregated? What should be the paths of the aggregations? Potentially 
add a REST API to allow changing the (JSON) config at run-time.
- It will be possible to read all aggregation objects, or aggregation 
objects of a specific type via one REST call.


c) Historical aggregations or snapshot. Let's call this Layer 2. This is 
to solve, for eg, "Need a reading corresponding to every X minutes in a 
period of Y hours". This can be a snapshot of Layer 1 or Layer 0 D-Bus 
objects. We have a requirement to store this snapshot on the BMC.

Proposal:
- The snapshot will be represented as a set of D-Bus objects. For eg if 
one needs an hourly reading for a period of 24 hours, the objects could 
be at temps/aggregations/ambient/per-hour/{1..24}.
- Enable a config to let a telemetry app to know things like : What 
D-Bus objects should I keep a history of? What is the duration of the 
snapshot? At what frequency should entries be added into the snapshot? 
Once the snapshot is full, should the entries roll, or should we 
restart? Potentially add a REST API to allow changing the (JSON) config 
at run-time.
- The historical aggregations can be read via one REST call. It should 
be one D-Bus call as well most likely for the REST server, if there's an 
object manager at temps/aggregations/ambient/per-hour for eg.
- These objects in the snapshot will implement the same interfaces as 
Layer 1 objects, so they will have the same properties (eg min/max/avg, 
timestamp).


d) Some notes
- With the proposal above, the API to retrieve the telemetry data is via 
the current OpenBMC REST API, so it may not readily work with telemetry 
tools relying on industry-standard API (see point 2 below), but it seems 
to be the feasible option to rely on to implement IBM's requirements in 
the expected timelines.
- Layer 1 and Layer 2 telemetry apps would be different processes, and 
can function independent of each other.



2) Industry standard methods for storing and retrieving telemetry data

- With the proposal above, the instantaneous readings are D-Bus objects, 
the instantaneous and historical aggregations are D-Bus objects as well. 
The API is the OpenBMC REST API.
- Typically, aggregations may not have to happen on the BMC, in which 
case one can turn off layers 1 and 2.
- This is regarding how the telemetry data is presented, and how we'd 
eventually not use the current OpenBMC REST API in production. I've 
heard (mostly from people on the To: list) of the following 
industry-standard ways to represent/retrieve telemetry data. This would 
mean transforming layer 0 D-Bus objects into these :
	- Via Redfish (events) API
	- Via IPMI events/PEF
	- Via SNMP traps
	- Via an sqlite db, and have something like Logstash parse it
	- Others?
Discussions are already happening regarding Redfish, so telemetry could 
be one aspect to consider as well.
- Aggregations could be done on the BMC with collectd. I need to look at 
this in detail. Aggregations could be stored in an RRD format. Need to 
look at this in detail as well. These are as opposed to a D-Bus model of 
aggregations. Thoughts on this? For eg, would this be much less work 
both for the BMC and the telemetry data users than the proposed D-Bus 
model, but at the same time can address the requirements I've mentioned? 
Do we know what are the commonly used client tools for processing 
telemetry data, and how they expect the data to be presented?



Thanks,
Deepak
