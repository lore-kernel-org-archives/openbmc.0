Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4058VW46nLzDq82
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 21:36:19 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2KAVZU0092852
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 06:36:17 -0400
Received: from e06smtp10.uk.ibm.com (e06smtp10.uk.ibm.com [195.75.94.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gu002svpj-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 06:36:16 -0400
Received: from localhost
 by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Tue, 20 Mar 2018 10:36:14 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 20 Mar 2018 10:36:11 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2KAaASk24969450; Tue, 20 Mar 2018 10:36:10 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A30F0AE05A;
 Tue, 20 Mar 2018 10:26:31 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 739DAAE04D;
 Tue, 20 Mar 2018 10:26:30 +0000 (GMT)
Received: from [9.124.212.252] (unknown [9.124.212.252])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 20 Mar 2018 10:26:30 +0000 (GMT)
Subject: Re: IPMI SOL performance
To: Jeremy Kerr <jk@ozlabs.org>, Bradley W Bishop <bradleyb@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
References: <f34018a7-be64-9a2b-befd-632747234fd0@linux.vnet.ibm.com>
 <32dafbf5-2568-a85a-ad3b-abd8242bf251@ozlabs.org>
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Date: Tue, 20 Mar 2018 16:06:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <32dafbf5-2568-a85a-ad3b-abd8242bf251@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18032010-0040-0000-0000-00000423386A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032010-0041-0000-0000-0000262651D1
Message-Id: <f1d1091d-6019-1839-ad61-148c69b32b16@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-20_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803200125
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
X-List-Received-Date: Tue, 20 Mar 2018 10:36:20 -0000



On Tuesday 20 March 2018 06:05 AM, Jeremy Kerr wrote:
> Hi Tom,
>
>> I wanted to discuss about an issue related to IPMI SOL.
> Cool!
>
> Given that:
>
>> The same issue is not hit by the ssh console on port 2200 and does not
>> miss the timeout of the petitboot menu option.
> - and that we don't see the same behaviour with other SoL
> implementations (ie, different BMC firmware on similar hardware), it
> sounds to me like this might be due to our IPMI implementation?

> Have you confirmed that we're making the best use of the SoL payloads?
> (ie, we're not using smaller TX buffers for any reason).

The accepted character count field in the SOL payload is what the 
client(ipmitool) uses to acknowledge to BMC.
Since this is a 1 byte field, so the maximum SOL character data is 
restricted to 255.
>
>> IPMI uses UDP protocol and the maximum size of the  SOL payload per
>> packet according to the specification is 255 bytes. Also the ack for
>> each of the IPMI packet requires a command lookup
>> and execution. Compared with IPMI SOL, ssh supports 64kb payloads and
>> ack does not need an application lookup, so the round-trip timing is
>> faster. IPMI specification for SOL is written with UART speed as
>> reference, but the VUART pushes the data at a much faster rate.
> The console multiplexer will only push data as fast as *all* consumers
> can consume it. As a bit of background: obmc-console-server will read
> from the VUART into a global 16kB ringbuffer, and write to each of the
> consumers (ie, the sockets that ssh and IPMI SoL daemons connect to).
>
> If those writes block (for any one of those consumers), the ringbuffer
> tail is not advanced. Only once the slowest consumer has unblocked and
> consumed data, we advance the tail.
Is it guaranteed that the Petitboot menu option will be shown only after 
the obmc-console-server,
reads it from the VUART? When does the petitboot menu timeout begin?
>
> Once the ringbuffer is full though, we stop reading from the VUART until
> there is more space available (ie, the slowest consumer has caught up).
>
> This means that we have 16kB of space for bursty data, after which the
> daemon will slow down reads from the VUART device.
>
> So it sounds like our IPMI SoL implementation is slower than other BMC
> implementations, as we don't see the delay on other platforms. Can we
> address that?
This is good piece of information. IPMI server on BMC listens on 
"\0obmc-console" socket and reads from the socket
  on a EPOLLIN. The read console data is updated in a buffer (double 
ended queue) and sent to the ipmitool
based on the flow rate. Since the console data is read into the IPMI 
buffer( and sending it to the client at the speed of client)
is the reason that obmc-console-server does not slow down.

One possible option is to put a limit on the buffer size and read from 
the socket only when the buffer is within that limits. The trade-off
would be ssh based console would output at the speed of IPMI.

> As others have mentioned, there's currently an issue with the VUART
> hardware or driver dropping serial data on high load, but that's
> somewhat separate from IPMI performance. I'm currently working on that
> now :)
>
> Regards,
>
>
> Jeremy
>
