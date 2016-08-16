Return-Path: <tomjose@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sD9Kh45qpzDr45
 for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2016 21:36:07 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u7GBT8KU101838
 for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2016 07:36:03 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 24tgu3fbg3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2016 07:36:03 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Tue, 16 Aug 2016 05:36:02 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 16 Aug 2016 05:36:01 -0600
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: tomjose@linux.vnet.ibm.com
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 006BD19D803F;
 Tue, 16 Aug 2016 05:35:33 -0600 (MDT)
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u7GBa02313173064; Tue, 16 Aug 2016 11:36:00 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EBA3AC055;
 Tue, 16 Aug 2016 07:36:00 -0400 (EDT)
Received: from [9.109.165.184] (unknown [9.109.165.184])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id EA836AC041;
 Tue, 16 Aug 2016 07:35:59 -0400 (EDT)
Subject: Re: Discussion on openbmc issue #430
To: Patrick Williams <patrick@stwcx.xyz>
References: <57ADD588.7080000@linux.vnet.ibm.com>
 <20160812141702.mx6fhszbltr2ogfa@asimov>
Cc: openbmc@lists.ozlabs.org
From: tomjose <tomjose@linux.vnet.ibm.com>
Date: Tue, 16 Aug 2016 17:05:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20160812141702.mx6fhszbltr2ogfa@asimov>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16081611-0020-0000-0000-0000098F2A38
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005603; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000181; SDB=6.00745407; UDB=6.00351300; IPR=6.00517958; 
 BA=6.00004662; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00012347; XFM=3.00000011;
 UTC=2016-08-16 11:36:02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16081611-0021-0000-0000-0000549A9E13
Message-Id: <57B2FA9E.6080405@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-08-16_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1608160146
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Aug 2016 11:36:09 -0000


Thanks Patrick for your feedack. I have mentioned my responses inline.

On Friday 12 August 2016 07:47 PM, Patrick Williams wrote:
> Tom,
>
> Thanks for sending this out to the broader community.
>
> Few comments below...
>
> On Fri, Aug 12, 2016 at 07:26:24PM +0530, tomjose wrote:
>> *Registering Callback Routines:-*
>> -----------------------------------------------
>> 1) Open the IPMI library path(/usr/lib/phosphor-host-ipmid)
> I would prefer we have a new directory '/usr/lib/phosphor-net-ipmid' for
> the RMCP libraries.  We can create symlinks between the two repos as
> appropriate.
>
> The reason for this is two-fold:
>     1) I suspect there will be some of the OEM commands that we will want
>        to expose in-band only.
>     2) There are commands that may want similarly excluded from the
>        in-band path due to security concerns (even though we have the
>        white-list support).
>
> We might want to have a '/usr/lib/ipmid-providers' as the default
> install location for all providers and then symlink into both
> phosphor-net and phosphor-host as appropriate.
In the proposal, i had mentioned there is a provision to add channel 
restrictions to each command.
There are 3 variants available: execute on any channel, execute in-band 
only and execute on lan only.
The channel restriction would be evaluated before each command is executed.
I hope this would meet the same requirements.

>
>> 2) Scan for libraries that end with .so
> Keep in mind you'll need to deal with versioned .so's as well.  We had
> to add that support to host-ipmid recently.

Sure would take this into account while implementing.
>
>> 3) Do a dlopen that would register the handlers for the callback routines.
>> The data that is currently registered for each command: Net Function,
>> Command and Functor.
> There are a few providers that register for dbus callbacks so they can
> monitor signals.  We'll need to discuss a little more I think on what
> the expectation is here.  Maybe the way we are doing dbus callbacks
> isn't appropriate to begin with, or maybe the callbacks are for host
> alerts and not needed in the network path?
>
>> *SessionLess Commands :-
>> *-------------------------------------*
>> *
>> This would mention whether the command can be executed without a
>> session. For example
>> Get Channel Capabilities can be executed without a session.
> How do we identify session-less commands?  Should this be an enhancement
> to the registration API?
The session less commands are mentioned in the IPMI specification.
Examples are Get Channel Authentication Capabilites, Activate Session 
command etc.

>
>> *Minimum Privilege Required to Execute the command :-
>> *---------------------------------------------------------------------------------*
>>
>> *This field would mention the minimum privilege of the session required
>> to execute the
>> command. Before executing any command on a session, the command would be
>> executed
>> only if the command privilege level is less than or equal to session
>> privilege level.
>> The privilege levels are Administrator, Operator, User and Callback and OEM
> Are these privilege levels something intrinsic in IPMI or something you
> came up with?
>
> We plan to integrate the ipmi server into the same BMC user list as the
> REST interface.  I think we need to identify these roles and then allow
> unix-group membership to determine which commands can be ran.
>
> We have a feature to be implemented for the REST interface to define
> group membership requirements for dbus / REST calls as well.
>
> How should providers specify these?

The privilege levels attributed to each command is mentioned in the 
specification.
It is mentioned in the specification Table G-1,(Command Number 
Assignments and
Privilege Levels). The providers should provide these as registration 
parameters
when the callbacks are registered.
>
