Return-Path: <openbmc+bounces-2663-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A86BC9832F
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2026 09:01:52 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4htb096Bjlz30WX;
	Mon, 28 Sep 2026 19:01:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790583981;
	cv=none; b=aLp7gqnX62s35Gs4PEFvQNBAXFGqJqW9/Uj/I/5ytmc73uSQB9tICcw/KYCOyujc90n6cRY5Kfp/eRv+YVohOtM+lzczLV72/krOG3Ia08Kx6ikOtCOqsOjqIydRhqKjMpjWy7T8e/Y9xBUEagyO5005u/ne5eBKyBwbHZvKT/4iuLwj+sU7RFxJq1wlCxzOSmWnYPTIpLUfdu7APooGri90gaBEjXC8GmhKw820R8nN9rYNuppc8ggMhCt7CSBPKFegA+bRhVA2uVFIr5SEgFuNK8eINv4sB/Lieyr4LCsGOce36jnUvX3yCsXmSD94izDHaj+JyVLIQ6Yw8o0hsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790583981; c=relaxed/relaxed;
	bh=jaRIHfyS839pnGmtubgjSGEcFcrMTPnSFxHKmD/d3ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EQVqR8fLckrsuSJqdsUCKyFEWYUtlFScGDYxUJP1v3aHueKeFfvLF3tI1j8x3r8wK72Yjfd4AspPOEjqgguGCYln7XGvRszGiO19XCSQExofFr2JPXxaaOF0DU3CLg4lTl/f6gsZHtdohLnCUIS6RovpElAIaamwfOTHJUTgJaDdENL396BE0WrBjJmUVhiov03jsZKbb3f8BodSpohl/56N/VLVC87HEbJQ10vg1/VymGL8m6bWyNup4A5d3VDe//E1PVfw8TveWq+YRxbpAYrDQ1NEynJpdwQlalJoLapBK6nqbmWv76cmaQF6pzb8ekUYFsIC5QtrBcr42jMb6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oYfpOOlH; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CQIjxGCZ; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oYfpOOlH;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CQIjxGCZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4htZCJ34lqz2xST
	for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2026 18:26:19 +1000 (AEST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xMpO136923
	for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2026 08:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jaRIHfyS839pnGmtubgjSGEcFcrMTPnSFxHKmD/d3ug=; b=oYfpOOlHfrhYgjZf
	yfWUVqMSpV9zere3l6ZpI7kjRkFXd/83ZnSK0ahwfd3zPEMJkYGe0i/JXF133Lfa
	K6MUpoUVudt2lcS4g66fQ727J4W7F8//AgYst2sOn4/POa8NrAUGS6f3EaHujq/W
	9D/svih1YQd8nqsdXi/NWL0qL9qzJ++R6CWmswX0P6g+EuLA4pnonDCwbcNRw0Wi
	qqeIjvTY1wyC2pVOaX7X469MWo5PcfuPUTvfhnhS0hRDBD5o+HYCxs24XlZLqqJa
	QoIErxUERH5WDlUcDag18u6E7QyU2QALE/RHCml2nChTfmZW+OyfrkVPj2UV1C7/
	e0BiQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq17he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2026 08:26:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c599e3d3bso386088185a.2
        for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2026 01:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790583976; x=1791188776; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jaRIHfyS839pnGmtubgjSGEcFcrMTPnSFxHKmD/d3ug=;
        b=CQIjxGCZ8YMLe66flj/7h3UH2PGdMt1MeZw11EupJHhzw9gl6oqpe/tKHW0GP5flkT
         bEiBEUlT16WPJoPSURUPg+ngiatcOfuKiQ9r1oUFdjyHVzOAh57Z/tBRLsX5uU/lgq26
         82/jCoa9SVQiEpVshYpDSblNUO74dpITgRRdktBmQNkscfV1R6Bh/ZEim8Fwes7+wqLK
         Q7UFHXmUqXwEUn/h+qeENmUqocr/Q8tGJO6ltdmmORpbsB77YqZd08K5XjaG8ERBaQ0G
         lFNsjZJ1R5jKB6a/Nkv9BsGJAIgyRhp1CJbEYUhnAQYuXOX4uWQiEY8aeoRPbRMps+no
         1qMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790583976; x=1791188776;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jaRIHfyS839pnGmtubgjSGEcFcrMTPnSFxHKmD/d3ug=;
        b=KnZgHV/j6Q2J+gsyIYyA0gS+881G9CGuqhWkGdQRkRgErUcRLIRcfFWE6kPg+IVGsG
         t4Ok2IGbTW/R1+7YI34DEkm/Dk95eMMa7s0iko5No53t3U9tTwYqeJXe7XA477da2Uly
         +dSddOXQUnxtPULt9N5RFc3spU0rnw21+fdMkW4+9n/AJLqC+dhFgPBqm48tKO12wOBM
         3uf4jamlfsxE7gtCHeqgr2YZrknUFjf/z4DR5/bom1WazC3iWiv/2p/X2vRRLDM/gF+o
         rjQRoUeS0iN1EPHWQZSF5HwBjKixW+1u+VAkPwgg20LOjS9HmWj4TozSFSv95MW3sOOl
         Z/Cw==
X-Forwarded-Encrypted: i=1; AKwUvBw6IZuaczkOBC6deaUMRY+rj1Glqfz149RRmqHISqiLoOrUQGPEasG+t5E/pRmHzyUgkI02EhAg@lists.ozlabs.org
X-Gm-Message-State: AFuF++kdwkWBTZ+VqzaA9+TR5LT737KOfZAAgIn08KxJn3dEVTsDyNpZ
	2MiRjvYznJwzi71xuY+zPBMnj/O6JiFPXXY5qvx0PBr/UCr642PlE7smBKOtKX5Ng6zVY5bCmDd
	hgfkqWw4S8uYS/ezbNksSXSyjtJZsTlzLtNaM5mn5IGbLnOlR0kvkmNseu1Nxiw==
X-Gm-Gg: AYBFou1uwnNrgRYtljb8xl18asmkMrAQQpWYXNItEo/Z6jyDUDZPglAR0+XH+KIjALD
	0ckDaIitrp/4K8RRxu7zVl4z26Y6q35X66hEM2dn2dSAQPo5DMdNwqu1fjriUgAiyRJHMskNCqA
	Ry7KDhHEB4skuV3EqgMAIL7LUuPSNCtp162busyUPtuNh/OcSfUDE15WDyrv72NPMFu7OxJ6DD8
	f8f+m0dTNpLlK8rSv0XMooSNoB/Fzr4q8lWMyL0t20Ki632Rh+A/BaeslVeAevSH+uoyAoIJgiB
	xnR8TNLdNQbBK3b64ytcyWVNUtHl+h5ayfBUm+EV/fAeGz7wraWSKQLBefBdOXVERMliopRUbwR
	uOzEYGsyy63NVsT7YkKsMAk53sY8=
X-Received: by 2002:a05:620a:4381:b0:93c:7955:afd9 with SMTP id af79cd13be357-93c7955d94emr530358185a.52.1790583975982;
        Mon, 28 Sep 2026 01:26:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4381:b0:93c:7955:afd9 with SMTP id af79cd13be357-93c7955d94emr530355385a.52.1790583975552;
        Mon, 28 Sep 2026 01:26:15 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d5f4:8a0a:ffd4:396a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm24546686f8f.35.2026.09.28.01.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:26:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>,
        Prasad Bolisetty <pbolisetty@axiado.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
        SriNavmani A <srinavmani@axiado.com>,
        Karthikeyan Mitran <kmitran@axiado.com>,
        Michael Walle <mwalle@kernel.org>,
        Petar Stepanovic <pstepanovic@axiado.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/2] gpio: Add support for Axiado AX3005 SGPIO controller
