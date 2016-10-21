Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0VKq0Sr6zDvZW
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 13:41:02 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9L2d4td108129
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 22:41:01 -0400
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2675ygs2t7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 22:41:00 -0400
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Fri, 21 Oct 2016 12:40:58 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 21 Oct 2016 12:40:39 +1000
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id BF4A12BB0057
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 13:40:37 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9L2eb4J6095200
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 13:40:37 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u9L2ebe8023444
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 13:40:37 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u9L2ebJ1023435; Fri, 21 Oct 2016 13:40:37 +1100
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id B6E67A019B;
 Fri, 21 Oct 2016 13:40:36 +1100 (AEDT)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id AEB2AE3C5C;
 Fri, 21 Oct 2016 13:40:36 +1100 (AEDT)
Received: by gwshan (Postfix, from userid 1000)
 id 8EAC4942C9E; Fri, 21 Oct 2016 13:41:28 +1100 (AEDT)
Date: Fri, 21 Oct 2016 13:41:28 +1100
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 4.4 9/9] net/ncsi: Improve HNCDSC AEN handler
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
References: <1477010866-15126-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1477010866-15126-10-git-send-email-gwshan@linux.vnet.ibm.com>
 <CACPK8XdSn5CZQWGs-CFjcM4Hi2MmO5tbQ52AE6deAy5xnZG17A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XdSn5CZQWGs-CFjcM4Hi2MmO5tbQ52AE6deAy5xnZG17A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102102-1617-0000-0000-0000016DA818
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102102-1618-0000-0000-000046F6EED5
Message-Id: <20161021024128.GA8915@gwshan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-21_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610210046
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
X-List-Received-Date: Fri, 21 Oct 2016 02:41:03 -0000

On Fri, Oct 21, 2016 at 12:09:37PM +1030, Joel Stanley wrote:
>Hi Gavin,
>
>On Fri, Oct 21, 2016 at 11:17 AM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
>> This improves AEN handler for Host Network Controller Driver Status
>> Change (HNCDSC):
>>
>>    * The channel's lock should be hold when accessing its state.
>>    * Do failover when host driver isn't ready.
>>    * Configure channel when host driver becomes ready.
>>
>> NOTE: The first one isn't applied to the code in dev-4.4.
>
>Can you clarify what you mean here?
>

Joel, dev-4.4 is using old NCSI old where we don't have a spinlock
for NCSI channel. dev-4.7 and upstream code has one to ensure the
consistent read/update on NCSI channel'state. The commit log was
picked from the patch merged to linux.net (branch: "net"), meaning
the commit log corresponds to the code changes for upstream code.

This piece of changes isn't applied to dev-4.4. So I put a note
to clarify it. I'm too lazy and it could be more meaningful actually :)

Thanks,
Gavin

>Cheers,
>
>Joel
>
>>
>> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
>> ---
>>  net/ncsi/ncsi-aen.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/net/ncsi/ncsi-aen.c b/net/ncsi/ncsi-aen.c
>> index 5bc0873..26ac93d 100644
>> --- a/net/ncsi/ncsi-aen.c
>> +++ b/net/ncsi/ncsi-aen.c
>> @@ -142,8 +142,7 @@ static int ncsi_aen_handler_hncdsc(struct ncsi_dev_priv *ndp,
>>         ncm = &nc->nc_modes[NCSI_MODE_LINK];
>>         hncdsc = (struct ncsi_aen_hncdsc_pkt *)h;
>>         ncm->ncm_data[3] = ntohl(hncdsc->status);
>> -       if (ndp->ndp_active_channel != nc ||
>> -           ncm->ncm_data[3] & 0x1)
>> +       if (ndp->ndp_active_channel != nc)
>>                 return 0;
>>
>>         /* If this channel is the active one and the link doesn't
>> @@ -151,7 +150,8 @@ static int ncsi_aen_handler_hncdsc(struct ncsi_dev_priv *ndp,
>>          * The logic here is exactly similar to what we do when link
>>          * is down on the active channel.
>>          */
>> -       ndp->ndp_flags |= NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE;
>> +       if (!(ncm->ncm_data[3] & 0x1))
>> +               ndp->ndp_flags |= NCSI_DEV_PRIV_FLAG_CHANGE_ACTIVE;
>>         ncsi_suspend_dev(nd);
>>
>>         return 0;
>> --
>> 2.1.0
>>
>
