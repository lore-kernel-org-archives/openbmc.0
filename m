Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AA8606A31B
	for <openbmc@archiver.kernel.org>; Wed,  4 Nov 2026 23:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pHkXeqV6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wp/SBOm3
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jKhfF2Ktsz2xwL;
	Thu, 05 Nov 2026 10:36:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793780092;
	cv=none; b=O5BjC47xaDFrlwkDp9vtq2YXjoglcidudgihcS2wfvNylsuTFnUvKwC6wSDeoTMmChS7ITcBp/gy5XWh9PzSY3KxDMQdp87vbT+A17/C4GqpjzG5A6RQfbarW+Ud3boORQ9b9sBbDbYjeNAUVbKpd8betkkKtw3TyGSZl7ju5yklHR3RBB49AwXJUi7J9Pd423UqItHqI2yb8VKahU8bdtAEcOBNkwEXlxtjubxHjyOcdoAnBmHVHhx02xUkjDcuMaUNDlkGi+/n1aCxVrIHuhysZkaz34RtoOVoxaxuvM1XwBd/yJfoj1JhpHBJxYPKihNk7Ym9yfRGOlEP3DbdRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793780092; c=relaxed/relaxed;
	bh=tbal/ZkG6Z3XFW+o0xC7HHpMaNOPsDMuc3tJN0tWynI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gd9dy9luxB5Sv+O/aeNEOCxxIEndV7nztl0duGvs5lzGk7rZaKv8aPuvvbuU5JoemwEmXFzFAa7DsbyPusMRwqCAuVivg39RCbJuNMreE5sQbPV7u0H+eW/32YCk7XFuBXR6rNZzBkm4hESwgBQRPexSmUFQ28H2HtihM2Cw25fR03TL5+SZb0gUgxSEBpx/vPwi9SBejLOIIeU2ZkQ2XsXn8Bs8sF6pH+r3XHEU24Qc0C1TLYnvkOPesbHOqzZmalanipoaaX2ghUQ2Sp0ashq0boLIx0/AbnC3HiaD5MQvD9exQN+wNg9CSGXJxCibxaZWPbE1rY8KJC7x5VltxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pHkXeqV6; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wp/SBOm3; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=peter.chen@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pHkXeqV6;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wp/SBOm3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=peter.chen@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jKJBy4L54z2xDD
	for <openbmc@lists.ozlabs.org>; Wed, 04 Nov 2026 19:14:49 +1100 (AEDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A470kof3460091
	for <openbmc@lists.ozlabs.org>; Wed, 4 Nov 2026 08:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tbal/ZkG6Z3XFW+o0xC7HHpM
	aNOPsDMuc3tJN0tWynI=; b=pHkXeqV6evqnstGnUGw1ZXFoP5wPgDZd9FKKqSD0
	Jjhnu+jlZpPGX01DzVhh2vWavE8EIDnBjodzE93dZe5xQI6KvvJ2MztgHjcJoxRs
	x2XwrDWQv+c5IIEviMli2BaYo1JrUExxVPeacUWAI5QC3DLbySZeLeC4u37p6pht
	R8q14RhN/s+JV+2piZijnNSUDeqbRrWHzH0D7h9TOiex71Is+sFvDVYtCSY79Kkp
	hc0MWjtt27xLW7i9ME6C3hsribeyJ794tTDrRYO1htH6GUTRcRpmjhFi38N8doc6
	N2NBdSSPa/mMhbNVAxAEY/n1eU+FF3xkW2OlbWO3+881Ag==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bv35n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 04 Nov 2026 08:14:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso2284141eec.0
        for <openbmc@lists.ozlabs.org>; Wed, 04 Nov 2026 00:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793780086; x=1794384886; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tbal/ZkG6Z3XFW+o0xC7HHpMaNOPsDMuc3tJN0tWynI=;
        b=Wp/SBOm3MSMGpismeORIwFCrbNqisBZwDqAofC1IPsjGA8d65wq2VZO2jjiRH6Qphh
         22DIHln19UxxY+01XG/RBYsj7SCiOmz+97N3oKzNa3DS/wL+kkOQgyACQK6f+qMor4+6
         5cX5HZ5KFhZse51HH5ElYWMf0DuyyTEorFcr+c8sbDoT3os5kC3ETpKLJ+2knyzXFluD
         roW+8ka8k4ixPtLUOg4/wsRTGktn3ehGO4P45B/cbeFw0F4MqJc6i/ELeVieWxjo6PPR
         BBQr2r6qVCdHMBy9jDYXETXWonP4YLcq3KqN2mFO8LBsoqddoOLENtMnKSMftPqn/u0G
         sl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780086; x=1794384886;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tbal/ZkG6Z3XFW+o0xC7HHpMaNOPsDMuc3tJN0tWynI=;
        b=eifkG9Syj51oWHzz3m8M254mi90/oJ+Vcqtyx/HgpqoPjo+wsnzektnAN5zPmrSVT2
         pcpK1l98OXix53GNrhwcYgsa+T0JF6J24aKUr5yjopX0Ge4SM2Sk0B/2dQtt7iiCTx8S
         mNDp6k5xkiWSge382eXS/odfu94e2EJb3NXn5QMjGoKGwXASQRpekzZMxtpmwxPwZ40p
         4XOgKd4mHKp6wQaeDKb07rASef8XUZtzVyDOINhcfjy+OAcp79aZIqHKxSPt5SRSH6L3
         0gWWfVtGZ//vVNcOsNHZOKIsu+jYDOBUh09AwcyDw7xnLPEQk4h5GBJIRkox33HBjHny
         7chw==
X-Forwarded-Encrypted: i=1; AKwUvBwh7H/HRgaViIhMvPr13u9VpFgNVjIJmlvMkthvaIjyqHkr4VPMebIUbnzzG5yaDagVXEA/uDqJ@lists.ozlabs.org
X-Gm-Message-State: APuU4Z+KthujIw+E7Xz1/X5wBBod8A+GKkNNH3i+rDydlLrOlvdgeJCR
	+I6zdPhZAEBjjKY1ERMFSlBxAYgz2VIT+2yqRs114hrkZA29ThGTQr0u/DZkXpwWcUvZP6eFjDl
	78IFJQS/2iZvY0bdmbSLYRwIdCh8jmw+6gLpjwf/PCqxaYGgn4YqgkV3cOSdIrw==
X-Gm-Gg: AYBFou2aXZWcySE8k2xURLeeGInubjK24QMK8olbvUBldPDBiKMdSZwvjbtBiiiYInV
	jqk+IQ5TmF+Klxzia95Bd4kXX1pUqNdXXiKGLtdBlsxuAifM+lO+OefWLtGPqhYiHE8Y4gxjzaQ
	ynel+Mf5/5jr6toBLo4N2Tz0IE7Ca+MxAK5b5v1mjvGfG365+J/lolEPQD6zZrps7dmf0ZXlLi9
	2hgeMt8GAP+UsmMkwFOQyDUY5m+pfQNxx7iWcPl5B2scT4YEQmTgf1BaW3vZzZc5RKN6ZuJBcoO
	QcYDXnL5sKxQTXGrYUVmMLBiL45Wjo0Aus7dGlfFz0INU5oncn5lST+xIO+86GNga3fGN/J8olY
	E+8XrMH68erK+GG3HLY6wDmpLscU53LM3z6Z0sYJVWDrZTyMDbtldvM1/0+pr6/k0dunryZDyMh
	TzrZGtx1Cey4oqyOTwH0Dd
X-Received: by 2002:a05:701b:220d:b0:1b2:365f:736f with SMTP id a92af1059eb24-1b2365f76c2mr8150395c88.9.1793780086190;
        Wed, 04 Nov 2026 00:14:46 -0800 (PST)
X-Received: by 2002:a05:701b:220d:b0:1b2:365f:736f with SMTP id a92af1059eb24-1b2365f76c2mr8150360c88.9.1793780085419;
        Wed, 04 Nov 2026 00:14:45 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm6286845c88.22.2026.11.04.00.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:14:45 -0800 (PST)
Date: Wed, 4 Nov 2026 00:14:43 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: npcm: keep the ci_hdrc platform device
 for removal
Message-ID: <aurpc-QvQ-9ak1dD@hu-petche-lv.qualcomm.com>
References: <20261104021456.1468462-1-vulab@iscas.ac.cn>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104021456.1468462-1-vulab@iscas.ac.cn>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX0lqus8CPsYpw
 bbl1Cy552ZA8FdcJqAxzUD6cwYmiRO30w6jNiefO12ZMMr1+QuCGA82R+THq795lZFhi7NYsk8A
 cH3wQ5UZDYBbt1qQNLi+N2PkCH2gn/0=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aeae977 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=jKONAvGbKtYcbMD76CUA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: RPtN2yrOQ_bP4U-0neyFajqfv0d4azLK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX9bUVbum4zaOr
 xG35jrKVqHoiDrrzv6dHWo5Z5diB02wCuSLSi+QuVgTq/5JSjEY4/xfmJWC5PUwAUuE1avemTVo
 M4bVX0x1FehM6V9iRLkQx/r+vdy/T4eFtSIPPbHOQjhuGhdnn5qnZTB4reCRtFHh9gICAKll19D
 CXBdUq+2maIj+pblVQr9Xyph3lPQ7khBCCraSmQgBFU2rMOHXyqyEWfhN4mLMIY5Ja68j5hPYlq
 0gNDW1BeJOY9HLOyLjNp9ybylLC7po+R3LPnt7HFuvY8VgGbIrIqAxnwCIJO6OFq/rpM1+Xft8n
 K4rfDbK6zH+m/AABHS4D1fDjwCMJFi2Wz1kHcraR9MxA/8uLmpv1b2Klr76aZP6S+89CQ+BlH76
 5TaHcIYVpIavXuS9v9ILDjRCcg/SnFOlHLhBNdpuq+ILVireAouM9TIGWOXtXEXdj30L8XSDYOv
 nNcrjIA9a0okI3p3fyQ==
X-Proofpoint-GUID: RPtN2yrOQ_bP4U-0neyFajqfv0d4azLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040032
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-11-04 02:14:56, Wentao Liang wrote:
> npcm_udc_probe() creates the ci_hdrc platform device with
> ci_hdrc_add_device() and stores it only in the local plat_ci variable.
> The npcm_udc_data::ci field that npcm_udc_remove() passes to
> ci_hdrc_remove_device() is never assigned, so it stays NULL.
> 
> ci_hdrc_remove_device() therefore never unregisters the device created
> during probe.  Both the platform device and the reference it holds on
> its parent are leaked on every unbind, and the UDC core structures are
> never torn down.
> 
> Store the returned device in ci->ci.
> 
> Fixes: 70f13579c2f7 ("usb: chipidea: Add support for NPCM")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/ci_hdrc_npcm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_npcm.c b/drivers/usb/chipidea/ci_hdrc_npcm.c
> index e52a2b05cbe2..8ad8797742f1 100644
> --- a/drivers/usb/chipidea/ci_hdrc_npcm.c
> +++ b/drivers/usb/chipidea/ci_hdrc_npcm.c
> @@ -70,6 +70,8 @@ static int npcm_udc_probe(struct platform_device *pdev)
>  		goto clk_err;
>  	}
>  
> +	ci->ci = plat_ci;
> +
>  	pm_runtime_no_callbacks(dev);
>  	pm_runtime_enable(dev);
>  
> -- 
> 2.34.1
> 
> 

-- 

Thanks,
Peter Chen

