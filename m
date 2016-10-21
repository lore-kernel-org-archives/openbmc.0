Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0VPg2qBFzDt1Y
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 13:44:23 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9L2hoeq002216
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 22:44:21 -0400
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2675yh0tyq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 22:44:21 -0400
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Fri, 21 Oct 2016 12:44:19 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 21 Oct 2016 12:44:16 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id B4AE72BB0059
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 13:44:14 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9L2iEcT28573778
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 13:44:14 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9L2iEhO002753
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 13:44:14 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9L2iEvt002750; Fri, 21 Oct 2016 13:44:14 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 2659DA019B;
 Fri, 21 Oct 2016 13:44:14 +1100 (AEDT)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 18D93E3C5C;
 Fri, 21 Oct 2016 13:44:14 +1100 (AEDT)
Received: by gwshan (Postfix, from userid 1000)
 id EA1DC942C9E; Fri, 21 Oct 2016 13:45:05 +1100 (AEDT)
Date: Fri, 21 Oct 2016 13:45:05 +1100
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 4.7 3/4] net/ncsi: Choose hot channel as active one if
 necessary
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
References: <1477005092-20632-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1477005092-20632-4-git-send-email-gwshan@linux.vnet.ibm.com>
 <CACPK8Xf2qQ601=tSdSR3OgcQpV=a9=orxvjxtSY5EQ+UdRVjEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xf2qQ601=tSdSR3OgcQpV=a9=orxvjxtSY5EQ+UdRVjEA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102102-0008-0000-0000-000000D367B5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102102-0009-0000-0000-00000851743B
Message-Id: <20161021024505.GB8915@gwshan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-21_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610210048
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
X-List-Received-Date: Fri, 21 Oct 2016 02:44:23 -0000

On Fri, Oct 21, 2016 at 12:50:39PM +1030, Joel Stanley wrote:
>On Fri, Oct 21, 2016 at 9:41 AM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
>> The issue was found on BCM5718 which has two NCSI channels in one
>> package: C0 and C1. C0 is in link-up state while C1 is in link-down
>> state. C0 is chosen as active channel until unplugging and plugging
>> C0's cable:  On unplugging C0's cable, LSC (Link State Change) AEN
>> packet received on C0 to report link-down event. After that, C1 is
>> chosen as active channel. LSC AEN for link-up event is lost on C0
>> when plugging C0's cable back. We lose the network even C0 is usable.
>>
>> This resolves the issue by recording the (hot) channel that was ever
>> chosen as active one. The hot channel is chosen to be active one
>> if none of available channels in link-up state. With this, C0 is still
>> the active one after unplugging C0's cable. LSC AEN packet received
>> on C0 when plugging its cable back.
>>
>> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
>> ---
>>  net/ncsi/internal.h    |  1 +
>>  net/ncsi/ncsi-manage.c | 22 +++++++++++++++++++---
>>  2 files changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
>> index eac4858..1308a56 100644
>> --- a/net/ncsi/internal.h
>> +++ b/net/ncsi/internal.h
>> @@ -265,6 +265,7 @@ struct ncsi_dev_priv {
>>  #endif
>>         unsigned int        package_num;     /* Number of packages         */
>>         struct list_head    packages;        /* List of packages           */
>> +       struct ncsi_channel *hot_channel;    /* Channel was ever active    */
>>         struct ncsi_request requests[256];   /* Request table              */
>>         unsigned int        request_id;      /* Last used request ID       */
>>  #define NCSI_REQ_START_IDX     1
>> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
>> index 4789f86..a3bd5fa 100644
>> --- a/net/ncsi/ncsi-manage.c
>> +++ b/net/ncsi/ncsi-manage.c
>> @@ -645,6 +645,7 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
>>         struct net_device *dev = nd->dev;
>>         struct ncsi_package *np = ndp->active_package;
>>         struct ncsi_channel *nc = ndp->active_channel;
>> +       struct ncsi_channel *hot_nc = NULL;
>>         struct ncsi_cmd_arg nca;
>>         unsigned char index;
>>         unsigned long flags;
>> @@ -750,12 +751,20 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
>>                 break;
>>         case ncsi_dev_state_config_done:
>>                 spin_lock_irqsave(&nc->lock, flags);
>> -               if (nc->modes[NCSI_MODE_LINK].data[2] & 0x1)
>> +               if (nc->modes[NCSI_MODE_LINK].data[2] & 0x1) {
>> +                       hot_nc = nc;
>>                         nc->state = NCSI_CHANNEL_ACTIVE;
>> -               else
>> +               } else {
>> +                       hot_nc = NULL;
>>                         nc->state = NCSI_CHANNEL_INACTIVE;
>> +               }
>>                 spin_unlock_irqrestore(&nc->lock, flags);
>>
>> +               /* Update the hot channel */
>> +               spin_lock_irqsave(&ndp->lock, flags);
>> +               ndp->hot_channel = hot_nc;
>> +               spin_unlock_irqrestore(&ndp->lock, flags);
>> +
>>                 ncsi_start_channel_monitor(nc);
>>                 ncsi_process_next_channel(ndp);
>>                 break;
>> @@ -773,10 +782,14 @@ error:
>>  static int ncsi_choose_active_channel(struct ncsi_dev_priv *ndp)
>>  {
>>         struct ncsi_package *np;
>> -       struct ncsi_channel *nc, *found;
>> +       struct ncsi_channel *nc, *found, *hot_nc;
>>         struct ncsi_channel_mode *ncm;
>>         unsigned long flags;
>>
>> +       spin_lock_irqsave(&ndp->lock, flags);
>> +       hot_nc = ndp->hot_channel;
>> +       spin_unlock_irqrestore(&ndp->lock, flags);
>> +
>
>Can you explain why we need to take a lock here?
>

I don't think it's too useful for now as AST2x00 are UP systems
and HWA isn't enabled so far. In extreme situation when NCSI stack
runs on SMP system and HWA (Hardware arbitration) is enabled. There
might be multiple accessors and updaters. It's why we need a spinlock
to ensure consistent access/update.

Thanks,
Gavin

>
>>         /* The search is done once an inactive channel with up
>>          * link is found.
>>          */
>> @@ -794,6 +807,9 @@ static int ncsi_choose_active_channel(struct ncsi_dev_priv *ndp)
>>                         if (!found)
>>                                 found = nc;
>>
>> +                       if (nc == hot_nc)
>> +                               found = nc;
>> +
>>                         ncm = &nc->modes[NCSI_MODE_LINK];
>>                         if (ncm->data[2] & 0x1) {
>>                                 spin_unlock_irqrestore(&nc->lock, flags);
>> --
>> 2.1.0
>>
>
