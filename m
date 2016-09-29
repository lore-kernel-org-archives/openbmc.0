Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skzPB3VPQzDrX7
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 12:42:06 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u8T2c828084741
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 22:42:04 -0400
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 by mx0b-001b2d01.pphosted.com with ESMTP id 25rq5x2b2d-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 22:42:03 -0400
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 29 Sep 2016 12:41:59 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 29 Sep 2016 12:41:58 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 971422CE805B
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 12:41:57 +1000 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u8T2fvM260424292
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 12:41:57 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u8T2fuou018104
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 12:41:57 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u8T2fuKL018100; Thu, 29 Sep 2016 12:41:56 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id BE71FA0195;
 Thu, 29 Sep 2016 12:41:56 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id B4464E3C36;
 Thu, 29 Sep 2016 12:41:56 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id A970A9429AB; Thu, 29 Sep 2016 12:42:27 +1000 (AEST)
Date: Thu, 29 Sep 2016 12:42:27 +1000
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v4.7 6/7] net/ncsi: Rework the channel monitoring
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
References: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475030915-9525-6-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475041832.9493.11.camel@jms.id.au>
 <20160928071803.GA10147@gwshan>
 <CACPK8XeWEiLAtUSuf2C8nTopQ9kRti5Oi3L0DDw-B+pLJ4XALg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XeWEiLAtUSuf2C8nTopQ9kRti5Oi3L0DDw-B+pLJ4XALg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16092902-0004-0000-0000-000001A03D58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16092902-0005-0000-0000-000008C8126D
Message-Id: <20160929024227.GA9366@gwshan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-09-29_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609020000
 definitions=main-1609290041
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
X-List-Received-Date: Thu, 29 Sep 2016 02:42:07 -0000

On Thu, Sep 29, 2016 at 11:44:05AM +0930, Joel Stanley wrote:
>On Wed, Sep 28, 2016 at 4:48 PM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
>> On Wed, Sep 28, 2016 at 03:20:32PM +0930, Joel Stanley wrote:
>>>> +#define NCSI_CHANNEL_MONITOR_START  0
>>>> +#define NCSI_CHANNEL_MONITOR_RETRY  1
>>>> +#define NCSI_CHANNEL_MONITOR_WAIT   2
>>>> +#define NCSI_CHANNEL_MONITOR_WAIT_MAX       5
>>>> +    } monitor;
>>>>      struct list_head            node;
>>>>      struct list_head            link;
>>>>  };
>>>> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
>>>> index 3019432..5813ebe 100644
>>>> --- a/net/ncsi/ncsi-manage.c
>>>> +++ b/net/ncsi/ncsi-manage.c
>>>> @@ -165,13 +165,13 @@ static void ncsi_channel_monitor(unsigned long
>>>> data)
>>>>      struct ncsi_dev_priv *ndp = np->ndp;
>>>>      struct ncsi_cmd_arg nca;
>>>>      bool enabled;
>>>> -    unsigned int timeout;
>>>> +    unsigned int monitor_state;
>>>>      unsigned long flags;
>>>>      int state, ret;
>>>>
>>>>      spin_lock_irqsave(&nc->lock, flags);
>>>> -    timeout = nc->timeout;
>>>> -    enabled = nc->enabled;
>>>> +    monitor_state = nc->monitor.state;
>>>> +    enabled = nc->monitor.enabled;
>>>>      spin_unlock_irqrestore(&nc->lock, flags);
>>>>
>>>>      if (!enabled || !list_empty(&nc->link))
>>>> @@ -181,7 +181,9 @@ static void ncsi_channel_monitor(unsigned long
>>>> data)
>>>>      if (state != NCSI_CHANNEL_INACTIVE && state !=
>>>> NCSI_CHANNEL_ACTIVE)
>>>>              return;
>>>>
>>>> -    if (!(timeout % 2)) {
>>>> +    switch (monitor_state) {
>>>> +    case NCSI_CHANNEL_MONITOR_START:
>>>> +    case NCSI_CHANNEL_MONITOR_RETRY:
>>>>              nca.ndp = ndp;
>>>>              nca.package = np->id;
>>>>              nca.channel = nc->id;
>>>> @@ -193,15 +195,19 @@ static void ncsi_channel_monitor(unsigned long
>>>> data)
>>>>                                 ret);
>>>>                      return;
>>>>              }
>>>> -    }
>>>>
>>>> -    if (timeout + 1 >= 3) {
>>>> +            break;
>>>> +    case NCSI_CHANNEL_MONITOR_WAIT ...
>>>> NCSI_CHANNEL_MONITOR_WAIT_MAX:
>>>
>>>It's not clear why you have the MAX_WAIT state if it's doing the same
>>>thing as WAIT.
>>>
>>
>> @nc->monitor.state tracks two types of information: (A) the current state
>> of the channel monitor; (B) the time since last GLS reponse was received
>> successfully. The general idea behind is: we have two GLS commands sent
>> and at least one response should be received in 5 seconds, which is
>> represented by NCSI_CHANNEL_MONITOR_WAIT_MAX.
>
>I follow that. But the code path for MAX_WAIT appears to be there same
>as WAIT. There's nowhere that we do if (nc->monitor.state ==
>NCSI_CHANNEL_MONITOR_WAIT_MAX) explode();
>
>Is that intentional? If so, why do we need the two separate states?
>

Yes, there are 4 waiting states (2/3/4/5) as below.

#define NCSI_CHANNEL_MONITOR_WAIT      2
#define NCSI_CHANNEL_MONITOR_WAIT_MAX  5

I want to use "switch...case" in the code as it's a state machine.
Also, I would like to have two macros to specify the range of
waiting state, which makes the code clearer. Yes, it's intentional.

Instead, we can use "if...else if...else". It's not good enough
to have this in the state machine driven code, but it's a personal
preference. In this case, we need less defined states:

   #define NCSI_CHANNEL_MONITOR_RETRY	1
   #define NCSI_CHANNEL_MONITOR_TIMEOUT	6

   if (monitor.state <= NCSI_CHANNEL_MONITOR_RETRY)
       /* send GLS packet */
   else if (monitor.state < NCSI_CHANNEL_MONITOR_TIMEOUT)
       /* break */
   else
	/* failover */

   monitor.state++;
   rescheule_timeout();

Thanks,
Gavin

>Cheers,
>
>Joel
>
