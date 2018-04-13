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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40N5ZB0RhhzF1S6
 for <openbmc@lists.ozlabs.org>; Sat, 14 Apr 2018 04:16:17 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w3DIAxDa076516
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 14:16:14 -0400
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2haxs9gu01-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 14:16:14 -0400
Received: from localhost
 by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Fri, 13 Apr 2018 19:16:12 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 13 Apr 2018 19:16:09 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w3DIG9WK56819836; Fri, 13 Apr 2018 18:16:09 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49D284C040;
 Fri, 13 Apr 2018 19:08:45 +0100 (BST)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E91894C044;
 Fri, 13 Apr 2018 19:08:43 +0100 (BST)
Received: from Deepaks-MacBook-Pro.local (unknown [9.77.214.213])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 13 Apr 2018 19:08:43 +0100 (BST)
Subject: Re: Serial Over Lan in the webui
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: "geissonator@gmail.com" <geissonator@gmail.com>,
 "gmills@linux.vnet.ibm.com" <gmills@linux.vnet.ibm.com>,
 "jayashankar.padath@in.ibm.com" <jayashankar.padath@in.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <6bb68901-d843-16eb-02ae-588ce52f91a7@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E82169932F689D5D@ORSMSX114.amr.corp.intel.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Fri, 13 Apr 2018 23:46:06 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:52.0)
 Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932F689D5D@ORSMSX114.amr.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18041318-0044-0000-0000-0000054707AB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18041318-0045-0000-0000-0000288748AF
Message-Id: <1bd0b4af-cc0f-6f5b-2ad4-e5c72a7ef8ef@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-04-13_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804130167
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
X-List-Received-Date: Fri, 13 Apr 2018 18:16:18 -0000

On 13/04/18 10:30 pm, Tanous, Ed wrote:
> I sent you a few replies on IRC, not sure if you saw any of them.  Some ideas are below.

Seem to have missed them.

>> -----Original Message-----
>> From: Deepak Kodihalli [mailto:dkodihal@linux.vnet.ibm.com]
>> Sent: Friday, April 13, 2018 2:59 AM
>> To: geissonator@gmail.com; Tanous, Ed <ed.tanous@intel.com>;
>> gmills@linux.vnet.ibm.com; jayashankar.padath@in.ibm.com; Brad Bishop
>> <bradleyb@fuzziesquirrel.com>
>> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>> Subject: Serial Over Lan in the webui
>>
>> Based on my investigation, it might not be possible to get the SOL working in
>> the UI via the latter scenario. This is because it doesn't seem to be possible to
>> implement an ssh client with client-side html and javascript that a browser
>> can run by itself, and that's because javascript running in the browser doesn't
>> have raw tcp/ip socket support.
> 
> To my understanding, there is no way to implement browser WebUI based SSH in either scenario without a separate conversion to websockets, as I do not believe there is any browser support for the low level socket access you need to directly connect to an SSH socket.  As you said, you are running an intermediary on your development system to do this now, which doesn't work when deploying to the platform.
> 
>>
>> So the question is how do we solve this when the webui code is served by
>> the BMC?
> 
> You will need some way to transfer events (text) to the browser.  In order, my personal preference would be:
> 
> 1. Build a daemon that is capable of forwarding socket-like information over an authenticated websocket.  There are several examples of how to do this, Bmcweb has an example of sending VNC-like protocols over an authenticated websocket.  Rest-dbus has a websocket for transferring dbus eventing info.  You could use either of these as an example of how to build your own.

I implemented that websocket for the alerts, but you're right that I 
should be able to leverage/refer to that implementation. I was going to 
try that first, but will look at the other ideas that you've suggested 
as well.

> 2. Use something like SSE to transfer the buffers and forward the events.
> https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events
> 3. Use long polling on a rest api to transfer buffers.
> https://www.pubnub.com/blog/2014-12-01-http-long-polling/
> 
>> Is anyone aware of a pure client-side javascript based ssh client? If
>> not, we'd have to run Node or something equivalent on the BMC
> You are free to do what you want, but I wouldn’t recommend this route, and would resist any attempts to put it in an upstream component patchset.  NodeJS is very heavyweight for running on the BMC hardware, in both flash usage and startup time, as it's jit compiling its sources using V8.  For something relatively simple (forwarding a serial interface to a websocket) I do not believe the infrastructure cost of maintaining nodejs on the BMC is warranted.

I agree, I just put that into perspective to stress the need of some 
server side work.

>> , or have
>> the REST server act as a proxy server between the terminal writing to a
>> socket that the rest server can intercept and convert to ssh packets. Any
>> other thoughts on how this can be achieved?
> 
> I would recommend going a level deeper, and avoid SSH altogether.  Directly connect the websocket to the interface that the SSH daemon is sourcing serial from.`

That sounds like a good idea, thanks!

Regards,
Deepak
