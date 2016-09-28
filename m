Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skTZ56CL6zDsjG
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 17:18:05 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u8S7D7Xl115246
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 03:18:04 -0400
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 by mx0a-001b2d01.pphosted.com with ESMTP id 25r4h1406q-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 03:18:03 -0400
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Wed, 28 Sep 2016 17:17:55 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 28 Sep 2016 17:17:53 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 13D8F2BB0059
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 17:17:53 +1000 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u8S7HrAq59637846
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 17:17:53 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u8S7HqZO028557
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 17:17:52 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u8S7Hq62028551; Wed, 28 Sep 2016 17:17:52 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 75C05A0195;
 Wed, 28 Sep 2016 17:17:52 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 65F6EE3C36;
 Wed, 28 Sep 2016 17:17:52 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id F419294301B; Wed, 28 Sep 2016 17:18:22 +1000 (AEST)
Date: Wed, 28 Sep 2016 17:18:22 +1000
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v4.7 7/7] net/ncsi: Introduce ncsi_stop_dev()
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
References: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475030915-9525-7-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475041880.9493.12.camel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1475041880.9493.12.camel@jms.id.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16092807-0044-0000-0000-000001E7949F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16092807-0045-0000-0000-000005A32AD1
Message-Id: <20160928071822.GB10147@gwshan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-09-28_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
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
X-List-Received-Date: Wed, 28 Sep 2016 07:18:06 -0000

On Wed, Sep 28, 2016 at 03:21:20PM +0930, Joel Stanley wrote:
>On Wed, 2016-09-28 at 12:48 +1000, Gavin Shan wrote:
>> This introduces ncsi_stop_dev(), as counterpart to ncsi_start_dev(),
>> to stop the NCSI device so that it can be enabled in future. This
>> API should be called when the network device driver is going to
>> shutdown the device. There are 3 things done in the function: Stop
>> the channel monitoring; Reset channels to inactive state; Report
>> NCSI link down.
>> 
>> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
>
>Makes sense. Can you split out the change to the faraday driver?
>

Sure, will do in next revision.

>> ---
>>  drivers/net/ethernet/faraday/ftgmac100.c |  2 ++
>>  include/net/ncsi.h                       |  1 +
>>  net/ncsi/ncsi-manage.c                   | 37 +++++++++++++++++++++-
>> ----------
>>  3 files changed, 27 insertions(+), 13 deletions(-)
>> 
>> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
>> b/drivers/net/ethernet/faraday/ftgmac100.c
>> index 134b9c5..f40fa92 100644
>> --- a/drivers/net/ethernet/faraday/ftgmac100.c
>> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
>> @@ -1189,6 +1189,8 @@ static int ftgmac100_stop(struct net_device
>> *netdev)
>>  	napi_disable(&priv->napi);
>>  	if (netdev->phydev)
>>  		phy_stop(netdev->phydev);
>> +	else if (priv->use_ncsi)
>> +		ncsi_stop_dev(priv->ndev);
>>  
>>  	ftgmac100_stop_hw(priv);
>>  	free_irq(priv->irq, netdev);
>> diff --git a/include/net/ncsi.h b/include/net/ncsi.h
>> index 1dbf42f..3d166f7 100644
>> --- a/include/net/ncsi.h
>> +++ b/include/net/ncsi.h
>> @@ -31,6 +31,7 @@ struct ncsi_dev {
>>  struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
>>  				   void (*notifier)(struct ncsi_dev
>> *nd));
>>  int ncsi_start_dev(struct ncsi_dev *nd);
>> +void ncsi_stop_dev(struct ncsi_dev *nd);
>>  void ncsi_unregister_dev(struct ncsi_dev *nd);
>>  #else /* !CONFIG_NET_NCSI */
>>  static inline struct ncsi_dev *ncsi_register_dev(struct net_device
>> *dev,
>> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
>> index 5813ebe..73ab65f 100644
>> --- a/net/ncsi/ncsi-manage.c
>> +++ b/net/ncsi/ncsi-manage.c
>> @@ -1160,9 +1160,7 @@ EXPORT_SYMBOL_GPL(ncsi_register_dev);
>>  int ncsi_start_dev(struct ncsi_dev *nd)
>>  {
>>  	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
>> -	struct ncsi_package *np;
>> -	struct ncsi_channel *nc;
>> -	int old_state, ret;
>> +	int ret;
>>  
>>  	if (nd->state != ncsi_dev_state_registered &&
>>  	    nd->state != ncsi_dev_state_functional)
>> @@ -1174,16 +1172,6 @@ int ncsi_start_dev(struct ncsi_dev *nd)
>>  		return 0;
>>  	}
>>  
>> -	/* Reset channel's state and start over */
>> -	NCSI_FOR_EACH_PACKAGE(ndp, np) {
>> -		NCSI_FOR_EACH_CHANNEL(np, nc) {
>> -			old_state = atomic_xchg(&nc->state,
>> -						NCSI_CHANNEL_INACTIV
>> E);
>> -			WARN_ON_ONCE(!list_empty(&nc->link) ||
>> -				     old_state ==
>> NCSI_CHANNEL_INVISIBLE);
>> -		}
>> -	}
>> -
>>  	if (ndp->flags & NCSI_DEV_HWA)
>>  		ret = ncsi_enable_hwa(ndp);
>>  	else
>> @@ -1193,6 +1181,29 @@ int ncsi_start_dev(struct ncsi_dev *nd)
>>  }
>>  EXPORT_SYMBOL_GPL(ncsi_start_dev);
>>  
>> +void ncsi_stop_dev(struct ncsi_dev *nd)
>> +{
>> +	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
>> +	struct ncsi_package *np;
>> +	struct ncsi_channel *nc;
>> +	int old_state;
>> +
>> +	/* Stop the channel monitor and reset channel's state */
>> +	NCSI_FOR_EACH_PACKAGE(ndp, np) {
>> +		NCSI_FOR_EACH_CHANNEL(np, nc) {
>> +			ncsi_stop_channel_monitor(nc);
>> +
>> +			old_state = atomic_xchg(&nc->state,
>> +						NCSI_CHANNEL_INACTIV
>> E);
>> +			WARN_ON_ONCE(!list_empty(&nc->link) ||
>> +				     old_state ==
>> NCSI_CHANNEL_INVISIBLE);
>> +                }
>> +        }
>> +
>> +	ncsi_report_link(ndp, true);
>> +}
>> +EXPORT_SYMBOL_GPL(ncsi_stop_dev);
>> +
>>  void ncsi_unregister_dev(struct ncsi_dev *nd)
>>  {
>>  	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
>> 
>
