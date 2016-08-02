Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s3NtC08yTzDqYw
 for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2016 14:45:22 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u724hpLk051678
 for <openbmc@lists.ozlabs.org>; Tue, 2 Aug 2016 00:45:21 -0400
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 by mx0a-001b2d01.pphosted.com with ESMTP id 24gn49k76j-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 02 Aug 2016 00:45:20 -0400
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Tue, 2 Aug 2016 14:45:18 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 2 Aug 2016 14:45:15 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id AA0523578053
 for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2016 14:45:14 +1000 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u724jEeG22020220
 for <openbmc@lists.ozlabs.org>; Tue, 2 Aug 2016 14:45:14 +1000
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u724jEvv023830
 for <openbmc@lists.ozlabs.org>; Tue, 2 Aug 2016 14:45:14 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u724jEoX023801; Tue, 2 Aug 2016 14:45:14 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id A718CA01E8;
 Tue,  2 Aug 2016 14:45:13 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 995F8E3BC3;
 Tue,  2 Aug 2016 14:45:13 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 82EE5942302; Tue,  2 Aug 2016 14:45:13 +1000 (AEST)
Date: Tue, 2 Aug 2016 14:45:13 +1000
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH dev-4.7 1/2] net/faraday: Avoid PHYSTS_CHG interrupt
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
References: <1469667862-12601-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1470040022.16990.8.camel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1470040022.16990.8.camel@jms.id.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16080204-0016-0000-0000-000001B95A9C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16080204-0017-0000-0000-000005215877
Message-Id: <20160802044513.GA22837@gwshan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-08-02_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1608020047
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
X-List-Received-Date: Tue, 02 Aug 2016 04:45:23 -0000

On Mon, Aug 01, 2016 at 05:57:02PM +0930, Joel Stanley wrote:
>On Thu, 2016-07-28 at 11:04 +1000, Gavin Shan wrote:
>> Bit#11 in MACCR (0x50) designates the signal level for PHY link
>> status change. It's cleared, meaning high level enabled, by default.
>> However, we can see continuous interrupt (bit#6) in ISR (0x0) for it
>> and it's obviously a false alarm. The side effect is CPU cycles
>> wasted
>> to process the false alarm.
>> 
>> This sets bit#11 in MACCR (0x50) to avoid the bogus interrupt.
>
>Thanks.
>
>I assume you're seeing this with the hardware in NCSI mode?
>
>Is the patch okay for other use cases?
>

Yeah, the only available testing environment is NCSI. I didn't
test it on PHY based AST2500. Joel, please give it a shoot on
your AST2500 board before merging it. By the way, the interrupt
(PHYSTS_CHG) shouldn't be used even we have a PHY connected as
polling mechanism is specified to retrieve the link status in
ftgmac100.c

Thanks,
Gavin

>Cheers,
>
>Joel
>
>> 
>> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
>> ---
>>  drivers/net/ethernet/faraday/ftgmac100.c | 1 +
>>  drivers/net/ethernet/faraday/ftgmac100.h | 1 +
>>  2 files changed, 2 insertions(+)
>> 
>> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
>> b/drivers/net/ethernet/faraday/ftgmac100.c
>> index e805c4d..f00911a 100644
>> --- a/drivers/net/ethernet/faraday/ftgmac100.c
>> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
>> @@ -224,6 +224,7 @@ static void ftgmac100_init_hw(struct ftgmac100
>> *priv)
>>  				 FTGMAC100_MACCR_RXMAC_EN	| \
>>  				 FTGMAC100_MACCR_FULLDUP	| \
>>  				 FTGMAC100_MACCR_CRC_APD	| \
>> +				 FTGMAC100_MACCR_PHY_LINK_LEVEL | \
>>  				 FTGMAC100_MACCR_RX_RUNT	| \
>>  				 FTGMAC100_MACCR_RX_BROADPKT)
>>  
>> diff --git a/drivers/net/ethernet/faraday/ftgmac100.h
>> b/drivers/net/ethernet/faraday/ftgmac100.h
>> index c258586..d07b6ea 100644
>> --- a/drivers/net/ethernet/faraday/ftgmac100.h
>> +++ b/drivers/net/ethernet/faraday/ftgmac100.h
>> @@ -152,6 +152,7 @@
>>  #define FTGMAC100_MACCR_FULLDUP		(1 << 8)
>>  #define FTGMAC100_MACCR_GIGA_MODE	(1 << 9)
>>  #define FTGMAC100_MACCR_CRC_APD		(1 << 10)
>> +#define FTGMAC100_MACCR_PHY_LINK_LEVEL	(1 << 11)
>>  #define FTGMAC100_MACCR_RX_RUNT		(1 << 12)
>>  #define FTGMAC100_MACCR_JUMBO_LF	(1 << 13)
>>  #define FTGMAC100_MACCR_RX_ALL		(1 << 14)
>
