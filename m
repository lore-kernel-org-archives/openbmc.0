Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skwNx30k8zDsTW
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 10:26:40 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u8T0NFvp055337
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 20:26:37 -0400
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0b-001b2d01.pphosted.com with ESMTP id 25rhd2hkvp-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 20:26:37 -0400
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 29 Sep 2016 10:26:34 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 29 Sep 2016 10:26:32 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id D10A63578052
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 10:26:31 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u8T0QVMX57606342
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 10:26:31 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u8T0QVcI012202
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 10:26:31 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u8T0QUwA012184; Thu, 29 Sep 2016 10:26:31 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id A285FA0195;
 Thu, 29 Sep 2016 10:26:30 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 8C4F2E3C36;
 Thu, 29 Sep 2016 10:26:30 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 8261C94267B; Thu, 29 Sep 2016 10:27:01 +1000 (AEST)
Date: Thu, 29 Sep 2016 10:27:01 +1000
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v4.7 1/7] net/ncsi: Avoid unused-value warning
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
References: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475040310.9493.2.camel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1475040310.9493.2.camel@jms.id.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16092900-0008-0000-0000-000000CA478A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16092900-0009-0000-0000-0000082CDB0E
Message-Id: <20160929002701.GA8853@gwshan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-09-28_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609020000
 definitions=main-1609290004
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
X-List-Received-Date: Thu, 29 Sep 2016 00:26:41 -0000

