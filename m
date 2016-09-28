Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skTYg4X3kzDrb2
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 17:17:43 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u8S7D7Sl029424
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 03:17:41 -0400
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 by mx0b-001b2d01.pphosted.com with ESMTP id 25r1vqhe2b-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 03:17:40 -0400
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Wed, 28 Sep 2016 17:17:36 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 28 Sep 2016 17:17:34 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id ABFCB3578053
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 17:17:33 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u8S7HXjA37814400
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 17:17:33 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u8S7HXTa011806
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 17:17:33 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u8S7HX2D011801; Wed, 28 Sep 2016 17:17:33 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id C63E9A0195;
 Wed, 28 Sep 2016 17:17:32 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 91292E3C36;
 Wed, 28 Sep 2016 17:17:32 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 1F56594301B; Wed, 28 Sep 2016 17:18:03 +1000 (AEST)
Date: Wed, 28 Sep 2016 17:18:03 +1000
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v4.7 6/7] net/ncsi: Rework the channel monitoring
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
References: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475030915-9525-6-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475041832.9493.11.camel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1475041832.9493.11.camel@jms.id.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16092807-0040-0000-0000-000001E5968A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16092807-0041-0000-0000-00000A930B1D
Message-Id: <20160928071803.GA10147@gwshan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-09-28_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609020000
 definitions=main-1609280127
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
X-List-Received-Date: Wed, 28 Sep 2016 07:17:44 -0000

