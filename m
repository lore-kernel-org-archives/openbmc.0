Return-Path: <SRS0=LnGq=G7=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C272C433E0
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 19:49:40 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A41C64E3D
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 19:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A41C64E3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRWJd1HqbzDsP0
	for <openbmc@archiver.kernel.org>; Fri, 29 Jan 2021 06:49:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=H8ByB/9L; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRWH12XPNzDqNN
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2021 06:48:12 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10SJXfYR137756; Thu, 28 Jan 2021 14:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BHImUlXFd17gPoBptzG+b33estwHwV9YCmkghV199EE=;
 b=H8ByB/9LF74mmbhCsaOkIaUUBp3rpUGmE/H8bivlONFAP6Tsm0pa/cEVEXtEH+InoR90
 7ajC/xICfpeRtPxi0C/mHL03mzZPVnz1SttGBz04zZT4bNu7IPvaqmN2dbcUSJVBUlrD
 c1BxcBaQwc1Z+oiMMBrN3f5NJFjvUXuTjyNOpyI0kbcug/FpefR+dF0mBDaaqrlZTfaA
 a563pXFuMKGq8lt8uLWXyR30OUh7TFNXIKMVMdre0Ql/FOm14QNymuoH0voFbKtyrj1B
 RbPFOixyzJfRDDbcWpAcbjgB+Y7LPNifYpZL8Kaj2gByXOteEjR6xIIRipleJHpRA4RF OA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36c3bp8h38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 14:48:06 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10SJhCfm017078;
 Thu, 28 Jan 2021 19:48:05 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 36agvf7cqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 19:48:05 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10SJm4k527591018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 19:48:04 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 440B6C6055;
 Thu, 28 Jan 2021 19:48:04 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60336C6061;
 Thu, 28 Jan 2021 19:48:03 +0000 (GMT)
Received: from [9.80.204.221] (unknown [9.80.204.221])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 28 Jan 2021 19:48:03 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/7] rsa: reject images
 with unknown padding
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org
References: <20210128105304.401058-1-joel@jms.id.au>
 <20210128105304.401058-2-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <8b3d31e5-6654-5768-d533-f220a4646b86@linux.vnet.ibm.com>
Date: Thu, 28 Jan 2021 16:48:01 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128105304.401058-2-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-28_12:2021-01-28,
 2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=995 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280090
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



On 1/28/2021 7:52 AM, Joel Stanley wrote:
> From: Patrick Doyle <wpdster@gmail.com>
> 
> Previously we would store NULL in info->padding and jump to an illegal
> instruction if an unknown value for "padding" was specified in the
> device tree.
> 

>   	printf("%s:%s", algo_name, info->keyname);
> 
> -	if (!info->checksum || !info->crypto) {
> +	if (!info->checksum || !info->crypto || !info->padding) {
Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

>   		*err_msgp = "Unknown signature algorithm";
>   		return -1;
>   	}
> 

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
