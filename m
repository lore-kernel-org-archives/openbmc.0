Return-Path: <openbmc+bounces-2210-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FFBC43458
	for <openbmc@archiver.kernel.org>; Mon,  6 Jul 2026 12:06:16 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gv33h6CD2z3bps;
	Mon, 06 Jul 2026 22:06:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783313763;
	cv=none; b=B0DjLyVew/H3zzdq1HLhNp1AUDMirhegEO6XpYps2Gq2I1pyuGe8+rRadoaN51zAxhakcPL0+nXg74ZYGMqFN+jwftxzoP2h1kP6sfHd3KEtefnXeYaD/myt6yDGgvuVg6MSGFShTYp7yJCoyr2bpBbTcYFj3U7yxZUrCRk7E7oMDpMV/JsfAXKoeVd53/8tFxvd7A5C6ZuUMHMq5FT0khhLdoCTv1izXKZgslV+i6Dgb6lXTc8qXzroNDBv+H8iN4RPjE0kizJTngDs0zn+IG9TfGWIfIPzUoauPmjba3nOv++Pu/rh5XuvVs5+Lw4rUEyHvb6YUVNMIeUg9F+WEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783313763; c=relaxed/relaxed;
	bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DT9VMTcWcMLlcRfuONzGKhr3ch3tjScVTHxCV61Hn4678rHXSkMOk5aCaqsqTkA+fjy4fVF/Ayvkaob3JG0ydJutMcnwRIeQXD/u0+XzwHBgEicbV0IJAbca+sedZma8NZQgI5CgDL0QFDdzR2N1sbCIRO/AVCi91EYmMMkyOLQQJEfkq0DE1XVUCpf2zBv9Kkp1f3Ly+B7E6GOakkZ7IB1WLpwd8uRn5LVoWs5KugrNRyaWcBV9hZYbkF1e0RcUH4NZg0lDe+eFp4l+0arRT3B/ieluuuGCib/I4MrRi2QQlNEmWCcFkVlC6C/GOntHOXVK9Vf5O8CmuoaX051vFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BtuYZphI; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZRR95HPO; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=ekansh.gupta@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BtuYZphI;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZRR95HPO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=ekansh.gupta@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gtsWQ5mbhz3bp7
	for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 14:56:00 +1000 (AEST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641Y3U3539341
	for <openbmc@lists.ozlabs.org>; Mon, 6 Jul 2026 04:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=; b=BtuYZphIK7UnAPPa
	qYGHPuM+VD3C6WvezTLdqIjiYVGHLzNLv6RSapQqEJ2excDEyUkD/0AEcWQjp5ej
	4HI3bMiV8UCRYHw/YXMP72BUtTB2CANb5/xl2wJKaV5lc87Ax6wEFDsEhbUsTXur
	RNx2Hm91I1sPL4Fp17l4JFxQuB37ZPnouzzUHhLqbWpMJkm6xOuGNEQuSB8vkr4v
	iHs+mInjL3lcrCXDe3aaUW3MnfspbyT4APEA3ecMXRsbeK03HAVvm7fbyNR3ckpu
	4lDTqZIfECL8APV6bvyHqU87nPrqklBdw7zS2B0zT/os5ltI50S9QbhC5yDZwUWY
	z7D7UA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnmqb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 04:55:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so2292810a91.0
        for <openbmc@lists.ozlabs.org>; Sun, 05 Jul 2026 21:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783313756; x=1783918556; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
        b=ZRR95HPOUicq5WtvsVTmO/5abHVAgcstF56SS3ap4bh0fUM8+hX3B070dISgQQGgtm
         CY8lxuoctm8vxqLD3pL0e9isdDzW9kIQAlDpPsPeyHy/WGWO94yV/jBF44tPG1e3dGcH
         Jwp+oqCeBgCLJj0u/Swfg/ZBWCI8Jgxs502sSbFPVYrgK8SXke5++Q1/Q+AimW+e6mGM
         y3rnHbHGAJjI9wrSZAE44YgqBeCltOVPtQ/kxCYLCCLDXTksXqJImhJenfbLDlfBVCgL
         +02n7ncs4xdQry0o1980GKYPM+rDSbgw1UvljA76W5Scd0SH5O/y925t8KZIgsrlh3jD
         b3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783313756; x=1783918556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
        b=MxN8h90nnQd88z3V3+VXqf8G16X22IzN3XKvdSR1PaJQR/QMXutWPUtauFCknlMKLO
         eku+c+HVd/7YhzgdG8m1/sMIw2uokPHcH2560K8ukWLe8VO5QQBaewloHfyLUBYO4WRZ
         7txfK7P/ZVSOuUzaaf9oXkDKkH0YBIJBhAgZ490Ae4RdKYAzs5Alz3lY8ckTVfHNXzoH
         8HbqhU7SwDBxsJCrHaF/VZp/TnoQnapMEqKNP59AfS+sfOMWxjhiwoM4ZIiFh1661iZL
         wlGKQ+w8xAUCVvLDKsL1nuzUHiKcM8T1UDuWZGkGV3JuE5iWCAwbHsXB1A+Sdsjscu5f
         Wmnw==
X-Forwarded-Encrypted: i=1; AHgh+RrBjEEdR8VodmxnVJR103ISwW35u/ZhBhh1qlnMEGPorPAMh1HCiR9HUGSYkXmf4NW38Hq+sE0L@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzCevwLFTJSgvPAzlWRU6ZKaBed4k+6GFS+uw0jyIGVsAC9tJ7U
	K+96u7qqbUufq2M7e/N47aYJ9UefXNKpIo119KHY3VjyJiIp7rLtH3CJ6kEj8/9zmhkcA9GPiZb
	7v+v0Me3OrCHXPiJFl3w0xhgO7fynL2dncIx0Sjt/HONB5X0m3+0YOkU85LnGXA==
X-Gm-Gg: AfdE7clJA4y5JbnVwuax0VkHdkSTyPugPP2myuWR7CDNPG5oDgBBFL+2p6Bcko0K7eA
	DnvmikBU9B5ArzErKlP3vh7EfK7r2TKNfsSFrujyocVyeBofdO8t6l2zlMGTlr16LxKPNUbXYw5
	pzX9wWiD9P0J17I35bE6K6I2O1Sb3nDtdURnfCwKngmLktZ4/Kt/AReSzGJRn1Aa93mNrYonOCx
	kN+15xZtKhdyFGZFm338aKJ4JNXrJAY2CsLXKoTVoGpBmFZMvwu5MDK0PnHgRG9tpeDAOHw63C8
	8MZplYhhdmAK744R8iTCDV8z9P57Xeokv2vbiKZzqQthyQxNXykfkESTJIILoy2IjYPfOW9+rQE
	wUtOCuqjs7Q4wd9sPIPdvEpPFAyEnVm4sPJtGlG+3
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr8328718a91.4.1783313756488;
        Sun, 05 Jul 2026 21:55:56 -0700 (PDT)
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr8328696a91.4.1783313755987;
        Sun, 05 Jul 2026 21:55:55 -0700 (PDT)
Received: from [10.204.78.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3114fe08b1bsm12946548eec.26.2026.07.05.21.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 21:55:55 -0700 (PDT)
Message-ID: <95e8281c-91e9-4444-8b83-ea87243122c9@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:25:47 +0530
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 40/42] misc: fastrpc: Use
 devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        sound-open-firmware@alsa-project.org,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfX9wECKmpaT0cd
 9cekvu71hj2bWS9Y6Ri+x75HOoDGYvNF0tWpTZU41BXSW31WprgOYssDJsX33HJFCbB4ReK+b1/
 pUp1XEsM/kofoCc7frjPtIhWCZHU2EE=
X-Proofpoint-ORIG-GUID: 5asqqAgeJ_-B2ss4Hy4J3iMjzOskaPEj
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4b355d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ee02QKOXNWxg8IJ2rEsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfX1PVaS/ntqquk
 kJ1FIBHBqRxIpydD952Y7mr3iXM0I2+uuLVRHrQ7Kzw1NLsl41Q/NZVyeDrQRCQTOH0d2tVyvxB
 05P5VY1TDgkeq21Mst1CelDEe2waolNG2xhXK+eKGwam/+f73QZMf5PhxH+TQrWzmRxPl0q+cDN
 BnUVhWfxukqAi6mbFNFIEOXX4SrfKdAqmiTWerHZCiF1AlR4+UhO31FqKaORraTYYyfwIAckkXd
 cedx0EHqVTCR1Z6AD7uuvF4MERD0KH99zULCrhFWcAxDVBaoqxzu2zmxKovNBXLKJ+ERYDqM7bw
 jkHwbUxG4NaCtr8X6AfivgSi5jr1oZro9684MOSRaEHaiHlLoTH7OGLx5Q3xbOj7xT3SJ7D8X67
 QSHRIXM9gUVe+BDMFwpvKbAUweU3sWOjxI5PbIxPAOOce3iMzswMjY8RiyqefMDUuMwD4WTSzwe
 /A8uDZP1D5+uu8GrDZQ==
X-Proofpoint-GUID: 5asqqAgeJ_-B2ss4Hy4J3iMjzOskaPEj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060045

On 06-07-2026 01:10, Mukesh Ojha wrote:
> Use the devres-managed devm_of_reserved_mem_device_init() to ensure
> the reserved memory region is released on device removal, fixing a
> missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().
nit: I see this change is also fixing fastrpc_rpmsg_probe() early
failure leaks as well as -EPROBE_DEFER retry paths which could be added
to the commit message.

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d86e79134c68..c4e05b0db527 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2396,7 +2396,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		return -EINVAL;
>  	}
>  
> -	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
> +	if (devm_of_reserved_mem_device_init(rdev))
>  		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
>  
>  	vmcount = of_property_read_variable_u32_array(rdev->of_node,


