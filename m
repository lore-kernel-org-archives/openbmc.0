Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s3Rjw4rfBzDrJQ
 for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2016 16:53:23 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u726nJsA002589
 for <openbmc@lists.ozlabs.org>; Tue, 2 Aug 2016 02:53:21 -0400
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 by mx0b-001b2d01.pphosted.com with ESMTP id 24gnv1m725-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 02 Aug 2016 02:53:20 -0400
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Tue, 2 Aug 2016 16:53:14 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 2 Aug 2016 16:53:12 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 341BD3578052
 for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2016 16:53:12 +1000 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u726rCIf25428062
 for <openbmc@lists.ozlabs.org>; Tue, 2 Aug 2016 16:53:12 +1000
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u726rBkv011383
 for <openbmc@lists.ozlabs.org>; Tue, 2 Aug 2016 16:53:12 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u726rB1m011376; Tue, 2 Aug 2016 16:53:11 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 4BAA2A01E8;
 Tue,  2 Aug 2016 16:53:11 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 2FCFDE3BC5;
 Tue,  2 Aug 2016 16:53:11 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 16C1C943179; Tue,  2 Aug 2016 16:53:11 +1000 (AEST)
Date: Tue, 2 Aug 2016 16:53:11 +1000
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH dev-4.7 2/2] net/faraday: Clear stale interrupts
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
References: <1469667862-12601-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1469667862-12601-2-git-send-email-gwshan@linux.vnet.ibm.com>
 <1470039961.16990.7.camel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1470039961.16990.7.camel@jms.id.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16080206-1617-0000-0000-00000142661C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16080206-1618-0000-0000-00004667E24B
Message-Id: <20160802065310.GA12378@gwshan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-08-02_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1608020069
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
X-List-Received-Date: Tue, 02 Aug 2016 06:53:25 -0000

On Mon, Aug 01, 2016 at 05:56:01PM +0930, Joel Stanley wrote:
>On Thu, 2016-07-28 at 11:04 +1000, Gavin Shan wrote:
>> There is stale interrupt (PHYSTS_CHG in ISR, bit#6 in 0x0) from
>> the bootloader (uboot) when enabling the MAC. The stale interrupts
>> aren't part of kernel and should be cleared.
>> 
>> This clears the stale interrupts in ISR (0x0) when enabling the MAC.
>
>Thanks Gavin. A question below.
>
>> 
>> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
>> ---
>>  drivers/net/ethernet/faraday/ftgmac100.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>> 
>> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
>> b/drivers/net/ethernet/faraday/ftgmac100.c
>> index f00911a..fc2852f 100644
>> --- a/drivers/net/ethernet/faraday/ftgmac100.c
>> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
>> @@ -1119,6 +1119,7 @@ static int ftgmac100_open(struct net_device
>> *netdev)
>>  {
>>  	struct ftgmac100 *priv = netdev_priv(netdev);
>>  	struct phy_device *phydev = netdev->phydev;
>> +	unsigned int status;
>>  	int err;
>>  
>>  	err = ftgmac100_alloc_buffers(priv);
>> @@ -1145,6 +1146,10 @@ static int ftgmac100_open(struct net_device
>> *netdev)
>>  	ftgmac100_init_hw(priv);
>>  	ftgmac100_start_hw(priv, priv->use_ncsi ? 100 : 10);
>>  
>> +	/* Clear stale interrupts */
>> +	status = ioread32(priv->base + FTGMAC100_OFFSET_ISR);
>> +	iowrite32(status, priv->base + FTGMAC100_OFFSET_ISR);
>
>By the time we get down here we've called ftgmac100_reset_hw. This has
>the following:
>
>/* NOTE: reset clears all registers */
>iowrite32(FTGMAC100_MACCR_SW_RST, priv->base + FTGMAC100_OFFSET_MACCR); 
>
>We are seeing that it does not actually clear all the registers?
>

Yep, it clears all registers including ISR/IER/MACCR, meaning MACCR[11]
is cleared. ISR[9] (PHYSTS_CHG) is set right after it even IER is cleared
that time. So ISR[9] cannot be cleared if MACCR[11] isn't set. Note the
MACCR[11] is set in PATCH[1/2] in ftgmac100_start_hw(). It also means
ISR[9] cannot be cleared successfully until ftgmac100_start_hw() sets
MACCR[11].

>Secondly, if we're seeing stale interrupts is there a risk that they
>will fire again between now and the call below where we
>set FTGMAC100_OFFSET_IER?
>
>Should we be masking them all off, clearing the stale ones, and then
>re-enabling them?
>

IER is cleared by reset done in ftgmac100_reset_hw(), meaning all interrupts
are disabled that time. We're clearing the stale interrupts (mainly ISR[9] -
PHYSTS_CHG) before the interrupts are enabled.

Thanks,
Gavin

>Cheers,
>
>Joel
>
>
>> +
>>  	if (phydev)
>>  		phy_start(phydev);
>>  	else if (priv->use_ncsi)
>
