Return-Path: <openbmc+bounces-2223-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DCBC43458
	for <openbmc@archiver.kernel.org>; Mon,  6 Jul 2026 23:47:21 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gvLcS2jxqz3brZ;
	Tue, 07 Jul 2026 09:47:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783343820;
	cv=none; b=m9W5d2WghhuwS/K6y7L0XWYuf2jy3NvMhRkhzrdkjIcYUYMbrMNwsgnGH3j2NL/h5dLy8c/xBmDV+I3+bSyitglFCvuvINOpHCcZTpsXjjWWleKkVB1dHNxYcdwJQxNaszPwh2BbOBqN2U8EWZMeayBSS2DxWStU53SfjGZtrLflF88m1RzYvVzmBEyy3wRU/868Q2/T3eRySPf1jbkcGWNf2458jtdZit9V++OxDjkfRYf+4zgRM9aQYQSFQRq0VctgA3M3hNj3ylHLi0Gc1SdvLmLE+KYWCyeorZ+ZLi5rkAULK/V9Ozu4QNrnJ7MAZDRkZYf6jEswBjBROFGhVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783343820; c=relaxed/relaxed;
	bh=Vz86zd3go04za6BKCrEOJJ5AQbsnL3kIqNm4xRq1ahk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GK8UKsMgvLz6CZ62PBSBFMFv+tRS0Czz/Fz+hFwYRDVdrfJzOzrIHg7KH4fjZJDNkKiBVWK1jZFzB6YHTgBMxLKkAEn5Zd/bIHFrMhMfYy8+qyCRo+/RDPD8OVXsZWlrtLmS0eQRn/fEosQrHGf7NtQcM5lb4Nf/Ue+pUrBhLCaK3X3BZdJX9PNSu+ApLurPzodJ+EVSz5OTJb/Dl34aZ78U0YRvK3MBCSphX1mQzyuUitzryfyBuuuke98Z8k/3fpwtiR210p1GU1SOBLcHpRs4zwhW/wtnAaT0/0VH2wc8bzT04jComdEfGSo5BoWJVlIfqWkRTHeDBTwZ5F4S4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxURCHyC; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMo+Qd+q; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxURCHyC;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMo+Qd+q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mukesh.ojha@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gv4dR4G0wz3bby
	for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 23:16:57 +1000 (AEST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxCUt238119
	for <openbmc@lists.ozlabs.org>; Mon, 6 Jul 2026 13:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vz86zd3go04za6BKCrEOJJ5A
	QbsnL3kIqNm4xRq1ahk=; b=gxURCHyC5Uby2DEF/Sz+/5yNg3sVS5RYamD/XHiq
	Oeg+y1LJwkhEFbOaeUT/NQGKPdVK2zZ8VlG3hv6H4S/me/nezIWTxoEm9In3Bs8g
	ZvdBIq0+/gprmciBEXPztT6Da/pNCqKAPXP77qtywx46VRNq9dIbfHagzvAaAEIl
	E6hG0pwACBSPp2ODRqZ5jgVnHaYTwWXW8Uuan0qZj5WO8InmLPD6We8EBKixryDx
	iPil71OMzHER33szNYpl62CNRKnWkJ2P7UpjNxjXjQ3Ou5rCnNsvVYC1bhpBPa1w
	4pcAqdWpoDmeLyJqbgihNBYMa0DBssjFzMUnNnE2Yj0Udg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t89499-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 13:16:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-380a638fb5bso3061775a91.0
        for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 06:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783343814; x=1783948614; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vz86zd3go04za6BKCrEOJJ5AQbsnL3kIqNm4xRq1ahk=;
        b=dMo+Qd+qAsEDEDAMoN681k0pUr1r0UqPo2Vpvbo4UOH2gc3ZYKJFaskA6arAoCpfTz
         tez4Y5s21vw9TWalAYS5m7yAg1xLyPVRACmj6JwBVdaQ7U0+z0/u/GfKxQv2dSEygvgT
         KPtTT0oYEqlkhmgUkp/oaHhZEKAXUX6IA2jiQm+++Djt82sEpSkZKKaDgIkrqZYFQgfJ
         zTErZ8c0BLfzZcXp7y7+k4JTk+PeJwv7oMLjb76t+Z7nwP/fEyy3aq/g8pKob46hCZwK
         Pzs8KkwOqDoOxDpQSSMHkAG5G1VyhDoCf9d+Y9K3ihBtttkgr2XIC6XtsDHw/I4PpQOb
         Vwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343814; x=1783948614;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vz86zd3go04za6BKCrEOJJ5AQbsnL3kIqNm4xRq1ahk=;
        b=bgq48LqA8eLPbKDjaZLAuFPWi0vDMDBSNh/xvFNHJ11mwMZ5g8aFz+4LR7fP7uWGeQ
         pWQQ3OoVGjIO0ae8Z4jJ4g/cSvWRE2sE9sG2/qMpbO9MOP6b/VL4J8Qy2GkV5ZQEWw4M
         FcUSf21lPGuT9X3+TdLqCMgPCVyQdMdz64lBylB1+g4BRVgU5ipZnd3VVjD/QhPwEwqk
         SBrcMrhKwfEdun7z2H4ucwebu6ObyI9XIq1ZtQx8Tv6fKd6QVoGiKB6rMEpsnhnKdGNr
         lF6OhAPq6BEcsMfSAKnP1zGenM44l5eR/ZkRvEGAAST3ZWOz/4SCAyJMibCA/ntsNjRf
         NocA==
X-Forwarded-Encrypted: i=1; AHgh+RoZ/NCxlLtNSo1S7d2vZHz/QwoQQwDX9umrF2zBNXFuVysfeg/WE6KZkMHbYSfdNBOd6stRmVCo@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwWexKmj96NTuIuRovLR4JqXB/FlaKUMhsv0qtfTwak63DrLoXA
	AHBN4BtBE9goHxcS+iQZnpRh6zvv968AxIsDjNqOla6DiKVGgsLO96vcUhFwHoRQc2EcDKMuUvI
	9f0oaKYzfoUpptkWJwxreGwsTfDsv5UUKDX9qqPa1ReM2s3Gv5AhB/nUZKv9yZg==
X-Gm-Gg: AfdE7ckKvWVTicEnQsMr20ACLoSctYl7MdorFUspB2RjFlCAB0ah6MqzkOM0ycnAKMs
	JwkfFqtbfSxLHC8O5+GCnPX7FKbfd332SWWYrCcmEUNSNtU6FCnGpHjraAvevKKFMEhGRFNvM0N
	Y0RlnBLKZZuNTUvthOP9ifjS/NUhQvsUqBJTnrrObHtvwhC7FIztVMF2NqC6JPy72EPUSgF+vT2
	p5wRdE39/G+EzAUtlB5fW9KbOcLeeUD8Fk934Gy34ZsI3XkKiEHTuU9JMzsHV6u5bYaBPOj1L2a
	Qn/QYSIEm2hc9fuZEtftp8bDCpZaSoe+PBdJUTMcH8HD0e3NeDlVZ7TCigicPnwlJUNP1u7BOBV
	RZSdeIA/5iHKHUSgHvA632f6GFJVWx/7rJ0xY9w==
X-Received: by 2002:a17:90b:4ccc:b0:380:f389:447b with SMTP id 98e67ed59e1d1-38755769514mr376340a91.11.1783343814408;
        Mon, 06 Jul 2026 06:16:54 -0700 (PDT)
X-Received: by 2002:a17:90b:4ccc:b0:380:f389:447b with SMTP id 98e67ed59e1d1-38755769514mr376272a91.11.1783343813871;
        Mon, 06 Jul 2026 06:16:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311561dd3a1sm16176449eec.22.2026.07.06.06.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:16:53 -0700 (PDT)
Date: Mon, 6 Jul 2026 18:46:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 00/42] of: reserved_mem: Introduce devres helpers and
 convert drivers
