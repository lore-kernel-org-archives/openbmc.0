Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yLKsM5P0kzDqhf
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 02:22:46 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9NFL1Tl010883
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 11:22:45 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dsha1nnhf-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 11:22:44 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Mon, 23 Oct 2017 09:22:44 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 23 Oct 2017 09:22:41 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9NFMfrJ3277064; Mon, 23 Oct 2017 08:22:41 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1EDD6E03A;
 Mon, 23 Oct 2017 09:22:40 -0600 (MDT)
Received: from [9.124.124.105] (unknown [9.124.124.105])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id D71EA6E038;
 Mon, 23 Oct 2017 09:22:39 -0600 (MDT)
Subject: Re: phosphor-host-ipmid and phosphor-net-ipmid architecture
To: brendanhiggins@google.com, vernon.mauery@linux.intel.com
References: <201710190408.v9J48En6009442@mactruck.svl.corp.google.com>
Cc: openbmc@lists.ozlabs.org
From: tomjose <tomjose@linux.vnet.ibm.com>
Date: Mon, 23 Oct 2017 20:52:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <201710190408.v9J48En6009442@mactruck.svl.corp.google.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17102315-0020-0000-0000-00000CE354EB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007939; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00935339; UDB=6.00471230; IPR=6.00715605; 
 BA=6.00005656; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017670; XFM=3.00000015;
 UTC=2017-10-23 15:22:42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17102315-0021-0000-0000-00005E9FFD8D
Message-Id: <59EE093E.9030703@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-23_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710230216
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
X-List-Received-Date: Mon, 23 Oct 2017 15:22:48 -0000



On Thursday 19 October 2017 09:38 AM, brendanhiggins@google.com wrote:
>> Hey Vernon,
>>
>> 1)  There are few reasons for a different approach for net-ipmid
>>
>>       The primary design direction when developing net-ipmid was to reuse
>> the provider libraries
>>       for the commands that are common across the interfaces. It was a
>> conscious decision
>>       to have two processes for network & BT, keeping in mind to have
>> small applications
>>       rather than having monolithic ones.
>>
>>      The network handler would not be minimal like btbridge or KCSbridge,
>> since there are net-ipmid
>>      specific functionalities like session setup, serial over LAN..etc.
> Unfortunately there is more common functionality than just handlers. For
> example, Firmware Firewall is to be applied to all interfaces. Another example,
> bridging allows messages to be taken from one interface, like the LAN Interface,
> and applied on some other interface, like the System Interface.

Firmware firewalling applies only for the system interface as per the 
IPMI specification.
There is a whitelist of IPMI commands, only those commands can be 
executed when
the machine is set to restricted mode. The list though is setup at build 
time.

>
> I talked about this extensively with Corey Minyard (see discussion under [RFC v1
> 1/4] ipmi_bmc: framework for BT IPMI on BMCs). I was trying to create a common
> interface that the userland could get IPMI messages from as well as a common way
> to handle IPMI messages in the kernel. Unfortunately, the various concepts in
> IPMI are just really too tightly coupled.
>
>> The only difference i see in your
>>      idea is we would relay the common commands on the dbus so that ipmid
>> would handle.
>>
>> 2) The phosphor-host-ipmid was developed as part of the prototyping done
>> for Barreleye. So i agree that
>>       we have quite a number of shortcomings, that it is not in alignment
>> with the modern C++ practices.
>>       We have added more code and haven't got to refactor that. We have a
>> story to refactor phosphor-host-ipmid.
>>       The plan was to handle so some of these suggestions as part of that.
>>
>>      The support is in place to register each command's privilege. The
>> support would be completed once the
>>      IPMI user account management changes are in place. The command's
>> privilege would matter only on
>>      the LAN interface which is session based. In net-ipmid every command
>> would be checked against the
>>      session's privilege, so that a session with USER privilege would be
>> restricted from running a command
>>      that needs ADMIN privilege. Since KCS and BT are sessionless and
>> unauthenticated, this would not matter.
> Not quite true, see above.
The privilege levels are for session based interfaces. I don't know any
other than LAN.

>
>>      Similarly System interface commands are compiled into a separate
>> library which is not loaded in the
>>      net-ipmid.
>>
>> 3) This is something we wanted to do, we can discuss what is the best
>> possible approach. This would help with
>>       command like Get/Set System Boot Configuration where each
>> implementer would get the flexibility
>>       to implement the OEM parameters.
>>
>>    Are you working on a OEM provider library?
> We have written some in the past. I proposed one about a year ago. I think there
> was another one as well. Might be time to revisit that.
>
>> Regards,
>> Tom
>>
>>
>>
>>
>> On Thursday 12 October 2017 03:35 AM, Vernon Mauery wrote:
>>> I am working on an ipmi provider library and had a few questions and
>>> observations.
>>>
>>> 1) Why are there separate ipmi message queues for the host and network?
>>>      It seems awkward that for the host, the ipmi request comes from a
>>>      different process (btbridge, or in our case kcsbridge), while for the
>>>      network (RMCP+), the messages are handled directly in the same
>>>      process.
>>>
>>>      It seems that the network handler could just as easily package the
>>>      command up and send it to ipmid the same way that btbridge does.
>>>
>>> 2) Can we modify the signature of the handlers so that they can behave
>>>      in a more intelligent manner? It would be nice if they were handed a
>>>      gsl::span<uint8_t> instead of a void* and a length. This allows for
>>>      a no-copy, bounds-checked way of passing buffers.
>>>
>>>      It would be nice to know what channel something came in on. We might
>>>      want to be able to change behavior based on the incoming channel (as
>>>      some channels are more secure than others).
>>>
>>>      It would be nice to know what IPMI privilege the command came in
>>>      with (ADMIN for session-less commands) so that the command handler
>>>      can behave appropriately based on the user.
>>>
>>> 3) When registering commands, it would be nice of the list also
>>>      maintained a priority so that commands could be easily overridden.
>>>      Currently the only way to override a command is to make sure that
>>>      your library gets loaded first (and this is done via the library
>>>      name). If we had default ipmi commands loaded at DEFAULT_PRIO and
>>>      then had some higher priorities such as MFR_PRIO, and OEM_PRIO, or
>>>      something like that, we could have integrators further on down the
>>>      line able to easily add a new provider library and piecemeal override
>>>      individual command. An alternate (or addition) might be the addition
>>>      of a unregister command method to remove an existing command so it
>>>      could be replaced with a new one (or just straight up removed).
>>>
>>>
>>> I am happy to work on changes that I would like to see and submit
>>> patches for review, but I wanted to know if there was some sort of
>>> historical or other reason that would prevent my work from getting
>>> rejected before I actually do the work.
>>>
>>> --Vernon
>>>
> Cheers
>
