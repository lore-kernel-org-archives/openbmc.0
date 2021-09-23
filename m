Return-Path: <SRS0=3mAZ=ON=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BF9C433F5
	for <openbmc@archiver.kernel.org>; Thu, 23 Sep 2021 21:24:42 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0E3560F6D
	for <openbmc@archiver.kernel.org>; Thu, 23 Sep 2021 21:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0E3560F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFp8R5Z64z305Q
	for <openbmc@archiver.kernel.org>; Fri, 24 Sep 2021 07:24:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=FrBrqebn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com;
 envelope-from=quic_ggregory@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=FrBrqebn; dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFp7f11xlz2yfZ
 for <openbmc@lists.ozlabs.org>; Fri, 24 Sep 2021 07:23:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1632432238; x=1663968238;
 h=from:subject:to:references:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=ke/CG85/ytmVT4Yjp+qko+KXVn1G/ww8uQXKkHUrlT0=;
 b=FrBrqebnlPY5JCRcBMWhHgC7nxvb22Tgwoc65Gup25LtnrNs//4OwKQu
 pS5UanqtVefRAW3sn0+Z7lA4DpepIAGp31dEuoryzfMTLC4kvrcvRVB1t
 2kHdq4/Alg3oZafsOCtjLUMweOQWhr8ILYbA14HJvMtib88D0we0LR+22 4=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 23 Sep 2021 14:22:54 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 14:22:54 -0700
Received: from [10.111.141.25] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Thu, 23 Sep 2021
 14:22:53 -0700
From: Graeme Gregory <quic_ggregory@quicinc.com>
Subject: Re: AST2600 EVB eth0 (MAC1) Issue
To: Troy Lee <troy_lee@aspeedtech.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
References: <8f36a6e9-eccf-5d9b-2c29-3546ded6ba5d@quicinc.com>
 <HK0PR06MB2145678C356EC1ADFB194D1E8AA39@HK0PR06MB2145.apcprd06.prod.outlook.com>
Message-ID: <296f8f59-c6a5-5a1a-2567-63c7845e53d3@quicinc.com>
Date: Thu, 23 Sep 2021 22:22:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <HK0PR06MB2145678C356EC1ADFB194D1E8AA39@HK0PR06MB2145.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On 23/09/2021 10:09, Troy Lee wrote:
> Hi Gaeme,
>
> Which soc revision and evb board revision are you using?
> Can you try to use phy-mode = "rgmii-rxid" for eth0/1 in your dts?
>
> Thanks,
> Troy Lee

Hi Troy,

Soc Rev:-

U-Boot 2019.04-00083-ge5902174d9-dirty (Sep 22 2021 - 15:10:03 +0000)

SOC: AST2600-A1


EVB Rev:-

AST2600-DDR4 EVB V1.4


phy-mode = "rgmii-rxid" instead of "rgmii" improves the issue and I now 
get DHCP on that interface, but packet loss is still hight compared to 
eth1 (MAC2).

eth0
ping -f 192.168.222.119
PING 192.168.222.119 (192.168.222.119) 56(84) bytes of data.
.............................................................................................................................................................................................................................................................................................................................^C
--- 192.168.222.119 ping statistics ---
597 packets transmitted, 330 received, 44.7236% packet loss, time 6775ms
rtt min/avg/max/mdev = 0.078/809.845/3266.263/1099.208 ms, pipe 205, 
ipg/ewma 11.367/30.024 ms

eth1
ping -f 192.168.222.30
[sudo] password for ggregory:
PING 192.168.222.30 (192.168.222.30) 56(84) bytes of data.
.^C
--- 192.168.222.30 ping statistics ---
50591 packets transmitted, 50590 received, 0.00197664% packet loss, time 
5550ms
rtt min/avg/max/mdev = 0.083/0.105/0.816/0.004 ms, ipg/ewma 0.109/0.104 ms

Thanks

Graeme

>> -----Original Message-----
>> From: openbmc <openbmc-
>> bounces+troy_lee=aspeedtech.com@lists.ozlabs.org> On Behalf Of Graeme
>> Gregory
>> Sent: Wednesday, September 22, 2021 11:49 PM
>> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>> Subject: AST2600 EVB eth0 (MAC1) Issue
>>
>> Hi,
>>
>> I know A0 versions of the AST2600 had an issue where eth0 was not working,
>> but the errata indicates this is fixed in later revisions.
>>
>> I am seeing an issue on the EVB board though where eth0 (MAC1) is not
>> functional. The other three ports all function as expected.
>>
>> On my DHCP host machine I can see DHCP requests from the AST2600, and
>> replies are sent. Looking at /proc/interrupts it looks very much like no IRQs
>> are ever generated for incoming packets.
>>
>> Thanks
>>
>> Graeme
>>