Message-ID: <20260706131625.nygqmu2usgifmias@hu-mojha-hyd.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <ceeca378-3c76-4b2c-81b4-0ff1bb1e99be@sirena.org.uk>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ceeca378-3c76-4b2c-81b4-0ff1bb1e99be@sirena.org.uk>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNSBTYWx0ZWRfX017c+tANQtAH
 jg3B8gD3RFoQBKvWTrKhAtCE4SWapye4rQoMvZQIBG8oXZGD6wvA5S32O4rps00Jbsql4ZLZAPS
 i8FcOsG8MEqZlY9whnBkAb28PTkyMPU=
X-Proofpoint-GUID: yp0dqJ9tZN1tqg_DsB_k7-Hn-PGtKOKn
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4baac7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=1XWaLZrsAAAA:8 a=sOACTKiIrrgCOb8DNPwA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: yp0dqJ9tZN1tqg_DsB_k7-Hn-PGtKOKn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNSBTYWx0ZWRfX1zzaKXJnZSHC
 SjvtLxpOpR9Ceo9rzRkZHv8Y4aMZPLZRaNJHFbehu9W7AtzPImS8gE1MxcaBhlHYWNOFyVbJ6Sh
 xG13By9MokhYuzMVxGEyQQfENx8rMvetOvWHTMZer5tJzVLUdqDvBge74YMdybCV38ZqJ5MH+bI
 giLKM8uDI20fDH8qgmh6DaQDotKvpnb/6qbW62c3nAAwLusf9dYDqi+EozSmpM/tXXL44Ah4SzP
 m0CBYpS8eW8xl3Os9rkrsLqtQVvywyKIaKKs7PqGIqhzMBMwAsSfNskR5nnqgWRno/VmsCdRng6
 If6+fH8xuZPbzkMfTPyEuD4VPfvo0nq2nTb2V8xuPX7os2cdNE6Zum8bLxTGd/ZvYjpb229uViS
 tVdw8cjgigvSPPgyiegaSZCH6XflCmVnJRMa6mv4QKIyBfefThhtYTVTlJMDbUDCO2XlAqpCUJy
 PYfuRoFbkmdGCA4uAHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060135

On Mon, Jul 06, 2026 at 01:14:13PM +0100, Mark Brown wrote:
> On Sat, Jul 04, 2026 at 01:08:13AM +0530, Mukesh Ojha wrote:
> > Drivers using of_reserved_mem_device_init() and its variants must
> > manually call of_reserved_mem_device_release() in their remove and
> > error-unwind paths. This is repetitive boilerplate that is easy to
> > get wrong, and several drivers have open-coded the teardown
> > inconsistently or skipped it entirely, leading to dangling reserved
> > memory references.
> 
> Just as a general thing, rather than sending a huge cross subsystem
> series for something like this it's probably better to just send a
> couple of examples, then once the new API is introduced and either has a
> pullable tag or has made it to mainline go and do the conversion.  This
> avoids clogging everyone's inbox with very big serieses.

Apologies for this; this is my first series touching these many
subsystems, and I also learned the hard way when the entire
series was not sent in one shot due to the daily sending limit
via git send-email[1], and I had to cut many cc lists for patches
33/42 to 42/42.

[1]
4.5.3 Your message has too many recipients. For more information regarding
  4.5.3 Google's sending limits, go to
  4.5.3  https://support.google.com/mail/?p=TooManyRecipientsError 5a478bee46e88-30f0bbd2362sm49597158eec.20 - gsmtp


Thanks for the suggestion; point noted.

-- 
-Mukesh Ojha

