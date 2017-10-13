Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCz7G4hpNzDrBX
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 17:57:45 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9D6sPZM016623
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 02:57:42 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2djndfrjx3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 02:57:42 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Fri, 13 Oct 2017 00:57:41 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 13 Oct 2017 00:57:39 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9D6vc4c32637178; Thu, 12 Oct 2017 23:57:38 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB70513603A;
 Fri, 13 Oct 2017 00:57:38 -0600 (MDT)
Received: from [9.124.124.105] (unknown [9.124.124.105])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 02738136044;
 Fri, 13 Oct 2017 00:57:37 -0600 (MDT)
Subject: Re: phosphor-host-ipmid and phosphor-net-ipmid architecture
References: <20171011220548.GA61269@mauery>
From: tomjose <tomjose@linux.vnet.ibm.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 13 Oct 2017 12:27:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20171011220548.GA61269@mauery>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17101306-0004-0000-0000-0000130EE566
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007889; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000236; SDB=6.00930428; UDB=6.00468372; IPR=6.00710694; 
 BA=6.00005635; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017520; XFM=3.00000015;
 UTC=2017-10-13 06:57:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17101306-0005-0000-0000-00008474E455
Message-Id: <59E063DF.7030805@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-13_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710130097
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
X-List-Received-Date: Fri, 13 Oct 2017 06:57:47 -0000


Hey Vernon,

1)  There are few reasons for a different approach for net-ipmid

     The primary design direction when developing net-ipmid was to reuse 
the provider libraries
     for the commands that are common across the interfaces. It was a 
conscious decision
     to have two processes for network & BT, keeping in mind to have 
small applications
     rather than having monolithic ones.

    The network handler would not be minimal like btbridge or KCSbridge, 
since there are net-ipmid
    specific functionalities like session setup, serial over LAN..etc. 
The only difference i see in your
    idea is we would relay the common commands on the dbus so that ipmid 
would handle.

2) The phosphor-host-ipmid was developed as part of the prototyping done 
for Barreleye. So i agree that
     we have quite a number of shortcomings, that it is not in alignment 
with the modern C++ practices.
     We have added more code and haven't got to refactor that. We have a 
story to refactor phosphor-host-ipmid.
     The plan was to handle so some of these suggestions as part of that.

    The support is in place to register each command's privilege. The 
support would be completed once the
    IPMI user account management changes are in place. The command's 
privilege would matter only on
    the LAN interface which is session based. In net-ipmid every command 
would be checked against the
    session's privilege, so that a session with USER privilege would be 
restricted from running a command
    that needs ADMIN privilege. Since KCS and BT are sessionless and 
unauthenticated, this would not matter.

    Similarly System interface commands are compiled into a separate 
library which is not loaded in the
    net-ipmid.

3) This is something we wanted to do, we can discuss what is the best 
possible approach. This would help with
     command like Get/Set System Boot Configuration where each 
implementer would get the flexibility
     to implement the OEM parameters.

  Are you working on a OEM provider library?

Regards,
Tom




On Thursday 12 October 2017 03:35 AM, Vernon Mauery wrote:
> I am working on an ipmi provider library and had a few questions and
> observations.
>
> 1) Why are there separate ipmi message queues for the host and network?
>     It seems awkward that for the host, the ipmi request comes from a
>     different process (btbridge, or in our case kcsbridge), while for the
>     network (RMCP+), the messages are handled directly in the same
>     process.
>
>     It seems that the network handler could just as easily package the
>     command up and send it to ipmid the same way that btbridge does.
>
> 2) Can we modify the signature of the handlers so that they can behave
>     in a more intelligent manner? It would be nice if they were handed a
>     gsl::span<uint8_t> instead of a void* and a length. This allows for
>     a no-copy, bounds-checked way of passing buffers.
>
>     It would be nice to know what channel something came in on. We might
>     want to be able to change behavior based on the incoming channel (as
>     some channels are more secure than others).
>
>     It would be nice to know what IPMI privilege the command came in
>     with (ADMIN for session-less commands) so that the command handler
>     can behave appropriately based on the user.
>     
> 3) When registering commands, it would be nice of the list also
>     maintained a priority so that commands could be easily overridden.
>     Currently the only way to override a command is to make sure that
>     your library gets loaded first (and this is done via the library
>     name). If we had default ipmi commands loaded at DEFAULT_PRIO and
>     then had some higher priorities such as MFR_PRIO, and OEM_PRIO, or
>     something like that, we could have integrators further on down the
>     line able to easily add a new provider library and piecemeal override
>     individual command. An alternate (or addition) might be the addition
>     of a unregister command method to remove an existing command so it
>     could be replaced with a new one (or just straight up removed).
>
>
> I am happy to work on changes that I would like to see and submit
> patches for review, but I wanted to know if there was some sort of
> historical or other reason that would prevent my work from getting
> rejected before I actually do the work.
>
> --Vernon
>
