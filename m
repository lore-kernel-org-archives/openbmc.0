Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383C0606A58E
	for <openbmc@archiver.kernel.org>; Mon,  2 Nov 2026 15:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=16asrMir
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jJFdX6VMTz3cHH;
	Tue, 03 Nov 2026 02:15:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793632544;
	cv=none; b=mlHc+zuFdsjFefDOyWnh6CXkSMekGIHIjqGCcNtLNdmERJAJIXihGsHiYAIxIiycICxJstpDHPCikbL3uwzPbAUvhl312OUQ8DvLM0W6BqTctDHV2+wE6QOStHhy1hYO6forQkiqXxf6vgMmaaOZJLS6YPrPLrHHp8sKLAON+GoFFvI4+WQGDnvxOO2jnJIEsPRAtLesUChHLFXnU4VTx3JTUtJiXbPNQnedpLdJRUw0Lp/rzLrhXEkiUfspNkzy9oE4QxqUiXCZDeFwdzfVQhiOcXuToGtYFzmwygwb+xHdOCEmXTyMVVoTf3Shr+52C6PkYKqzJPRbbwAoP3RXcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793632544; c=relaxed/relaxed;
	bh=al7C8b/8iiTYMDhhhBNV0a2bV3CHGlnm5HJ6xGUdZaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Id82qPoB3FW3nN5NgxU4AboO2lOqPfsxlS5Z3eVvZ7tD02F8qhpJpzqUOo0JqsyRmJxsY3wixRIYj1G/e+7jD4vEXfArsGPObAGSAZ/axgYUVyT5MEkEnwTarymWfbxt6LaaQ1nU3j/Q0ITydZHQH6FrmsiMzg1LfXDFyDXvSbw08mHkqzTYGNNFh1WowJJJ67H7ljzBHMpDMLjuXIQafNWS1RuN9o5WmNvUs1YejEl+ILQ4y7rPLFyDa9yTF6mE4L3p3m3v87NbzBVvZLhigp7YiPMJcC8YHv1gkbec7mzBba0bI6RuGURbtn5U41VD95I+VhvOLo9stSopzLemEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=16asrMir; dkim-atps=neutral; spf=softfail (client-ip=44.202.169.39; helo=omta040.useast.a.cloudfilter.net; envelope-from=linux@roeck-us.net; receiver=lists.ozlabs.org) smtp.mailfrom=roeck-us.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=16asrMir;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=roeck-us.net (client-ip=44.202.169.39; helo=omta040.useast.a.cloudfilter.net; envelope-from=linux@roeck-us.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 340 seconds by postgrey-1.37 at boromir; Tue, 03 Nov 2026 02:15:43 AEDT
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jJFdW3GSfz3cGg
	for <openbmc@lists.ozlabs.org>; Tue, 03 Nov 2026 02:15:43 +1100 (AEDT)
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id NpAlxQJ0rMylkNte9xyDtp; Mon, 02 Nov 2026 15:08:29 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Nte9xHyG30ULmNte9x9pn0; Mon, 02 Nov 2026 15:08:29 +0000
X-Authority-Analysis: v=2.4 cv=JJw7s9Kb c=1 sm=1 tr=0 ts=6ae8a76d
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=Bq6zwJu1AAAA:8
 a=QyXUC8HyAAAA:8 a=_jlGtV7tAAAA:8 a=nGbfsWwlM6PO30TiPYEA:9 a=QEXdDO2ut3YA:10
 a=KQ6X2bKhxX7Fj2iT9C4S:22 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=al7C8b/8iiTYMDhhhBNV0a2bV3CHGlnm5HJ6xGUdZaI=; b=16asrMirg3Bh
	F25tpdQhGDemIrrL96ASMluF6qDiuiC3SgvWTROYRJEE+tMYXC9FDJ0waBJ+27sGlKtRQl7ET4MKS
	9zVOYoZWQMsBI/XNX1dLEMSYJSKezddf/JyEtEayfgNKw0OscRGHml66NlIr+8z4i1yCzm1vtHCcT
	ySYE5TAzxksDhqAwlunA/J4SNPJc4Eb2wPp+yFm7IQsAnN9Z+1wm4RR3KhrGMNelPViKG7Y0NhJHs
	7rlhxbLPKjYqFz+/iApeWPN3wOMJrbdyGeif0BUsy51gj/w9KnUlbQkGAu5xV3X4FcHqascOR8kMj
	o4tgTglYVpB094I1cpf3lg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52064)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNte8-00000003tmt-2aOq;
	Mon, 02 Nov 2026 20:38:28 +0530
Message-ID: <73c1a319-477a-4695-8aba-7b1e401aa10d@roeck-us.net>
Date: Mon, 2 Nov 2026 07:08:27 -0800
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] hwmon: (peci/dimmtemp) Add support for Granite
 Rapids (GNR)
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 "changhuang.liang@starfivetech.com" <changhuang.liang@starfivetech.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
 <20261019114502.55307-7-changhuang.liang@starfivetech.com>
 <215a0b5a-9fda-4bce-bff5-b9e4bb5c3928@roeck-us.net>
 <2dca8ff44c92473a5cf461df6bd838ee5d87d066.camel@intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <2dca8ff44c92473a5cf461df6bd838ee5d87d066.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xNte8-00000003tmt-2aOq
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:52064
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 21
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCOSSVehOjklxcwSMySW7PFE7ti+koyKBCQ9E8oIlX9ysPSIvNtHVGSh5xyop5oObns6WlK/Yg/JtcvfZ80v9/lcSRoH8/kjOx7aijmkOPiRnu+rtxBT
 gWuU8v7adlcfPMduu5WwySp8c8hDevJ294cyghR+nu9p5eAH5ZL55r7IKgr1qptH5E6xitXDEJfmPeV1zgxfHLJ1jdyX9PzRFNzBvf47r5v+enGWsqI+OZ+Y
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/2/26 01:57, Winiarska, Iwona wrote:
> On Fri, 2026-10-30 at 12:56 -0700, Guenter Roeck wrote:
>> On Mon, Oct 19, 2026 at 04:45:02AM -0700, Changhuang Liang wrote:
>>> Add support for Granite Rapids (GNR) platform in PECI DIMM temperature
>>> monitoring driver.
>>>
>>> The GNR platform has different DIMM topology from previous generations,
>>> with 12 channel ranks (CHAN_RANK_MAX_ON_GNR) and 2 DIMM indexes per
>>> channel. Define these new constants and update CHAN_RANK_MAX to use
>>> the GNR value since it represents the maximum across all supported
>>> platforms.
>>>
>>> Since the current peci core does not support domains, accessing GNR's
>>> DIMM_TEMP_MAX and DIMM_TEMP_CRIT via PECI commands will be rejected
>>> and return completion code 0x90 (invalid request). To handle this, the
>>> read_thresholds callback is not defined for GNR, and the visibility
>>> logic is updated to skip exposing the max and crit temperature
>>> attributes.
>>>
>>> The minimum PECI revision required for GNR is 0x42.
>>>
>>> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>>> Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>
>>
>> Acked-by: Guenter Roeck <linux@roeck-us.net>
> 
> Hi Guenter!
> 
> Could you please take the hwmon changes through your tree?
> 

Done.

Thanks,
Guenter