On Wed, Sep 28, 2016 at 03:20:32PM +0930, Joel Stanley wrote:
>On Wed, 2016-09-28 at 12:48 +1000, Gavin Shan wrote:
>> The original NCSI channel monitoring was implemented based on a
>> backoff algorithm: the GLS response should be received in the
>> specified interval. Otherwise, the channel is regarded as dead
>> and failover should be taken if current channel is an active one.
>> There are several problems in the implementation: (A) On BCM5718,
>> we found when the IID (Instance ID) in the GLS command packet
>> changes from 255 to 1, the response corresponding to IID#1 never
>> comes in. It means we cannot make the unfair judgement that the
>> channel is dead when one response is missed. (B) The code's
>> readability should be improved. (C) We should do failover when
>> current channel is active one and the channel monitoring should
>> be marked as disabled before doing failover.
>> 
>> This reworks the channel monitoring to address all above issues.
>> The fields for channel monitoring is put into separate struct
>> and the state of channel monitoring is predefined. The channel
>> is regarded alive if the network controller responses to one of
>> two GLS commands or both of them in 5 seconds.
>> 
>> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
>> ---
>>  net/ncsi/internal.h    | 12 +++++++++---
>>  net/ncsi/ncsi-manage.c | 46 ++++++++++++++++++++++++++------------
>> --------
>>  net/ncsi/ncsi-rsp.c    |  2 +-
>>  3 files changed, 36 insertions(+), 24 deletions(-)
>> 
>> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
>> index a2e3af9..d9b3705 100644
>> --- a/net/ncsi/internal.h
>> +++ b/net/ncsi/internal.h
>> @@ -187,9 +187,15 @@ struct ncsi_channel {
>>  	struct ncsi_channel_mode    modes[NCSI_MODE_MAX];
>>  	struct ncsi_channel_filter  *filters[NCSI_FILTER_MAX];
>>  	struct ncsi_channel_stats   stats;
>> -	struct timer_list           timer;	/* Link monitor
>> timer  */
>> -	bool                        enabled;	/* Timer is
>> enabled    */
>> -	unsigned int                timeout;	/* Times of
>> timeout    */
>> +	struct {
>> +		struct timer_list   timer;	/* Link monitor
>> timer  */
>> +		bool                enabled;	/* Timer is
>> enabled    */
>> +		unsigned int        state;	/* Link monitor
>> state  */
>
>These comments don't add much value.
>

Joel, thanks for your comments. I agree and will drop those comments
in next revision.

>> +#define NCSI_CHANNEL_MONITOR_START	0
>> +#define NCSI_CHANNEL_MONITOR_RETRY	1
>> +#define NCSI_CHANNEL_MONITOR_WAIT	2
>> +#define NCSI_CHANNEL_MONITOR_WAIT_MAX	5
>> +	} monitor;
>>  	struct list_head            node;
>>  	struct list_head            link;
>>  };
>> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
>> index 3019432..5813ebe 100644
>> --- a/net/ncsi/ncsi-manage.c
>> +++ b/net/ncsi/ncsi-manage.c
>> @@ -165,13 +165,13 @@ static void ncsi_channel_monitor(unsigned long
>> data)
>>  	struct ncsi_dev_priv *ndp = np->ndp;
>>  	struct ncsi_cmd_arg nca;
>>  	bool enabled;
>> -	unsigned int timeout;
>> +	unsigned int monitor_state;
>>  	unsigned long flags;
>>  	int state, ret;
>>  
>>  	spin_lock_irqsave(&nc->lock, flags);
>> -	timeout = nc->timeout;
>> -	enabled = nc->enabled;
>> +	monitor_state = nc->monitor.state;
>> +	enabled = nc->monitor.enabled;
>>  	spin_unlock_irqrestore(&nc->lock, flags);
>>  
>>  	if (!enabled || !list_empty(&nc->link))
>> @@ -181,7 +181,9 @@ static void ncsi_channel_monitor(unsigned long
>> data)
>>  	if (state != NCSI_CHANNEL_INACTIVE && state !=
>> NCSI_CHANNEL_ACTIVE)
>>  		return;
>>  
>> -	if (!(timeout % 2)) {
>> +	switch (monitor_state) {
>> +	case NCSI_CHANNEL_MONITOR_START:
>> +	case NCSI_CHANNEL_MONITOR_RETRY:
>>  		nca.ndp = ndp;
>>  		nca.package = np->id;
>>  		nca.channel = nc->id;
>> @@ -193,15 +195,19 @@ static void ncsi_channel_monitor(unsigned long
>> data)
>>  				   ret);
>>  			return;
>>  		}
>> -	}
>>  
>> -	if (timeout + 1 >= 3) {
>> +		break;
>> +	case NCSI_CHANNEL_MONITOR_WAIT ...
>> NCSI_CHANNEL_MONITOR_WAIT_MAX:
>
>It's not clear why you have the MAX_WAIT state if it's doing the same
>thing as WAIT.
>

@nc->monitor.state tracks two types of information: (A) the current state
of the channel monitor; (B) the time since last GLS reponse was received
successfully. The general idea behind is: we have two GLS commands sent
and at least one response should be received in 5 seconds, which is
represented by NCSI_CHANNEL_MONITOR_WAIT_MAX.

>> +		break;
>> +	default:
>>  		if (!(ndp->flags & NCSI_DEV_HWA) &&
>> -		    state == NCSI_CHANNEL_ACTIVE)
>> +		    state == NCSI_CHANNEL_ACTIVE) {
>>  			ncsi_report_link(ndp, true);
>> +			ndp->flags |= NCSI_DEV_RESHUFFLE;
>> +		}
>>  
>>  		spin_lock_irqsave(&ndp->lock, flags);
>> -		atomic_set(&nc->state, NCSI_CHANNEL_INACTIVE);
>> +		atomic_set(&nc->state, NCSI_CHANNEL_ACTIVE);
>>  		list_add_tail_rcu(&nc->link, &ndp->channel_queue);
>>  		spin_unlock_irqrestore(&ndp->lock, flags);
>>  		ncsi_process_next_channel(ndp);
>> @@ -209,10 +215,9 @@ static void ncsi_channel_monitor(unsigned long
>> data)
>>  	}
>>  
>>  	spin_lock_irqsave(&nc->lock, flags);
>> -	nc->timeout = timeout + 1;
>> -	nc->enabled = true;
>> +	nc->monitor.state++;
>>  	spin_unlock_irqrestore(&nc->lock, flags);
>> -	mod_timer(&nc->timer, jiffies + HZ * (1 << (nc->timeout /
>> 2)));
>> +	mod_timer(&nc->monitor.timer, jiffies + HZ);
>>  }
>>  
>>  void ncsi_start_channel_monitor(struct ncsi_channel *nc)
>> @@ -220,12 +225,12 @@ void ncsi_start_channel_monitor(struct
>> ncsi_channel *nc)
>>  	unsigned long flags;
>>  
>>  	spin_lock_irqsave(&nc->lock, flags);
>> -	WARN_ON_ONCE(nc->enabled);
>> -	nc->timeout = 0;
>> -	nc->enabled = true;
>> +	WARN_ON_ONCE(nc->monitor.enabled);
>> +	nc->monitor.enabled = true;
>> +	nc->monitor.state = NCSI_CHANNEL_MONITOR_START;
>>  	spin_unlock_irqrestore(&nc->lock, flags);
>>  
>> -	mod_timer(&nc->timer, jiffies + HZ * (1 << (nc->timeout /
>> 2)));
>> +	mod_timer(&nc->monitor.timer, jiffies + HZ);
>>  }
>>  
>>  void ncsi_stop_channel_monitor(struct ncsi_channel *nc)
>> @@ -233,14 +238,14 @@ void ncsi_stop_channel_monitor(struct
>> ncsi_channel *nc)
>>  	unsigned long flags;
>>  
>>  	spin_lock_irqsave(&nc->lock, flags);
>> -	if (!nc->enabled) {
>> +	if (!nc->monitor.enabled) {
>>  		spin_unlock_irqrestore(&nc->lock, flags);
>>  		return;
>>  	}
>> -	nc->enabled = false;
>> +	nc->monitor.enabled = false;
>>  	spin_unlock_irqrestore(&nc->lock, flags);
>>  
>> -	del_timer_sync(&nc->timer);
>> +	del_timer_sync(&nc->monitor.timer);
>>  }
>>  
>>  struct ncsi_channel *ncsi_find_channel(struct ncsi_package *np,
>> @@ -269,8 +274,9 @@ struct ncsi_channel *ncsi_add_channel(struct
>> ncsi_package *np, unsigned char id)
>>  	nc->id = id;
>>  	nc->package = np;
>>  	atomic_set(&nc->state, NCSI_CHANNEL_INACTIVE);
>> -	nc->enabled = false;
>> -	setup_timer(&nc->timer, ncsi_channel_monitor, (unsigned
>> long)nc);
>> +	nc->monitor.enabled = false;
>> +	setup_timer(&nc->monitor.timer,
>> +		    ncsi_channel_monitor, (unsigned long)nc);
>>  	spin_lock_init(&nc->lock);
>>  	INIT_LIST_HEAD(&nc->link);
>>  	for (index = 0; index < NCSI_CAP_MAX; index++)
>> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
>> index 1429e8b..eec88c7 100644
>> --- a/net/ncsi/ncsi-rsp.c
>> +++ b/net/ncsi/ncsi-rsp.c
>> @@ -322,7 +322,7 @@ static int ncsi_rsp_handler_gls(struct
>> ncsi_request *nr)
>>  
>>  	/* Reset the channel monitor if it has been enabled */
>>  	spin_lock_irqsave(&nc->lock, flags);
>> -	nc->timeout = 0;
>> +	nc->monitor.state = NCSI_CHANNEL_MONITOR_START;
>>  	spin_unlock_irqrestore(&nc->lock, flags);
>>  
>>  	return 0;
>> 
>