Date: Mon, 28 Sep 2026 10:26:11 +0200
Message-ID: <179058396966.15719.5627642110789688777.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
References: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PHOfzHLPomSmawHP0RejL21uFZaIVjqv
X-Proofpoint-GUID: PHOfzHLPomSmawHP0RejL21uFZaIVjqv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfX4V54BtIzt3uI
 qhwO/10pMJb3waLGE8nnUTB3hB6P5xS8sTDPo8Je6h8l6vwvJujfkrsB+NB0v8FIiNQfhXSBqf7
 loMT2kPPRSLM7ddkwCZaL0vm+FJ4i84=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba24a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Wkxt52mgQ5FUUMUmAjQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfX3Jy6kM/xMydo
 6dEoTqEsWQcvZx9RkDpNY6HCNtvoYxNE2M6p9bgUwK2pG1SwGimgZChRJcOKQOfN85pnxRLsh7Z
 TJBZrBUzQdsuuIRy0pAoZDF7hDBMh36zaBaTDYnp0MwWzSFBYHGpmHPYCcnP7rrTZZDcKfeO8K4
 8c7T27KQK+hd6vziDc1aHRvUFV21ZrwRBHhUEYz/OiSJ7ekCaD0y8sQwIBa8b0eenPS7ZsLJfVg
 Vd2PylEnDhSZ5SF7YdipdkamdVxxN9XoGiGtSfM7RQK9S7/ZqihiynLhKAkGRUyxOaQcZrqx0SL
 9miko1tCYFoaS1i9DZPRJIL3VnmXXLH9SqUNkOCt4LsW5MTpI62JTWmRPf60QvHIR6lJqH4L7H3
 e3nAVhb5u+GXmZPwXCmGJU+1mtOuO25rJKxDHC3NkiFg0gRtTq/+nn5eM+f5kBwj+zWFxpWQKY2
 Unzi1oqgfwJkueycZVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1011 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280033


On Mon, 21 Sep 2026 00:20:21 -0700, Petar Stepanovic wrote:
> Each SGPIO position provides one input GPIO and one output GPIO with
> fixed directions, along with interrupt support for input GPIOs.
> 
> This series adds support for the SGPIO controller found on the Axiado
> AX3005 SoC.
> 
> The series includes:
> - Devicetree binding documentation
> - GPIO driver implementation
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: add Axiado AX3005 SGPIO controller
      https://git.kernel.org/brgl/c/a7787b818204d6de78e2e83ded0155d8195119e6
[2/2] gpio: axiado: add AX3005 SGPIO controller support
      https://git.kernel.org/brgl/c/dd36a4b7f391eec4daa336c837a197dab0cf6401

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