On Wed, Sep 28, 2016 at 02:55:10PM +0930, Joel Stanley wrote:
>On Wed, 2016-09-28 at 12:48 +1000, Gavin Shan wrote:
>> xchg() is used to set NCSI channel's state in order for consistent
>> access to the state. xchg()'s return value should be used. Otherwise,
>> one build warning will be raised (with -Wunused-value) as below
>> message
>> indicates. It is reported by ia64-linux-gcc (GCC) 4.9.0.
>> 
>>  net/ncsi/ncsi-manage.c: In function 'ncsi_channel_monitor':
>>  arch/ia64/include/uapi/asm/cmpxchg.h:56:2: warning: value computed
>> is \
>>  not used [-Wunused-value]
>>   ((__typeof__(*(ptr))) __xchg((unsigned long) (x), (ptr),
>> sizeof(*(ptr))))
>>    ^
>>  net/ncsi/ncsi-manage.c:202:3: note: in expansion of macro 'xchg'
>>   xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
>> 
>> This avoids the build warning by replacing xchg() with atomic_set()
>> and atomic_xchg(). atomic_read() is used to retrieve the NCSI
>> channel's
>> state. No functional change introduced.
>> 
>> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
>> ---
>>  net/ncsi/internal.h    |  2 +-
>>  net/ncsi/ncsi-aen.c    | 17 ++++++++++-------
>>  net/ncsi/ncsi-manage.c | 36 ++++++++++++++++++++----------------
>>  net/ncsi/ncsi-rsp.c    |  4 ++--
>>  4 files changed, 33 insertions(+), 26 deletions(-)
>> 
>> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
>> index 33738c0..549846b 100644
>> --- a/net/ncsi/internal.h
>> +++ b/net/ncsi/internal.h
>> @@ -175,7 +175,7 @@ struct ncsi_package;
>>  
>>  struct ncsi_channel {
>>  	unsigned char               id;
>> -	int                         state;
>> +	atomic_t                    state;
>>  #define NCSI_CHANNEL_INACTIVE		1
>>  #define NCSI_CHANNEL_ACTIVE		2
>>  #define NCSI_CHANNEL_INVISIBLE		3
>> diff --git a/net/ncsi/ncsi-aen.c b/net/ncsi/ncsi-aen.c
>> index d463468..77303da 100644
>> --- a/net/ncsi/ncsi-aen.c
>> +++ b/net/ncsi/ncsi-aen.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/module.h>
>>  #include <linux/kernel.h>
>>  #include <linux/init.h>
>> +#include <linux/atomic.h>
>>  #include <linux/netdevice.h>
>>  #include <linux/skbuff.h>
>>  
>> @@ -55,6 +56,7 @@ static int ncsi_aen_handler_lsc(struct
>> ncsi_dev_priv *ndp,
>>  	struct ncsi_channel_mode *ncm;
>>  	unsigned long old_data;
>>  	unsigned long flags;
>> +	int state;
>>  
>>  	/* Find the NCSI channel */
>>  	ncsi_find_package_and_channel(ndp, h->common.channel, NULL,
>> &nc);
>> @@ -70,12 +72,13 @@ static int ncsi_aen_handler_lsc(struct
>> ncsi_dev_priv *ndp,
>>  	if (!((old_data ^ ncm->data[2]) & 0x1) ||
>>  	    !list_empty(&nc->link))
>>  		return 0;
>> -	if (!(nc->state == NCSI_CHANNEL_INACTIVE && (ncm->data[2] &
>> 0x1)) &&
>> -	    !(nc->state == NCSI_CHANNEL_ACTIVE && !(ncm->data[2] &
>> 0x1)))
>> +
>> +	state = atomic_read(&nc->state);
>
>It's not clear that state needs to have atomic access. Can you explain
>why you made the change?
>
>Would leaving it as an int and using READ_ONCE() be sufficient?
>

Yes, READ_ONCE() + WRITE_ONCE() should be sufficient.

>> +	if (!(state == NCSI_CHANNEL_INACTIVE && (ncm->data[2] &
>> 0x1)) &&
>> +	    !(state == NCSI_CHANNEL_ACTIVE && !(ncm->data[2] &
>> 0x1)))
>>  		return 0;
>>  
>> -	if (!(ndp->flags & NCSI_DEV_HWA) &&
>> -	    nc->state == NCSI_CHANNEL_ACTIVE)
>> +	if (!(ndp->flags & NCSI_DEV_HWA) && state ==
>> NCSI_CHANNEL_ACTIVE)
>>  		ndp->flags |= NCSI_DEV_RESHUFFLE;
>>  
>>  	ncsi_stop_channel_monitor(nc);
>> @@ -98,12 +101,12 @@ static int ncsi_aen_handler_cr(struct
>> ncsi_dev_priv *ndp,
>>  		return -ENODEV;
>>  
>>  	if (!list_empty(&nc->link) ||
>> -	    nc->state != NCSI_CHANNEL_ACTIVE)
>> +	    atomic_read(&nc->state) != NCSI_CHANNEL_ACTIVE)
>>  		return 0;
>>  
>>  	ncsi_stop_channel_monitor(nc);
>>  	spin_lock_irqsave(&ndp->lock, flags);
>> -	xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
>> +	atomic_set(&nc->state, NCSI_CHANNEL_INACTIVE);
>>  	list_add_tail_rcu(&nc->link, &ndp->channel_queue);
>>  	spin_unlock_irqrestore(&ndp->lock, flags);
>>  
>> @@ -128,7 +131,7 @@ static int ncsi_aen_handler_hncdsc(struct
>> ncsi_dev_priv *ndp,
>>  	hncdsc = (struct ncsi_aen_hncdsc_pkt *)h;
>>  	ncm->data[3] = ntohl(hncdsc->status);
>>  	if (!list_empty(&nc->link) ||
>> -	    nc->state != NCSI_CHANNEL_ACTIVE ||
>> +	    atomic_read(&nc->state) != NCSI_CHANNEL_ACTIVE ||
>>  	    (ncm->data[3] & 0x1))
>>  		return 0;
>>  
>> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
>> index ef017b8..b325c1d 100644
>> --- a/net/ncsi/ncsi-manage.c
>> +++ b/net/ncsi/ncsi-manage.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/module.h>
>>  #include <linux/kernel.h>
>>  #include <linux/init.h>
>> +#include <linux/atomic.h>
>>  #include <linux/netdevice.h>
>>  #include <linux/skbuff.h>
>>  #include <linux/netlink.h>
>> @@ -143,7 +144,7 @@ static void ncsi_report_link(struct ncsi_dev_priv
>> *ndp, bool force_down)
>>  	NCSI_FOR_EACH_PACKAGE(ndp, np) {
>>  		NCSI_FOR_EACH_CHANNEL(np, nc) {
>>  			if (!list_empty(&nc->link) ||
>> -			    nc->state != NCSI_CHANNEL_ACTIVE)
>> +			    atomic_read(&nc->state) !=
>> NCSI_CHANNEL_ACTIVE)
>>  				continue;
>>  
>>  			if (nc->modes[NCSI_MODE_LINK].data[2] & 0x1)
>> {
>> @@ -166,7 +167,7 @@ static void ncsi_channel_monitor(unsigned long
>> data)
>>  	bool enabled;
>>  	unsigned int timeout;
>>  	unsigned long flags;
>> -	int ret;
>> +	int state, ret;
>>  
>>  	spin_lock_irqsave(&nc->lock, flags);
>>  	timeout = nc->timeout;
>> @@ -175,8 +176,9 @@ static void ncsi_channel_monitor(unsigned long
>> data)
>>  
>>  	if (!enabled || !list_empty(&nc->link))
>>  		return;
>> -	if (nc->state != NCSI_CHANNEL_INACTIVE &&
>> -	    nc->state != NCSI_CHANNEL_ACTIVE)
>> +
>> +	state = atomic_read(&nc->state);
>> +	if (state != NCSI_CHANNEL_INACTIVE && state !=
>> NCSI_CHANNEL_ACTIVE)
>>  		return;
>>  
>>  	if (!(timeout % 2)) {
>> @@ -195,11 +197,11 @@ static void ncsi_channel_monitor(unsigned long
>> data)
>>  
>>  	if (timeout + 1 >= 3) {
>>  		if (!(ndp->flags & NCSI_DEV_HWA) &&
>> -		    nc->state == NCSI_CHANNEL_ACTIVE)
>> +		    state == NCSI_CHANNEL_ACTIVE)
>>  			ncsi_report_link(ndp, true);
>>  
>>  		spin_lock_irqsave(&ndp->lock, flags);
>> -		xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
>> +		atomic_set(&nc->state, NCSI_CHANNEL_INACTIVE);
>>  		list_add_tail_rcu(&nc->link, &ndp->channel_queue);
>>  		spin_unlock_irqrestore(&ndp->lock, flags);
>>  		ncsi_process_next_channel(ndp);
>> @@ -266,7 +268,7 @@ struct ncsi_channel *ncsi_add_channel(struct
>> ncsi_package *np, unsigned char id)
>>  
>>  	nc->id = id;
>>  	nc->package = np;
>> -	nc->state = NCSI_CHANNEL_INACTIVE;
>> +	atomic_set(&nc->state, NCSI_CHANNEL_INACTIVE);
>>  	nc->enabled = false;
>>  	setup_timer(&nc->timer, ncsi_channel_monitor, (unsigned
>> long)nc);
>>  	spin_lock_init(&nc->lock);
>> @@ -309,7 +311,7 @@ static void ncsi_remove_channel(struct
>> ncsi_channel *nc)
>>  		kfree(ncf);
>>  	}
>>  
>> -	nc->state = NCSI_CHANNEL_INACTIVE;
>> +	atomic_set(&nc->state, NCSI_CHANNEL_INACTIVE);
>>  	spin_unlock_irqrestore(&nc->lock, flags);
>>  	ncsi_stop_channel_monitor(nc);
>>  
>> @@ -556,7 +558,7 @@ static void ncsi_suspend_channel(struct
>> ncsi_dev_priv *ndp)
>>  
>>  		break;
>>  	case ncsi_dev_state_suspend_done:
>> -		xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
>> +		atomic_set(&nc->state, NCSI_CHANNEL_INACTIVE);
>>  		ncsi_process_next_channel(ndp);
>>  
>>  		break;
>> @@ -676,9 +678,9 @@ static void ncsi_configure_channel(struct
>> ncsi_dev_priv *ndp)
>>  		break;
>>  	case ncsi_dev_state_config_done:
>>  		if (nc->modes[NCSI_MODE_LINK].data[2] & 0x1)
>> -			xchg(&nc->state, NCSI_CHANNEL_ACTIVE);
>> +			atomic_set(&nc->state, NCSI_CHANNEL_ACTIVE);
>>  		else
>> -			xchg(&nc->state, NCSI_CHANNEL_INACTIVE);
>> +			atomic_set(&nc->state,
>> NCSI_CHANNEL_INACTIVE);
>>  
>>  		ncsi_start_channel_monitor(nc);
>>  		ncsi_process_next_channel(ndp);
>> @@ -708,7 +710,7 @@ static int ncsi_choose_active_channel(struct
>> ncsi_dev_priv *ndp)
>>  	NCSI_FOR_EACH_PACKAGE(ndp, np) {
>>  		NCSI_FOR_EACH_CHANNEL(np, nc) {
>>  			if (!list_empty(&nc->link) ||
>> -			    nc->state != NCSI_CHANNEL_INACTIVE)
>> +			    atomic_read(&nc->state) !=
>> NCSI_CHANNEL_INACTIVE)
>>  				continue;
>>  
>>  			if (!found)
>> @@ -770,7 +772,8 @@ static int ncsi_enable_hwa(struct ncsi_dev_priv
>> *ndp)
>>  	spin_lock_irqsave(&ndp->lock, flags);
>>  	NCSI_FOR_EACH_PACKAGE(ndp, np) {
>>  		NCSI_FOR_EACH_CHANNEL(np, nc) {
>> -			WARN_ON_ONCE(nc->state !=
>> NCSI_CHANNEL_INACTIVE ||
>> +			WARN_ON_ONCE(atomic_read(&nc->state) !=
>> +				     NCSI_CHANNEL_INACTIVE ||
>>  				     !list_empty(&nc->link));
>>  			ncsi_stop_channel_monitor(nc);
>>  			list_add_tail_rcu(&nc->link, &ndp-
>> >channel_queue);
>> @@ -987,7 +990,7 @@ int ncsi_process_next_channel(struct
>> ncsi_dev_priv *ndp)
>>  		goto out;
>>  	}
>>  
>> -	old_state = xchg(&nc->state, NCSI_CHANNEL_INVISIBLE);
>> +	old_state = atomic_xchg(&nc->state, NCSI_CHANNEL_INVISIBLE);
>>  	list_del_init(&nc->link);
>>  
>>  	spin_unlock_irqrestore(&ndp->lock, flags);
>> @@ -1006,7 +1009,7 @@ int ncsi_process_next_channel(struct
>> ncsi_dev_priv *ndp)
>>  		break;
>>  	default:
>>  		netdev_err(ndp->ndev.dev, "Invalid state 0x%x on
>> %d:%d\n",
>> -			   nc->state, nc->package->id, nc->id);
>> +			   old_state, nc->package->id, nc->id);
>>  		ncsi_report_link(ndp, false);
>>  		return -EINVAL;
>>  	}
>> @@ -1166,7 +1169,8 @@ int ncsi_start_dev(struct ncsi_dev *nd)
>>  	/* Reset channel's state and start over */
>>  	NCSI_FOR_EACH_PACKAGE(ndp, np) {
>>  		NCSI_FOR_EACH_CHANNEL(np, nc) {
>> -			old_state = xchg(&nc->state,
>> NCSI_CHANNEL_INACTIVE);
>> +			old_state = atomic_xchg(&nc->state,
>> +						NCSI_CHANNEL_INACTIV
>> E);
>>  			WARN_ON_ONCE(!list_empty(&nc->link) ||
>>  				     old_state ==
>> NCSI_CHANNEL_INVISIBLE);
>>  		}
>> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
>> index af84389..54f7eed 100644
>> --- a/net/ncsi/ncsi-rsp.c
>> +++ b/net/ncsi/ncsi-rsp.c
>> @@ -123,7 +123,7 @@ static int ncsi_rsp_handler_dp(struct
>> ncsi_request *nr)
>>  	/* Change state of all channels attached to the package */
>>  	NCSI_FOR_EACH_CHANNEL(np, nc) {
>>  		spin_lock_irqsave(&nc->lock, flags);
>> -		nc->state = NCSI_CHANNEL_INACTIVE;
>> +		atomic_set(&nc->state, NCSI_CHANNEL_INACTIVE);
>>  		spin_unlock_irqrestore(&nc->lock, flags);
>
>We don't need both the atomic_set and the spin locks. One or the other
>should be enough.
>

Right, I will use WRITE_ONCE() and remove the lock.

Thanks,
Gavin

>>  	}
>>  
>> @@ -195,7 +195,7 @@ static int ncsi_rsp_handler_rc(struct
>> ncsi_request *nr)
>>  
>>  	/* Update state for the specified channel */
>>  	spin_lock_irqsave(&nc->lock, flags);
>> -	nc->state = NCSI_CHANNEL_INACTIVE;
>> +	atomic_set(&nc->state, NCSI_CHANNEL_INACTIVE);
>>  	spin_unlock_irqrestore(&nc->lock, flags);
>>  
>>  	return 0;
>> 
>
