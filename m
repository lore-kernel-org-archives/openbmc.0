Return-Path: <SRS0=JGev=OK=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1,
	WEIRD_QUOTING autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C340C433FE
	for <openbmc@archiver.kernel.org>; Mon, 20 Sep 2021 18:28:25 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4779660F23
	for <openbmc@archiver.kernel.org>; Mon, 20 Sep 2021 18:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4779660F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCtNR6Qrtz2yPn
	for <openbmc@archiver.kernel.org>; Tue, 21 Sep 2021 04:28:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SFpVFDIW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SFpVFDIW; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCtM00cWjz2yZh
 for <openbmc@lists.ozlabs.org>; Tue, 21 Sep 2021 04:27:07 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18KHT9wh016547
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 14:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7tVCrT9mcClqifym7keMhj/pRYJ2DOJ77YwRm1IBF40=;
 b=SFpVFDIW9ZWwFEDGEBjiahtVK3jTbZNB9RHtXC1p6JbaQN/q5FXhYvcctlQNFcpAbcDT
 3JK/sZHjDgti3gK7oj8/CIotIXqFbq/hQhccQC+K0aBxFVgNEMm0oDOC0rrrY6dOkBzL
 ZFn5M730fA4sEpuVJ8U07DGjm7dxf3el3AIGhgu1/eYrWNIbZwHIk32K1T0xDI1p6Ov5
 8e2maAmb5NAfUFbFA5kCPZ+L+Ft/oFQ83lwRSFhTsSpc/xAmkXGK438Pph7FJypBHVlL
 zlTDkz5h7AlwfeReOP0nf3Bnlxib+tgAVvYQBNwsVsUQPuMzGHrl+qwc2FngVdSX4ge8 OA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b5w94j6qp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 14:27:05 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18KIH54l003395
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 18:27:04 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 3b57ra7cnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 18:27:04 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18KIR2ha20119898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Sep 2021 18:27:02 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EF1E6A05F;
 Mon, 20 Sep 2021 18:27:02 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 434D16A051;
 Mon, 20 Sep 2021 18:27:02 +0000 (GMT)
Received: from [9.211.87.144] (unknown [9.211.87.144])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Sep 2021 18:27:02 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.10 v2 2/3] ARM: dts: everest: Define name for
 gpio line Q2
To: Ben Tyner <bentyner@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <20210920150549.6431-1-bentyner@linux.ibm.com>
 <20210920150549.6431-3-bentyner@linux.ibm.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <9bcf8670-f500-8dfc-cf0c-dbd1fbca6c7b@linux.ibm.com>
Date: Mon, 20 Sep 2021 13:27:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920150549.6431-3-bentyner@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: g5nBNmOgQHZiCduya4Hm_hkQ5Plp5vpD
X-Proofpoint-ORIG-GUID: g5nBNmOgQHZiCduya4Hm_hkQ5Plp5vpD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109200108
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
Cc: Ben Tyner <ben.tyner@ibm.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>


On 9/20/21 10:05 AM, Ben Tyner wrote:
> From: Ben Tyner <ben.tyner@ibm.com>
>
> gpio-line-names Q2 set to regulator-standby-faulted


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Ben Tyner <ben.tyner@ibm.com>
> ---
>   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> index 10e214f8c7bc..bc21a7f56642 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> @@ -265,7 +265,7 @@ &gpio0 {
>   	/*N0-N7*/	"","","","","","","","",
>   	/*O0-O7*/	"","","","","","","","",
>   	/*P0-P7*/	"","","","","led-pcieslot-power","","","",
> -	/*Q0-Q7*/	"","","","","","","","",
> +	/*Q0-Q7*/	"","","regulator-standby-faulted","","","","","",
>   	/*R0-R7*/	"","power-chassis-control","power-chassis-good","","","I2C_FLASH_MICRO_N","","",
>   	/*S0-S7*/	"","","","","","","","",
>   	/*T0-T7*/	"","","","","","","","",
